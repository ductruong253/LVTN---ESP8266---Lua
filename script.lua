--turn the power led on
gpio.mode(4, gpio.OUTPUT)
gpio.write(4, gpio.LOW)

pin = 5
status, temp, humi, temp_dec, humi_dec = dht.read(pin)

t = temp*1000 + temp_dec;
h = humi*1000 + humi_dec;

    print("IP:"..wifi.sta.getip())
    print("Status:"..wifi.sta.status())
    print("GET /sensor/"..t.."/"..h.." HTTP/1.1\r\n Host: 192.168.1.116\r\n Accept: */*\r\n Connection: Upgrade\r\n\r\n")
    sk = net.createConnection(net.TCP, 0) 
    sk:connect(3000,"192.168.1.116")
    sk:on("connection",function(socket)
        socket:send("GET /sensor/"..t.."/"..h.." HTTP/1.1\r\n Host: 192.168.1.116\r\n Accept: */*\r\n Connection: Upgrade\r\n\r\n") 
        print("Send data to server")
        print("Going to sleep...")
        node.dsleep(10000000)
    end)



