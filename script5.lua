node.dsleep(2000000,0)
gpio.mode(4, gpio.OUTPUT)
gpio.write(4, gpio.LOW)

wifi.sta.config("Phong KGHT CDIO","pCDIO201609")
wifi.sta.getip()
srv = net.createConnection(net.TCP, 0)
srv:on("receive", function(sck, c) print(c) end)
srv:on("connection", function(sck, c)
  -- Wait for connection before sending.
  sck:send("GET /sensor/55/60 HTTP/1.1\r\n Host: 192.168.100.3\r\n Connection: keep-alive\r\n Accept: */*\r\n\r\n")
  print("Send completed!")
end)
srv:connect(3000,"192.168.100.3")
gpio.write(4, gpio.HIGH)