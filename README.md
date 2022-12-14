React app which gets automatically built into a Docker container and deployed to AWS Elastic Beanstalk using Github Actions
on every push to the master branch.

Commands to run:

To run the dev server:

`docker build -f Dockerfile.dev -t k02d/frontend .`

`docker-compose -f docker-compose-dev.yml up`

To run the production server:

`docker build .`

`docker run -p 8080:80 b5530bde3a3a` (get the hash from the previous command)
