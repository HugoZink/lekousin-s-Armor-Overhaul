if not tweak_data then return end
if not tweak_data.character then return end
if SmallTweaks then return end

tweak_data.upgrades.specialization_descs[Global.spec_length] = {
	{
		multiperk = "1%",
		multiperk2 = "0.5"
	},
	{
		multiperk = "25%"
	},
	{
		multiperk = "2%",
		multiperk2 = "1"
	},
	{
		multiperk = "+1",
		multiperk2 = "25%",
		multiperk3 = "45%"
	},
	{
		multiperk = "3%",
		multiperk2 = "2"
	},
	{
		multiperk = "135%"
	},
	{
		multiperk = "4%",
		multiperk2 = "3.5"
	},
	{
		multiperk = "5%",
		multiperk2 = "20%"
	},
	{
		multiperk = "5%",
		multiperk2 = "5",
		multiperk3 = "10%"
	}
}
tweak_data.weapon.swat_van_turret_module.SPREAD = 2--0.5
tweak_data.weapon.swat_van_turret_module.DAMAGE_MUL_RANGE[4] = {2500, 0.5}
--tweak_data.weapon.swat_van_turret_module.auto.fire_rate = 0.1

SmallTweaks = true