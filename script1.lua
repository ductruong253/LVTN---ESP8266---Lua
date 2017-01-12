wifi.sta.config("Phong KGHT CDIO","pCDIO201609")
wifi.sta.getip()
srv = net.createConnection(net.TCP, 0)
srv:on("receive", function(sck, c) print(c) end)
srv:on("connection", function(sck, c)
  -- Wait for connection before sending.
  sck:send("GET /sensor/55/60 HTTP/1.1\r\nHost: 192.168.100.3\r\nConnection: keep-alive\r\nAccept: */*\r\n\r\n")
end)
srv:connect(3000,"192.168.100.3")
