amqp       = require("amqp")
connection = amqp.createConnection(host: "localhost")

connection.on "ready", ->
  options =
    queue:
      autoDelete: false
      durable: true
    subscribe:
      ack: true
      prefetchCount: 10

  connection.queue "task_queue", options.queue, (queue) ->
    console.log " [*] Waiting for messages. To exit press CTRL+C"

    queue.subscribe options.subscribe, (msg, headers, delivery_info) ->
      console.log " [x] Delivery info", delivery_info

      body = msg.data.toString("utf-8")
      console.log " [x] Received %s", body

      setTimeout (->
        console.log " [x] Done"
        queue.shift(delivery_info.deliveryTag, true, false, false) # basic_ack equivalent
      ), (body.split(".").length - 1) * 1000
