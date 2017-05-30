require 'sidekiq/web'
require 'sidekiq-status/web'

use Rack::Auth::Basic, 'Restricted Area' do |username, password|
  username == (ENV['USERNAME'] || 'admin') and password == (ENV['PASSWORD'] || 'password')
end

run Sidekiq::Web
