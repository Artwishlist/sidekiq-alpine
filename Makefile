default: package

eb-create-prod-env:
	eb create                         \
	  -i t2.micro                     \
	  -p 'Docker 1.9.1'               \
	  -r eu-west-1                    \
	  --single                        \
	  -t webserver                    \
	  -c awl-sidekiq-web-prod         \
	  --vpc.id vpc-1f00d87a           \
	  --vpc.publicip                  \
	  --vpc.securitygroup sg-9c5787fb \
	  --vpc.ec2subnets subnet-effd6b8a,subnet-c76bd4b0,subnet-a31acafa \
	    sidekiq-web-prod

package:
	rm -f tmp/release.zip
	zip -r tmp/release.zip .ebextensions/ Dockerfile Dockerrun.aws.json \
		Gemfile Gemfile.lock config.ru

deploy:
	eb deploy
