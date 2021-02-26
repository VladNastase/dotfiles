local math     = math
local screen   = screen
local tonumber = tonumber

local fairfull  = { name = "fairfull" }

local function do_fair(p)
    local t = p.tag or screen[p.screen].selected_tag
    local wa = p.workarea
    local cls = p.clients

    if #cls == 0 then return end

    local width = math.floor(wa.width / #cls)
    local height = wa.height

    local remaining_clients = #cls

    -- Iterate in reversed order.
    for i = #cls,1,-1 do
        local c = cls[i]
        local this_x = remaining_clients - 1

        -- Calculate geometry.
        local g = {}
        g.width = width
        g.height = height

        g.x = wa.x + this_x*width
        g.y = wa.y

        if g.width  < 1 then g.width  = 1 end
        if g.height < 1 then g.height = 1 end

        p.geometries[c] = g

        remaining_clients = remaining_clients - 1
    end
end

function fairfull.arrange(p)
    return do_fair(p)
end

return fairfull
