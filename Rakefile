namespace :eb do
  task :package => [:cleanup] do
    sh 'mkdir -p tmp/releases'
    sh "git ls-files | zip #{build_package_path} -@"
  end

  task :cleanup do
    sh 'rm -rf tmp/releases'
  end

  task :deploy, [:env] => [:package] do |t, args|
    env = args.env or fail 'Please provide an environment to deploy.'
    sh "eb_deploy --package #{build_package_path} --environment #{env}"
  end

  task :destroy, [:env] do |t, args|
    env = args.env or fail 'Please provide an environment to destroy.'
    sh "eb_deploy --destroy --environment #{env}"
  end

  def build_package_path
    git_sha = `git log -1 --pretty=format:"%h"`.strip
    "tmp/releases/#{git_sha}.zip"
  end
end
