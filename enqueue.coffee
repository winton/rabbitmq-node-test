amqp       = require("amqp")

connection = amqp.createConnection(host: "localhost")
message    = process.argv.slice(2).join(" ") or "Hello World!"

connection.on "ready", ->
  options =
    queue:
      autoDelete: false
      durable: true
    publish:
      deliveryMode: 2

  for i in [1..100]
    connection.queue "task_queue", options.queue, (queue) ->
      connection.publish("task_queue", message, options.publish)
      console.log(" [x] Sent %s", message)

  setTimeout(
    => connection.end()
    5000
  )