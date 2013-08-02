##rabbitmq-node-test

Simple test to show how a worker queue + nack works.

###Install RabbitMQ

    brew install rabbitmq

###Open RabbitMQ Stats

Go to [http://localhost:15672](http://localhost:15672).

###Install amqp package

    npm install

###Enqueue jobs

    coffee enqueue.coffee "....."

###Start worker

    NODE_DEBUG_AMQP=1 coffee worker.coffee
