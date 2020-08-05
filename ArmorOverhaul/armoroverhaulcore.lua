if not ArmorOverhaul then
    _G.ArmorOverhaul = {}

    -- Spoof key into value for other clients
    ArmorOverhaul.spoof = {
        level_8 = "level_6",
        level_9 = "level_6",
        level_10 = "level_1",
        level_11 = "level_7",
        level_12 = "level_1",
    }

    ArmorOverhaul.tweak = {
        health_dmg_bleed_threshold = 30,
        health_dmg_max_bleed_value = 20,
        standstill_dodge_mult = 0.8,
        max_dodge_chance = 0.95,
        armor_regeneration_delay_s = 3,
    }
end
