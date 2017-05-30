# Sidekiq

Sidekiq on Alpine over Sinatra for all redis jobs.


If not included in env vars, by default:
```
Redis URL:  redis://localhost:6379
Username :  admin
Password :  password
```

### Using

You can just use the public image [artwishlist/sidekiq-alpine](https://hub.docker.com/r/artwishlist/sidekiq-alpine) in your Dockerfile

### Installing

1. Clone the repo or download the zip
2. cd into the app folder
3. Run `docker-compose build`
4. Run `docker-compose up`
5. Go to [http://localhost:8081](http://localhost:8081)

### Deployment

1. Install GCloud locally and authenticate
2. Run `kubectl apply -f .gcloud/staging/..` to deploy the app to your (new?) staging namespace.

### Built With

* [Ruby](https://www.ruby-lang.org/en/) - The Language
* [Sinatra](http://www.sinatrarb.com/) - The Framework
* [Thin](http://code.macournoyer.come/thin/) - The Server
* [Docker](https://www.docker.com/) Containerzzz
* [JetBrains](https://www.jetbrains.com/) - The preferred IDE for development (RubyMine) and db monitoring (Datagrip)

### Acknowledgements

* [Alpine](https://alpinelinux.org) - The OS
* [Docker Hub](https://hub.docker.com) - Dockers in the cloud
