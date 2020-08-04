--[[
function UpgradesManager:_aquire_upgrade(upgrade, id, loading)
	if upgrade.category == "weapon" then
		self:_aquire_weapon(upgrade, id, loading)
	elseif upgrade.category == "feature" then
		self:_aquire_feature(upgrade, id, loading)
	elseif upgrade.category == "equipment" then
		self:_aquire_equipment(upgrade, id, loading)
	elseif upgrade.category == "equipment_upgrade" then
		self:_aquire_equipment_upgrade(upgrade, id, loading)
	elseif upgrade.category == "temporary" then
		self:_aquire_temporary(upgrade, id, loading)
	elseif upgrade.category == "team" then
		self:_aquire_team(upgrade, id, loading)
	elseif upgrade.category == "armor" then
		self:_aquire_armor(upgrade, id, loading)
	elseif upgrade.category == "rep_upgrade" then
		self:_aquire_rep_upgrade(upgrade, id, loading)
	elseif upgrade.category == "melee_weapon" then
		self:_aquire_melee_weapon(upgrade, id, loading)
	elseif upgrade.category == "grenade" then
		self:_aquire_grenade(upgrade, id, loading)
	elseif upgrade.category == "crew" then
		self:_aquire_crew(upgrade, id, loading)
	end
end

function UpgradesManager:_unaquire_upgrade(upgrade, id)
	if upgrade.category == "weapon" then
		self:_unaquire_weapon(upgrade, id)
	elseif upgrade.category == "feature" then
		self:_unaquire_feature(upgrade, id)
	elseif upgrade.category == "equipment" then
		self:_unaquire_equipment(upgrade, id)
	elseif upgrade.category == "equipment_upgrade" then
		self:_unaquire_equipment_upgrade(upgrade, id)
	elseif upgrade.category == "temporary" then
		self:_unaquire_temporary(upgrade, id)
	elseif upgrade.category == "team" then
		self:_unaquire_team(upgrade, id)
	elseif upgrade.category == "armor" then
		self:_unaquire_armor(upgrade, id)
	elseif upgrade.category == "melee_weapon" then
		self:_unaquire_melee_weapon(upgrade, id)
	elseif upgrade.category == "grenade" then
		self:_unaquire_grenade(upgrade, id)
	elseif upgrade.category == "crew" then
		self:_unaquire_crew(upgrade, id)
	end
end

function UpgradesManager:_aquire_crew(team, id)
	managers.player:aquire_crew_bonus(team.upgrade, id)
end

function UpgradesManager:_unaquire_crew(team, id)
	managers.player:unaquire_crew_bonus(team.upgrade, id)
end
]]