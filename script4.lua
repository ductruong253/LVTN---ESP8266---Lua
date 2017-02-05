
print("Running init.lua")
gpio.mode(0, gpio.OUTPUT)
gpio.write(0, gpio.HIGH)
abort = false
gpio.mode(1, gpio.INPUT)
query = gpio.read(1)
print(query)
    
if (query == 1) then
    abort = true
    print("Autorun is overrided! Manual commands mode is now ACTIVATED!")
end
if (abort == false) then
    tmr.alarm(0, 5000, 1, function()
        print("Running Script...")
        dofile("script2.lua")
    end)
end