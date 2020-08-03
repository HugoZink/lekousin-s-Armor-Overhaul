function UnitNetworkHandler:add_synced_crew_bonus(category, upgrade, level, sender)
	local sender_peer = self._verify_sender(sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not sender_peer then
		return
	end

	local peer_id = sender_peer:id()
	managers.player:add_synced_crew_bonus(peer_id, category, upgrade, level)
end