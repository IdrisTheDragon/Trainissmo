require 'utils.data_stages'
_LIFECYCLE = _STAGE.control -- Control stage

require 'modules.immersive_cargo_wagons.main'

function OnInit()
    local ship_items = remote.call("freeplay", "get_ship_items")
    ship_items['locomotive'] = (ship_items['locomotive'] or 0) + 1
    ship_items['cargo-wagon'] = (ship_items['cargo-wagon'] or 0) + 1

    local debris_items = remote.call("freeplay", "get_debris_items")
    debris_items['rail'] = (debris_items['rail'] or 0) + 25
    
    remote.call("freeplay", "set_ship_items", ship_items)
    remote.call("freeplay", "set_debris_items", debris_items)
end

script.on_init(OnInit)