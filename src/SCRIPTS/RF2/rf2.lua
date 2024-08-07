rf2 = {
    baseDir = "/SCRIPTS/RF2/",
    runningInSimulator = string.sub(select(2,getVersion()), -4) == "simu",

    loadScript = loadScript,

    log = function(str)
        if not rf2.logfile then
            rf2.logfile = io.open("/LOGS/rf2.log", "a")
        end
        io.write(rf2.logfile, string.format("%.2f ", rf2.clock()) .. tostring(str) .. "\n")
    end,

    print = function(str)
        if rf2.runningInSimulator then
            print(tostring(str))
        else
            --serialWrite(tostring(str).."\r\n") -- 115200 bps
            --rf2.log(str)
        end
    end,

    clock = function()
        return getTime() / 100
    end,

    apiVersion = nil
}
