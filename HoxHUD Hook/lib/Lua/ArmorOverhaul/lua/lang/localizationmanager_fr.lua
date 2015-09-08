--[[
Text for new stats
-code base thanks to hejoro
]]

local testAllStrings = false
LocalizationManager_text = LocalizationManager_text or LocalizationManager.text
function LocalizationManager:text( string_id, macros )
	local armortext = {}

	-- Stats
	armortext["bm_menu_regen"] = "Regen par seconde"
	armortext["bm_menu_deflect_min_dmg"] = "Dmg max deflect"
	armortext["bm_menu_deflect_min_procent"] = "Max deflect chance"
	armortext["bm_menu_deflect_max_dmg"] = "Dmg min deflect"
	armortext["bm_menu_deflect_max_procent"] = "Min deflect chance"
	armortext["bm_menu_hdr_min_dmg"] = "Min HDR dmg"
	armortext["bm_menu_hdr_min_procent"] = "Min HDR value"
	armortext["bm_menu_hdr_max_dmg"] = "Max HDR dmg"
	armortext["bm_menu_hdr_max_procent"] = "Max HDR value"
	armortext["bm_menu_explosion_damage_reduction"] = "Reduction dégâts explosion"
	armortext["bm_menu_ammo_mul"] = "Mun. bonus"
	armortext["bm_menu_jump_speed_multiplier"] = "Bonus hauteur saut"
	armortext["bm_menu_ap_regen_suppressed_max_multiplier"] = "Regen max suppression"
	armortext["bm_menu_bleeding_reduction"] = "Reduction saignement"

	-- Armors
	armortext["bm_armor_level_8"] = "Lifa Vest"
	armortext["bm_armor_level_9"] = "Veste tactique légère"
	armortext["bm_armor_level_10"] = "Fine veste"
	armortext["bm_armor_level_11"] = "Combinaison de déminage"
	armortext["bm_armor_level_12"] = "Custom Armor"

	-- Armors required skills
	armortext["bm_menu_skill_locked_level_7"] = "Nécessite Tough Guy"
	armortext["bm_menu_skill_locked_level_8"] = "Nécessite Curaga"
	armortext["bm_menu_skill_locked_level_9"] = "Nécessite Materia"
	armortext["bm_menu_skill_locked_level_10"] = "Nécessite Moving Target"
	armortext["bm_menu_skill_locked_level_11"] = "Nécessite Démineur"

	-- Skills
	armortext["menu_stockholm_syndrome"] = "Curaga"
	armortext["menu_sentry_targeting_package"] = "Materia"
	armortext["menu_juggernaut"] = "Démineur"

	-- New perk deck
	armortext["menu_st_spec_armor_drainer"] = "Armor Drainer"
	armortext["menu_st_spec_armor_drainer_desc"] = "Vous pouvez gagner un bonus d'armure lorsque vous tirez dans la tête d'ennemis.\n\nNote: après un tir à la tête, un cooldown démarre durant lequel les tirs dans la tête n'ont aucun effet."
	armortext["menu_deck_armor_drainer_1"] = "Armor Drainer I"
	armortext["menu_deck_armor_drainer_3"] = "Armor Drainer II"
	armortext["menu_deck_armor_drainer_5"] = "Armor Drainer III"
	armortext["menu_deck_armor_drainer_7"] = "Armor Drainer IV"
	armortext["menu_deck_armor_drainer_9"] = "Armor Drainer V"

	armortext["custom_armor"] = "Custom armor"

	-- Mandatory for the custom armor's concealment values
	armortext["1"] = 1
	armortext["12"] = 12
	armortext["18"] = 18
	armortext["21"] = 21
	armortext["23"] = 23
	armortext["26"] = 26
	armortext["30"] = 30

	-- ArmorOverhaul options
	armortext["armor_overhaul_options"] = "ArmorOverhaul"
	armortext["armor_overhaul_options_help"] = "Changer les options d'ArmorOverhaul"
	armortext["armor_overhaul_options_lang"] = "Langue"
	armortext["armor_overhaul_options_lang_help"] = ""
	armortext["lang_en"] = "en"
	armortext["lang_fr"] = "fr"
	armortext["armor_overhaul_options_debug"] = "Debug"
	armortext["armor_overhaul_options_debug_help"] = ""
	armortext["armor_overhaul_options_localize"] = "Localiser"
	armortext["armor_overhaul_options_localize_help"] = "Localise les textes (décochez si vous avez des problèmes avec les textes d'autres mods)"
	armortext["armor_overhaul_options_gui"] = "Activer GUI"
	armortext["armor_overhaul_options_gui_help"] = ""
	armortext["armor_overhaul_options_gui_health"] = "Vie en numérique"
	armortext["armor_overhaul_options_gui_health_help"] = "Affiche la vie en valeur numérique au-dessus de la barre de vie"
	armortext["armor_overhaul_options_gui_armor"] = "Armure en numérique"
	armortext["armor_overhaul_options_gui_armor_help"] = "Affiche l'armure en valeur numérique au-dessus de la barre d'amrure"

	-- Crew bonuses
	armortext["crew_bonuses"] = "Bonus équipiers"
	armortext["crew_bonuses_help"] = "Permet de booster les équipiers utilisant ArmorOverhaul 0.6. S'applique seulement aux équipiers"
	armortext["crew_bonus_xp_multiplier"] = "Nice man"
	armortext["crew_bonus_armor_multiplier"] = "Armure x1.1"
	armortext["crew_bonus_health_multiplier"] = "Vie x1.2"
	armortext["crew_bonus_deflect_chance_addend"] = "Chance de déflection +10%"
	
	-- Changelogs
	armortext["changelog_beta_0_5"] = "0.5"
	armortext["changelog_beta_0_5_text"] = [[ --- New/Altered mechanics --- 
	-- Armor suppression --
	The instant you are suppressed, your armor stops to regen, but it slowly regain its potential as long as the suppression progressively vanishes
	
	 --- Tweaks --- 
	Decreased Flak Jacket ammo boost from 50% to 35%
	Increased Lightweight Tactical Vest ammo boost from 25% to 40%
	Increased Thin Suit jump speed multiplier from 1.05 to 1.1
	Increased EOD Suit jump speed multiplier from 0.15 to 0.2
	Increased Armor suppression time from 3s to 10s (this value is still variable depending on your armor regen skills)
	 
	 --- Fix --- 
	Fixed HP bonus being invisible and detection ring being rendered behind armor stats
	
	 --- Misc --- 
	Added support for DMCWO text (cause why not)]]
	armortext["changelog_beta_0_5_1"] = "0.5.1"
	armortext["changelog_beta_0_5_1_text"] = [[Dramastically reduced jump speed penalty for all armors
	Light ballistic Vest : -2.5% -> 0%
	Ballistic Vest : -7.5%-> -1%
	Heavy Ballistic Vest : -15% -> -2%
	Flak Jacket : -25% -> -3%
	Combined Tactical Vest : -40% -> -5%
	Improved Combined Tactical Vest : -60% -> -7%
	Lifa Vest : -50% -> -6%
	Lightweight Tactical Vest : -35% -> -4%
	EOD Suit : -80% -> -10%]]
	armortext["changelog_beta_0_5_2"] = "0.5.2"
	armortext["changelog_beta_0_5_2_text"] = [[Fixed an issue preventing to host a game and play with others while wearing a non-vanilla armor
	This problem only occured while hosting]]
	armortext["changelog_beta_0_6"] = "0.6"
	armortext["changelog_beta_0_6_text"] = [[ --- New/Altered mechanics --- 
	-- Entropy --
	Added entropy for both deflection and dodge at 10% of their original value (If you have 10 dodge you'll get 1 entropy dodge).
	]]

	-- Mechanic descriptions
	armortext["description_mechanics"] = "Mechanic descriptions"
	armortext["description_mechanics_help"] = "Explanation of all mechanics of the game"

	armortext["description_new"] = "New/Altered mechanics"
	armortext["description_new_help"] = "Mechanics introduced or altered by lekousin's Armor Overhaul"
	armortext["description_new_armor_regen"] = "Progressive armor regeneration"
	armortext["description_new_armor_regen_help"] = ""
	armortext["description_new_armor_regen_desc_title"] = "New/Altered mechanics - Armor regeneration"
	armortext["description_new_bullet_deflection"] = "Bullet deflection"
	armortext["description_new_bullet_deflection_help"] = ""
	armortext["description_new_bullet_deflection_desc_title"] = "New/Altered mechanics - Bullet deflection"
	armortext["description_new_hdr"] = "Health Damage Reduction"
	armortext["description_new_hdr_help"] = ""
	armortext["description_new_hdr_desc_title"] = "New/Altered mechanics - HDR"
	armortext["description_new_armor_ammo"] = "Variable Ammo Pool"
	armortext["description_new_armor_ammo_help"] = ""
	armortext["description_new_armor_ammo_desc_title"] = "New/Altered mechanics - Variable Ammo Pool"
	armortext["description_new_edr"] = "Explosion Damage Reduction"
	armortext["description_new_edr_help"] = ""
	armortext["description_new_edr_desc_title"] = "New/Altered mechanics - EDR"
	armortext["description_new_health_armor"] = "Armor Health Bonus"
	armortext["description_new_health_armor_help"] = ""
	armortext["description_new_health_armor_desc_title"] = "New/Altered mechanics - Health Bonus"
	armortext["description_new_health_regen"] = "Health Regen"
	armortext["description_new_health_regen_help"] = ""
	armortext["description_new_health_regen_desc_title"] = "New/Altered mechanics - Health Regen"
	armortext["description_new_jump_armor"] = "Variable jump height"
	armortext["description_new_jump_armor_help"] = ""
	armortext["description_new_jump_armor_desc_title"] = "New/Altered mechanics - Variable Jump Height"
	armortext["description_new_bleeding"] = "Bleeding"
	armortext["description_new_bleeding_help"] = ""
	armortext["description_new_bleeding_desc_title"] = "New/Altered mechanics - Bleeding"
	armortext["description_new_difficulty"] = "Difficulty dependant stats"
	armortext["description_new_difficulty_help"] = ""
	armortext["description_new_difficulty_desc_title"] = "New/Altered mechanics - Variable stats"
	armortext["description_new_armor_reduction"] = "Armor reduction"
	armortext["description_new_armor_reduction_help"] = ""
	armortext["description_new_armor_reduction_desc_title"] = "New/Altered mechanics - Armor reduction"
	armortext["description_new_armor_drainer"] = "Perk deck: Armor Drainer"
	armortext["description_new_armor_drainer_help"] = ""
	armortext["description_new_armor_drainer_desc_title"] = "New/Altered mechanics - Armor Drainer"

	armortext["description_long_guide"] = "The Long Guide"
	armortext["description_long_guide_help"] = "A weirdly formatted version of The Long Guide (Work In Progress)"

	--[[
		LAO descriptions
	]]

	armortext["description_new_armor_regen_desc"] = [[When you are hit, you have to wait some time before your armor starts regenerating.
	When this delay has passed, instead of instanlty regenerating, your armor progressively regenerates, the rate depending on the armor.
	If you are suppressed while your armor is regenerating, its regeneration rate is set at 0, but progressively recovers for 10 seconds (can be lowered by armor regeneration skills), as long as you are not suppressed again.]]

	armortext["description_new_bullet_deflection_desc"] = [[When an enemy shoots at you, you have a chance to nullify the bullet.
	The odds depend on your armor (the tougher the better) and on the damage of the bullet (the higher, the fewer the chances).
	If you deflect the projectile, you proc the damage cooldown, like dodge does.
	In blackmarket, interpret the stats as follow:
	Deflection chance up to [deflect min value] (if damage <= [deflect min dmg]) and down to [deflect max value] (if damage > [deflect max dmg])]]

	armortext["description_new_hdr_desc"] = [[When you are hit while your armor is down (or when you are hit by a too strong sniper round), your armor can reduce health loss.
	It depends on the armor (the tougher the better) and on the damage received (the higher the better).
	In blackmarket, interpret the stats as follow:
	Health damage reduction down to [HDR min value] (if damage <= [HDR min dmg]) and up to [HDR max value] (if damage > [HDR max dmg])]]

	armortext["description_new_armor_ammo_desc"] = [[Some armors alter your ammo pool.
	Suits tend to lower it (by 20% for the Two-piece suit and 50% for the Thin suit), whereas some others increase it (Flak Jacket -> 35%; Lightweight Tactical Vest -> 40%).]]

	armortext["description_new_edr_desc"] = [[If you are hit by an explosion, damage can be lowered by the armor, the tougher the higher reduction.]]

	armortext["description_new_health_armor_desc"] = [[Some armors alter your health pool. They are a restricted number though.
	Lifa Vest increases your health pool by 100 HP, EOD Suit by 40 with Bomb Disposal Expert aced.]]

	armortext["description_new_health_regen_desc"] = [[Each tick (the briefiest part of time), depending on your armor, you might regenerate a bit of your health.
	On normal difficulty, each armor (except Two-piece suit and Thin suit) grants you a tiny health regeneration per second.
	Otherwise, only Lifa Vest grants health regeneration (1 HP per second with Curaga basic, 3 with Curaga aced).]]

	armortext["description_new_jump_armor_desc"] = [[The tougher your armor, the lower your jump will go.
	With this in mind, the jump cooldown has been reduced to 0.05s.]]

	armortext["description_new_bleeding_desc"] = [[When you take health damage, you have a chance to start bleeding.
	The odds and bleed rate depend on health loss, with a maximum of 50% chance to bleed and a rate of 50 HP per second.
	The bleeding rate decreases when your armor is up. The debleeding rate varies accordingly to your armor and its current armor / max armor ratio.
	Note that you cannot go into bleedout due to bleeding, and bleeding can be stopped by using a medic bag.]]

	armortext["description_new_difficulty_desc"] = [[Your armor stats are not static. They may depend on the difficulty.
	There is a list of the stats affected by difficulty and their ratio (from normal to deathwish):
	Armor (1, 1.5, 2, 3, 5)
	Health Damage Reduction (0.4, 0.5, 0.6, 0.8, 1)
	Bullet Deflection (0.4, 0.5, 0.6, 0.8, 1)
	Armor Regeneration (0.6, 0.65, 0.75, 0.9, 1)
	Note that when in main menu, armor stats are those of your last difficulty played in the session (normal if no mission has been played).]]

	armortext["description_new_armor_reduction_desc"] = [[When your armor breaks, your armor loses 1% of its base max armor, with a minimum of 50% remaining max armor.
	To compensate for this loss, you are granted a 0.2% speed bonus each time it breaks (with a maximum of 10% bonus).]]

	armortext["description_new_armor_drainer_desc"] = [[A new perk deck has been introduced: Armor drainer.
	When you deal a headshot, you are granted some bonus max armor. It has a 3.5 seconds cooldwon.
	This bonus is lost when your armor breaks.]]

	--[[
		The Long Guide descriptions
	]]

	armortext["description_hurt_animation_intro_desc"] = [[When an enemy takes damage, the game calculates the reaction (animation) he is supposed to show. There are 6 different reactions possible:
	No reaction: The enemy does indeed play no animation at all.
	Light hurt: An animation is shown only if the enemy isn't busy already; he flinches very slightly, virtually unnoticeable.
	Moderate hurt: The enemy staggers for 0.9 to 2.5 seconds before regaining composure.
	Heavy hurt: The enemy usually falls to the ground or at least goes on his knees and takes between 0.9 to 4.8 seconds to get up again.
	Explode hurt: The enemy is thrown into the air, falls on the ground and takes between 2.7 to 6.1 seconds to start fighting again. Shields are stunned for 1.5 to 2.5 seconds. Bulldozers are stunned for 3.5 seconds.
	Fire hurt: The enemy is set on fire for 4.3 seconds. This reaction itself does not deal damage over time however. The fire reaction is not calculated like the other reactions and thus explained together with fire weapons in Weapon Stats - Advanced Concepts.
	Death
	The death reaction is always shown when the enemy dies. There are additional reactions not related to taking damage, e.g. melee against shield with Iron Man aced, countertasing, ECM feedback, panic.

	Cloakers show no hurt reactions other than fire hurt or death (incidentally, they are also immune to ECM feedback). The remaining special enemies (except the Taser) and Deathwish Murkywaters/GenSec Elites (they are basically reskinned versions of each other) have only light or no reactions against bullets and melee but a 100% chance for explode hurt vs explosions.

	The remaining enemies look at the fraction damage/currentHitpoints, with currentHitpoints being the current hitpoints of the enemy before the damage is applied, to decide which of the following tables to pick, which in turn define the chances for each type of reaction. 

	Bullets vs law enforcers (except Deathwish Murkywaters/GenSec Elites and all specials but including the Taser):
	If fraction < 0.3: 20% no reaction, 70% light hurt, 5% moderate hurt, 5% heavy hurt
	If 0.3 <= fraction < 0.6: 40% light hurt, 40% moderate hurt, 20% heavy hurt
	If 0.6 <= fraction < 0.9: 20% light hurt, 20% moderate hurt, 60% heavy hurt
	If fraction >= 0.9: 100% heavy hurt
	Bullets vs gangsters:
	If fraction < 0.4: 30% no reaction, 60% light hurt, 10% moderate hurt
	If 0.4 <= fraction < 0.7: 10% no reaction, 70% light hurt, 20% moderate hurt
	If fraction >= 0.7: 10% no reaction, 50% light hurt, 30% moderate hurt, 10% heavy hurt
	Basically, gangsters are a lot sturdier than law enforcers. Before update 31, this table was used for all enemies. As a result, update 31 increased the chance of hurt animations on law enforcers.

	Explosions vs anyone except Deathwish Murkywaters/GenSec Elites and all specials but including the Taser:
	If fraction < 0.2: 60% no reaction, 40% heavy hurt
	If 0.2 <= fraction < 0.5: 60% heavy hurt, 40% explode hurt
	If fraction >= 0.5: 20% heavy hurt, 80% explode hurt
	Melee vs anyone except Deathwish Murkywaters/GenSec Elites and all specials but including the Taser:
	If fraction < 0.3: 30% no reaction, 70% light hurt
	If 0.3 <= fraction < 0.8: 100% light hurt
	If 0.8 <= fraction < 0.9: 60% light hurt, 20% moderate hurt, 20% heavy hurt
	If fraction >= 0.9: 100% heavy hurt
	Melee weapons do not use their actual damage value for the calculation of the fraction, but the knockdown value seen in the inventory. Martial Arts basic delivers a 1.5 multiplier to this value, making it easier to reach the stronger animations. In this manner, the fraction may even exceed 1 (technically, the game clamps it at 1 though), yet the enemy survives the attack and plays the heavy hurt animation unless he is one of the exceptions mentioned above. Pumping Iron aced has no effect on the knockdown value despite the inventory claiming otherwise (Pumping Iron basic is not reflected in the inventory at all). As indicated by the melee table, if the knockdown doesn't reach at least 80% of the remaining hitpoints, the enemy only shows light reactions or none at all. To reliably utilize the knockdown of a weapon, it is mandatory to have a knockdown value of at least 90% of the remaining hitpoints. Things would've been easier to comprehend if the last fraction requirement was fraction >= 1.0. You might want to divide your knockdown by 0.9 to obtain the maximum allowed current enemy hitpoints to have a 100% heavy hurt chance. Thus the bat with 240 knockdown can reliably cause heavy hurt when the current enemy hitpoints are less than 267.

	If there is a reaction and it is not light hurt, the victim screams (range can be reduced with Shinobi aced). If the victim was a Taser, he will be interrupted.

	If the reaction is moderate hurt, heavy hurt or death and the victim has been uncool for 3 seconds and has a weapon which has not been dropped, he additionally has a 10% chance to accidentally fire his gun, potentially harming other enemies and killing civilians close by. Enemies affected by the explosion reaction do not fire, though they will still play the death reaction when dying. Single-fire weapons shoot only 0.2 to 0.4 seconds after the reaction, whereas auto-fire weapons have no delay. The victim will not fire if he has dropped his weapon, which happens when he is affected by forced ragdoll, which in turn always happens after roughly 0.3 to 0.8 seconds after the death reaction. Basically, when an enemy is killed in a single hit, there is a small chance that he drops his weapon before using his single-fire weapon. Additionally, when enemies die due to explosions or a shotgun blast from less than 5 m away (so they experience some sort of physics push and thus ragdoll), they drop their weapons instantly (instead of the 0.3-0.8 seconds) so that not even auto-fire weapons get a shot off. Enemies do not drop their weapon before death: If the enemies don't die with a single explosion or shotgun attack, there is the risk that they show moderate or heavy hurt and thus shoot. Shotguns with slug ammo do not cause a physics push. Shotguns with HE rounds also lose their original 5 m physics push and gain a push due to the explosion (without the range requirement) instead. While ordinary bullets do slightly push bodies while they are dropping to the floor, this does not count as a forced ragdoll and does not prevent enemies from firing their gun upon death.

	Example 1:
	It is day 1 of Big Oil and a biker has been uncool for 3 seconds. Your submachine gun only deals 35% damage of his total hitpoints with each hit. What is the chance that he fires his gun due to hurt?
	The first fraction is 35%/100%, so on the first hit there is a 10% chance for moderate hurt, which means a 1% chance to shoot. The second hit has the fraction 35%/65% = 0.54, which means another 2% chance to shoot. The third shot ends in death, which means another 10% chance. The chance for the biker not to shoot is 0.99*0.98*0.9 = 87.3%, so there is a 12.7% chance that he will shoot due to hurt.

	Example 2:
	Using a weapon with 150 knockdown but only 30 damage against a Tan with 200 hitpoints, what are the reactions each time?
	The first fraction is 150/200 = 0.75, so the enemy has a 100% chance for light hurt. The enemy then takes 30 damage. The second fraction is 150/170 = 0.88, so there is a 20% chance for moderate hurt and a 20% chance for heavy hurt. The enemy takes damage again. The knockdown now exceeds his hitpoints, so he will always show heavy hurt on subsequent hits.

	Example 3:
	Using an M1014 with HE rounds (assume that it deals constant 35 damage including damage falloff and a 0.8 damage multiplier for explosives) against a Murkywater soldier who has been uncool for 3 seconds, compare the results on non-Deathwish (130 hitpoints) and Deathwish difficulty (240 hitpoints).
	The non-Deathwish Murkywater has a fraction of 35/130 = 0.27 on the first hit and thus has a 60% heavy hurt chance, meaning a 6% chance to shoot due to hurt. The fraction is 35/95 = 0.37 on the second hit, meaning another 6% chance to shoot. The third hit has a 20% heavy hurt chance, meaning a 2% chance to shoot. The Murkywater dies on the fourth hit and drops his weapon instantly, so there is no chance to shoot. The chance for the Murkywater not to shoot is 0.94*0.94*0.98 = 86.6%, so there is a 13.4% chance for him to shoot due to hurt. The Deathwish Murkywater has a 0% chance to shoot as he never shows anything but the explode reaction. However, as HE rounds make explosion noise on impact, this example only serves to illustrate the mechanics but does not have any actual application.]]

	armortext["description_hurt_animation_duration_desc"] = [[A reaction usually does not have just one possible animation; instead, there are different animations depending on the direction of the attack and whether the person was stationary or moving and hit above or below the center of mass (center of the chest) and on the enemy type. Finally, usually there are several animation variations even if the attack direction, etc. are the same, so the game randomly picks one variation. 

	For the direction of the attack, "front" shall mean that the attacker (center of the explosion or the player himself) is located in front of the enemy, facing him. Similarly, "left" means that the attacker is located to the left of the enemy, and so on. Every direction covers an angle of 90°. In the following lists, I present the minimum and maximum durations of the different animations, as well as the arithmetic mean.

	Bulldozers have only one explode hurt animation, lasting 3.5 seconds.

	Explode hurt animations of Shields (only 2 explode reactions for each direction, hence "or"):
	Front: 1.6 or 1.7 seconds, mean 1.7 seconds
	Back: 1.9 or 2.5 seconds, mean 2.2 seconds
	Left: 1.7 or 2.0 seconds, mean 1.8 seconds
	Right: 1.5 or 1.8 seconds, mean 1.7 seconds
	Explode hurt animations of the other enemies (many variations, hence "to"):
	Front: 3.2 to 4.6 seconds, mean 4.1 seconds
	Back: 3.5 to 6.1 seconds, mean 4.5 seconds
	Left: 2.7 to 4.1 seconds, mean 3.4 seconds
	Right: 3.2 to 4.4 seconds, mean 3.7 seconds
	Moderate hurt animations when hit above center of mass:
	Front: 1.1 to 2.5 seconds, mean 1.7 seconds
	Back: 0.9 or 1.1 seconds, mean 1.0 seconds
	Left: 1.0 to 2.0 seconds, mean 1.4 seconds
	Right: 1.1 to 1.6 seconds, mean 1.3 seconds
	Moderate hurt animations when hit below center of mass:
	1.3 seconds
	Heavy hurt animations when running:
	1.2 to 4.7 seconds, mean 2.8 seconds
	Heavy hurt animations when hit above center of mass:
	Front: 1.5 to 4.8 seconds, mean 3.1 seconds
	Back: 0.9 to 2.8 seconds, mean 2.1 seconds
	Left: 1.8 to 3.1 seconds, mean 2.6 seconds
	Right: 1.0 to 3.4 seconds, mean 2.7 seconds
	Heavy hurt animations when hit below center of mass:
	Front: 2.0 to 3.3 seconds, mean 2.7 seconds
	Back: 1.9 or 3.1 seconds, mean 2.5 seconds
	Left: 1.5 or 3.0 seconds, mean 2.2 seconds
	Right: 2.3 or 3.0 seconds, mean 2.8 seconds

	It follows that explosions cause the longest explode hurt animations when detonating in the back of the enemy (except against Bulldozers). Heavy hurt, on average, lasts over 3 seconds when hitting the enemy above the center of mass from the front. If you intend to go on a killing spree with melee weapons, engaging enemies from the front and aiming above their center of mass knocks down the enemies for the longest possible duration. These 3 seconds also leave the player enough time to fully wait out the violence timeout when trying to dominate the enemy.]]

	armortext["description_carrying_bags_desc"] = [[The different types of bags are classified into 4 categories:
	Light (e.g. coke, paintings): No movement penalty. Can sprint while carrying and throw far. 
	Medium (e.g. money, drill): 75% movement speed. Can't sprint, but can throw as far as light bags.
	Heavy (e.g. weapons, gold, body bag): 50% movement speed. Can't sprint and can throw only a short distance.
	Very heavy (e.g. engine, artifact): 25% movement speed. Basically just drops to the ground when thrown.
	The movement speed is multiplied by 1.5 if you have the Transporter skill (it is capped at 100% however). Thus if you have the skill, medium bags are carried at 100% speed (as 0.75*1.5=1.125 which is then capped at 1). Heavy bags are carried at 75% movement speed and very heavy ones at 37.5%.

	When throwing bags, there are a few things to keep in mind:
	Picking up a bag takes a moment (more so without Fast Hands).
	After throwing a bag, there's a cooldown of 1.2-1.5 seconds before you can pick up another bag.
	In really laggy rounds it might take several seconds before a bag you want to throw is actually thrown.
	If you don't have Fast Hands or the game is laggy, it is usually a better idea to carry things directly instead of throwing.

	I personally use the following guidelines to decide whether to carry the bags or to throw them:
	As you can sprint while carrying light bags, you don't gain too much throwing them around. Keep them on your back if you are lazy and stamina is not an issue. Otherwise mix sprinting and throwing.
	Medium bags always benefit from throwing them around, sprinting after them and picking them up again. The speed gain is minimal in the suit, but very noticeable when wearing heavy armor. Too much lag may make throwing not viable however.
	Throwing heavy bags doesn't speed up your progress, but (if you manage the cooldown of picking up bags correctly) also doesn't slow you down. Keep them on your back to save yourself the hassle of repeatedly picking up bags.
	There is no benefit to throwing (or rather, dropping) very heavy bags. Carry them on your back.
	Sometimes it is necessary to keep a large bunch of bags together to keep the cops off of them. Keep the aforementioned rules in mind while moving the bags from one point to another. If there are no cops involved, there is no point dropping weapon bags after carrying them halfway. Move them to the van and be done with it. To avoid the issue of several players attempting to grab the same bag which potentially slows down the heist, consider moving your share of bags only. E.g. if there are 8 bags of cash on day 2 of Framing Frame, focus on 2 bags and move them to the van as fast as possible. Afterwards help with the remaining 6 bags, which the other 3 players in whatever inefficient manner have carried only halfway to the van. Note that if both bags are at initially at the same spot, then if you picked up the first and threw it towards your destination without yourself moving at all, you will now need to wait more than a second before you can pick up the next bag. If instead you moved a couple of steps towards your destination before throwing the first bag, you could use that second to walk back towards the next bag, fully utilizing the time caused by the interaction cooldown. Another efficient way to carry 2 (or more) medium bags is to have one bag in front of the other. Pick up one bag and throw it past the other one, then move up to the other (during the interaction cooldown) and throw it past the first one.

	If you carry a bag while escaping, you will get the full amount of money for it. Bain's commentary afterwards will not reflect this. However, merely throwing bags into the escape zone on the other hand (without any "loot secured" message) does not count. 

	XP rewards and achievements that require players to secure a certain amount of loot do not count bags carried into the escape. Essentially, if you worry about gaining experience or achievements, carrying bags into the escape has some severe disadvantages. If you care about money only, carrying bags directly may often save a second or two depending on the circumstances.

	Bags are not affected by your personal momentum when thrown. Regardless, you can slightly increase your throwing range by jumping before throwing.]]

	armortext["description_interaction_desc"] = [[You can shout at the following things:
	Uncool civilians (range: 10 m)
	Uncool non-special enemies (range: 10 m)
	Crew members (unrestricted range to merely call them; 7 m range for Inspire)
	You can also highlight/mark the following things:
	Cameras during stealth (range: 20 m)
	SWAT turrets (range: 20 m)
	Special enemies and cool enemies (range: 30 m)
	Interaction requires clear line of sight to a the target except when targeting crew members. More precisely, there must be no obstacles between the location of the first-person camera and a single point associated with the target. If your target is a security camera, the interaction point is the camera lens. Otherwise, the interaction point is located 30 cm above the head point, which itself is located at the back of the neck. Thus the interaction point is actually located about 10 cm above the top of the head. If you have clear line of sight to this point, the shout/mark will succeed.

	The Crew Chief perk deck and Dominator aced are multipliers for the range to highlight enemies and to shout at civilians and enemies. With both skills, your range to highlight becomes 30 * 1.25 * 1.5 = 56.25 meters and your intimidation range becomes 18.75 meters. Cameras and SWAT turrets are not affected, so their range remains at 20 m.

	Long range interactions have a cooldown of 1.5 seconds before they can be used again. Inspire basic has a cooldown of 3.5 seconds. If you shout at a teammate every 2 seconds, only every other shout speeds him up. Your voice will indicate whether you have called him or inspired him.

	Enemies in stealth are highlighted for 13.5 seconds. Special enemies and cameras are highlighted for 4.5 seconds. SWAT turrets are highlighted for 9 seconds.

	Spotter basic changes the color of highlighted enemies from pink (no damage bonus) to red (damage bonus). 

	If you shout at an unintimidated civilian, he will randomly be given a maximum intimidation time between 60 and 120 seconds. His current intimidation time is filled up by repeatedly shouting at him (until it reaches the maximum intimidation time). If the current intimidation time reaches 0, the civilian will lose his intimidated state and flee. It often takes several shouts to get a civilian to drop on the ground. If a civilian was moving at the time of the shout, he will merely stop. 

	Even if your shout does not make the civilian drop on the ground, the intimidation time will build up normally. You can just leave him standing there with his hands raised for 1-2 minutes and he will not call the cops or flee. Shouting a single time at a civilian (or shooting a single time in hearing range with Control Freak basic) intimidates him, no matter the animation. Intimidation and dropping to the ground are two different things.

	Make sure to distinguish between civilians lying on the ground and crouching civilians. Crouching civilians are extremely dangerous and will try to call the police as soon as possible.

	Shouting at a civilian once will at most add 60 seconds to the time (90 seconds with Control Freak basic). The civilian you are looking at directly will gain the full 60/90 seconds, whereas the other civilians in intimidation range may get less depending on distance and angle. The system is extremely wonky however (refer to the appendix for more details). If there is a group of civilians, some close, some far away, it is a bad idea to target the close ones. Your best bet is to either target the civilian furthest away or aim at the crowd without looking at anyone in particular. Civilians hiding behind counters or furniture are not affected at all as line of sight is required.]]

	if managers.money then
	
		local leadership_cost, leadership_cost_pro, leadership_money, leadership_money_pro, fast_learner_cost, fast_learner_cost_pro, fast_learner_money, fast_learner_money_pro, equilibrium_cost, equilibrium_cost_pro, equilibrium_money, equilibrium_money_pro, dominator_cost, dominator_cost_pro, dominator_money, dominator_money_pro, kilmer_cost, kilmer_cost_pro, kilmer_money, kilmer_money_pro, control_freak_cost, control_freak_cost_pro, control_freak_money, control_freak_money_pro, inspire_cost, inspire_cost_pro, inspire_money, inspire_money_pro, enforcer_cost, enforcer_money, show_of_force_cost, show_of_force_cost_pro, show_of_force_money, show_of_force_money_pro, shotgun_impact_cost, shotgun_impact_cost_pro, shotgun_impact_money, shotgun_impact_money_pro, from_the_hip_cost, from_the_hip_cost_pro, from_the_hip_money, from_the_hip_money_pro, sharpshooter_cost, sharpshooter_cost_pro, sharpshooter_money, sharpshooter_money_pro, hardware_expert_cost, hardware_expert_cost_pro, hardware_expert_money, hardware_expert_money_pro, iron_man_cost, iron_man_cost_pro, iron_man_money, iron_man_money_pro, chameleon_cost, chameleon_cost_pro, chameleon_money, chameleon_money_pro, silence_cost, silence_cost_pro, silence_money, silence_money_pro, magic_touch_cost, magic_touch_cost_pro, magic_touch_money, magic_touch_money_pro, scavenger_cost, scavenger_cost_pro, scavenger_money, scavenger_money_pro, assassin_cost, assassin_cost_pro, assassin_money, assassin_money_pro, materia_cost, materia_money, materia_cost_pro, materia_money_pro, sentry_2_cost, sentry_2_money, sentry_2_cost_pro, sentry_2_money_pro, tough_guy_cost, tough_guy_money, tough_guy_cost_pro, tough_guy_money_pro, juggernaut_cost, juggernaut_money, juggernaut_cost_pro, juggernaut_money_pro, moving_target_cost, moving_target_money, moving_target_cost_pro, moving_target_money_pro
		
		control_freak_cost = SkillTreeManager:get_skill_points("stockholm_syndrome", 1)
		control_freak_cost_pro = SkillTreeManager:get_skill_points("stockholm_syndrome", 2)
		control_freak_money = MoneyManager:get_skillpoint_cost(1, 6, control_freak_cost)
		control_freak_money_pro = MoneyManager:get_skillpoint_cost(1, 6, control_freak_cost_pro)

		tweak_data.upgrades.skill_descs.stockholm_syndrome = {multibasic = "100", multibasic2 = "1", multipro = "3"}

		armortext["menu_stockholm_syndrome_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor7"] and "OWNED" or (control_freak_cost .. " points / $" .. comma_value(control_freak_money))) .. "## ## ##\nDébloque Lifa Vest.\nCette veste vous donne un bonus de vie de ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multibasic .. "## en normal d (jusqu'à 250 en Désir de Mort) et une régénration de vie de ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multibasic2 .. "## points par seconde.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_8_hp_regen_addend"] and "OWNED" or (control_freak_cost_pro .. " points / $" .. comma_value(control_freak_money_pro))) .. "##\nAméliore votre Lifa Vest, régénérant ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multipro .. "## PV par seconde."

		tough_guy_cost = SkillTreeManager:get_skill_points("tough_guy", 1)
		tough_guy_cost_pro = SkillTreeManager:get_skill_points("tough_guy", 2)
		tough_guy_money = MoneyManager:get_skillpoint_cost(1, 6, tough_guy_cost)
		tough_guy_money_pro = MoneyManager:get_skillpoint_cost(1, 6, tough_guy_cost_pro)

		armortext["menu_tough_guy_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor6"] and "OWNED" or (tough_guy_cost .. " points / $" .. comma_value(tough_guy_money))) .. "## ## ##\nDébloque l'ICTV.\n\nACE: ##" .. (Global.upgrades_manager.aquired["run_and_shoot"] and "OWNED" or (tough_guy_cost_pro .. " points / $" .. comma_value(tough_guy_money_pro))) .. "##\nVous pouvez maintenant tirer en courant.\nVous pouvez maintenant destabiliser les boucliers avec un coup de mêlée."

		juggernaut_cost = SkillTreeManager:get_skill_points("juggernaut", 1)
		juggernaut_cost_pro = SkillTreeManager:get_skill_points("juggernaut", 2)
		juggernaut_money = MoneyManager:get_skillpoint_cost(1, 6, juggernaut_cost)
		juggernaut_money_pro = MoneyManager:get_skillpoint_cost(1, 6, juggernaut_cost_pro)

		tweak_data.upgrades.skill_descs.juggernaut = {multipro = "10%", multipro2 = "10", multipro3 = "8", multipro4 = "400%", note = "75%"}

		armortext["menu_juggernaut_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor10"] and "OWNED" or (juggernaut_cost .. " points / $" .. comma_value(juggernaut_money))) .. "## ## ##\nDébloque la combinaison de déminage.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_11_hp_addend"] and "OWNED" or (juggernaut_cost_pro .. " points / $" .. comma_value(juggernaut_money_pro))) .. "##\nAméliore votre combinaison, réduisant les dégâts d'explosion à ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro .. "##, augmentant vos PV max de ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro2 .. "##, votre vitesse de ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro3 .. "## et la stamina de ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro4 .. "##.\n\nNote: La combinaison de déminage n'est pas affectée par Blending In. Lorsque vous êtes sous un effet de suppression, vous ne pouvez régénérer plus de ##" .. tweak_data.upgrades.skill_descs.juggernaut.note .. "## de sa valeur de base."

		materia_cost = SkillTreeManager:get_skill_points("sentry_targeting_package", 1)
		materia_cost_pro = SkillTreeManager:get_skill_points("sentry_targeting_package", 2)
		materia_money = MoneyManager:get_skillpoint_cost(1, 6, materia_cost)
		materia_money_pro = MoneyManager:get_skillpoint_cost(1, 6, materia_cost_pro)

		tweak_data.upgrades.skill_descs.materia = {multipro = "20%", multipro2 = "10", multipro3 = "10%"}

		armortext["menu_sentry_targeting_package_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor8"] and "OWNED" or (materia_cost .. " points / $" .. comma_value(materia_money))) .. "## ## ##\nDébloque la Veste légère tactique.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_9_armor_regen_addend"] and "OWNED" or (materia_cost_pro .. " points / $" .. comma_value(materia_money_pro))) .. "##\nAméliore votre Veste légère tactique, réduisant le délai de régénération de ##" .. tweak_data.upgrades.skill_descs.materia.multipro .. "##, augmentant la vitesse de régénération de ##" .. tweak_data.upgrades.skill_descs.materia.multipro2 .. "## par seconde et les chances de défléction de ##" .. tweak_data.upgrades.skill_descs.materia.multipro3 .. "##."

		sentry_2_cost = SkillTreeManager:get_skill_points("sentry_2_0", 1)
		sentry_2_cost_pro = SkillTreeManager:get_skill_points("sentry_2_0", 2)
		sentry_2_money = MoneyManager:get_skillpoint_cost(1, 6, sentry_2_cost)
		sentry_2_money_pro = MoneyManager:get_skillpoint_cost(1, 6, sentry_2_cost_pro)

		tweak_data.upgrades.skill_descs.sentry_2 = {multibasic = "100%", multipro = "150%", multipro2 = "50%"}

		armortext["menu_sentry_2_0_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["sentry_gun_can_reload"] and "OWNED" or (sentry_2_cost .. " points / $" .. comma_value(sentry_2_money))) .. "## ## ##\nVous pouvez maintenant recharger vos tourelles avec vos munitions\nLa précision de vos tourelles est augmentée de ##" .. tweak_data.upgrades.skill_descs.sentry_2.multibasic .. "##.\n\nACE: ##" .. (Global.upgrades_manager.aquired["sentry_gun_shield"] and "OWNED" or (sentry_2_cost_pro .. " points / $" .. comma_value(sentry_2_money_pro))) .. "##\nVos tourelles ont maintenant un bouclier protecteur\nLa vitesse de rotation de vos tourelles est augmentée de ##" .. tweak_data.upgrades.skill_descs.sentry_2.multipro .. "##.\nVos tourelles ont ##" .. tweak_data.upgrades.skill_descs.sentry_2.multipro2 .. "## de munitions en plus."

		moving_target_cost = SkillTreeManager:get_skill_points("moving_target", 1)
		moving_target_cost_pro = SkillTreeManager:get_skill_points("moving_target", 2)
		moving_target_money = MoneyManager:get_skillpoint_cost(1, 6, moving_target_cost)
		moving_target_money_pro = MoneyManager:get_skillpoint_cost(1, 6, moving_target_cost_pro)

		tweak_data.upgrades.skill_descs.moving_target = {multipro = "15%"}

		armortext["menu_moving_target_desc"] = "## ##BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor9"] and "OWNED" or (moving_target_cost .. " points / $" .. comma_value(moving_target_money))) .. "## ## ##\nVous pouvez maintenant courir vers les côtés.\nDébloque la fine veste.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_can_free_run"] and "OWNED" or (moving_target_cost_pro .. " points / $" .. comma_value(moving_target_money_pro))) .. "##\nVous pouvez maintenant courir dans toutes les direcitons.\nVous avez ##" .. tweak_data.upgrades.skill_descs.moving_target.multipro .. "## de dodge en plus."
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

	armortext["menu_deck_armor_drainer_1_desc"] = "##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][1].multiperk .. "## d'armure max en plus pour chaque tir dans la tête, avec un maximum de ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][1].multiperk2 .. "## par tir dans la tête."
	armortext["menu_deck_armor_drainer_3_desc"] = "##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][3].multiperk .. "## d'armure max en plus pour chaque tir dans la tête, avec un maximum de ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][3].multiperk2 .. "## par tir dans la tête."
	armortext["menu_deck_armor_drainer_5_desc"] = "##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][5].multiperk .. "## d'armure max en plus pour chaque tir dans la tête, avec un maximum de ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][5].multiperk2 .. "## par tir dans la tête."
	armortext["menu_deck_armor_drainer_7_desc"] = "##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][7].multiperk .. "## d'armure max en plus pour chaque tir dans la tête, avec un maximum de ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][7].multiperk2 .. "## par tir dans la tête."
	armortext["menu_deck_armor_drainer_9_desc"] = "##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk .. "## d'armure max en plus pour chaque tir dans la tête, avec un maximum de ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk2 .. "## par tir dans la tête.\n\nBonus de completion: Vous avez ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk3 .. "## de chances de plus d'avoir un objet rare lors d'un PAYDAY."

	--[[armortext["custom_armor_points"] = "Points used: " .. (points_used and points_used or 0) .. " / " .. (total_points and total_points or 0)
	armortext["custom_armor_armor_help"] = "Amount of armor (" .. (Global.custom_armor and get_custom_armor_value("armor") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("armor") or "nil") .. ")"
	armortext["custom_armor_movement_help"] = "Amount of movement (" .. (Global.custom_armor and get_custom_armor_value("movement") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("movement") or "nil") .. ")"
	armortext["custom_armor_concealment_help"] = "Points used: " .. (Global.custom_armor and get_custom_armor_cost("concealment") or "nil")
	armortext["custom_armor_dodge_help"] = "Amount of dodge (" .. (Global.custom_armor and get_custom_armor_value("dodge") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("dodge") or "nil") .. ")"
	armortext["custom_armor_damage_shake_help"] = "Amount of steadiness (" .. (Global.custom_armor and 11 / (1 - get_custom_armor_value("damage_shake")) or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("damage_shake") or "nil") .. ")"
	armortext["custom_armor_stamina_help"] = "Amount of stamina (" .. (Global.custom_armor and get_custom_armor_value("stamina") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("stamina") or "nil") .. ")"
	armortext["custom_armor_skill_ammo_mul_help"] = "Amount of ammo (" .. (Global.custom_armor and get_custom_armor_value("skill_ammo_mul") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("skill_ammo_mul") or "nil") .. ")"
	armortext["custom_armor_hdr_min_dmg_help"] = "Amount of HDR min damage (" .. (Global.custom_armor and get_custom_armor_value("health_damage_reduction_min_dmg") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("health_damage_reduction_min_dmg") or "nil") .. ")"
	armortext["custom_armor_hdr_min_value_help"] = "Amount of HDR min value (" .. (Global.custom_armor and get_custom_armor_value("health_damage_reduction_min_value") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("health_damage_reduction_min_value") or "nil") .. ")"
	armortext["custom_armor_hdr_max_dmg_help"] = "Amount of HDR max damage (" .. (Global.custom_armor and 100 - get_custom_armor_value("health_damage_reduction_max_dmg") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("health_damage_reduction_max_dmg") or "nil") .. ")"
	armortext["custom_armor_hdr_max_value_help"] = "Amount of HDR max value (" .. (Global.custom_armor and get_custom_armor_value("health_damage_reduction_max_value") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("health_damage_reduction_max_value") or "nil") .. ")"
	armortext["custom_armor_deflect_min_dmg_help"] = "Amount of deflect min damage (" .. (Global.custom_armor and get_custom_armor_value("deflect_min_dmg") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("deflect_min_dmg") or "nil") .. ")"
	armortext["custom_armor_deflect_min_value_help"] = "Amount of deflect min chance (" .. (Global.custom_armor and get_custom_armor_value("deflect_min_value") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("deflect_min_value") or "nil") .. ")"
	armortext["custom_armor_deflect_max_dmg_help"] = "Amount of deflect max damage (" .. (Global.custom_armor and get_custom_armor_value("deflect_max_dmg") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("deflect_max_dmg") or "nil") .. ")"
	armortext["custom_armor_deflect_max_value_help"] = "Amount of deflect max chance (" .. (Global.custom_armor and get_custom_armor_value("deflect_max_value") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("deflect_max_value") or "nil") .. ")"
	armortext["custom_armor_regen_help"] = "Amount of armor regen (" .. (Global.custom_armor and 10 + get_custom_armor_value("regen") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("regen") or "nil") .. ")"
	armortext["custom_armor_edr_help"] = "Amount of EDR (" .. (Global.custom_armor and get_custom_armor_value("explosion_damage_reduction") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("explosion_damage_reduction") or "nil") .. ")"
	armortext["custom_armor_hp_regen_help"] = "Amount of health regen per second (" .. (Global.custom_armor and get_custom_armor_value("hp_regen") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("hp_regen") or "nil") .. ")"
	armortext["custom_armor_hp_addend_help"] = "Amount of health bonus (" .. (Global.custom_armor and get_custom_armor_value("hp_addend") * 10 or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("hp_addend") or "nil") .. ")"
	armortext["custom_armor_jump_speed_multiplier_help"] = "Height of jump (" .. (Global.custom_armor and get_custom_armor_value("jump_speed_multiplier") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("jump_speed_multiplier") or "nil") .. ")"
	armortext["custom_armor_ap_regen_suppressed_max_multiplier_help"] = "Amount of max AP regen while suppressed (" .. (Global.custom_armor and get_custom_armor_value("ap_regen_suppressed_max_multiplier") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("ap_regen_suppressed_max_multiplier") or "nil") .. ")"
	armortext["custom_armor_bleeding_reduction_help"] = "Amount of bleeding reduction (" .. (Global.custom_armor and get_custom_armor_value("bleeding_reduction") or "nil") .. ") (points used: " .. (Global.custom_armor and get_custom_armor_cost("bleeding_reduction") or "nil") .. ")"]]
	
    if armortext[string_id] then return armortext[string_id] end

    if not DMCWO then
    	return LocalizationManager_text(self, string_id, macros)
    end

    -- Compatibility with DeadManChest's Weapon Overhaul (or DMCWO if you prefer)
    return string_id == "bm_menu_weapon_movement_penalty_info" and "Base move speed when drawn: "
	
	--armor
	or string_id == "bm_armor_level_5" and "Flak Jacket A Bigger Shit"
	or string_id == "bm_armor_level_6" and "Combined Tactical Vest A Shit"
	
	--attachments
	or string_id == "bm_menu_custom" and "Internal Mod"
	or string_id == "bm_menu_extra" and "Rail"
	or string_id == "bm_menu_upper_reciever" and "Upper Body Mod"
	or string_id == "bm_menu_lower_reciever" and "Lower Body Mod"
	or string_id == "bm_menu_slide" and "Barrel/Slide"
	or string_id == "bm_menu_grip" and "Pistol Grip"
	or string_id == "bm_menu_barrel_ext" and "Barrel Extension"
	or string_id == "bm_menu_foregrip" and "Handguard"
	or string_id == "bm_menu_sight" and "Optic"
	
	--pseudo-categories
	or string_id == "menu_anti_mat" and "Anti Materiel Rifles"
	or string_id == "menu_pdw" and "PDWs"
	or string_id == "menu_mach_pis" and "Machine Pistols"
	or string_id == "menu_battle_rifle" and "Battle Rifles"
	or string_id == "menu_carbine" and "Carbines"
	or string_id == "menu_gpmg" and "General Purpose Machine Guns"
	or string_id == "menu_revolvo" and "Revolvers"
	
	--real categories
	or string_id == "menu_pistol" and "Pistols"
	or string_id == "menu_lmg" and "Light Machine Guns"
	or string_id == "menu_shotgun" and "Shotguns"
	or string_id == "menu_assault_rifle" and "Assault Rifles"
	or string_id == "menu_snp" and "Rifles"
	or string_id == "menu_smg" and "Sub-Machine Guns"
	
	--characters
	or string_id == "menu_jowi" and "Wick"
	
	--[[ WE UPOTTE NAO ]]--{
	--[ Faculty ]
	or DMCWO.upotte == true and string_id == "bm_w_m1928" and "Thompson-sensei"
	or DMCWO.upotte == true and string_id == "bm_w_m1928_desc" and "An American elementary school teacher working at Seishou Academy. She's chambered in .45 ACP.\nCheerful but airheaded.\nCan pierce enemies and walls."
	--[ Elementary Schoolers ]
	--MP5
	or DMCWO.upotte == true and string_id == "bm_w_mp5" and "Empi"
	or DMCWO.upotte == true and string_id == "bm_w_mp5_desc" and "A German elementary schooler attending Seishou Academy. She's chambered in 9mm.\nPresident of the elementary school student council.\nCan pierce thin walls."
	or DMCWO.upotte == true and string_id == "bm_w_mac10" and "Emten"
	or DMCWO.upotte == true and string_id == "bm_w_mac10_desc" and "An American elementary schooler attending Seishou Academy. She's chambered in .45 ACP.\nMotor-mouthed and quite \"stacked\".\nCan pierce enemies and walls."
	--[ Middleschoolers ]
	--AUG
	or DMCWO.upotte == true and string_id == "bm_w_aug" and "AUG"
	or DMCWO.upotte == true and string_id == "bm_w_aug_desc" and "An Austrian middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nStrict but reserved.\nCan pierce enemies and walls."
	--M16
	or DMCWO.upotte == true and string_id == "bm_w_m16" and "Ichiroku"
	or DMCWO.upotte == true and string_id == "bm_w_m16_desc" and "An American middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nEnergetic and foul-mouthed.\nCan pierce enemies and walls."
	--L85
	or DMCWO.upotte == true and string_id == "bm_w_l85a2" and "Eru"
	or DMCWO.upotte == true and string_id == "bm_w_l85a2_desc" and "A British middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nShy and clumsy.\nCan pierce enemies and walls."
	--M4A1
	or DMCWO.upotte == true and string_id == "bm_w_m16" and "Em-Four"
	or DMCWO.upotte == true and string_id == "bm_w_m16_desc" and "An American middleschooler attending Seishou Academy. She's chambered in 5.56 NATO.\nVice-president of the middleschool student council.\nCan pierce enemies and walls."
	--AK74
	or DMCWO.upotte == true and string_id == "bm_w_ak74" and "AK74"
	or DMCWO.upotte == true and string_id == "bm_w_ak74_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 5.45x39.\nSerious and cunning.\nCan pierce enemies and walls."
	--AKM
	or DMCWO.upotte == true and string_id == "bm_w_akm" and "AKM"
	or DMCWO.upotte == true and string_id == "bm_w_akm_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 7.62x39.\nMenacing and a bully.\nCan pierce enemies and walls."
	--RPK
	or DMCWO.upotte == true and string_id == "bm_w_rpk" and "RPK"
	or DMCWO.upotte == true and string_id == "bm_w_rpk_desc" and "A Russian middleschooler attending Red Steel Academy. She's chambered in 7.62x39.\nAgressive but rather simple minded.\nCan pierce enemies and walls."
	--[ Highschoolers ]
	--G3
	or DMCWO.upotte == true and string_id == "bm_w_g3" and "Jiisuri"
	or DMCWO.upotte == true and string_id == "bm_w_g3_desc" and "A German highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nElegant but a bit of a klutz.\nCan pierce enemies, walls and shields.\nDMC's raifu, treat her well."
	--M14
	or DMCWO.upotte == true and string_id == "bm_w_m14" and "Ichiyon"
	or DMCWO.upotte == true and string_id == "bm_w_m14_desc" and "An American highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nCarefree and filled with puns.\nCan pierce enemies, walls and shields."
	--FAL
	or DMCWO.upotte == true and string_id == "bm_w_fal" and "Faaru"
	or DMCWO.upotte == true and string_id == "bm_w_fal_desc" and "A Belgian highschooler attending Seishou Academy. She's chambered in 7.62 NATO.\nResponsible and lax.\nCan pierce enemies, walls and shields."
	--}
	
	--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
	or string_id == "bm_w_m134" and "General Electric M134"
	or string_id == "bm_w_m134_desc" and "A 7.62 NATO, six-barreled machine gun with high suppressive capabilities.\nCan pierce enemies, walls and shields."
	or string_id == "bm_wp_m134_body_upper_light_desc" and "##20% faster## movement.\n##10% faster## reload speeds."
	or string_id == "bm_wp_m134_barrel_extreme" and "Anti-Air Barrel"
	or string_id == "bm_wp_m134_barrel_extreme_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds.\n##10% slower## movement."
	or string_id == "bm_wp_m134_barrel_short" and "Compact Barrel"
	or string_id == "bm_wp_m134_barrel_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds.\n##20% faster## movement."
	
	--[[WE TERRORIST NAO]]
	or string_id == "bm_w_rpg7" and "Bazalt RPG-7"
	or string_id == "bm_w_rpg7_desc" and "A Russian rocket-propelled grenade launcher.\nNo police ammobox pickups.\nDamage boosts from skills do not affect this weapon."
	
	--[[GOLD SLAVSHIT]]
	or string_id == "bm_w_akm_gold" and "Gold Plated AKMS"
	or string_id == "bm_w_akm_gold_desc" and "A Russian gold-plated assault rifle chambered in 7.62x39mm.\nCan pierce enemies and walls."
	
	--[[JAM733]]
	or string_id == "bm_w_amcar" and "Colt M733 Commando"
	or string_id == "bm_w_amcar_desc" and "An American carbine chambered in 5.56 NATO.\nCan pierce enemies and walls."
	
	--[[STEEL BALLS]]
	or string_id == "bm_w_ak74" and "Concern Kalashnikov AKS-74"
	or string_id == "bm_w_ak74_desc" and "A Russian assault rifle chambered in 5.45x39mm.\nCan pierce enemies and walls."
	
	--[[JAM-4]]
	or string_id == "bm_w_m4" and "Colt M4A1" --"Safety Pins"
	or string_id == "bm_w_m4_desc" and "An American assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls."
	--Barrels
	or string_id == "bm_wp_m4_uupg_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	or string_id == "bm_wp_m4_uupg_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Suppressed Barrel
	or string_id == "bm_wp_m4_uupg_b_sd" and "Suppressed Barrel" 
	or string_id == "bm_wp_m4_uupg_b_sd_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds." 
	--Aftermarket
	or string_id == "bm_wp_m4_uupg_fg_lr300" and "LR300 Handguard"
	or string_id == "bm_wp_m4_uupg_fg_lr300_desc" and "##7.5% faster## ADS speeds."
	--Competition
	or string_id == "bm_wp_upg_fg_jp" and "JPE Modular Handguard"
	or string_id == "bm_wp_upg_fg_jp_desc" and "##5% faster## ADS speeds." 
	--Gazelle
	or string_id == "bm_wp_upg_fg_smr" and "Geissele Super Modular Rail"
	
	--[[AUGLY]]
	or string_id == "bm_w_aug" and "Steyr AUG A2"
	or string_id == "bm_w_aug_desc" and "An Austrian bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls."
	--A3 Tact. Foregrip
	or string_id == "bm_wp_aug_fg_a3" and "A3 Rail"
	or string_id == "bm_wp_aug_fg_a3_desc" and "##5% slower## ADS speeds."
	or string_id == "bm_wp_aug_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_aug_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[WHITE FLAG]]
	or string_id == "bm_w_famas" and "Nexter FAMAS" --"IS THAT A DEAGLE?"
	or string_id == "bm_w_famas_desc" and "A French bullpup assault rifle chambered in 5.56 NATO.\nCan fire in 3-round bursts.\nCan pierce enemies and walls."
	
	or string_id == "bm_wp_famas_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	or string_id == "bm_wp_famas_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	or string_id == "bm_wp_famas_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_famas_b_suppressed_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds."
	
	--Retro Grip
	or string_id == "bm_wp_famas_g_retro" and "G2 Guard"
	or string_id == "bm_wp_famas_g_retro_desc" and "ROF ##raised## to ##1200 RPM##"
	
	--[[JAM]]
	or string_id == "bm_w_l85a2" and "BAE L85A2" --"Eru"
	or string_id == "bm_w_l85a2_desc" and "A British-German bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls."
	or string_id == "bm_wp_l85a2_b_long" and "Long Barrel"
	or string_id == "bm_wp_l85a2_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_l85a2_b_short" and "Short Barrel"
	or string_id == "bm_wp_l85a2_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_l85a2_g_worn" and "Taped Pistol Grip"
	or string_id == "bm_wp_l85a2_fg_short" and "Daniel Defense L85 Quad Rail"
	or string_id == "bm_wp_l85a2_fg_short_desc" and "##5% faster## ADS speeds." 
	
	--[[CROATGAT]]
	or string_id == "bm_w_vhs" and "HS Produkt VHS-2"
	or string_id == "bm_w_vhs_desc" and "A Croatian bullpup assault rifle chambered in 5.56 NATO.\nCan pierce enemies and walls."
	or string_id == "bm_wp_vhs_b_short" and "Short Barrel"
	or string_id == "bm_wp_vhs_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_vhs_b_sniper" and "Sniper Barrel"
	or string_id == "bm_wp_vhs_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	
	or string_id == "bm_wp_vhs_b_silenced" and "Suppressed Barrel"
	or string_id == "bm_wp_vhs_b_silenced_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds."
	
	--[[SLAVSHIT]]
	or string_id == "bm_w_akm" and "Concern Kalashnikov AKMS"
	or string_id == "bm_w_akm_desc" and "A Russian assault rifle chambered in 7.62x39mm.\nCan pierce enemies and walls."
	
	--[[MELTGUN]]
	or string_id == "bm_w_g36" and "Heckler & Koch G36KV"
	or string_id == "bm_w_g36_desc" and "A German carbine chambered in 5.56 NATO.\nCan fire in 2-round bursts.\nCan pierce enemies and walls."
	--Compact
	or string_id == "bm_wp_g36_fg_c" and "G36c Handguard"
	or string_id == "bm_wp_g36_fg_c_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds."
	--Polizei
	or string_id == "bm_wp_g36_fg_ksk" and "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	or string_id == "bm_wp_g36_s_kv" and "G36KV Stock"
	--Sniper Stock
	or string_id == "bm_wp_g36_s_sl8" and "SL8 Stock"
	
	--[[PUNS]]
	or string_id == "bm_w_m14" and "Springfield M14 DMR"
	or string_id == "bm_w_m14_desc" and "A special DMR version of the American M14 battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Abraham
	or string_id == "bm_wp_m14_body_ebr" and "MK.14 Kit"
	or string_id == "bm_wp_m14_body_ebr_desc" and "##5% slower## ADS speeds\n##5% slower## movement.\nROF ##raised## to ##750 RPM##"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	or string_id == "bm_wp_m14_body_jae" and "M14 JAE Kit"
	
	--[[SWED]]
	or string_id == "bm_w_ak5" and "Bofors Ak 5" --"FNC's sexy swedish cousin"
	or string_id == "bm_w_ak5_desc" and "A licensed Swedish copy of the Belgian FN FNC assault rifle, chambered in 5.56 NATO.\nCan pierce enemies and walls."
	--Karbin Ceres
	or string_id == "bm_wp_ak5_fg_ak5c" and "Ak 5c Kit"
	or string_id == "bm_wp_ak5_fg_ak5c_desc" and "ROF ##lowered## to ##650 RPM.##"
	--Belgian Heat
	or string_id == "bm_wp_ak5_fg_fnc" and "FN FNC Kit"
	or string_id == "bm_wp_ak5_fg_fnc_desc" and "ROF ##raised## to ##700 RPM.##\nAllows the burst fire mod to be attached."
	--Bertil
	or string_id == "bm_wp_ak5_s_ak5b" and "Ak 5b Stock"
	--Caesar
	or string_id == "bm_wp_ak5_s_ak5c" and "Ak 5c Stock"
	
	--[[JAM16]]
	or string_id == "bm_w_m16" and "Colt M16A4" --"Orange Slices", "IS THAT A FAMAS?"
	or string_id == "bm_w_m16_desc" and "An American 5.56 NATO assault rifle.\nCan pierce enemies and walls."
	--going against imfdb here, simply for the fact the the flat top receiver isn't limited to the A4 and that the AMR bares more resemblence to the A3 (default handguard, automatic fire)
	or string_id == "bm_w_m16a4" and "Colt M16A4"
	or string_id == "bm_w_m16a4_desc" and "An American 5.56 NATO assault rifle that fires in 3-round bursts.\nCan pierce enemies and walls."
	--Railed
	or string_id == "bm_wp_m16_fg_railed" and "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring dongle thing
	or string_id == "bm_wp_m16_fg_railed_desc" and "##5% slower## ADS speeds."
	--Blast to the Past
	or string_id == "bm_wp_m16_fg_vietnam" and "M16A1 Handguard"
	or string_id == "bm_wp_m16_fg_vietnam_desc" and "##5% faster## ADS speeds." 
	
	--[[553 NO PANTSU]]
	or string_id == "bm_w_s552" and "SIG SG 552-2" --"SG550's Little Sister"
	or string_id == "bm_w_s552_desc" and "A Swiss-made carbine chambered in 5.56 NATO.\nCan fire in 3-round bursts.\nCan pierce enemies and walls."
	--Enhanced Foregrip
	or string_id == "bm_wp_ass_s552_fg_standard_green" and "OD Green Handguard"
	--Enhanced Grip
	or string_id == "bm_wp_ass_s552_g_standard_green" and "OD Green Pistol Grip"
	--Enhanced Stock
	or string_id == "bm_wp_ass_s552_s_standard_green" and "OD Green Stock"	
	--Enhanced Foregrip
	or string_id == "bm_wp_ass_s552_fg_black" and "Black Handguard"
	--Enhanced Grip
	or string_id == "bm_wp_ass_s552_g_black" and "Black Pistol Grip"
	--Enhanced Stock
	or string_id == "bm_wp_ass_s552_s_black" and "Black Stock"
	--Railed Foregrip
	or string_id == "bm_wp_ass_s552_fg_railed" and "SIG Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
	--Heat Treated
	or string_id == "bm_wp_ass_s552_body_standard_black" and "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
	--Long Barrel
	or string_id == "bm_wp_ass_s552_b_long_desc" and "##15% longer## overall range.\n5##% slower## ADS speeds."
	
	--[[EAG-H]]
	or string_id == "bm_w_scar" and "FN MK.17"
	or string_id == "bm_w_scar_desc" and "A Belgian-American battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Sniper Stock
	or string_id == "bm_wp_scar_s_sniper" and "MK.20 Stock"	
	
	or string_id == "bm_wp_scar_b_long_desc" and "##15% longer## overall range.\n5##% slower## ADS speeds."
	
	or string_id == "bm_wp_scar_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Rail Extension
	or string_id == "bm_wp_scar_fg_railext" and "PWS SCAR Rail Extension"
	or string_id == "bm_wp_scar_fg_railext_desc" and "##5% slower## ADS speeds."
	
	--[[RIGHT ARM]]
	or string_id == "bm_w_fal" and "FN FAL"
	or string_id == "bm_w_fal_desc" and "A Belgian battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\n\"Right arm of the free world.\""
	--CQB
	or string_id == "bm_wp_fal_body_standard" and "DSA SA58 Handguard w/Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	or string_id == "bm_wp_fal_body_standard_desc" and "##10% shorter## overall range.\n##15% faster## ADS speeds.\n##5% faster## movement."
	
    or string_id == "bm_wp_fal_fg_03" and "IMI Romat Handguard"
    or string_id == "bm_wp_fal_fg_03_desc" and "##5% slower## ADS speeds."
	--Marksman
    or string_id == "bm_wp_fal_fg_04" and "DSA Freefloat Handguard"
    or string_id == "bm_wp_fal_fg_04_desc" and "##5% faster## ADS speeds." 
	--Wood
    or string_id == "bm_wp_fal_fg_wood" and "Wooden Handguard"
    or string_id == "bm_wp_fal_fg_wood_desc" and "##7.5% slower## ADS speeds.\n##5% slower## movement."
	--Tactical Grip
	or string_id == "bm_wp_fal_g_01" and "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
    or string_id == "bm_wp_fal_m_01" and "30rnd FAL Magazine"
    or string_id == "bm_wp_fal_m_01_desc" and "##10% slower## reload speeds."
	--Folding
    or string_id == "bm_wp_fal_s_01" and "Sidefolding Stock"
	--Marksman
    or string_id == "bm_wp_fal_s_03" and "Magpul FAL PRS Stock"
	
	--[[BOTTLE OPENER]]
	or string_id == "bm_w_galil" and "IMI Galil ARM"
	or string_id == "bm_w_galil_desc" and "An Israeli battle rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Sniper
	or string_id == "bm_wp_galil_fg_sniper" and "IMI Galatz Handguard & Sniper Barrel"
	or string_id == "bm_wp_galil_fg_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds.\nROF ##lowered## to ##630 RPM.##"
	--Light
	or string_id == "bm_wp_galil_fg_sar" and "IMI Galil SAR Handguard & 13\" Barrel"
	or string_id == "bm_wp_galil_fg_sar_desc" and "##5% faster ADS## speeds." 
	--CQB
	or string_id == "bm_wp_galil_fg_mar" and "IMI Galil MAR Handguard & 7\" Barrel"
	or string_id == "bm_wp_galil_fg_mar_desc" and "##10% shorter## overall range.\n##15% faster## ADS speeds.\n##10% faster## movement.\nROF ##raised## to ##750 RPM.##"
	--FAB
	or string_id == "bm_wp_galil_fg_fab" and "FAB Defense VFR GA Handguard"
	--Sniper Grip
	or string_id == "bm_wp_galil_g_sniper" and "IMI Galatz Pistol Grip"
	--Sniper Stock
	or string_id == "bm_wp_galil_s_sniper" and "IMI Galatz Wooden Stock"
	--Skeletal Stock
	or string_id == "bm_wp_galil_s_skeletal" and "IMI Galil MAR Stock"
	--Light Stock
	or string_id == "bm_wp_galil_s_light" and "IMI Galatz Skeleton Stock"
	--FAB Stock
	or string_id == "bm_wp_galil_s_fab" and "FAB Defense MG-CP Cheek Pad"
	
	--[[MAI RAIFU (SHE'S MINE I TELL YOU)]]
	or string_id == "bm_w_g3" and "Heckler & Koch G3"
	or string_id == "bm_w_g3_desc" and "A German battle rifle based off the Spanish CETME, chambered in 7.62 NATO.\nCan pierce enemies, walls and shields.\nDMC's raifu, treat her well."
	--Assault Kit
	or string_id == "bm_wp_g3_b_short" and "Short Barrel"
	or string_id == "bm_wp_g3_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--DMR Kit
	or string_id == "bm_wp_g3_b_sniper" and "PSG-1 Barrel"
	or string_id == "bm_wp_g3_b_sniper_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds.\nROF ##lowered## to ##500 RPM.##"
	--PSG Foregrip
	or string_id == "bm_wp_g3_fg_psg" and "PSG-1 Handguard"
	or string_id == "bm_wp_g3_fg_psg_desc" and "##5% slower## ADS speeds."
	--Railed Foregrip
	or string_id == "bm_wp_g3_fg_railed" and "FAB Defense G3-RS Handguard"
	--Retro Foregrip
	or string_id == "bm_wp_g3_fg_retro" and "Wooden Slimline Handguard"
	or string_id == "bm_wp_g3_fg_retro_desc" and "##7.5% slower## ADS speeds.\n##5% faster## movement."
	--Plastic Retro Foregrip
	or string_id == "bm_wp_g3_fg_retro_plastic" and "Slimline Handguard"
	or string_id == "bm_wp_g3_fg_retro_plastic_desc" and "##5% faster## ADS speeds.\n##10% faster## movement."
	--Retro Grip
	or string_id == "bm_wp_g3_g_retro" and "G3 Ergo Grip"
	or string_id == "bm_wp_g3_g_retro_desc" and "##5% faster## ADS speeds." 
	--Sniper Grip
	or string_id == "bm_wp_g3_g_sniper" and "PSG-1 Wooden Pistol Grip"
	--Sniper Stock
	or string_id == "bm_wp_g3_s_sniper" and "PSG-1 Stock"

	
	--[[Rattlesnake]]
	or string_id == "bm_w_msr" and "Remington MSR"
	or string_id == "bm_w_msr_desc" and "An American bolt-action rifle chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Suppressor
	or string_id == "bm_wp_snp_msr_ns_suppressor" and "AAC TiTAN-QD Suppressor"
	or string_id == "bm_wp_snp_msr_ns_suppressor_desc" and "A ##large## suppressor.\n##20% shorter## overall range.\n##10% lower## minimum damage.\n##10% slower## ADS speeds."
	or string_id == "bm_wp_snp_msr_b_long_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds."
	--Aluminum Body
	or string_id == "bm_wp_msr_body_msr" and "MSR Aluminum Stock & Receiver"
	or string_id == "bm_wp_msr_body_msr_desc" and "##5% faster## ADS speeds." 
	
	--[[R93]]
	or string_id == "bm_w_r93" and  "Blaser R93 Tactical 2"
	or string_id == "bm_w_r93_desc" and "A German bolt-action rifle chambered in .338 Lapua Magnum.\nCan pierce enemies, walls and shields."
	
	or string_id == "bm_wp_r93_b_short_desc" and  "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_r93_b_suppressed_desc" and  "A ##large## suppressor.\n##20% shorter## overall range.\n##10% lower## minimum damage.\n10% slower ADS speeds."
	--Wooden Body
	or string_id == "bm_wp_r93_body_wood" and "Long Range Sporter 2 Stock"
	or string_id == "bm_wp_r93_body_wood_desc" and "##5% slower## ADS speeds."
	
	--[[FIDDY CAL]]
	or string_id == "bm_w_m95" and "Barrett M95"
	or string_id == "bm_w_m95_desc" and "An American .50 BMG, bolt-action, bullpup anti-materiel rifle.\nCan pierce enemies, walls and shields.\nDamage boosts from skills do not effect this weapon."
	--Tank Buster
	or string_id == "bm_wp_m95_b_barrel_long" and "Long Barrel w/AW50F Muzzle Brake"
	or string_id == "bm_wp_m95_b_barrel_long_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds.\n##5% slower## movement."
	or string_id == "bm_wp_m95_b_barrel_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds.\n##5% faster## movement."
	or string_id == "bm_wp_m95_b_barrel_suppressed_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds.\n##15% slower## movement."
	
	--[[MOIST NUGGET]]
	or string_id == "bm_w_mosin" and "Mosin Nagant M91/30"
	or string_id == "bm_w_mosin_desc" and "A Russian bolt-action rifle chambered in 7.62x54R.\nCan pierce enemies, walls and shields.\nCan mount a bayonet."
	
	or string_id == "bm_wp_mosin_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_mosin_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_mosin_b_sniper" and "Mosin Suppressor"
	or string_id == "bm_wp_mosin_b_sniper_desc" and "A ##large## 7.62x54R suppressor.\n##20% shorter## overall range.\n##10%lower## minimum damage.\n7.5% slower ADS speeds."
	--Black Stock
	or string_id == "bm_wp_mosin_body_conceal" and "Black Paint"
	
	
	--[[ELMER FUDD]]
	or string_id == "bm_w_huntsman" and "Mosconi Coach Gun"
	or string_id == "bm_w_huntsman_desc" and "A side-by-side, break-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	
	or string_id == "bm_wp_huntsman_b_short" and "Sawn-Off Short Barrel"
	or string_id == "bm_wp_huntsman_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_huntsman_s_short" and "Sawn-Off Stock"
	
	--[[BARDODA SHOTGAT]]
	or string_id == "bm_w_b682" and "Beretta 682"
	or string_id == "bm_w_b682_desc" and "An Italian, over-under, break-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or string_id == "bm_wp_b682_b_short" and "Sawn-Off Short Barrel"
	or string_id == "bm_wp_b682_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	or string_id == "bm_wp_b682_s_short" and "Sawn-Off Stock"
	or string_id == "bm_wp_b682_s_ammopouch" and "Ammo Pouch"
	
	--[[870]]
	or string_id == "bm_w_r870" and "Remington Model 870" --"Remafdng"
	or string_id == "bm_w_r870_desc" and "An American, tube fed, pump-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Extended Mag
	or string_id == "bm_wp_r870_m_extended" and "R870 Extended Tube Magazine"
	--Zombie Hunter
    or string_id == "bm_wp_r870_fg_wood" and "Wooden Pump"
    or string_id == "bm_wp_r870_fg_wood_desc" and "##5% slower## ADS speeds."
	--Short Enough **don't know
	or string_id == "bm_wp_r870_s_nostock" and "No Stock"
	--Short Enough Tact. **don't know
	or string_id == "bm_wp_r870_s_nostock_big" and "No Stock w/Full Length Rail"
	--Govt. Stock **don't know
	or string_id == "bm_wp_r870_s_solid_big" and "Fixed Stock w/Full Length Rail"
	
	--[[CATS]]
	or string_id == "bm_w_saiga" and "Concern Kalashnikov Saiga-12K"
	or string_id == "bm_w_saiga_desc" and "A Russian, magazine fed, fully automatic shotgun based off the AK platform, loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Tact. Russian
	or string_id == "bm_wp_saiga_fg_lowerrail" and "Ultimak AK Modular Rail Forend System"
	or string_id == "bm_wp_saiga_fg_lowerrail_desc" and "##5% slower## ADS speeds."
	--Saiga 20 rounder
	or string_id == "bm_wp_saiga_m_20rnd" and "20rnd MD Arms Saiga Drum"
	or string_id == "bm_wp_saiga_m_20rnd_desc" and "##15% slower## reload speeds."
	
	--[[AA12]]
	or string_id == "bm_w_aa12" and "MPS Auto Assault-12 CQB"
	or string_id == "bm_w_aa12_desc" and "An American, magazine fed, fully automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or string_id == "bm_wp_aa12_mag_drum" and "20rnd AA-12 Drum"
	or string_id == "bm_wp_aa12_mag_drum_desc" and "##15% slower## reload speeds."
	or string_id == "bm_wp_aa12_barrel_long" and "Standard Barrel"
	or string_id == "bm_wp_aa12_barrel_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	or string_id == "bm_wp_aa12_barrel_silenced_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds."
	
	--[[M1014]]
	or string_id == "bm_w_benelli" and "Benelli M4"
	or string_id == "bm_w_benelli_desc" and "An Italian, tube fed, semi automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Long Barrel
	or string_id == "bm_wp_ben_b_long" and "Long Barrel w/7-Shot Tube"
	or string_id == "bm_wp_ben_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short Barrel
	or string_id == "bm_wp_ben_b_short" and "NFA Barrel w/4-Shot Tube"
	or string_id == "bm_wp_ben_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Collapsed Stock
	or string_id == "bm_wp_ben_s_collapsed" and "M1014 Collapsed Stock"
	--Solid Stock
	or string_id == "bm_wp_ben_fg_standard" and "M1014 Solid Stock" --same deal with the FAL, possible conflict
	
	--[[KELTEC]]
	or string_id == "bm_w_ksg" and "Kel-Tec KSG"
	or string_id == "bm_w_ksg_desc" and "An American, dual tube fed, pump-action bullpup shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Long Barrel
	or string_id == "bm_wp_ksg_b_long" and "Long Barrel w/2x 8-Shot Tubes"
	or string_id == "bm_wp_ksg_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short Barrel
	or string_id == "bm_wp_ksg_b_short" and "Patrol Barrel w/2x 6-Shot Tubes"
	or string_id == "bm_wp_ksg_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
	or string_id == "bm_w_spas12" and "Franchi SPAS-12"
	or string_id == "bm_w_spas12_desc" and "An Italian, tube fed, semi automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or string_id == "bm_wp_spas12_b_long" and "SPAS-12 8-Shot Tube Magazine"
	or string_id == "bm_wp_spas12_b_long_desc" and "##5% slower## ADS speeds."
	
	--[[STREET SWEEPER]]
	or string_id == "bm_w_striker" and "Armsel Striker"
	or string_id == "bm_w_striker_desc" and "A South-African, cylinder fed, semi automatic shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	or string_id == "bm_wp_striker_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	or string_id == "bm_wp_striker_b_suppressed_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds." 
	
	--[[BABBY 870]]
	or string_id == "bm_w_serbu" and "Short Remington Model 870"
	or string_id == "bm_w_serbu_desc" and "An American, tube fed, pump-action shotgun loaded with 12-gauge shells.\nCan be loaded with special ammo types."
	--Extended Mag
	or string_id == "bm_wp_shorty_m_extended_short" and "Short R870 Extended Tube Magazine"
	--Standard
	or string_id == "bm_wp_r870_s_solid" and "Fixed Stock"
	--Police Shorty
	or string_id == "bm_wp_serbu_s_solid_short" and "Fixed Stock w/Rail"
	--Tactical Shorty
	or string_id == "bm_wp_serbu_s_nostock_short" and "No Stock w/Rail"
	
	--[[LONGCAT]]
	or string_id == "bm_w_rpk" and "Concern Kalashnikov RPK"
	or string_id == "bm_w_rpk_desc" and "A Russian LMG chambered in 7.62x39mm.\nCan pierce enemies and walls."
	--Tactical Forgrip
	or string_id == "bm_wp_rpk_fg_standard" and "Polymer Handguard"
	or string_id == "bm_wp_rpk_fg_standard_desc" and "##5% faster## ADS speeds." 
	--Plastic Stock
	or string_id == "bm_wp_rpk_s_standard" and "Polymer Stock"
	
	--[[KSP]]
	or string_id == "bm_w_m249" and "FN Paratrooper M249"
	or string_id == "bm_w_m249_desc" and "A Belgian-American LMG chambered in 5.56 NATO.\nCan pierce enemies and walls."
	--Railed Foregrip
	or string_id == "bm_wp_m249_fg_mk46" and "MK.46 Handguard"
	or string_id == "bm_wp_m249_fg_mk46_desc" and "##5% slower## ADS speeds."
	--Solid Stock
	or string_id == "bm_wp_m249_s_solid" and "M249 Solid Stock"
	--LB
	or string_id == "bm_wp_m249_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[RELATED TO RAIFU]]
	or string_id == "bm_w_hk21" and "Heckler & Koch HK21E" --"Related to mai raifu"
	or string_id == "bm_w_hk21_desc" and "A German GPMG chambered in 7.62 NATO.\nCan pierce enemies, walls and shields."
	--Short Foregrip
	or string_id == "bm_wp_hk21_fg_short" and "HK21 Short Handguard"
	or string_id == "bm_wp_hk21_fg_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds.\n##10% faster## movement."
	or string_id == "bm_wp_hk21_g_ergo" and "HK21 Ergo Grip"
	or string_id == "bm_wp_hk21_g_ergo_desc" and "##5% faster## ADS speeds." 
	--LB
	or string_id == "bm_wp_hk21_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	--[[KERBEROS]]
	or string_id == "bm_w_mg42" and "Mauser Maschinengewehr 42"
	or string_id == "bm_w_mg42_desc" and "A German GPMG chambered in 7.92x57mm.\nCan pierce enemies, walls and shields.\n\n\"And then the wolf... ate up Little Red Riding Hood\""
	--Light Barrel
	or string_id == "bm_wp_mg42_b_mg34" and "Maschinengewehr 34 Barrel"
	or string_id == "bm_wp_mg42_b_mg34_desc" and "##5% faster## ADS speeds.\nROF ##lowered## to ##900 RPM.##"
	--Heat Sink (Star Wars)
	or string_id == "bm_wp_mg42_b_vg38" and "BlasTech DLT-19 Barrel"
	or string_id == "bm_wp_mg42_b_vg38_desc" and "Fire special tracers.\n##Lose all penetration capabilities.##\nROF ##lowered## to ##400 RPM.##"
	
	--[[GORDON]]
	or string_id == "bm_w_usp" and "Heckler & Koch USP Tactical"
	or string_id == "bm_w_x_usp" and "Akimbo H&K USP Tacticals"
	or string_id == "bm_w_usp_desc" and "A German handgun chambered in .45 ACP.\nCan pierce enemies and walls."
	or string_id == "bm_w_x_usp_desc" and "A pair of German handguns chambered in .45 ACP.\nCan pierce enemies and walls."
	--Ventilated .45 **don't know
	--or string_id == "bm_wp_usp_co_comp_1" and "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	or string_id == "bm_wp_usp_co_comp_2" and "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	or string_id == "bm_wp_pis_usp_m_extended" and "20rnd USP Magazine"
	or string_id == "bm_wp_pis_usp_m_extended_desc" and "##5% slower## reload speeds."
	--Expert
	or string_id == "bm_wp_pis_usp_b_expert" and "USP Expert Slide"
	--Match
	or string_id == "bm_wp_pis_usp_b_match" and "USP Match Slide"
	or string_id == "bm_wp_pis_usp_b_match_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[GRENADE 22]]
	or string_id == "bm_w_g22c" and "Glock 22C"
	or string_id == "bm_w_x_g22c" and "Akimbo Glock 22Cs"
	or string_id == "bm_w_g22c_desc" and "An Austrian handgun chambered in .40 S&W.\nCan pierce walls."
	or string_id == "bm_w_x_g22c_desc" and "A pair of Austrian handguns chambered in .40 S&W.\nCan pierce walls."
	--Long Slide
	or string_id == "bm_wp_g22c_b_long" and "Glock 35 Compensated Slide"
	or string_id == "bm_wp_g22c_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[GRENADE 17]]
	or string_id == "bm_w_glock_17" and "Glock 17"
	or string_id == "bm_w_x_g17" and "Akimbo Glock 17s"
	or string_id == "bm_w_glock_17_desc" and "An Austrian handgun chambered in 9mm.\nCan pierce thin walls."
	or string_id == "bm_w_x_g17_desc" and "A pair of Austrian handguns chambered in 9mm.\nCan pierce thin walls."
	
	--[[GRENADE 26]]
	or string_id == "bm_wp_pis_g26" and  "Glock 26"
	or string_id == "bm_w_jowi" and  "Akimbo Glock 26s"
	or string_id == "bm_wp_pis_g26_desc" and "An Austrian handgun chambered in 9mm.\nCan pierce thin walls."
	or string_id == "bm_w_jowi_desc" and "A pair of Austrian handguns chambered in 9mm.\nCan pierce thin walls."
	
	or string_id == "bm_wp_g26_body_salient" and  "Stipled Tan Frame"
	or string_id == "bm_wp_g26_b_custom" and  "Brushed Metal Frame"
	or string_id == "bm_wp_g26_m_custom" and  "G26 Stipled Tan Magazine"
	or string_id == "bm_wp_g26_m_custom_desc" and  "##15% faster## reload speeds."
	
	--[[FAWHTY FAHVE]]
	or string_id == "bm_w_colt_1911" and "Springfield Operator 1911" 
	or string_id == "bm_w_x_1911" and "Akimbo Springfield Operator 1911s" 
	or string_id == "bm_w_colt_1911_desc" and "An American handgun chambered in .45 ACP.\nCan pierce enemies and walls."
	or string_id == "bm_w_x_1911_desc" and "A pair of American handguns chambered in .45 ACP.\nCan pierce enemies and walls."
	
	--Aggressor
	or string_id == "bm_wp_1911_co_2" and "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	or string_id == "bm_wp_1911_co_1" and "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Ergo Grip
	or string_id == "bm_wp_1911_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Long
	or string_id == "bm_wp_1911_b_long" and "Compensated Long Barrel & Slide" 
	or string_id == "bm_wp_1911_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	--Vented
	or string_id == "bm_wp_1911_b_vented" and "Compensated Two-Tone Slide"
	or string_id == "bm_wp_1911_m_extended" and "12rnd 1911 Magazine"
	or string_id == "bm_wp_1911_m_extended_desc" and "##5% slower## reload speeds."
	
	--[[BARDODA]]
	or string_id == "bm_w_b92fs" and "Beretta 92FS"
	or string_id == "bm_w_x_b92fs" and "Akimbo Beretta 92s"	
	or string_id == "bm_w_b92fs_desc" and "An Italian handgun chambered in 9mm.\nCan pierce thin walls."
	or string_id == "bm_w_x_b92fs_desc" and "A pair of Italian handguns chambered in 9mm.\nCan pierce thin walls."
	--Professional
	or string_id == "bm_wp_beretta_co_co1" and "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	or string_id == "bm_wp_beretta_co_co2" and "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	or string_id == "bm_wp_beretta_m_extended" and "30rnd 92FS Magazine"
	or string_id == "bm_wp_beretta_m_extended_desc" and "##5% slower## reload speeds."
	--Elite Slide
	or string_id == "bm_wp_beretta_sl_brigadier" and "Brigadier Elite Slide"
		
	--[[HUEHUEHUEHUE]]
	or string_id == "bm_w_raging_bull" and "Taurus Raging Bull"
	or string_id == "bm_w_raging_bull_desc" and "A Brazilian revolver chambered in .44 Magnum.\nCan pierce enemies, walls and shields\nBenefits from pistol skills."
	--Mount
	or string_id == "bm_wp_pis_rage_extra" and "Raging Bull Scope Mount"
	--Aggressor
	or string_id == "bm_wp_rage_b_comp1" and "S&W V-Compensator"
	--Pocket
	or string_id == "bm_wp_rage_b_short" and "Snub Nose Short Barrel"
	or string_id == "bm_wp_rage_b_short_desc" and "##10% shorter## overall range.\n5% faster ADS speeds." 
	--Ventilated
	or string_id == "bm_wp_rage_b_comp2" and "S&W Muzzle Compensator"
	or string_id == "bm_wp_rage_b_comp2_desc" and "Vents muzzle flash to the sides."
	--Overcompensating
	or string_id == "bm_wp_rage_b_long" and "Long Barrel"
	or string_id == "bm_wp_rage_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
	or string_id == "bm_w_judge" and "Taurus 4510PLYFS"
	or string_id == "bm_w_judge_desc" and "Also known as \"The Judge\".\nA Brazilian revolver loaded with .410 bore shells.\nCan be loaded with special ammo types.\nBenefits from pistol skills."
	
	--[[GRENADE 18]]
	or string_id == "bm_w_glock_18c" and "Glock 18C"
	or string_id == "bm_w_glock_18c_desc" and "An Austrian machine pistol chambered in 9mm.\nCan pierce thin walls.\nBenefits from pistol skills.\nIs not affected by Equilibrium Aced."
	--Ventilated **don't know
	--or string_id == "bm_wp_g18c_co_1" and "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	or string_id == "bm_wp_g18c_co_comp_2" and "SJC Compensator 9mm"
	
	--[[DEAGLE]]
	or string_id == "bm_w_deagle" and "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	or string_id == "bm_w_x_deagle" and "Akimbo IMI Desert Eagles"
	or string_id == "bm_w_deagle_desc" and "An Israeli-American handgun chambered in .50 AE.\nCan pierce enemies, walls and shields."
	or string_id == "bm_w_x_deagle_desc" and "A pair of Israeli-American handguns chambered in .50 AE.\nCan pierce enemies, walls and shields."
	--Mount
	or string_id == "bm_wp_pis_deagle_extra" and "Desert Eagle Scope Mount"
	--La Femme
	or string_id == "bm_wp_deagle_co_short" and "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	or string_id == "bm_wp_deagle_co_long" and "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	or string_id == "bm_wp_deagle_co_long_desc" and "5% slower ADS speeds." 
	--Extended Mag
	or string_id == "bm_wp_deagle_m_extended" and "10rnd Desert Eagle Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	--Long Barrel
	or string_id == "bm_wp_deagle_b_long" and "10\" Long Barrel"
	or string_id == "bm_wp_deagle_b_long_desc" and "15% longer overall range.\n5% slower ADS speeds." 
	
	
	--[[JAMES BOND]]
	or string_id == "bm_w_ppk" and "Walther PPK"
	or string_id == "bm_w_ppk_desc" and "A German handgun chambered in .32 ACP.\nCan pierce thin walls."
	--Laser Grip
	or string_id == "bm_wp_pis_ppk_g_laser" and "Crimson Trace Laser Grip"
	--Long Side
	or string_id == "bm_wp_pis_ppk_b_long" and "PPKS Slide"
	
	--[[40 SW IS A SHIT ROUND]]
	or string_id == "bm_w_p226" and "Sig Sauer P226R"
	or string_id == "bm_w_p226_desc" and "A Swiss-made handgun chambered in .40 S&W.\nCan pierce walls."
	--Ventilated .40 **don't know
	--or string_id == "bm_wp_p226_co_comp_1" and "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	or string_id == "bm_wp_p226_co_comp_2" and "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	or string_id == "bm_wp_p226_m_extended" and "22rnd P226 Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	or string_id == "bm_wp_p226_m_extended_desc" and "##10% slower## reload speeds."
	--Two-Tone
	or string_id == "bm_wp_p226_b_equinox" and "Equinox Duo-Tone Slide"
	--Long Slide
	or string_id == "bm_wp_p226_b_long" and "Brushed Long Slide"
	or string_id == "bm_wp_p226_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[LEO]]
	or string_id == "bm_w_hs2000" and "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
	or string_id == "bm_w_hs2000_desc" and "A Croatian-American handgun chambered in .40 S&W.\nCan pierce walls."
	--Extended Mag
	or string_id == "bm_wp_hs2000_m_extended" and "22rnd XD(M)-40 Magazine"
	or string_id == "bm_wp_hs2000_m_extended_desc" and "##5% slower## reload speeds."
	--Custom Slide
	or string_id == "bm_wp_hs2000_sl_custom" and "Compensated Slide"
	or string_id == "bm_wp_hs2000_sl_custom_desc" and "##5% faster## ADS speeds." 
	--Long Slide
	or string_id == "bm_wp_hs2000_sl_long" and "Custom Slide"
	
	--[[RED 9]]
	or string_id == "bm_w_c96" and "Mauser C96"
	or string_id == "bm_w_c96_desc" and "A German handgun chambered in 7.63x25mm that can be converted to full-auto.\nCan pierce enemies and walls."
	--Long Barrel
	or string_id == "bm_wp_c96_b_long" and "Carbine Barrel"
	or string_id == "bm_wp_c96_b_long_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds."
	--Han Solo
	or string_id == "bm_wp_c96_nozzle" and "DL-44 Muzzle"
	or string_id == "bm_wp_c96_nozzle_desc" and "Fire special tracers.\n##Lose all penetration capabilities.##"
	--Scope
	or string_id == "bm_wp_c96_sight" and "Schmidt & Bender 1-8x24 PM Short Dot"
	or string_id == "bm_wp_c96_sight_desc" and "High power scope.\n##7.5% slower## ADS speeds."
	--20rnd Mag
	or string_id == "bm_wp_c96_m_extended" and "20rnd C96 Magazine"

	--[[EVENFASTERRUNONSENTENCES]]
	or string_id == "bm_w_cobray" and "Cobray M11/9"
	or string_id == "bm_w_cobray_desc" and "An American machine pistol chambered in 9mm.\nCan pierce thin walls.\nBenefits from SMG skills."
	
	or string_id == "bm_wp_cobray_ns_barrelext" and "MAC Barrel Extension"
	or string_id == "bm_wp_cobray_ns_barrelext_desc" and "##10% slower## ADS speeds."
	or string_id == "bm_wp_cobray_ns_silencer" and "SIONICS Suppressor"	
	or string_id == "bm_wp_cobray_ns_silencer_desc" and "A ##specialized## suppressor.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##10% slower## ADS speeds."	
	
	--[[RUNONSENTENCES]]
	or string_id == "bm_w_mac10" and "Ingram M10"
	or string_id == "bm_w_mac10_desc" and "An American machine pistol chambered in .45 ACP.\nCan pierce enemies and walls\nBenefits from SMG skills."
	--Extended Mag
	or string_id == "bm_wp_mac10_m_extended" and "30rnd M10 Magazine"
	or string_id == "bm_wp_mac10_m_extended_desc" and "##5% slower## reload speeds."
	--Railed Handguard
	or string_id == "bm_wp_mac10_body_ris" and "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	or string_id == "bm_wp_mac10_body_ris_desc" and "##5% slower## ADS speeds."
	--Skeletal Stock
	or string_id == "bm_wp_mac10_s_skel" and "Low Mount Skeleton Stock"	
	
	--[[THOMPSON SENSEI]]
	or string_id == "bm_w_m1928" and "Auto-Ordnance M1928"
	or string_id == "bm_w_m1928_desc" and "An American sub-machine gun chambered in .45 ACP.\nCan pierce enemies and walls."
	--Short Barrel
	or string_id == "bm_wp_m1928_b_short" and "Short Barrel"	
	or string_id == "bm_wp_m1928_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_m1928_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Dis. Foregrip
	or string_id == "bm_wp_m1928_fg_discrete" and "Synthetic Foregrip"	--for once it's actually a foregrip
	or string_id == "bm_wp_m1928_fg_discrete_desc" and "##5% faster## ADS speeds." 	--for once it's actually a foregrip
	--Dis. Pistol Grip
	or string_id == "bm_wp_m1928_g_discrete" and "Synthetic Pistol Grip"	
	or string_id == "bm_wp_m1928_g_discrete_desc" and "##5% faster## ADS speeds." 	
	--Dis. Stock
	or string_id == "bm_wp_m1928_s_discrete" and "Synthetic Stock"
	
	
	--[[MAI RAIFU'S LITTLE SISTER AND STUDENT COUNCIL PRESIDENT OF THE ELEMETARY SCHOOL]]
	or string_id == "bm_w_mp5" and "Heckler & Koch MP5A4" --"Empi"
	or string_id == "bm_w_mp5_desc" and "A German sub-machine gun chambered in 9mm.\nCan fire in 3-round bursts.\nCan pierce thin walls."
	--Sehr Kurze
	or string_id == "bm_wp_mp5_fg_m5k" and "MP5k Tri-Rail Kit"
	or string_id == "bm_wp_mp5_fg_m5k_desc" and "##15% shorter## overall range.\n##5% faster## ADS speeds.\nROF ##raised## to ##900 RPM.##"
	--Polizei Tactical
	or string_id == "bm_wp_mp5_fg_mp5a5" and "MP5 Railed Handguard"
	--Ninja
	or string_id == "bm_wp_mp5_fg_mp5sd" and "MP5SD Kit"
	or string_id == "bm_wp_mp5_fg_mp5sd_desc" and "##Internally suppressed## barrel.\nROF ##lowered## to ##600 RPM.##"
	--Adjustable
	or string_id == "bm_wp_mp5_s_adjust" and "Retractable Stock"
	--Bare Essentials
	or string_id == "bm_wp_mp5_s_ring" and "No Stock" --"No Pantsu"
	--MP5 Drum
	or string_id == "bm_wp_mp5_m_drum" and "110rnd GSG-5 .22lr Drum"
	or string_id == "bm_wp_mp5_m_drum_desc" and ".22lr conversion for the MP5.\n##15% shorter## overall range.\n##15% slower## reload speeds."

	--[[SLING STOCKS ARE 2LEWD]]
	or string_id == "bm_w_mp9" and "Brugger & Thomet TP9SF"
	or string_id == "bm_w_mp9_desc" and "A Swiss-made machine pistol chambered in 9mm.\nBenefits from SMG skills."
	--Extended Mag
	or string_id == "bm_wp_mp9_m_extended" and "30rnd MP9 Magazine"
	or string_id == "bm_wp_mp9_m_extended_desc" and "##5% slower## reload speeds."
	--Skeletal Stock
	or string_id == "bm_wp_mp9_s_skel" and "Steyr TMP Fixed Stock"
	
	--[[IT STINGS]]
	or string_id == "bm_w_scorpion" and "CZ Skorpion vz. 61"
	or string_id == "bm_w_scorpion_desc" and "A Czechoslovakian sub-machine gun chambered in .32 ACP.\nCan pierce thin walls."
	
	or string_id == "bm_wp_scorpion_m_extended" and "Dual Magazines"
	or string_id == "bm_wp_scorpion_m_extended_desc" and "##20% faster## reload speeds."
	
	or string_id == "bm_wp_scorpion_b_suppressed" and "Skorpion Suppressor"
	or string_id == "bm_wp_scorpion_b_suppressed_desc" and "A ##specialized## suppressor for the Skorpion.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
	or string_id == "bm_w_uzi" and "IMI Uzi"
	or string_id == "bm_w_uzi_desc" and "An Israeli sub-machine gun chambered in 9mm.\nCan pierce thin walls."
	
	or string_id == "bm_wp_uzi_s_solid" and "Wooden Stock"
	
	or string_id == "bm_wp_uzi_fg_rail" and "FAB Defense Uzi Tri-Rail System"
	or string_id == "bm_wp_uzi_fg_rail_desc" and "##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_uzi_b_supperessed" and "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
	or string_id == "bm_wp_uzi_b_supperessed_desc" and "A ##specialized## suppressor for the Uzi.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	--[[S-COOL SHOOTINGS]]
	or string_id == "bm_w_tec9" and "Intratec TEC-9"
	or string_id == "bm_w_tec9_desc" and "A Swedish-American handgun chambered in 9mm that can be converted to full-auto.\nCan pierce thin walls."
	
	or string_id == "bm_wp_tec9_b_standard" and "AB-10 Barrel"
	or string_id == "bm_wp_tec9_b_standard_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	or string_id == "bm_wp_tec9_ns_ext" and "TEC-9 Pseudo Barrel Extension"
	or string_id == "bm_wp_tec9_ns_ext_desc" and "##5% slower## ADS speeds."
	
	or string_id == "bm_wp_tec9_s_unfolded" and "Interdynamic MP-9 Wire Stock"
	
	or string_id == "bm_wp_tec9_m_extended" and "50rnd TEC-9 Magazine"
	or string_id == "bm_wp_tec9_m_extended_desc" and "##10% slower## reload speeds."
	
	--[[NOT A STEN]]
	or string_id == "bm_w_sterling" and "Sterling L2A1"
	or string_id == "bm_w_sterling_desc" and "A British sub-machine gun chambered in 9mm.\nCan pierce thin walls."
	--Supp. Barrel
	or string_id == "bm_wp_sterling_b_suppressed" and "L34A1 Barrel"
	or string_id == "bm_wp_sterling_b_suppressed_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds."
	--Heat Sink Barrel
	or string_id == "bm_wp_sterling_b_e11" and "BlasTech E-11 Barrel"
	or string_id == "bm_wp_sterling_b_e11_desc" and "Fire special tracers.\n##Lose all penetration capabilities.##"
	
	or string_id == "bm_wp_sterling_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_sterling_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--10rnd Mag
	or string_id == "bm_wp_sterling_m_short" and "10rnd L2A1 Magazine"
	or string_id == "bm_wp_sterling_m_short_desc" and "##20% faster## reload speeds."
	--34rnd Mag
	or string_id == "bm_wp_sterling_m_long" and "34rnd L2A1 Magazine"
	or string_id == "bm_wp_sterling_m_long_desc" and "##10% slower## reload speeds."

	--[[BABBY AR]]
	or string_id == "bm_w_olympic" and "Olympic Arms K23B Tactical"
	or string_id == "bm_w_olympic_desc" and "An American carbine chambered in 5.56 NATO.\nCan pierce enemies and walls."
	or string_id == "bm_w_olympic_desc" and "An American carbine chambered in 5.56 NATO.\nCan pierce enemies and walls."
	
	--Railed Handguard
	or string_id == "bm_wp_olympic_fg_railed" and "KAC Free Float Handguard" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	or string_id == "bm_wp_olympic_s_short" and "Buffer Tube Stock" 
	or string_id == "bm_wp_m4_uupg_b_medium_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[BABBY SLAVSHIT]]
	or string_id == "bm_w_akmsu" and "Soviet Union AKMSU"
	or string_id == "bm_w_akmsu_desc" and "A Russian carbine chambered in 7.62x39mm.\nCan pierce enemies and walls."
	--Moscow Special
	or string_id == "bm_wp_akmsu_fg_rail" and "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	or string_id == "bm_wp_akmsu_fg_rail_desc" and "5% slower ADS speeds."
	
	--[[OVERPRICED 22LR]]
	or string_id == "bm_w_p90" and "FN P90 TR"
	or string_id == "bm_w_p90_desc" and "A Belgian bullpup personal defence weapon chambered in 5.7x28mm.\nCan pierce enemies, walls and shields."
	--Long Barrel
	or string_id == "bm_wp_p90_b_long" and "PS90 Barrel"
	or string_id == "bm_wp_p90_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	
	--[[LOL SWEDS]]
	or string_id == "bm_w_m45" and "Carl Gustaf Kpist M/45"
	or string_id == "bm_w_m45_desc" and "A Swedish sub-machine gun chambered in 9mm.\nCan pierce thin walls."
	--Extended Mag
	or string_id == "bm_wp_smg_m45_m_extended" and "50rnd M/45 Magazine"
	or string_id == "bm_wp_smg_m45_m_extended_desc" and "##10% slower## reload speeds." 
	
	--[[YOU SUCK AND WE HATE YOU]]
	or string_id == "bm_w_mp7" and "Heckler & Koch MP7A2"
	or string_id == "bm_w_mp7_desc" and "A German personal defence weapon chambered in 4.6x30mm.\nCan pierce enemies, walls and shields."
	--Airsoft Supressor
	or string_id == "bm_wp_mp7_b_suppressed" and "B&T MP7 Rotex-II Suppressor"	
	or string_id == "bm_wp_mp7_b_suppressed_desc" and "A ##specialized## suppressor for the MP7.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##7.5% slower## ADS speeds."	
	--Extended Mag
	or string_id == "bm_wp_mp7_m_extended" and "MP7 40rnd Magazine"
	or string_id == "bm_wp_mp7_m_extended_desc" and "##5% slower## reload speeds."
	--Extended Stock
	or string_id == "bm_wp_mp7_s_long" and "Extended Stock"
	
	--[[DEMOMAN]]
	or string_id == "bm_w_gre_m79" and "Springfield Armory M79"
	or string_id == "bm_w_gre_m79_desc" and "An American, single-shot, break-action grenade launcher loaded with 40mm grenades.\nCan fire incendiary rounds.\nDamage boosts from skills do not affect this weapon."
	
	--[[NADE SPAM]]
	or string_id == "bm_w_m32" and "Milkor Grenade Launcher"
	or string_id == "bm_w_m32_desc" and "A South-African, cylinder-fed grenade launcher loaded with 40mm grenades.\nCan fire incendiary rounds.\nDamage boosts from skills do not affect this weapon."
	
	--[[REVOLVER OCELOT]]
	or string_id == "bm_w_peacemaker" and "Colt Single Action Army" --"Revolver Ocelot"
	or string_id == "bm_w_peacemaker_desc" and "An American single-action revolver chambered in .45 Colt.\nCan pierce enemies, walls and shields.\nBenefits from pistol skills.\n\n\"This is the best handgun ever made\""
	--Long
	or string_id == "bm_wp_peacemaker_barrel_long" and "12\" Barrel"
	or string_id == "bm_wp_peacemaker_barrel_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Short
	or string_id == "bm_wp_peacemaker_barrel_short" and "5.5\" Barrel"
	or string_id == "bm_wp_peacemaker_barrel_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--Grip
	or string_id == "bm_wp_peacemaker_handle_bling" and "Engraved Grip"
	--Stock
	or string_id == "bm_wp_peacemaker_rifle_stock" and "Skeletal Stock"
	
	--[[Winchester]]--
	or string_id == "bm_w_winchester1874" and "Winchester Model 1873"
	or string_id == "bm_w_winchester1874_desc" and "An American, tube fed, lever-action rifle chambered in .44-40 Winchester.\nHas high damage drop-off compared to other rifles.\nCan pierce enemies, walls and shields."
	--Long
	or string_id == "bm_wp_winchester_b_long" and "Long Barrel"
	or string_id == "bm_wp_winchester_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds." 
	--Supp
	or string_id == "bm_wp_winchester_b_suppressed" and "Suppressor"
	or string_id == "bm_wp_winchester_b_suppressed_desc" and "A #medium# suppressor.\n##25% shorter## overall range.\n##12.5% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	or string_id == "bm_wp_winchester_sniper_scope_desc" and "High power scope\n10% slower ADS speeds."
	
	--[[HANG YOUR GAMES]]
	or string_id == "bm_w_plainsrider_desc" and "A wooden bow and arrow.\nCan fire explosive tipped arrows.\nNon-exploded arrows can be retrieved and fired again.\nNo police ammobox pickups."
	
	--[[TOASTY]]
	or string_id == "bm_w_flamethrower_mk2_desc" and "A flamethrower capable of shooting out to 20 meters.\n30% chance to set your target aflame.\nNo police ammobox pickups."

	--[[TAGUSO]] --GiTS references abound!
	or string_id == "bm_w_mateba" and "Mateba 2006M"
	or string_id == "bm_w_mateba_desc" and "An Italian revolver chambered in .357 Magnum.\nCan pierce enemies, walls and shields.\nBenefits from pistol skills.\n\n\"Ангелы и демоны кружили надо мной,\nРазбивали тернии и звёздные пути,\nНе знает счастья только тот,\nКто его зова понять не смог\""
	--Long
	or string_id == "bm_wp_2006m_b_long" and "Major Barrel"
	or string_id == "bm_wp_2006m_b_long_desc" and "##15% longer## overall range.\n##5% slower## ADS speeds."
	--Med
	or string_id == "bm_wp_2006m_b_medium" and "Batou Barrel"
	--Short
	or string_id == "bm_wp_2006m_b_short" and "Togusa Barrel"
	or string_id == "bm_wp_2006m_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	
	--AS Val
	or string_id == "bm_w_asval" and "Tula Arms AS \"Val\""
	or string_id == "bm_w_asval_desc" and "A Russian internally suppressed assault rifle chambered in 9x39mm.\nCan pierce enemies and walls."
	--Shorty
	or string_id == "bm_wp_asval_b_proto_desc" and "##Removes the suppressor.##\n##10% longer## overall range.\n##5% faster## ADS speeds."
	--VSS
	or string_id == "bm_wp_asval_s_solid" and "VSS Kit"
	or string_id == "bm_wp_asval_s_solid_desc" and "ROF ##lowered## to ##600 RPM.##"
		
	--SUB 2000
	or string_id == "bm_w_sub2000" and "Kel-Tec SUB-2000"
	or string_id == "bm_w_sub2000_desc" and "An American carbine chambered in 9mm.\nCan pierce thin walls.\nBenefits from pistol skills." 
	--Handguards
	or string_id == "bm_wp_sub2000_fg_gen2" and "Gen2 Handguard"
	or string_id == "bm_wp_sub2000_fg_gen2_desc" and "##5% faster## ADS speeds."
	or string_id == "bm_wp_sub2000_fg_railed" and "Red Lion R6 Handguard"
	or string_id == "bm_wp_sub2000_fg_railed_desc" and "##5% slower## ADS speeds."
	or string_id == "bm_wp_sub2000_fg_suppressed" and "Quad Rail Handguard w/Suppressor"
	or string_id == "bm_wp_sub2000_fg_suppressed_desc" and "A ##large## 9mm suppressor.\n##20% shorter## overall range.\n##10% lower## minimum damage.\n##10% slower## ADS speeds."
	
	--XXX Boner
	or string_id == "bm_w_hunter" and "Avalanche CB1-50 Pistol Grip Crossbow"
	or string_id == "bm_w_hunter_desc" and "A handheld crossbow.\nNo police ammobox pickups.\nNon-exploded bolts can be retrieved and fired again.\nDamage boosts from skills do not affect this weapon."
	
	--2000 crying babies
	or string_id == "bm_w_wa2000" and "Walther WA2000"
	or string_id == "bm_w_wa2000_desc" and "A German semi-automatic bullpup rifle chambered in .308 Win.\nCan pierce enemies, walls and shields."
	--Long
	or string_id == "bm_wp_wa2000_b_long" and "Long Barrel"
	or string_id == "bm_wp_wa2000_b_long_desc" and "##15% longer## overall range.\n##7.5% slower## ADS speeds."
	--Supp.
	or string_id == "bm_wp_wa2000_b_suppressed" and "Suppressor"
	or string_id == "bm_wp_wa2000_b_suppressed_desc" and "A ##large## suppressor.\n##20% shorter## overall range.\n##10% decrease## in minimum damage.\n##10% slower## ADS speeds."
	--Light
	or string_id == "bm_wp_wa2000_g_light" and "Lightweight Furniture"
	or string_id == "bm_wp_wa2000_g_light_desc" and "##5% faster## ADS speeds.\n##10% faster## movement."
	--Black
	or string_id == "bm_wp_wa2000_g_stealth" and "Black Furniture"
	--Walnut
	or string_id == "bm_wp_wa2000_g_walnut" and "Walnut Furniture"
	or string_id == "bm_wp_wa2000_g_walnut_desc" and "##5% slower## ADS speeds."
	
	--Vector
	or string_id == "bm_w_polymer" and "KRISS Vector SMG"
	or string_id == "bm_w_polymer_desc" and "A recoil mitigating American sub-machine gun chambered in .45 ACP.\nCan fire in 2-round bursts.\nCan pierce enemies and walls."
	--CRB
	or string_id == "bm_wp_polymer_barrel_precision" and "CRB Barrel w/Shroud"
	or string_id == "bm_wp_polymer_barrel_precision_desc" and "##20% longer## overall range.\n##10% slower## ADS speeds."
	--Supp
	or string_id == "bm_wp_polymer_ns_silencer" and "Defiance HPS 4GSK Suppressor"
	or string_id == "bm_wp_polymer_ns_silencer_desc" and "A ##specialized## suppressor.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##15% slower## ADS speeds."

	--[[WEAPON MODS]]
	--Ported
	or string_id == "bm_wp_ns_battle" and "Battlecomp 2.0 Compensator"
	--MP5 10mm Magazine
	or string_id == "bm_wp_mp5_m_straight" and "30rnd MP5/10 10mm Magazine"
	or string_id == "bm_wp_mp5_m_straight_desc" and "10mm Auto conversion for the MP5.\n##5% slower## reload speeds."
	--AK5 CQB
	or string_id == "bm_wp_ak5_b_short" and "Short Barrel" 
	or string_id == "bm_wp_ak5_b_short_desc" and "##10% shorter## overall range.\n##5% faster## ADS speeds." 
	--AUG Raptor
	or string_id == "bm_wp_aug_body_f90" and "Thales F90 Body Kit"
	or string_id == "bm_wp_aug_body_f90_desc" and "ROF ##raised## to ##850 RPM.##"
	--SALVO
	or string_id == "bm_wp_upg_ns_sho_salvo_large" and "Silencerco Salvo 12 Suppressor"
	or string_id == "bm_wp_upg_ns_sho_salvo_large_desc" and "A ##large## shotgun suppressor.\n##20% shorter## overall range.\n##10% slower## ADS speeds."
	--MP9 Suppressor
	or string_id == "bm_wp_mp9_b_suppressed" and "B&T MP9 QD Suppressor"
	or string_id == "bm_wp_mp9_b_suppressed_desc" and "##Internally suppressed## barrel.\n10% slower ADS speeds."
	--BIG BOSS
	or string_id == "bm_wp_upg_ns_pis_jungle" and "Big Boss Suppressor"
	or string_id == "bm_wp_upg_ns_pis_jungle_desc" and "A ##large## pistol suppressor.\n##20% shorter## overall range.\n##10% decrease## in minimum damage.\n##10% slower## ADS speeds."
	--Filter
	or string_id == "bm_wp_upg_ns_ass_filter" and "Filter Suppressor"
	or string_id == "bm_wp_upg_ns_ass_filter_desc" and "An ##improvised## pistol suppressor.\n##25% shorter## overall range.\n##15% decrease## in minimum damage.\n##10% slower## ADS speeds."
	--M14 Scope Mount
	or string_id == "bm_wp_upg_o_m14_scopemount" and "Sun Optics USA M14/M1A Scope Mount"
	--LED Combo
	or string_id == "bm_wp_upg_fl_ass_utg" and "UTG P38 LED Laser Combo"
	--M3X
	or string_id == "bm_wp_upg_fl_pis_m3x" and "Insight Technology M3X"
	--P90 Mall
	or string_id == "bm_wp_p90_b_ninja_desc" and "##Internally suppressed## barrel.\n##10% slower## ADS speeds."
	--P90 Civ
	or string_id == "bm_wp_p90_b_civilian" and "Moerse Lekker Barrel Shroud"
	or string_id == "bm_wp_p90_b_civilian_desc" and "##15% longer## overall range.\n##10% slower## ADS speeds."
	
	
	
	--AK Crab Rail
	or string_id == "bm_wp_upg_ak_fg_krebs" and "Krebs UFM Keymod System Handguard"
	or string_id == "bm_wp_upg_ak_fg_krebs_desc" and "##7.5% faster## ADS speeds."
	--AK Keymod Rail
	or string_id == "bm_wp_upg_ak_fg_trax" and "Strike Industries TRAX Handguard"
	or string_id == "bm_wp_upg_ak_fg_trax_desc" and "##7.5% slower## ADS speeds."
	--AK Aluminum Grip
	or string_id == "bm_wp_upg_ak_g_rk3" and "ZenitCo PK-3 Pistol Grip"
	--AK Aluminum Foregrip
	or string_id == "bm_wp_upg_ak_fg_zenit" and "ZenitCo Handguard"
	--Scope Mount
	or string_id == "bm_wp_upg_o_ak_scopemount" and "K-VAR KV-04S Optic Mount"
	--Low Drag Magazine
	or string_id == "bm_wp_upg_ak_m_uspalm" and "30rnd US PALM AK30 Magazine"
	or string_id == "bm_wp_upg_ak_m_uspalm_desc" and "##5% faster## reload speeds."
	--PBS Suppressor
	or string_id == "bm_wp_upg_ns_ass_pbs1" and "PBS-1 Suppressor"
	or string_id == "bm_wp_upg_ns_ass_pbs1_desc" and "##15% shorter## overall range.\n##15% decrease## in minimum damage.\n##10% slower## ADS speeds."
	--DMR Kit
	or string_id == "bm_wp_upg_ass_ak_b_zastava" and "Zastava M76 Barrel"
	or string_id == "bm_wp_upg_ass_ak_b_zastava_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	--Modern Barrel
	or string_id == "bm_wp_upg_ak_b_ak105" and "AK-105 Barrel"
	or string_id == "bm_wp_upg_ak_b_ak105_desc" and "##10% shorter## overall range."
	
	--Exotique Receiver
	or string_id == "bm_wp_m4_upper_reciever_edge" and "VLTOR Upper Receiver"
	or string_id == "bm_wp_m4_upper_reciever_edge_desc" and "ROF ##raised## by ##2%.##"
	
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos" and "2A-Arm BALIOS Upper Receiver" --????
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_ballos_desc" and "ROF ##lowered## by ##5%.##"
	
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_core" and "CORE15 Upper Receiver"
	or string_id == "bm_wp_upg_ass_m4_upper_reciever_core_desc" and "ROF ##raised## by ##5%.##"
	
	or string_id == "bm_wp_upg_ass_m4_lower_reciever_core" and "CORE15 Lower Receiver"
	or string_id == "bm_wp_upg_ass_m4_lower_reciever_core_desc" and "##5% faster## reload speeds."
	
	or string_id == "bm_wp_upg_m4_s_ubr" and "Magpul UBR Stock"
	
	or string_id == "bm_wp_upg_m4_m_l5" and "30rnd Lancer Systems L5 AW Magazine"
	
	or string_id == "bm_wp_upg_smg_olympic_fg_lr300" and "Short LR300 Handguard"
	
	or string_id == "bm_wp_upg_ass_m16_fg_stag" and "Stag Arms Model 8T Handguard"
	
	or string_id == "bm_wp_upg_ass_m4_fg_moe" and "Magpul MOE SL Handguard"
	or string_id == "bm_wp_upg_ass_m4_fg_moe_desc" and "##5% faster## ADS speeds." 
	
	or string_id == "wpn_fps_upg_ass_m4_fg_lvoa" and "War Sport LVOA Handguard"
	or string_id == "wpn_fps_upg_ass_m4_fg_lvoa_desc" and "##5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ass_m4_b_beowulf" and "Beowulf Barrel"
	or string_id == "bm_wp_upg_ass_m4_b_beowulf_desc" and "##Sniper class barrel.##\n##30% longer## overall range.\n##10% greater## minimum damage.\n##10% slower## ADS speeds."
	
	--Descriptions are gone (for now) so I figured I'd change their names to reflect that they're locking the firemode
	--Single Fire
	or string_id == "bm_wp_upg_i_singlefire" and "Single Fire Mod"
	or string_id == "bm_wp_upg_i_singlefire_desc" and "Locks fire mode to ##semi-auto.##\nROF ##lowered## by ##10%.##"
	--Auto Fire
	or string_id == "bm_wp_upg_i_autofire" and "Auto Fire Mod"
	or string_id == "bm_wp_upg_i_autofire_desc" and "Locks fire mode to ##full-auto.##\nROF ##raised## by ##15%.##"
	or string_id == "bm_wp_upg_i_autofire_tec9" and "Locks fire mode to ##full-auto.##\nROF ##raised## to ##800 RPM.##\n##Disables the effects of Equilibrium Aced.##"
	or string_id == "bm_wp_upg_i_autofire_c96" and "Locks fire mode to ##full-auto.##\nROF ##raised## to ##1000 RPM.##\n##Disables the effects of Equilibrium Aced.##"
	or string_id == "bm_wp_upg_i_autofire_hk21" and "ROF ##lowered## to ##450 RPM.##"
	
	--Pistol Light
	or string_id == "bm_wp_upg_fl_pis_tlr1" and "Streamlight TLR1"
	--Pistol Laser
	or string_id == "bm_wp_upg_fl_pis_laser" and "Aim Sports LH002 Laser Sight" --it seems to be more based on the RAP4 Paintball Pistol Laser sight but it's a lot less cool calling it that since paintball so the next closest thing will suffice	
	--Pistol Laser
	or string_id == "bm_wp_upg_fl_x400v" and "SureFire X400V-IRC"
	or string_id == "bm_wp_upg_fl_crimson" and "Crimson Trace CMR Laser Sight"
	
	or string_id == "bm_wp_pis_g_laser" and "Crimson Trace Glock Laser Grip"
	or string_id == "bm_wp_pis_g_beavertail" and "Beavertail Grip Extension"
	
	--Assault Light
	or string_id == "bm_wp_upg_fl_ass_smg_sho_surefire" and "Surefire Scout Light" --based off of but doesnt seem to take from a specific model
	--Compact Laser
	or string_id == "bm_wp_upg_fl_ass_laser" and "Offset Laser Mount & Sight"
	--Tactical Laser
	or string_id == "bm_wp_upg_fl_ass_smg_sho_peqbox" and "Insight Technology AN/PEQ-5"
	--Military Laser 
	or string_id == "bm_wp_upg_fl_ass_peq15" and "Insight Technology AN/PEQ-15"

	--Shark Teeth
	or string_id == "bm_wp_upg_ns_shot_shark" and "Tromix Shark Breaching Brake"
	--King's Crown
	or string_id == "bm_wp_upg_shot_ns_king" and "King Armory KA-1212 Breaching Brake"
	
	--Pistol Flash Hider
	or string_id == "bm_wp_upg_pis_ns_flash_desc" and "Hides muzzle flash"

	--Low Profile Suppressor
	or string_id == "bm_wp_upg_ns_ass_smg_small" and "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
	or string_id == "bm_wp_upg_ns_ass_smg_small_desc" and "A ##small## pistol suppressor.\n##35% shorter## overall range.\n##17.5% decrease## in minimum damage."
	--Medium Suppressor
	or string_id == "bm_wp_upg_ns_ass_smg_medium" and "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	or string_id == "bm_wp_upg_ns_ass_smg_medium_desc" and "A ##medium## suppressor.\n##25% shorter## overall range.\n##12.5% decrease## in minimum damage.\n##5% slower## ADS speeds."
	--Bigger the Better **Don't know
	or string_id == "bm_wp_upg_ns_ass_smg_large" and "Large Suppressor"
	or string_id == "bm_wp_upg_ns_ass_smg_large_desc" and "A ##large## suppressor.\n##20% shorter## overall range.\n##10% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	--Size Doesn't Matter 
	or string_id == "bm_wp_upg_ns_pis_small" and "Thompson Machine Poseidon Suppressor"	
	or string_id == "bm_wp_upg_ns_pis_small_desc" and "A ##small## pistol suppressor.\n##35% shorter## overall range.\n##17.5% decrease## in minimum damage."	
	--Standard Issue
	or string_id == "bm_wp_upg_ns_pis_medium" and "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	or string_id == "bm_wp_upg_ns_pis_medium_desc" and "A ##medium## pistol suppressor.\n##25% shorter## overall range.\n##12.5% decrease## in minimum damage.\n##5% slower## ADS speeds."
	--Monolith 
	or string_id == "bm_wp_upg_ns_pis_large" and "Silencerco Osprey Suppressor"
	or string_id == "bm_wp_upg_ns_pis_large_desc" and "A ##large## pistol suppressor.\n##20% shorter## overall range.\n##10% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ns_medium_gem" and "GemTech Blackside Suppressor"
	or string_id == "bm_wp_upg_ns_medium_gem_desc" and "A ##medium## pistol suppressor.\n##25% shorter## overall range.\n##12.5% decrease## in minimum damage.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ns_large_kac" and "KAC MK.23 Suppressor"
	or string_id == "bm_wp_upg_ns_large_kac_desc" and "A ##large## pistol suppressor.\n##20% shorter## overall range.\n##10% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ns_pis_medium_slim_desc" and "A ##specialized## pistol suppressor.\n##15% shorter## overall range.\n##7.5% decrease## in minimum damage.\n##7.5% slower## ADS speeds."
	
	--Shotgun Suppressor
	or string_id == "bm_wp_upg_ns_shot_thick" and "Shotgun Suppressor"
	or string_id == "bm_wp_upg_ns_shot_thick_desc" and "A ##medium## shotgun suppressor.\n##25% shorter## overall range.\n##5% slower## ADS speeds."
	
	or string_id == "bm_wp_upg_ns_meatgrinder" and "Standoff Muzzle Device"
	
	--Stubby
	or string_id == "bm_wp_upg_ns_ass_smg_stubby" and "Stinger Flash Hider" --Based on the VFC Stinger's pseudo flash-hider
	or string_id == "bm_wp_upg_ns_ass_smg_stubby_desc" and "Hides muzzle flash"
	--Tank **Don't know, could quite literally be based off of a tank compensator
	or string_id == "bm_wp_upg_ns_ass_smg_tank" and "Tank Compensator"
	or string_id == "bm_wp_upg_ns_ass_smg_tank_desc" and "Vents muzzle flash to the sides"
	--Firebreather
	or string_id == "bm_wp_upg_ns_ass_smg_firepig" and "Noveske KX3 Compensator"
	or string_id == "bm_wp_upg_ns_ass_smg_firepig_desc" and "Increases muzzle flash"
	
	--Competitors
	or string_id == "bm_wp_upg_ass_ns_jprifles" and "JPE Bennie Cooley Muzzle Brake"
	--Funnel of Fun
	or string_id == "bm_wp_upg_ass_ns_linear" and "KIES Blast Master Linear Compensator"
	or string_id == "bm_wp_upg_ass_ns_linear_desc" and "Increases muzzle flash"
	--Tactical
	or string_id == "bm_wp_upg_ass_ns_surefire" and "Surefire MBK Muzzle Brake"
	
	--Muldon
	or string_id == "bm_wp_r870_s_folding" and "R870 Top Folding Stock"
	
	--Standard
	or string_id == "bm_wp_m4_s_standard" and "Bushmaster LE Stock"
	--Tactical
	or string_id == "bm_wp_m4_s_pts" and "Magpul PTS Stock"
	--Folding
	or string_id == "bm_wp_m4_uupg_s_fold" and "LR300 Folding Stock"
	--Wide
	or string_id == "bm_wp_upg_m4_s_crane" and "NSWC Crane Stock"
	--War-Torn
	or string_id == "bm_wp_upg_m4_s_mk46" and "NSWC Crane Stock w/Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	
	--Folding Stock (underfolder)
	or string_id == "bm_wp_ak_s_folding" and "Folding AK Stock"
	--Folding Stock (sidefolder)
	or string_id == "bm_wp_ak_s_skfoldable" and "Folding AK Stock"
	--Wooden Sniper Stock
	or string_id == "bm_wp_ak_s_psl" and "PSL Thumbhole Stock"
	
	--Ergo (Glocks)
	or string_id == "bm_wp_g18c_g_ergo" and "Hogue Handall Grip Sleeve"
	or string_id == "bm_wp_g18c_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Ergo
	or string_id == "bm_wp_m4_g_ergo" and "Command Arms UPG16 Pistol Grip"
	or string_id == "bm_wp_m4_g_ergo_desc" and "##5% faster## ADS speeds." 
	--Pro
	or string_id == "bm_wp_m4_g_sniper" and "PSG Style Pistol Grip" --there are a bunch of grips styled after the PSG-1's grip but the one in PD2 doesn't seem to take from any specific real-life model
	--Rubber
	or string_id == "bm_wp_upg_m4_g_hgrip" and "Hogue OverMolded AR Pistol Grip"
	--Straight
	or string_id == "bm_wp_upg_m4_g_mgrip" and "Magpul MOE-K Pistol Grip"
	
	--Rubber
	or string_id == "bm_wp_upg_ak_g_hgrip" and "Hogue OverMolded AK Pistol Grip"
	--Plastic
	or string_id == "bm_wp_upg_ak_g_pgrip" and "US PALM Enhanced Pistol Grip"
	or string_id == "bm_wp_upg_ak_g_pgrip_desc" and "##5% faster## ADS speeds." 
	
	--Wood Rail
	or string_id == "bm_wp_ak_fg_combo2" and "Ultimak AK Optic Mount"
	--Tact. Russian
	or string_id == "bm_wp_ak_fg_combo3" and "Ultimak AK Modular Rail Forend System"
	--Battleproven
	or string_id == "bm_wp_upg_ak_fg_tapco" and "Tapco Intrafuse Handguard" --This is actually for the Saiga. lolOverkill
	--Lightweight
	or string_id == "bm_wp_upg_fg_midwest" and "Midwest Industries Quad Rail"
	
	--Slav. Dragon
	or string_id == "bm_wp_upg_ak_b_draco" and "Draco Pistol Barrel"
	or string_id == "bm_wp_upg_ak_b_draco_desc" and "##10% shorter## overall range.\n##10% faster## ADS speeds."
	
	--Extended Mag (Glocks)
	or string_id == "bm_wp_g18c_m_mag_33rnd" and "33/22rnd Glock Magazine (9mm/.40S&W)"	
	or string_id == "bm_wp_g18c_m_mag_33rnd_desc" and "##5% slower## reload speeds."	
	--Vintage Mag
	or string_id == "bm_wp_m4_m_straight" and "20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
	or string_id == "bm_wp_m4_m_straight_desc" and "##10% faster## reload speeds."
	--Milspec Mag
	or string_id == "bm_wp_m4_uupg_m_std" and "30rnd STANAG Magazine"
	--Tactical Mag
	or string_id == "bm_wp_m4_m_pmag" and "31rnd Magpul PMAG Magazine" --you can actually shove 31 rounds into one of the PMAG models and still have it load
	or string_id == "bm_wp_m4_m_pmag_desc" and "##5% faster## reload speeds."
	--Expert Mag
	or string_id == "bm_wp_l85a2_m_emag" and "30rnd Magpul EMAG Magazine"
	or string_id == "bm_wp_l85a2_m_emag_desc" and "Carry an extra magazine.\n##12% slower## reload speeds."
	--CAR Quad
	or string_id == "bm_wp_upg_m4_m_quad" and "60rnd Surefire Magazine"
	or string_id == "bm_wp_upg_m4_m_quad_desc" and "##10% slower## reload speeds."
	--AK Quad
	or string_id == "bm_wp_upg_ak_m_quad" and "60rnd Concern Kalashnikov Magazine"
	or string_id == "bm_wp_upg_ak_m_quad_desc" and "##10% slower## reload speeds."
	--Beta-C
	or string_id == "bm_wp_m4_m_drum" and "100rnd Beta-C Dual Drum"
	or string_id == "bm_wp_m4_m_drum_desc" and "##15% slower## reload speeds."
	--AK Drum
	or string_id == "bm_wp_ak_m_drum" and "75rnd AK Drum"
	or string_id == "bm_wp_ak_m_drum_desc" and "##15% slower## reload speeds."
	
	--Pistol Red Dot
	or string_id == "bm_wp_upg_o_rmr" and "Trijicon RMR Red Dot"
	or string_id == "bm_wp_upg_o_rmr_desc" and "Low power red dot sight"
	--Marksman Irons
	or string_id == "bm_wp_upg_o_marksmansight_rear_desc" and "Custom iron sights."
	
	--Military Red Dot
	or string_id == "bm_wp_upg_o_aimpoint" and "Aimpoint PRO Red Dot"
	or string_id == "bm_wp_upg_o_aimpoint_desc" and "Encased red dot sight."
	--Holographic
	or string_id == "bm_wp_upg_o_eotech" and "EOTech 553 Holographic Sight"
	or string_id == "bm_wp_upg_o_eotech_desc" and "Low power holographic sight."
	--Professional
	or string_id == "bm_wp_upg_o_t1micro" and "Aimpoint Micro T-1 Red Dot"
	or string_id == "bm_wp_upg_o_t1micro_desc" and "Low power red dot sight."
	--Surgeon
	or string_id == "bm_wp_upg_o_docter" and "IRONDOT w/Docter Sight II Plus Red Dot"
	or string_id == "bm_wp_upg_o_docter_desc" and "Low power red dot sight."
	--ACOUGH
	or string_id == "bm_wp_upg_o_acog" and "Trijicon ACOG Scope"
	or string_id == "bm_wp_upg_o_acog_desc" and "Medium range scope.\n##5% slower## ADS."
	--Milspec
	or string_id == "bm_wp_upg_o_specter" and "ELCAN Specter DR 1-4x Scope"
	or string_id == "bm_wp_upg_o_specter_desc" and "Medium range scope.\n##5% slower## ADS."
	--See More
	or string_id == "bm_wp_upg_o_cmore" and "C-More Railway Red Dot"
	or string_id == "bm_wp_upg_o_cmore_desc" and "Low power red dot sight."
	--Combat
	or string_id == "bm_wp_upg_o_cs" and "Aimpoint CS Red Dot"
	or string_id == "bm_wp_upg_o_cs_desc" and "Encased red dot sight."
	--Compact Holo
	or string_id == "bm_wp_upg_o_eotech_xps" and "EOTech EXPS3 Holographic Sight"
	or string_id == "bm_wp_upg_o_eotech_xps_desc" and "Low power holographic sight."
	--Speculator
	or string_id == "bm_wp_upg_o_reflex" and "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
	or string_id == "bm_wp_upg_o_reflex_desc" and "Low power red dot sight."
	--Trigonom
	or string_id == "bm_wp_upg_o_rx01" and "Trijicon RX01 Red Dot"
	or string_id == "bm_wp_upg_o_rx01_desc" and "Low power red dot sight."
	--Solar
	or string_id == "bm_wp_upg_o_rx30" and "Trijicon RX30 Red Dot"	
	or string_id == "bm_wp_upg_o_rx30_desc" and "Low power red dot sight."	
	--Theia
	or string_id == "bm_wp_upg_o_leupold" and "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	or string_id == "bm_wp_upg_o_leupold_desc" and "Ballistic scope that ##auto-marks## enemies ##in stealth## or ##specials.##\n##10% slower## ADS."
	--45 irons
	or string_id == "bm_wpn_fps_upg_o_45iron" and "XS Sights Angled Sights" --these are literally the worst things IRL, don't buy them for your gun if you have one and want angled sights to mount on it
	--Flip-Up (KSG sights)
	or string_id == "bm_wp_upg_o_mbus_rear" and "Magpul MBUS Back-up Sights"
	or string_id == "bm_wp_upg_o_mbus_rear_desc" and "Flip-up sights."
	or string_id == "dd_rear" and "Daniel Defense Fixed Sight Combo"
	or string_id == "dd_rear_desc" and "Fixed sights"
	
	or string_id == "bm_wp_mosin_iron_sight" and "Iron Sights"
	or string_id == "bm_wp_mosin_iron_sight_desc" and "Remove the scope and use iron sights."
	
	--Dragons Breath
	or string_id == "bm_wp_upg_a_dragons_breath" and "Dragon's Breath Rounds"
	or string_id == "bm_wp_upg_a_dragons_breath_desc" and "Pellets capable of ##setting targets on fire.##\nFire ##8 pellets.##\n##50% chance## to set targets aflame within ##30m##"
	or string_id == "bm_wp_upg_a_dragons_breath_auto" and "Pellets capable of ##setting targets on fire.##\nFire ##8 pellets.##\n##50% chance## to set targets aflame within ##30m##\nROF ##lowered## by ##10%.##"
	--AP Slug
	or string_id == "bm_wp_upg_a_slug" and "Armor Piercing SABOT Slugs"
	or string_id == "bm_wp_upg_a_slug_desc" and "A slug capable of ##piercing through enemies, walls and shields.##\n##50% longer## max damage range.\n##150% longer## drop-off range."
	--Birdshot (originally the free 000 Buck)
	or string_id == "bm_wp_upg_a_bird" and "Birdshot"
	or string_id == "bm_wp_upg_a_bird_desc" and "Shoot tiny pellets for ##greater pellet coverage.##\n Shoot ##50 pellets.##\n##CAN CAUSE FPS DROPS ON LOW END SYSTEMS##"
 	or string_id == "bm_wp_upg_a_bird_judge" and "Shoot tiny pellets for ##greater pellet coverage.##\n Shoot ##30 pellets.##\n##CAN CAUSE FPS DROPS ON LOW END SYSTEMS##" 
	--000 Buck
	or string_id == "bm_wp_upg_a_custom" and "000 Buck"
	or string_id == "bm_wp_upg_a_custom_desc" and "Large pellets with ##greater stopping power.##\nFire ##6 pellets.##\n##20% longer## max damage range.\n##30% shorter## drop-off range."
	or string_id == "bm_wp_upg_a_custom_judge" and "Large pellets with ##greater stopping power.##\nFire ##4 pellets.##\n##20% longer## max damage range.\n##30% shorter## drop-off range." 
	--Flechette
	or string_id == "bm_wp_upg_a_piercing" and "Flechette Rounds"
	or string_id == "bm_wp_upg_a_piercing_desc" and "Darts capable of ##penetrating MFR armor.##\nFire ##15 darts.##\n##50% longer## drop-off range."
	or string_id == "bm_wp_upg_a_piercing_judge" and "Darts capable of ##penetrating MFR armor.##\nFire ##10 darts.##\n##50% longer## drop-off range."
	--HE
	or string_id == "bm_wp_upg_a_explosive" and "Fragmentation Rounds"
	or string_id == "bm_wp_upg_a_explosive_desc" and "Fin stabilized rounds that ##explode on impact.## Shoot ##1 explosive## projectile.\n##2 meter## blast radius.\nDeals a flat ##120 damage.##"
	
	--Hollow Points
	or string_id == "bullet_hollow" and "Hollow Point Ammunition"
	or string_id == "bullet_hollow_desc" and "##No shield, enemy or armor penetration.\n50% less## penetration through walls.\n##30% less## damage to Dozers, MFR helmets and Elite SWATs.\n##25% lower## pick-up rate."
	--AP
	or string_id == "bullet_ap" and "Armor Piercing Ammunition"
	or string_id == "bullet_ap_desc" and "##Pierce shields within max damage range.##\n##30% greater## chance to go through MFR armor.\n##50% more## penetration through walls.\n##20% more## damage to Dozers, MFR helmets and Elite SWATs.\n##25% lower## pick-up rate."
	or string_id == "bullet_ap_desc_has_pen" and "##+5%## damage through shields.\n##30% greater## chance to go through MFR armor.\n##50% more## penetration through walls.\n##20% more## damage to Dozers, MFR helmets and Elite SWATs.\n##25% lower## pick-up rate."
	or string_id == "bullet_ap_desc_9mm" and "##Pierce enemies and armor.##\n##30% greater## chance to go through MFR armor.\n##50% more## penetration through walls.\n##20% more## damage to Dozers, MFR helmets and Elite SWATs.\n##25% lower## pick-up rate."
	--Match
	or string_id == "bullet_match" and "Match Grade Ammunition"
	or string_id == "bullet_match_desc" and "High grade rounds for ##greater range and accuracy.##\n##No suppressors.##\n##15% longer## overall range.\n##10% lower## pick-up rate."
	--Low Power
	or string_id == "bullet_low" and "Low Powered Ammunition"
	or string_id == "bullet_low_desc" and "Rounds with reduced loads for ##less recoil.##\n##No sniper class barrels.##\n##20% shorter## overall range.\n##15% less## penetration through walls."
	--Incendiary
	or string_id == "bullet_fire" and "Incendiary Ammunition"
	or string_id == "bullet_fire_desc" and "Rounds with a ##5% chance## to set your target ##on fire.##\n##No ammo pickups.##"
	--HEIAP
	or string_id == "bullet_heiap" and "Raufoss Mk 211 Ammunition"
	or string_id == "bullet_heiap_desc" and "...##No ammo pickups.##"
	--Deagle Corbon
	or string_id == "bullet_corbon" and ".440 Cor-bon Ammunition"
	or string_id == "bullet_corbon_desc" and "Rechambers this weapon in .440 Cor-bon.\n##10% longer## overall range.\n##15% more## penetration through walls.\n##50% lower## pick-up rate."
	--300 Winchester
	or string_id == "bullet_300_win" and ".300 Winchester Magnum Ammunition"
	or string_id == "bullet_300_win_desc" and "Rechambers this weapon in .300 Winchester Magnum.\n##15% longer## overall range.\n##10% lower## pick-up rate."
	or string_id == "bullet_300_win_r93_desc" and "Rechambers this weapon in .300 Winchester Magnum.\n##10% shorter## overall range.\n##10% greater## pick-up rate."
	
	--Taser
	or string_id == "shell_taser" and "Taser Rounds"
	or string_id == "shell_taser_desc" and "Non-lethal shells that can stun a target for a short time.\n##No ammo pickups.##"
	
	--M134 Slow
	or string_id == "m134_slow" and "Death Machine Motor"
	or string_id == "m134_slow_desc" and "ROF ##lowered## to ##1666 RPM.##"
	--M134 Slower
	or string_id == "m134_slower" and "Ghost Motor"
	or string_id == "m134_slower_desc" and "ROF ##lowered## to ##750 RPM.##"
	--Burst Fire
	or string_id == "burstfire" and "Burst Fire Kit"
	or string_id == "burstfire_desc" and "Allows this weapon switch to ##3-round bursts.##"
	or string_id == "burstfire_desc_ak5" and "Allows this weapon switch to ##3-round bursts.## \n##Requires the FN FNC Kit to be attached.##"
	or string_id == "burstfire_desc_m16" and "Swaps out full-auto capabilities for ##3-round bursts.##"
	or string_id == "burstfire_desc_raffica" and "Allows this weapon to fire in ##3-round bursts## at ##1200 RPM.##\n##Semi-auto fire rate is unchanged.##\n##Disables the effects of Equilibrium Aced.##"
	--MAC slow kit
	or string_id == "mac_slow" and "MAC Slow Fire Kit"
	or string_id == "mac_slow_desc" and "ROF ##lowered## to ##750 RPM.##"
	
	--DMCWO loot shit
	or string_id == "loot_dmcwo" and "DeadMansChest's Weapon Overhaul"
	or string_id == "loot_dmcwo_desc" and "This is a DMCWO item!"
	
	--URSA
	or string_id == "bm_melee_kabar" and "USMC KA-BAR"
	or string_id == "bm_melee_kabar_desc" and "The most famous fixed blade knife in the World, the KA-BAR.\n\nDesigned to serve US troops during World War II and is still doing its job, in the hands of robbers, years later."
	--Krieger
	or string_id == "bm_melee_kampfmesser" and "KM 2000"
	or string_id == "bm_melee_kampfmesser_desc" and "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity. Good choice for CQC."
	--Berger
	or string_id == "bm_melee_gerber" and "Gerber DMF Folder"
	or string_id == "bm_melee_gerber_desc" and "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous use knife. Textured G-10 handle gives the DMF Folder a sure grip in gloved hands and maintains a perfect weight balance."
	--Lambo
	or string_id == "bm_melee_rambo_desc" and "A survival knife with a heavy bowie blade. The length, sawtooth spine and centered tip works just as well in the wilderness as it does in close combat."
	
	--Tomahawk
	or string_id == "bm_melee_tomahawk" and "Gerber Downrange Tomahawk"
	or string_id == "bm_melee_tomahawk_desc" and "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the heist. No matter what's on the other side of that door or vault, you want a tool with the same single-minded determination as the robber wielding it."
	--Machete
	or string_id == "bm_melee_becker" and "KA-BAR Becker Tac Tool"
	or string_id == "bm_melee_becker_desc" and "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts.\n\nIt is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out display cases as it is efficient at cutting police cable ties."
	--Baton
	or string_id == "bm_melee_baton" and "ASP Friction Loc Baton"
	or string_id == "bm_melee_baton_desc" and "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement. Tested by the most elite federal teams, it has proven itself virtually indestructible.\n\nIt's rather ironic that you're using it against them now."	
	--Shovel
	or string_id == "bm_melee_shovel" and "KLAS Shovel"
	or string_id == "bm_melee_shovel_desc" and "The KLAS shovel can be used for a variety of recreational purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone.\n\nIf you use it correctly, that is.\n\nWhich you don't."
	
	--EMONE
	or string_id == "bm_melee_moneybundle" and "LODS OF EMONE"
	or string_id == "bm_melee_moneybundle_desc" and "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!"
	
	--AAAA-TATATATATATATA
	or string_id == "bm_melee_fists_desc" and "You're no boxer, but you can still throw a pretty good punch. All it takes is some strength, speed and timing and you'll land a striking blow in no time."
	
	--KA-NUCKLES
	or string_id == "bm_melee_brass_knuckles_desc" and "Knuckle style weapons have been used all over the world for hundreds of years. Brass knuckles concentrate the punch's force by directing it towards a harder and smaller area, increasing the chanecs of tissue disruption. Hit hard enough and you'll even fracture some bones."

	--TWD Bat
	or string_id == "bm_melee_baseballbat" and "\"Lucille\""
	or string_id == "bm_melee_baseballbat_desc" and "A baseball bat that has been given the name of \"Lucille\". It's been said that Lucille was used to bash a man's skull in, teach some unruly folks a lesson.\n\nNow that you have it, perhaps you could do the same and teach those cops a thing or two.\n"
	
	--Bayonet
	or string_id == "bm_melee_bayonet" and "AKM Type II Bayonet"	
	or string_id == "bm_melee_bayonet_desc" and "A rugged bayonet, meant for mounting on the end of your AK and thrusting it into the bodies of your foes.\n\nDoing that makes sense though. You'll just use it like a regular knife, won't you?\n"	
	
	--Bullseye
	or string_id == "bm_melee_bullseye" and "Smith & Wesson Bullseye Hatchet"
	or string_id == "bm_melee_bullseye_desc" and "I don't even know what to say to be honest - this is not something you would bring to a fight unless you were some kind of psycho, right?\nI mean, this is intended for chopping logs and going camping, not robbing banks.\n\nRight?"
	
	--X46
	or string_id == "bm_melee_x46" and "Robson Knives X46 Utility Survival Knife"
	or string_id == "bm_melee_x46_desc" and "The X46 is a single 6\" piece of coated A2 steel in a partially serrated bowie blade configuration with a false top edge.\nIntergrated guard and glass breaker pommel tip.\nThe multi-purpose field design of this knife makes it as useful on the battlefield as it is in an emergency."
	
	--Gunther
	or string_id == "bm_melee_dingdong" and "Gerber Ding Dong Breaching Tool"
	or string_id == "bm_melee_dingdong_desc" and "A sledgehammer.\nA battering ram.\nA pry bar.\nAll three are essential breaching tools for heisters who need to get through doors quickly. The Ding Dong combines these three tools into one package as tight as the crew."
	
	--Cleaver
	or string_id == "bm_melee_cleaver" and "Cleaver"
	or string_id == "bm_melee_cleaver_desc" and "Your run of the mill cleaver.\n\nThe grip of this cleaver is rather slippery in your gloved hands so I'm telling you this now, you gotta get a grip on it unless you feel like tossing it."
	
	--Batshit insane
	or string_id == "bm_melee_bat_desc" and "A baseball bat, no more, no less.\n\nMeant for use in sport, you'll be using it fo something much more sinister.\n\nLike bashing in the head of an officer of the law."
	
	--Machete
	or string_id == "bm_melee_machete" and "Machete"
	or string_id == "bm_melee_machete_desc" and "You like hurting people. That's why you use this dull, worn to shit machete, allowing you to revel in the horrific aftermath of your work.\n\nGaping wounds, crudely chopped off body parts and the blood curdling screams of agony from that cop you failed to kill quickly.\n\nTruly the weapon of a cruel, cruel heister."
	
	--Fireaxe
	or string_id == "bm_melee_fireaxe_desc" and "Can I axe you a question?\n\nDo you like hurting other people?\n\nIf you do, what better way to do it than with something intended to save lives! Show your victims the fire in your eyes as you save them from yourself in one quick swing."
	
	--Briefcase
	or string_id == "menu_l_global_value_hlm_game" and "This is a Hotline Miami Ownership item!"
	or string_id == "bm_melee_briefcase_desc" and "Call it a blessing, but maybe it was for the best you lost the lock combination.\n\nNow you have an excuse to hit people over the head with this!\n"
	
	--Tanto
	or string_id == "bm_melee_kabar_tanto" and "KA-BAR Tanto"
	or string_id == "bm_melee_kabar_tanto_desc" and "The Tanto blade shape, of Asian influence, has a thick pointed blade that's good for penetration. Coupled with a glass-filled nylon sheath this knife is designed for the toughest of tasks."
	
	--UberHaxorNova
	or string_id == "bm_melee_toothbrush_desc" and "A small plastic toothbrush, sharpened and hardened, ready to be driven into the side of your next victim.\n\nNova-ne will see it coming."
	
	--Chef
	or string_id == "bm_melee_chef" and "Chef Knife"
	or string_id == "bm_melee_chef_desc" and "Take this!\n\nWhether you're an angry heister or a psycho bank robber, this hot-forged, laser sharpened chef knife in fine, stainless molybdenum steel will serve you for years.\n\nDid you know that the traditional chef's knife was originally intended to slice and disjoint large cuts of flesh?"
	
	--Trench Knife
	or string_id == "bm_melee_fairbair" and "Fairbairn-Sykes Fighting Knife"
	or string_id == "bm_melee_fairbair_desc" and "The Fairbairn-Sykes fighting knife is a double-edged fighting knife resembling a dagger or poignard with a foil grip. Good for those rough-n-tumble moments you can find yourself in while on a job."
	
	or string_id == "bm_melee_swagger_desc" and "Hello heisters. Look at your knife, now back to this, now back at your knife, now back to this.\n\nSadly, your knife isn't as swag as this, but if you stopped using that pansy ass knife and started using this swagger stick, you could be ballin' all over those cops."

	--Amerigan flag :DDD
	or string_id == "bm_melee_freedom_desc" and "Thirteen stripes of red alternating with white, a blue rectangle in the canton, fifty small, white, five pointed stars, a pinch of partriotism, two cups of freedom and a broken flag pole.\n\nVoila - you have yourself a deadly weapon."

	--Erica Hartmann
	or string_id == "bm_melee_model24" and "Model 24 Stielhandgranate"
	or string_id == "bm_melee_model24_desc" and "Why would anyone ever use a grenade as a melee weapon?\n\nStrike to the head?\nWitch-ful thinking?\n\nI guess those that have tried and lived are really grenade-ful it didn't go off."
	
	--Hammer time
	or string_id == "bm_melee_hammer" and "Jacket's Hammer"
	or string_id == "bm_melee_hammer_desc" and "The Jacket says, \"Do you know what time it is?\"\n\nWhy it's time to hammer some skulls in of course!\n\nCops won't be touching you, that's for sure."
	
	--Mayweather a boring
	or string_id == "bm_melee_boxing_gloves_desc" and "Time to come out swinging!\nSlip these beauties on and unleash 1000 pounds of peak punching power!\n\nThat is if you actually fight and not just run around avoiding conflict..."
	
	--A stick of lies
	or string_id == "bm_melee_shillelagh_desc" and "It's hard to determine the true origins of the shillelagh. How can you pinpoint the first time someone picked up a stout stick and brained someone else with it? And the shillelagh really hasn't evolved too much beyond that. Some prize blackthorn wood, while some might fill the head with molten lead.\n\nAt the end of the day, it really is just a bloody heavy stick that cracks skulls."
	
	--SJW Whiskey
	or string_id == "bm_melee_whiskey_desc" and "Know what makes you a good heister?\n\nReading this message obviously. Clear indication you haven't been caught."
	
	--Another Cleaver
	or string_id == "bm_melee_meat_cleaver" and "Dragan's Cleaver"
	or string_id == "bm_melee_meat_cleaver_desc" and "The cleaver is a kind of knife primarily used for cutting through meat and bone, but rather than using precise cuts the cleaver delivers powerful hammer-like blows that rend even the most durable flesh. Cleavers have a long history of butchering human beings as well as livestock.\n\nYou'll be doing the former."
	 
	--Tender lovin'
	or string_id == "bm_melee_poker" and "Firewood Poker"
	or string_id == "bm_melee_poker_desc" and "A long piece of iron with a pointy end is a fine implement for tending to smoldering embers, but it is also the perfect implement for causing havoc and extreme discomfort.\n\nTell'em to poker up!"
	
	--Tender lovin'
	or string_id == "bm_melee_tenderizer" and "Meat Tenderizer"
	or string_id == "bm_melee_tenderizer_desc" and "While it was mainly designed for softening and flattening tough strips of steak, it has also proven useful for softening and flattening tough strips of cop.\n\nShow'em some tender lovin'!"
	
	--Fork her
	or string_id == "bm_melee_fork" and "BBQ Fork"
	or string_id == "bm_melee_fork_desc" and "What's the difference between a truckload of bowling balls and a truckload of dead dozers? You can't unload a truckload of bowling balls with a fork.\n\nGive'em a good forkin'!"
	
	--Spangle Beb
	or string_id == "bm_melee_spatula_desc" and "A melee weapon with a dual purpose - use it to smear a cop all across the road, and then let others use it to scoop up their remains.\n\nGet'em faces sizzlin'!"
	
	--Autism
	or string_id == "bm_melee_mining_pick" and "Pickaxe"
	or string_id == "bm_melee_mining_pick_desc" and "There's gold in 'dem 'der hills! And by hills we mean teeth. But, hills or teeth, nothing digs the gold out faster than a swinging spike of pig iron."
	
	--Ebay sellers
	or string_id == "bm_melee_scalper_desc" and "For the victor, it is the symbol of war, of power and of dominance. For the loser, it is the symbol of a really bad haircut."
	
	--NAOW THIS IS A KNOIFE
	or string_id == "bm_melee_bowie" and "Bowie Knife"
	or string_id == "bm_melee_bowie_desc" and "Nine inches of clip-point fighting steel. It's origins lie in the age of the classic pirate, but it was the famous Brawl of Carroll County (and a dozen bloodied men) that brought it wide-spread fame"
	
	--MY BRAND
	or string_id == "bm_melee_branding_iron" and "Branding Iron"
	or string_id == "bm_melee_branding_iron_desc" and "It may have been designed to mark the thick hides of cattle for identification, but fire-heated iron is even more effective against the soft flesh of a deputy or marshall."
	
	--Mike
	or string_id == "bm_melee_microphone_desc" and "A microphone you ask?\n\nIndeed it is. A dinky little microphone at that.\n\nNot much else to say,"

	--Mike Stands
	or string_id == "bm_melee_micstand_desc" and "Can't quite understand why you'd use this.\n\nMaybe like how a singer can keep rabid folk away and off the stage, you can do the same with cops rushing you and off your loot."
	
	--WOLOLOLO
	or string_id == "bm_melee_oldbaton" and "Nightstick"
	or string_id == "bm_melee_oldbaton_desc" and "Be one of the night and stick it to the man!\n\nShow them irony, show them pain!\nShow them in the end that this is (not) a game!"
	
	--WHOOP WHOOP PULL OVAH THAT BRASS TOO FAT
	or string_id == "bm_melee_detector" and "Garrett Handheld Metal Detector"
	or string_id == "bm_melee_detector_desc" and "You should probably leave this thing off if you plan on taking it with you on your next job.\n\nUnless you plan on wreaking havoc from the get go, then by all means go ahead and have fun."
	
	--Stun Baton
	or string_id == "bm_melee_taser" and "ZAP Stun Baton"
	
	--Kunai
	or string_id == "bm_melee_cqc" and "Kunai"
	--Sai
	or string_id == "bm_melee_twins" and "Sais"
	--Tekko-Kagi
	or string_id == "bm_melee_tiger" and "Tekko-Kagi"
		
	or testAllStrings == true and string_id
	or LocalizationManager_text(self, string_id, macros)
end

function comma_value(amount)
  local formatted = amount
  local k
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end