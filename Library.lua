local library = {}

function library:ListenerEvent(args)
    local this = {}

    if #args ~= 3 then return; end;

    this.Event = args[1]
    this.Obj = args[2]
    this.Call = args[3]

    if this.Event and this.Obj and this.Call then
        -- Event happened // Checking event name and object name
        event = this.Event
        obj = this.Obj
        call = this.Call

        if event == "ValueChanged" then
            if type(obj) == "number" or type(obj) == "boolean" then
                result, error = pcall(function()
                    call(type(obj))
                end)
                if error ~= nil and error~=false then
                    print(error)
                else
                    if result then end
                end
            end
        end
        
    end
end

local test = true
local test2 = 1

library:ListenerEvent(
    {
        "ValueChanged",
        test,
        function(boob)
            print(boob)
        end
    }
)
