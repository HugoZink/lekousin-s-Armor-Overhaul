--[[
local sync_orig = NetworkMember.sync_data
function NetworkMember:sync_data(peer)
	sync_orig(self, peer)
	managers.player:update_crew_bonuses_to_peer(peer)
end
]]
