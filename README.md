##rabbitmq-node-test

Simple test to show how a worker queue + nack works.

###Run it

    coffee enqueue.coffee "....."
    NODE_DEBUG_AMQP=1 coffee worker.coffee
