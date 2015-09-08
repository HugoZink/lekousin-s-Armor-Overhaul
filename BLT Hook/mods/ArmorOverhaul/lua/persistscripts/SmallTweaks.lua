if not tweak_data then return end
if not tweak_data.character then return end
if SmallTweaks then return end

for i, range in ipairs(tweak_data.character.presets.weapon.sniper.m4.FALLOFF) do
	range.dmg_mul = range.dmg_mul * 2
end

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

SmallTweaks = true