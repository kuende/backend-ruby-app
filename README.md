#Backend Ruby Sample

This project serves as the Ruby work sample for Backend Engineer position.

## Installation

This application requires PostgreSQL, RabbitMQ and Redis. The easiest setup requires docker to be installed. You can get a copy by installing [Docker Toolbox](https://docs.docker.com/engine/installation/).

Then, make sure you have commands `docker`, `docker-machine` and `docker-compose` installed.

```bash
$ # Create a docker machine and start it
$ docker-machine create --driver virtualbox default
$ docker-machine start default

$ # Check ip configuration for this machine. For me it is 192.168.99.100
$ # this ip is required below
$ docker-machine env default

$ # Copy environment information
$ cp .env.sample .env
$ # Edit .env, replacing 192.168.99.100 with docker machine ip, if needed

$ # Start postgres, redis and rabbitmq
$ docker-compose up

$ # Create and migrate databases
$ bin/rake db:create db:migrate db:seed
$ APP_ENV=test bin/rake db:create db:migrate

$ # Start all servers
$ foreman start
```

## Components

There are three components of this service.

### API

All external communication goes through the API. Authentication and authorization is mocked in AuthService and it does not fit the purpose of this sample test. The API is implemented using [Grape](https://github.com/intridea/grape) API. JSON data is serialized using [Grape-Entity](https://github.com/ruby-grape/grape-entity). The API code can be found in `app/api`.

### Hutch

Communication between services is implemented asynchronously using [Hutch](https://github.com/gocardless/hutch) on top of RabbitMQ. Other services push messages into a queue defined by a consumer. Consumers pull messages one by one from the queue and then enqueue them to a local Sidekiq instance which offers fault tolerance (automatic retries) and scalability (multiple workers).

### Sidekiq

[Sidekiq](https://github.com/mperham/sidekiq) is used for background job processing on top of Redis. If there is a long running task which can not be processed during the life of a request, it is sent to sidekiq to be processed async. Also, jobs pulled from RabbitMQ using Hutch are immediately sent to Sidekiq.

## Tasks

You are required to implemented the functionality listed below. All features need tests as well, written using Rspec framework.

### Notification API

Currently there is an API implemented which lists all notifications for an user. Please add this functionality:

- Currently all notifications are returned for every request. Some users can have thousands of notifications. Implement pagination.
- Get all notifications since a date sent as parameter `since`
- Return all unread notifications (parameter `unseen=true`)

### Inter-Service communication

Other services need a way to send notifications to users. Implement the NotificationConsumer with the following functionality:

- Save the provided payload as a new notification in the database
- Send a notification to user's mobile phone calling the provided `GCMService`. Since fault tolerancy is a must, call it from a Sidekiq background job.

Note: You can use the `scripts/publish-notification.rb` to insert notification payloads into Rabbitmq.

### Advanced API usage

- Implement a PUT `/notifications/:id` API which marks a notification as seen.
- Return the number of unseen notifications for the GET Notifications API as `X-Notifications-Unseen` header.
