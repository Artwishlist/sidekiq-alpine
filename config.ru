require 'sidekiq'
require 'sidekiq/web'
map '/' do
  use Rack::Auth::Basic, "Protected Area" do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking
    Rack::Utils.secure_compare(
      ::Digest::SHA256.hexdigest(username),
      ::Digest::SHA256.hexdigest(ENV["USERNAME"] || 'admin')
    ) & Rack::Utils.secure_compare(
      ::Digest::SHA256.hexdigest(password),
      ::Digest::SHA256.hexdigest(ENV["PASSWORD"] || 'password')
    )
  end

  run Sidekiq::Web
end

class Health
  def self.call(env)
    res = Rack::Response.new
    # This will automatically set the Content-Length header for you
    res.write 'Hello, I\'m healthy!'
    # returns the standard [status, headers, body] array
    res.finish
  end
end

map '/health' do
  run Health
end