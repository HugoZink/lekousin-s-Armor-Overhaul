--[[
Text for new stats
-code base thanks to hejoro
]]

LocalizationManager_text = LocalizationManager_text or LocalizationManager.text
function LocalizationManager:text( string_id, macros )
	local armortext = {}

	-- Stats
	armortext["bm_menu_regen"] = "Regen per second"
	armortext["bm_menu_deflect_min_dmg"] = "Dmg max deflect"
	armortext["bm_menu_deflect_min_procent"] = "Max deflect chance"
	armortext["bm_menu_deflect_max_dmg"] = "Dmg min deflect"
	armortext["bm_menu_deflect_max_procent"] = "Min deflect chance"
	armortext["bm_menu_hdr_min_dmg"] = "Min HDR dmg"
	armortext["bm_menu_hdr_min_procent"] = "Min HDR value"
	armortext["bm_menu_hdr_max_dmg"] = "Max HDR dmg"
	armortext["bm_menu_hdr_max_procent"] = "Max HDR value"
	armortext["bm_menu_explosion_damage_reduction"] = "Explosion damage reduction"
	armortext["bm_menu_ammo_mul"] = "Bonus ammo"
	armortext["bm_menu_jump_speed_multiplier"] = "Bonus jump speed"
	armortext["bm_menu_ap_regen_suppressed_max_multiplier"] = "Maximum regen suppressed"
	armortext["bm_menu_bleeding_reduction"] = "Bleeding reduction"

	-- Armors
	armortext["bm_armor_level_8"] = "Lifa Vest"
	armortext["bm_armor_level_9"] = "Lightweight tactical vest"
	armortext["bm_armor_level_10"] = "Thin vest"
	armortext["bm_armor_level_11"] = "EOD Suit"
	armortext["bm_armor_level_12"] = "Custom Armor"

	-- Armors required skills
	armortext["bm_menu_skill_locked_level_7"] = "Requires the Tough Guy skill"
	armortext["bm_menu_skill_locked_level_8"] = "Requires the Curaga skill"
	armortext["bm_menu_skill_locked_level_9"] = "Requires the Materia skill"
	armortext["bm_menu_skill_locked_level_10"] = "Requires the Moving Target skill"
	armortext["bm_menu_skill_locked_level_11"] = "Requires the Bomb Disposal Expert skill"

	-- Skills
	armortext["menu_stockholm_syndrome"] = "Curaga"
	armortext["menu_sentry_targeting_package"] = "Materia"
	armortext["menu_juggernaut"] = "Bomb Disposal Expert"

	-- New perk deck
	armortext["menu_st_spec_armor_drainer"] = "Armor Drainer"
	armortext["menu_st_spec_armor_drainer_desc"] = "The armor drainer allows the shooter to increases its armor pool by leading headshots.\n\nNote: when leading a headshot, a cooldown starts in which headshots don't increase the bonus."
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
	armortext["armor_overhaul_options_help"] = "Change ArmorOverhaul options"
	armortext["armor_overhaul_options_lang"] = "Language"
	armortext["lang_en"] = "en"
	armortext["lang_fr"] = "fr"

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
	Suits tend to lower it (by 25% for the Two-piece suit and 65% for the Thin suit), whereas some others increase it (Flak Jacket -> 35%; Lightweight Tactical Vest -> 40%).]]

	armortext["description_new_edr_desc"] = [[If you are hit by an explosion, damage can be lowered by the armor, the tougher the higher reduction.]]

	armortext["description_new_health_armor_desc"] = [[Some armors alter your health pool. They are a restricted number though.
	Lifa Vest increases your health pool by 30 HP, EOD Suit by 20 with Bomb Disposal Expert aced.]]

	armortext["description_new_health_regen_desc"] = [[Each tick (the briefiest part of time), depending on your armor, you might regenerate a bit of your health.
	On normal difficulty, each armor (except Two-piece suit and Thin suit) grants you a tiny health regeneration per second.
	Otherwise, only Lifa Vest grants health regeneration (0.5 HP per second with Curaga basic, 1.5 with Curaga aced).]]

	armortext["description_new_jump_armor_desc"] = [[The tougher your armor, the lower your jump will go.
	With this in mind, the jump cooldown has been reduced to 0.05s.]]

	armortext["description_new_bleeding_desc"] = [[When you take health damage, you have a chance to start bleeding.
	The odds and bleed rate depend on health loss, with a maximum of 50% chance to bleed and a rate of 10 HP per second for a 100+ HP loss.
	The bleeding rate decreases when your armor is up. The debleeding rate varies accordingly to your armor and its current armor / max armor ratio.
	That being said, Thin suit can't stop bleeding, so you may lose all your health.
	Note that you cannot go into bleedout due to bleeding, and bleeding can be stopped also by using a medic bag.]]

	armortext["description_new_difficulty_desc"] = [[Your armor stats are not static. They may depend on the difficulty.
	There is a list of the stats affected by difficulty and their ratio (from normal to deathwish):
	Armor (1, 1.25, 1.5, 2, 2.5)
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

		tweak_data.upgrades.skill_descs.stockholm_syndrome = {multibasic = "30", multibasic2 = "0.5", multipro = "1.5"}

		armortext["menu_stockholm_syndrome_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor7"] and "OWNED" or (control_freak_cost .. " points / $" .. comma_value(control_freak_money))) .. "## ## ##\nUnlocks the Lifa Vest.\nThis vest nets you a ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multibasic .. "## HP bonus and a ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multibasic2 .. "## HP regen per second.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_8_hp_regen_addend"] and "OWNED" or (control_freak_cost_pro .. " points / $" .. comma_value(control_freak_money_pro))) .. "##\nImproves your Lifa Vest, which now regenerates ##" .. tweak_data.upgrades.skill_descs.stockholm_syndrome.multipro .. "## HP per second."

		tough_guy_cost = SkillTreeManager:get_skill_points("tough_guy", 1)
		tough_guy_cost_pro = SkillTreeManager:get_skill_points("tough_guy", 2)
		tough_guy_money = MoneyManager:get_skillpoint_cost(1, 6, tough_guy_cost)
		tough_guy_money_pro = MoneyManager:get_skillpoint_cost(1, 6, tough_guy_cost_pro)

		armortext["menu_tough_guy_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor6"] and "OWNED" or (tough_guy_cost .. " points / $" .. comma_value(tough_guy_money))) .. "## ## ##\nUnlocks the Improved Combined Tactical Vest.\n\nACE: ##" .. (Global.upgrades_manager.aquired["run_and_shoot"] and "OWNED" or (tough_guy_cost_pro .. " points / $" .. comma_value(tough_guy_money_pro))) .. "##\nYou can now shoot while running.\nYou can now melee shields to make them stumble."

		juggernaut_cost = SkillTreeManager:get_skill_points("juggernaut", 1)
		juggernaut_cost_pro = SkillTreeManager:get_skill_points("juggernaut", 2)
		juggernaut_money = MoneyManager:get_skillpoint_cost(1, 6, juggernaut_cost)
		juggernaut_money_pro = MoneyManager:get_skillpoint_cost(1, 6, juggernaut_cost_pro)

		tweak_data.upgrades.skill_descs.juggernaut = {multipro = "10%", multipro2 = "10", multipro3 = "8", multipro4 = "400%", note = "75%"}

		armortext["menu_juggernaut_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor10"] and "OWNED" or (juggernaut_cost .. " points / $" .. comma_value(juggernaut_money))) .. "## ## ##\nUnlocks the EOD Suit.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_11_hp_addend"] and "OWNED" or (juggernaut_cost_pro .. " points / $" .. comma_value(juggernaut_money_pro))) .. "##\nImproves your EOD Suit, lowering explosion damage to ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro .. "##, increasing maximum HP by ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro2 .. "##, movement speed by ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro3 .. "## and stamina by ##" .. tweak_data.upgrades.skill_descs.juggernaut.multipro4 .. "##.\n\nNote: The EOD Suit is unaffected by the Blending In perk. When your EOD Suit is under the suppression effect, it cannot regenerate more than ##" .. tweak_data.upgrades.skill_descs.juggernaut.note .. "## of its usual regeneration value."

		materia_cost = SkillTreeManager:get_skill_points("sentry_targeting_package", 1)
		materia_cost_pro = SkillTreeManager:get_skill_points("sentry_targeting_package", 2)
		materia_money = MoneyManager:get_skillpoint_cost(1, 6, materia_cost)
		materia_money_pro = MoneyManager:get_skillpoint_cost(1, 6, materia_cost_pro)

		tweak_data.upgrades.skill_descs.materia = {multipro = "20%", multipro2 = "10", multipro3 = "10%"}

		armortext["menu_sentry_targeting_package_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor8"] and "OWNED" or (materia_cost .. " points / $" .. comma_value(materia_money))) .. "## ## ##\nUnlocks the Lightweight Tactical Vest.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_level_9_armor_regen_addend"] and "OWNED" or (materia_cost_pro .. " points / $" .. comma_value(materia_money_pro))) .. "##\nImproves your Lightweight Tactical Vest, decreasing armor regeneration delay by ##" .. tweak_data.upgrades.skill_descs.materia.multipro .. "##, increasing armor regeneration by ##" .. tweak_data.upgrades.skill_descs.materia.multipro2 .. "## per second and deflection chance by ##" .. tweak_data.upgrades.skill_descs.materia.multipro3 .. "##."

		sentry_2_cost = SkillTreeManager:get_skill_points("sentry_2_0", 1)
		sentry_2_cost_pro = SkillTreeManager:get_skill_points("sentry_2_0", 2)
		sentry_2_money = MoneyManager:get_skillpoint_cost(1, 6, sentry_2_cost)
		sentry_2_money_pro = MoneyManager:get_skillpoint_cost(1, 6, sentry_2_cost_pro)

		tweak_data.upgrades.skill_descs.sentry_2 = {multibasic = "100%", multipro = "150%", multipro2 = "50%"}

		armortext["menu_sentry_2_0_desc"] = "BASIC: ##" .. (Global.upgrades_manager.aquired["sentry_gun_can_reload"] and "OWNED" or (sentry_2_cost .. " points / $" .. comma_value(sentry_2_money))) .. "## ## ##\nYou can now reload your sentry gun with your own ammo\nYour sentry gun's accuracy is increased by ##" .. tweak_data.upgrades.skill_descs.sentry_2.multibasic .. "##.\n\nACE: ##" .. (Global.upgrades_manager.aquired["sentry_gun_shield"] and "OWNED" or (sentry_2_cost_pro .. " points / $" .. comma_value(sentry_2_money_pro))) .. "##\nYour sentry gun receives a protective shield.\nYour sentry gun's rotational speed is increased by ##" .. tweak_data.upgrades.skill_descs.sentry_2.multipro .. "##.\nYour sentry gun contains ##" .. tweak_data.upgrades.skill_descs.sentry_2.multipro2 .. "## more ammo."

		moving_target_cost = SkillTreeManager:get_skill_points("moving_target", 1)
		moving_target_cost_pro = SkillTreeManager:get_skill_points("moving_target", 2)
		moving_target_money = MoneyManager:get_skillpoint_cost(1, 6, moving_target_cost)
		moving_target_money_pro = MoneyManager:get_skillpoint_cost(1, 6, moving_target_cost_pro)

		tweak_data.upgrades.skill_descs.moving_target = {multipro = "25%"}

		armortext["menu_moving_target_desc"] = "## ##BASIC: ##" .. (Global.upgrades_manager.aquired["body_armor9"] and "OWNED" or (moving_target_cost .. " points / $" .. comma_value(moving_target_money))) .. "## ## ##\nYou can now run while strafing.\nUnlocks the Thin Vest.\n\nACE: ##" .. (Global.upgrades_manager.aquired["player_can_free_run"] and "OWNED" or (moving_target_cost_pro .. " points / $" .. comma_value(moving_target_money_pro))) .. "##\nYou can now run in any direction.\nYour dodge value is increased by ##" .. tweak_data.upgrades.skill_descs.moving_target.multipro .. "##."
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

	armortext["menu_deck_armor_drainer_1_desc"] = "You gain ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][1].multiperk .. "## maximum armor for each headshot, with a maximum at ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][1].multiperk2 .. "## per headshot."
	armortext["menu_deck_armor_drainer_3_desc"] = "You gain ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][3].multiperk .. "## maximum armor for each headshot, with a maximum at ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][3].multiperk2 .. "## per headshot."
	armortext["menu_deck_armor_drainer_5_desc"] = "You gain ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][5].multiperk .. "## maximum armor for each headshot, with a maximum at ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][5].multiperk2 .. "## per headshot."
	armortext["menu_deck_armor_drainer_7_desc"] = "You gain ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][7].multiperk .. "## maximum armor for each headshot, with a maximum at ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][7].multiperk2 .. "## per headshot."
	armortext["menu_deck_armor_drainer_9_desc"] = "You gain ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk .. "## maximum armor for each headshot, with a maximum at ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk2 .. "## per headshot.\n\nDeck Completion bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##" .. tweak_data.upgrades.specialization_descs[Global.spec_length][9].multiperk3 .. "##."

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

    -- Compatibility with DeadManChest's Weapon Overhaul (or DMCWO if you prefer)
    local realnames = {}
	
	--[[BRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRT]]
	realnames["bm_w_m134"] = "General Electric M134"
	realnames["bm_w_m134_desc"] = ""
	realnames["bm_wp_m134_body_upper_light_desc"] = "Decreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_extreme"] = "Anti-Air Barrel"
	realnames["bm_wp_m134_barrel_extreme_desc"] = "Increases range by 15% \nDecreases ADS speed by 10% \nIncreases movement penalty by 20%"
	realnames["bm_wp_m134_barrel_short"] = "Compact Barrel"
	realnames["bm_wp_m134_barrel_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5% \nDecreases movement penalty by 20%"
	
	--[[WE TERRORIST NAO]]
	realnames["bm_w_rpg7"] = "Bazalt RPG-7"
	
	
	--[[GOLD SLAVSHIT]]
	realnames["bm_w_akm_gold"] = "Gold Plated AKMS"
	
	--[[JAM733]]
	realnames["bm_w_amcar"] = "Colt M733 Commando"
	
	--[[STEEL BALLS]]
	realnames["bm_w_ak74"] = "Concern Kalashnikov AKS-74"
	
	--[[JAM-4]]
	realnames["bm_w_m4"] = "Colt M4A1" --"Safety Pins"
	--Barrels
	realnames["bm_wp_m4_uupg_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	realnames["bm_wp_m4_uupg_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%" 
	--Suppressed Barrel
	realnames["bm_wp_m4_uupg_b_sd"] = "Suppressed Barrel" 
	realnames["bm_wp_m4_uupg_b_sd_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%" 
	--Aftermarket
	realnames["bm_wp_m4_uupg_fg_lr300"] = "LR300 Handguard"
	realnames["bm_wp_m4_uupg_fg_lr300_desc"] = "Increases ADS speed by 7.5%"
	--Competition
	realnames["bm_wp_upg_fg_jp"] = "JPE Modular Handguard"
	realnames["bm_wp_upg_fg_jp_desc"] = "Increases ADS speed by 5%"
	--Gazelle
	realnames["bm_wp_upg_fg_smr"] = "Geissele Super Modular Rail"
	
	--[[AUGLY]]
	realnames["bm_w_aug"] = "Steyr AUG A2"
	--A3 Tact. Foregrip
	realnames["bm_wp_aug_fg_a3"] = "A3 Rail"
	realnames["bm_wp_aug_fg_a3_desc"] = "Decreases ADS speed by 5%"
	realnames["bm_wp_aug_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_aug_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	--[[WHITE FLAG]]
	realnames["bm_w_famas"] = "Nexter FAMAS" --"IS THAT A DEAGLE?"
	
	realnames["bm_wp_famas_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	realnames["bm_wp_famas_b_sniper_desc"] = "Increases range by 30% \nDecreases ADS speed by 10%"
	realnames["bm_wp_famas_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_famas_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--Retro Grip
	realnames["bm_wp_famas_g_retro"] = "G2 Guard"
	realnames["bm_wp_famas_g_retro_desc"] = "Increases ROF to 1200 RPM"
	
	--[[JAM]]
	realnames["bm_w_l85a2"] = "BAE L85A2" --"Eru"
	realnames["bm_wp_l85a2_b_long"] = "Long Barrel"
	realnames["bm_wp_l85a2_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_b_short"] = "Short Barrel"
	realnames["bm_wp_l85a2_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_l85a2_g_worn"] = "Taped Pistol Grip"
	realnames["bm_wp_l85a2_fg_short"] = "Daniel Defence L85 Quad Rail"
	realnames["bm_wp_l85a2_fg_short_desc"] = "Increases ADS speed by 5%"
	
	--[[CROATGAT]]
	realnames["bm_w_vhs"] = "HS Produkt VHS-2"
	realnames["bm_wp_vhs_b_short"] = "Short Barrel"
	realnames["bm_wp_vhs_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_vhs_b_sniper"] = "Sniper Barrel"
	realnames["bm_wp_vhs_b_sniper_desc"] = "Increases range by 30% \nDecreases ADS speed by 10%"
	
	realnames["bm_wp_vhs_b_silenced"] = "Suppressed Barrel"
	realnames["bm_wp_vhs_b_silenced_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--[[SLAVSHIT]]
	realnames["bm_w_akm"] = "Concern Kalashnikov AKMS"
	
	--[[MELTGUN]]
	realnames["bm_w_g36"] = "Heckler & Koch G36C"
	--Compact
	realnames["bm_wp_g36_fg_c"] = "Carbine Handguard"
	realnames["bm_wp_g36_fg_c_desc"] = "Decreases range by 10% \nIncreses ADS speed by 5%"
	--Polizei
	realnames["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard"  
	--Solid Stock
	realnames["bm_wp_g36_s_kv"] = "G36KV Stock"
	--Sniper Stock
	realnames["bm_wp_g36_s_sl8"] = "SL8 Stock"
	
	--[[PUNS]]
	realnames["bm_w_m14"] = "Springfield M14 DMR"
	--Abraham
	realnames["bm_wp_m14_body_ebr"] = "MK.14 Kit"
	realnames["bm_wp_m14_body_ebr_desc"] = "Increases ADS speed by 5% \nIncreases ROF to 750 RPM"
	--Seid ihr das Essen? Nein, wir sind der Jaeger! (watch better anime)
	realnames["bm_wp_m14_body_jae"] = "M14 JAE Kit"
	
	--[[SWED]]
	realnames["bm_w_ak5"] = "Bofors AK5" --"FNC's sexy swedish cousin"
	--Karbin Ceres
	realnames["bm_wp_ak5_fg_ak5c"] = "AK5c Handguard"
	realnames["bm_wp_ak5_fg_ak5c_desc"] = "Decreases ROF to 650 RPM"
	--Belgian Heat
	realnames["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard"
	realnames["bm_wp_ak5_fg_fnc_desc"] = "Increases ROF to 700 RPM"
	--Bertil
	realnames["bm_wp_ak5_s_ak5b"] = "AK5b Stock"
	--Caesar
	realnames["bm_wp_ak5_s_ak5c"] = "AK5c Stock"
	
	--[[JAM16]]
	realnames["bm_w_m16"] = "Colt M16A3" --"Orange Slices", "IS THAT A FAMAS?"
	realnames["bm_w_m16a4"] = "Colt M16A4"
	--going against imfdb here, simply for the fact the the flat top receiver isn't limited to the A4 and that the AMR bares more resemblence to the A3 (default handguard, automatic fire)
	--Railed
	realnames["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail" --not a carbon copy, just based off of, if only for the delta ring
	--Blast to the Past
	realnames["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard"
	
	--[[553 NO PANTSU]]
	realnames["bm_w_s552"] = "SIG SG 552" --"SG550's Little Sister"
	--Enhanced Foregrip
	realnames["bm_wp_ass_s552_fg_standard_green"] = "OD Green Handguard"
	--Enhanced Grip
	realnames["bm_wp_ass_s552_g_standard_green"] = "OD Green Pistol Grip"
	--Enhanced Stock
	realnames["bm_wp_ass_s552_s_standard_green"] = "OD Green Stock"	
	--Enhanced Foregrip
	realnames["bm_wp_ass_s552_fg_black"] = "Black Handguard"
	--Enhanced Grip
	realnames["bm_wp_ass_s552_g_black"] = "Black Pistol Grip"
	--Enhanced Stock
	realnames["bm_wp_ass_s552_s_black"] = "Black Stock"
	--Railed Foregrip
	realnames["bm_wp_ass_s552_fg_railed"] = "Railed Handguard" --pretty sure Sig manufactures their own rails for the 552/3. Can't be bothered to look :/
	--Heat Treated
	realnames["bm_wp_ass_s552_body_standard_black"] = "Black Receiver" --GJ, Overkill. Heat treating metal, while it does make it harder, also makes it more brittle. Pretty sure you don't want that in a gun
	
	--[[EAG-H]]
	realnames["bm_w_scar"] = "FN MK.17"
	--Sniper Stock
	realnames["bm_wp_scar_s_sniper"] = "MK.20 Stock"	
	
	realnames["bm_wp_scar_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_scar_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	--Rail Extension
	realnames["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension"
	realnames["bm_wp_scar_fg_railext_desc"] = "Decreases ADS speed by 5%"
	
	--[[RIGHT ARM]]
	realnames["bm_w_fal"] = "FN FAL"
	--CQB
	realnames["bm_wp_fal_body_standard"] = "DSA SA58 Handguard w/ Short Barrel" --this might conflict with something since this is also the name_id of the receiver
	realnames["bm_wp_fal_body_standard_desc"] = "Decreases range by 10% \nIncreases ADS speed by 15%" --this might conflict with something since this is also the name_id of the receiver
	--Retro
    realnames["bm_wp_fal_fg_03"] = "IMI Romat Handguard"
    realnames["bm_wp_fal_fg_03_desc"] = "Decreases ADS speed by 5%"
	--Marksman
    realnames["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard"
    realnames["bm_wp_fal_fg_04_desc"] = "Increases ADS speed by 5%"
	--Wood
    realnames["bm_wp_fal_fg_wood"] = "Wooden Handguard"
    realnames["bm_wp_fal_fg_wood_desc"] = "Decreases ADS speed by 7.5%"
	--Tactical Grip
	realnames["bm_wp_fal_g_01"] = "Tapco FAL/SAW Pistol Grip"
	--Extended Mag
    realnames["bm_wp_fal_m_01"] = "30rnd FAL Magazine"
    realnames["bm_wp_fal_m_01_desc"] = "Decreases reload speed by 10%"
	--Folding
    realnames["bm_wp_fal_s_01"] = "Sidefolding Stock"
	--Marksman
    realnames["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock"
	
	--[[BOTTLE OPENER]]
	realnames["bm_w_galil"] = "IMI Galil ARM"
	--Sniper
	realnames["bm_wp_galil_fg_sniper"] = "IMI Galatz Handguard & Sniper Barrel"
	realnames["bm_wp_galil_fg_sniper_desc"] = "Increases range by 15% \nDecreases ADS speed by 10% \nDecreases ROF to 630 RPM"
	--Light
	realnames["bm_wp_galil_fg_sar"] = "IMI Galil SAR Handguard & 13\" Barrel"
	realnames["bm_wp_galil_fg_sar_desc"] = "Increases ADS speed by 5%"
	--CQB
	realnames["bm_wp_galil_fg_mar"] = "IMI Galil MAR Handguard & 7\" Barrel"
	realnames["bm_wp_galil_fg_mar_desc"] = "Decreases range by 10% \nIncreases ADS speed by 15% \nIncreases ROF to 750 RPM"
	--FAB
	realnames["bm_wp_galil_fg_fab"] = "FAB Defence Galil Handguard"
	--Sniper Grip
	realnames["bm_wp_galil_g_sniper"] = "IMI Galatz Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_galil_s_sniper"] = "IMI Galatz Wooden Stock"
	--Skeletal Stock
	realnames["bm_wp_galil_s_skeletal"] = "IMI Galil MAR Stock"
	--Light Stock
	realnames["bm_wp_galil_s_light"] = "IMI Galatz Skeleton Stock"
	--FAB Stock
	realnames["bm_wp_galil_s_fab"] = "FAB Defence MG-CP Cheek Pad"
	
	--[[MAI RAIFU (SHE'S MINE I TELL YOU)]]
	realnames["bm_w_g3"] = "Heckler & Koch G3"
	--Assault Kit
	realnames["bm_wp_g3_b_short"] = "Short Barrel"
	realnames["bm_wp_g3_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--DMR Kit
	realnames["bm_wp_g3_b_sniper"] = "PSG-1 Barrel"
	realnames["bm_wp_g3_b_sniper_desc"] = "Increases range by 30%\nDecreases ADS speed by 10%"
	--PSG Foregrip
	realnames["bm_wp_g3_fg_psg"] = "PSG-1 Handguard"
	realnames["bm_wp_g3_fg_psg_desc"] = "Decreases ADS speed by 5%"
	--Railed Foregrip
	realnames["bm_wp_g3_fg_railed"] = "FAB Defence G3-RS Handguard"
	--Retro Foregrip
	realnames["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_desc"] = "Decreases ADS speed by 7.5%"
	--Plastic Retro Foregrip
	realnames["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard"
	realnames["bm_wp_g3_fg_retro_plastic_desc"] = "Increases ADS speed by 5%"
	--Retro Grip
	realnames["bm_wp_g3_g_retro"] = "G3 Ergo Grip"
	realnames["bm_wp_g3_g_retro_desc"] = "Increases ADS speed by 5%"
	--Sniper Grip
	realnames["bm_wp_g3_g_sniper"] = "PSG-1 Pistol Grip"
	--Sniper Stock
	realnames["bm_wp_g3_s_sniper"] = "PSG-1 Stock"

	
	--[[Rattlesnake]]
	realnames["bm_w_msr"] = "Remington MSR"
	--Suppressor
	realnames["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor"
	realnames["bm_wp_snp_msr_ns_suppressor_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	realnames["bm_wp_snp_msr_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 10%"
	--Aluminum Body
	realnames["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver"
	realnames["bm_wp_msr_body_msr_desc"] = "Increases ADS speed by 5%"
	
	--[[R93]]
	realnames["bm_w_r93"] =  "Blaser R93 Tactical 2"
	
	realnames["bm_wp_r93_b_short_desc"] =  "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_r93_b_suppressed_desc"] =  "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	--Wooden Body
	realnames["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock"
	realnames["bm_wp_r93_body_wood_desc"] = "Decreases ADS speed by 5%"
	
	--[[FIDDY CAL]]
	realnames["bm_w_m95"] = "Barrett M95"
	--Tank Buster
	realnames["bm_wp_m95_b_barrel_long"] = "Long Barrel w/ AW50F Muzzle Brake"
	realnames["bm_wp_m95_b_barrel_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 10%"
	realnames["bm_wp_m95_b_barrel_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	realnames["bm_wp_m95_b_barrel_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--[[MOIST NUGGET]]
	realnames["bm_w_mosin"] = "Mosin Nagant M91/30"
	
	realnames["bm_wp_mosin_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_standard_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_mosin_b_sniper"] = "Mosin Suppressor"
	realnames["bm_wp_mosin_b_sniper_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	--Black Stock
	realnames["bm_wp_mosin_body_conceal"] = "Black Paint"
	
	
	--[[ELMER FUDD]]
	realnames["bm_wp_huntsman_b_short"] = "Sawn-Off Short Barrel"
	realnames["bm_wp_huntsman_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_huntsman_s_short"] = "Sawn-Off Stock"
	
	--[[BARDODA SHOTGAT]]
	realnames["bm_w_b682"] = "Beretta 682"
	realnames["bm_wp_b682_b_short"] = "Sawn-Off Short Barrel"
	realnames["bm_wp_b682_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	realnames["bm_wp_b682_s_short"] = "Sawn-Off Stock"
	realnames["bm_wp_b682_s_ammopouch"] = "Ammo Pouch"
	
	--[[870]]
	realnames["bm_w_r870"] = "Remington Model 870" --"Remafdng"
	--Extended Mag
	realnames["bm_wp_r870_m_extended"] = "R870 Extended Tube Magazine (+2 Rounds)"
	--Zombie Hunter
    realnames["bm_wp_r870_fg_wood"] = "Wooden Pump"
    realnames["bm_wp_r870_fg_wood_desc"] = "Decreases ADS speed by 5%"
	--Short Enough **don't know
	realnames["bm_wp_r870_s_nostock"] = "No Stock"
	--Short Enough Tact. **don't know
	realnames["bm_wp_r870_s_nostock_big"] = "No Stock w/ Full Length Rail"
	--Govt. Stock **don't know
	realnames["bm_wp_r870_s_solid_big"] = "Fixed Stock w/ Full Length Rail"
	
	--[[CATS]]
	realnames["bm_w_saiga"] = "Concern Kalashnikov Saiga-12K"
	--Tact. Russian
	realnames["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System"
	realnames["bm_wp_saiga_fg_lowerrail_desc"] = "Decreases ADS speed by 5%"
	--Saiga 20 rounder
	realnames["bm_wp_saiga_m_20rnd"] = "20rnd MD Arms Saiga Drum"
	realnames["bm_wp_saiga_m_20rnd_desc"] = "Decreases reload speed by 15%"
	
	--[[AA12]]
	realnames["bm_w_aa12"] = "MPS Auto Assault-12"
	realnames["bm_wp_aa12_mag_drum"] = "20rnd AA-12 Drum"
	realnames["bm_wp_aa12_mag_drum_desc"] = "Decreases reload speed by 15%"
	realnames["bm_wp_aa12_barrel_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	realnames["bm_wp_aa12_barrel_silenced_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	
	--[[M1014]]
	realnames["bm_w_benelli"] = "Benelli M4"
	--Long Barrel
	realnames["bm_wp_ben_b_long"] = "Long Barrel w/ 7-Shot Tube"
	realnames["bm_wp_ben_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ben_b_short"] = "NFA Short Barrel w/ 4-Shot Tube"
	realnames["bm_wp_ben_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	--Collapsed Stock
	realnames["bm_wp_ben_s_collapsed"] = "M1014 Collapsed Stock"
	--Solid Stock
	realnames["bm_wp_ben_fg_standard"] = "M1014 Civilian Stock" --same deal with the FAL, possible conflict
	
	--[[KELTEC]]
	realnames["bm_w_ksg"] = "Kel-Tec KSG"
	--Long Barrel
	realnames["bm_wp_ksg_b_long"] = "Long Barrel w/ 2x 8-Shot Tubes"
	realnames["bm_wp_ksg_b_long_desc"] = "Increases range by 15%\nDecreases ADS speed by 5%"
	--Short Barrel
	realnames["bm_wp_ksg_b_short"] = "Patrol Barrel w/ 2x 6-Shot Tubes"
	realnames["bm_wp_ksg_b_short_desc"] = "Decreases range by 10%\nIncreases ADS speed by 5%"
	
	--[[WHY DON'T YOU TAKE A SEAT OVER THERE?]]
	realnames["bm_w_spas12"] = "Franchi SPAS-12"
	realnames["bm_wp_spas12_b_long"] = "SPAS-12 8-Shot Tube Magazine"
	realnames["bm_wp_spas12_b_long_desc"] = "Decreases ADS speed by 5%"
	
	--[[STREET SWEEPER]]
	realnames["bm_w_striker"] = "Cobray Street Sweeper" --Hard to name this really, it has the drum key of the Cobray SS, the ejection system of the Protecta (although the Cobray SS can also have this) and the drum advance lever of the original Striker
	realnames["bm_wp_striker_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	realnames["bm_wp_striker_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%" 
	
	--[[BABBY 870]]
	realnames["bm_w_serbu"] = "Short Barrelled Remington Model 870"
	--Extended Mag
	realnames["bm_wp_shorty_m_extended_short"] = "R870 Extended Tube Magazine (+1 Round)"
	--Standard
	realnames["bm_wp_r870_s_solid"] = "Fixed Stock"
	--Police Shorty
	realnames["bm_wp_serbu_s_solid_short"] = "Fixed Stock w/ Rail"
	--Tactical Shorty
	realnames["bm_wp_serbu_s_nostock_short"] = "No Stock w/ Rail"
	
	--[[LONGCAT]]
	realnames["bm_w_rpk"] = "Concern Kalashnikov RPK"
	--Tactical Forgrip
	realnames["bm_wp_rpk_fg_standard"] = "Polymer Handguard"
	realnames["bm_wp_rpk_fg_standard_desc"] = "Increases ADS speed by 5%"
	--Plastic Stock
	realnames["bm_wp_rpk_s_standard"] = "Polymer Stock"
	
	--[[KSP]]
	realnames["bm_w_m249"] = "FN Paratrooper M249"
	--Railed Foregrip
	realnames["bm_wp_m249_fg_mk46"] = "MK.46 Handguard"
	realnames["bm_wp_m249_fg_mk46_desc"] = "Decreases ADS speed by 5%"
	--Solid Stock
	realnames["bm_wp_m249_s_solid"] = "M249 Solid Stock"
	
	--[[RELATED TO RAIFU]]
	realnames["bm_w_hk21"] = "Heckler & Koch HK21" --"Related to mai raifu"
	--Short Foregrip
	realnames["bm_wp_hk21_fg_short"] = "HK21 Short Handguard"
	realnames["bm_wp_hk21_fg_short_desc"] = "Increases ADS speed by 5%"
	realnames["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip"
	realnames["bm_wp_hk21_g_ergo_desc"] = "Increases ADS speed by 5%"
	
	--[[KERBEROS]]
	realnames["bm_w_mg42"] = "Mauser Maschinengewehr 42"
	--Light Barrel
	realnames["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel"
	realnames["bm_wp_mg42_b_mg34_desc"] = "Increases ADS speed by 5%\nDecreases ROF to 900 RPM"
	--Heat Sink (Star Wars)
	realnames["bm_wp_mg42_b_vg38"] = "DLT-19 Barrel"
	realnames["bm_wp_mg42_b_vg38_desc"] = "Internally suppressed barrel"
	
	--[[GORDON]]
	realnames["bm_w_usp"] = "Heckler & Koch USP Tactical"
	realnames["bm_w_x_usp"] = "Akimbo H&K USP Tacticals"
	--Ventilated .45 **don't know
	--realnames["bm_wp_usp_co_comp_1"] = "Ventilated .45 Compensator" --I question the existence of this compensator
	--Velocity .45
	realnames["bm_wp_usp_co_comp_2"] = "SJC Compensator .45" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_pis_usp_m_extended"] = "20rnd USP Magazine"
	realnames["bm_wp_pis_usp_m_extended_desc"] = "Decreases reload speed by 5%"
	--Expert
	realnames["bm_wp_pis_usp_b_expert"] = "USP Expert Slide"
	--Match
	realnames["bm_wp_pis_usp_b_match"] = "USP Match Slide"
	realnames["bm_wp_pis_usp_b_match_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[GRENADE 22]]
	realnames["bm_w_g22c"] = "Glock 22C"
	realnames["bm_w_x_g22c"] = "Akimbo Glock 22Cs"
	--Long Slide
	realnames["bm_wp_g22c_b_long"] = "Glock 35 Compensated Slide"
	realnames["bm_wp_g22c_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[GRENADE 17]]
	realnames["bm_w_glock_17"] = "Glock 17"
	realnames["bm_w_x_g17"] = "Akimbo Glock 17s"
	
	--[[GRENADE 26]]
	realnames["bm_wp_pis_g26"] =  "Glock 26"
	realnames["bm_w_jowi"] =  "Akimbo Glock 26s"
	realnames["bm_wp_g26_body_salient"] =  "Stipled Tan Frame"
	realnames["bm_wp_g26_b_custom"] =  "Brushed Metal Frame"
	realnames["bm_wp_g26_m_custom"] =  "G26 Stipled Tan Magazine"
	realnames["bm_wp_g26_m_custom_desc"] =  "Increases reload speed by 15%"
	
	--[[FAWHTY FAHVE]]
	realnames["bm_w_colt_1911"] = "Springfield Operator 1911" 
	realnames["bm_w_x_1911"] = "Akimbo Springfield Operator 1911s" 
	--Aggressor
	realnames["bm_wp_1911_co_2"] = "TCII Compensator" --Not 100% but seems to be based off of it
	--Punisher
	realnames["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster" --Not 100% but seems to be based off of it
	--Ergo Grip
	realnames["bm_wp_1911_g_ergo_desc"] = "Increases ADS speed by 5%" 
	--Long
	realnames["bm_wp_1911_b_long"] = "Compensated Long Barrel & Slide" 
	realnames["bm_wp_1911_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	--Vented
	realnames["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide"
	realnames["bm_wp_1911_m_extended"] = "12rnd 1911 Magazine"
	realnames["bm_wp_1911_m_extended_desc"] = "Decreases reload speed by 5%"
	
	--[[BARDODA]]
	realnames["bm_w_b92fs"] = "Beretta 92FS"
	realnames["bm_w_x_b92fs"] = "Akimbo Beretta 92FSs"
	--Professional
	realnames["bm_wp_beretta_co_co1"] = "SGS Compensator" --Original name was a reference to the movie "The Professional"
	--Competitor
	realnames["bm_wp_beretta_co_co2"] = "Competition Compensator" --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models were based off of airsoft counterparts
	--Extended Mag
	realnames["bm_wp_beretta_m_extended"] = "30rnd 92FS Magazine"
	realnames["bm_wp_beretta_m_extended_desc"] = "Decreases reload speed by 5%"
	--Elite Slide
	realnames["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide"
	
	--[[HUEHUEHUEHUE]]
	realnames["bm_w_raging_bull"] = "Taurus Raging Bull"
	--Mount
	realnames["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount"
	--Aggressor
	realnames["bm_wp_rage_b_comp1"] = "S&W V-Compensator"
	--Pocket
	realnames["bm_wp_rage_b_short"] = "Snub Nose Short Barrel"
	realnames["bm_wp_rage_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%" 
	--Ventilated
	realnames["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator"
	realnames["bm_wp_rage_b_comp2_desc"] = "Vents muzzle flash to the sides"
	--Overcompensating
	realnames["bm_wp_rage_b_long"] = "Long Barrel"
	realnames["bm_wp_rage_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[HUEHUEHUEHUE BUT IT'S A SHOTGUN]]
	realnames["bm_w_judge"] = "Taurus Judge"
	
	--[[GRENADE 18]]
	realnames["bm_w_glock_18c"] =  "Glock 18C"
	--Ventilated **don't know
	--realnames["bm_wp_g18c_co_1"] = "Ventilated Compensator" --I question the existence of this compensator
	--Velocity
	realnames["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm"
	
	--[[DEAGLE]]
	realnames["bm_w_deagle"] = "IMI Desert Eagle Mark XIX" --"IS THAT A M16?"
	realnames["bm_w_x_deagle"] = "Akimbo IMI Desert Eagles"
	--Mount
	realnames["bm_wp_pis_deagle_extra"] = "Desert Eagle Scope Mount"
	--La Femme
	realnames["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake" --Original name was a reference to a 1990s film only for the gun's appearance in it, otherwise this is based on a real attachment
	--Overkill
	realnames["bm_wp_deagle_co_long"] = "Custom Barrel Weight" --Attachment is a reference to the Boondock Saints
	realnames["bm_wp_deagle_co_long_desc"] = "Decreases ADS speed by 5%" 
	--Extended Mag
	realnames["bm_wp_deagle_m_extended"] = "10rnd Desert Eagle Magazine" --Given the length of the mag and considering the .50 AE variant is single stack only, this is the only choice. Not that it matters that there's more ammo than what's stated *cough* 1911 12rnd Mag *cough*
	--Long Barrel
	realnames["bm_wp_deagle_b_long"] = "10\" Long Barrel"
	realnames["bm_wp_deagle_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	
	--[[JAMES BOND]]
	realnames["bm_w_ppk"] = "Walther PPK"
	--Laser Grip
	realnames["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip"
	--Long Side
	realnames["bm_wp_pis_ppk_b_long"] = "PPKS Slide"
	
	--[[40 SW IS A SHIT ROUND]]
	realnames["bm_w_p226"] = "Sig Sauer P226R"
	--Ventilated .40 **don't know
	--realnames["bm_wp_p226_co_comp_1"] = "Ventilated .40 Compensator" --I question the existence of this compensator
	--Velocity .40
	realnames["bm_wp_p226_co_comp_2"] = "SJC Compensator .40" --Technically only for the G17 but "Overkill logic" so yeah
	--Extended Mag
	realnames["bm_wp_p226_m_extended"] = "22rnd P226 Magazine" --Not too sure if this exists, just basing it off of the fact the "22" is plastered all over the damn thing
	realnames["bm_wp_p226_m_extended_desc"] = "Decreases reload speed by 5%"
	--Two-Tone
	realnames["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide"
	--Long Slide
	realnames["bm_wp_p226_b_long"] = "Brushed Metal Long Slide"
	realnames["bm_wp_p226_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[LEO]]
	realnames["bm_w_hs2000"] = "Springfield Armory XD(M)-40" --Fuck the texture labels, it's a XD(M)
	--Extended Mag
	realnames["bm_wp_hs2000_m_extended"] = "22rnd XD(M)-40 Magazine"
	realnames["bm_wp_hs2000_m_extended_desc"] = "Decreases reload speed by 5%"
	--Custom Slide
	realnames["bm_wp_hs2000_sl_custom"] = "Compensated Slide"
	realnames["bm_wp_hs2000_sl_custom_desc"] = "Increases ADS speed by 5%" 
	--Long Slide
	realnames["bm_wp_hs2000_sl_long"] = "Custom Slide"
	
	--[[RED 9]]
	realnames["bm_w_c96"] = "Mauser C96"
	--Long Barrel
	realnames["bm_wp_c96_b_long"] = "Carbine Barrel"
	realnames["bm_wp_c96_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	--Han Solo
	realnames["bm_wp_c96_nozzle"] = "DL-44 Muzzle"
	--Scope
	realnames["bm_wp_c96_sight"] = "Schmidt & Bender 1-8x24 PM Short Dot"
	realnames["bm_wp_c96_sight_desc"] = "High power scope \nDecreases ADS speed by 7.5%"
	--20rnd Mag
	realnames["bm_wp_c96_m_extended"] = "20rnd C96 Magazine"

	--[[EVENFASTERRUNONSENTENCES]]
	realnames["bm_w_cobray"] = "Cobray M11/9"
	realnames["bm_wp_cobray_ns_barrelext"] = "MAC Barrel Extension"
	realnames["bm_wp_cobray_ns_barrelext_desc"] = "Decreases ADS speed by 10%"
	realnames["bm_wp_cobray_ns_silencer"] = "SIONICS Suppressor"	
	realnames["bm_wp_cobray_ns_silencer_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"	
	realnames["bm_wp_cobray_body_upper_jacket_desc"] = "Decreases ROF to 850 RPM"	
	
	--[[RUNONSENTENCES]]
	realnames["bm_w_mac10"] = "Ingram M10"
	--Extended Mag
	realnames["bm_wp_mac10_m_extended"] = "30rnd M10 Magazine"
	realnames["bm_wp_mac10_m_extended_desc"] = "Decreases reload speed by 5%"
	--Railed Handguard
	realnames["bm_wp_mac10_body_ris"] = "MAC Rail System" --I'm getting nothing but airsoft results so generic name
	realnames["bm_wp_mac10_body_ris_desc"] = "Decreases ADS speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock"	
	
	--[[THOMPSON SENSEI]]
	realnames["bm_w_m1928"] = "Auto-Ordnance M1928"
	--Short Barrel
	realnames["bm_wp_m1928_b_short"] = "Short Barrel"	
	realnames["bm_wp_m1928_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_m1928_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	--Dis. Foregrip
	realnames["bm_wp_m1928_fg_discrete"] = "Synthetic Foregrip"	--for once it's actually a foregrip
	realnames["bm_wp_m1928_fg_discrete_desc"] = "Increases ADS speed by 5%"	--for once it's actually a foregrip
	--Dis. Pistol Grip
	realnames["bm_wp_m1928_g_discrete"] = "Synthetic Pistol Grip"	
	realnames["bm_wp_m1928_g_discrete_desc"] = "Increases ADS speed by 5%"	
	--Dis. Stock
	realnames["bm_wp_m1928_s_discrete"] = "Synthetic Stock"
	
	
	--[[MAI RAIFU'S LITTLE SISTER AND STUDENT COUNCIL PRESIDENT OF THE ELEMETARY SCHOOL]]
	realnames["bm_w_mp5"] = "Heckler & Koch MP5A4" --"Empi"
	--Sehr Kurze
	realnames["bm_wp_mp5_fg_m5k"] = "MP5k Railed Handguard"
	realnames["bm_wp_mp5_fg_m5k_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5% \nIncreases ROF to 900 RPM"
	--Polizei Tactical
	realnames["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard"
	--Ninja
	realnames["bm_wp_mp5_fg_mp5sd"] = "MP5SD Handguard"
	realnames["bm_wp_mp5_fg_mp5sd_desc"] = "Internally suppressed barrel \nDecreases ROF to 600 RPM"
	--Adjustable
	realnames["bm_wp_mp5_s_adjust"] = "Retractable Stock"
	--Bare Essentials
	realnames["bm_wp_mp5_s_ring"] = "No Stock" --"No Pantsu"
	--MP5 Drum
	realnames["bm_wp_mp5_m_drum"] = "110rnd GSG-5 .22lr Drum"
	realnames["bm_wp_mp5_m_drum_desc"] = ".22lr conversion \nDecreases reload speed by 15%"

	--[[SLING STOCKS ARE 2LEWD]]
	realnames["bm_w_mp9"] = "Brugger & Thomet TP9"
	--Extended Mag
	realnames["bm_wp_mp9_m_extended"] = "30rnd MP9 Magazine"
	realnames["bm_wp_mp9_m_extended_desc"] = "Decreases reload speed by 5%"
	--Skeletal Stock
	realnames["bm_wp_mp9_s_skel"] = "Steyr TMP Fixed Stock"
	
	--[[IT STINGS]]
	realnames["bm_w_scorpion"] = "CZ Skorpion vz. 61"
	
	realnames["bm_wp_scorpion_m_extended"] = "Skorpion Dual Magazines"
	realnames["bm_wp_scorpion_m_extended_desc"] = "Increases reload speed by 25%"
	
	realnames["bm_wp_scorpion_b_supperessed"] = "Skorpion Suppressor"
	realnames["bm_wp_scorpion_b_supperessed_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--[[NOT THE STUDENT COUNCIL PRESIDENT (get FUCKED)]]
	realnames["bm_w_uzi"] = "IMI Uzi"
	
	realnames["bm_wp_uzi_s_solid"] = "Wooden Stock"
	
	realnames["bm_wp_uzi_fg_rail"] = "FAB Defence Uzi Tri-Rail System"
	realnames["bm_wp_uzi_fg_rail_desc"] = "Increases ADS speed by 5%"
	
	realnames["bm_wp_uzi_b_supperessed"] = "IMI Two-Stage Suppressor" --It's IMI made but it was never imported. No idea what the model name is.
	realnames["bm_wp_uzi_b_supperessed_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--[[S-COOL SHOOTINGS]]
	realnames["bm_w_tec9"] = "Intratec TEC-9"
	
	realnames["bm_wp_tec9_b_standard"] = "AB-10 Barrel"
	realnames["bm_wp_tec9_b_standard_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_ns_ext"] = "TEC-9 Barrel Extension"
	realnames["bm_wp_tec9_ns_ext_desc"] = "Decreases ADS speed by 5%"
	
	realnames["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock"
	
	realnames["bm_wp_tec9_m_extended"] = "50rnd TEC-9 Magazine"
	realnames["bm_wp_tec9_m_extended_desc"] = "Decreases reload speed by 10%"
	
	--[[NOT A STEN]]
	realnames["bm_w_sterling"] = "Sterling L2A1"
	--Supp. Barrel
	realnames["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel"
	realnames["bm_wp_sterling_b_suppressed_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	--Heat Sink Barrel
	realnames["bm_wp_sterling_b_e11"] = "E-11 Barrel"
	realnames["bm_wp_sterling_b_e11_desc"] = "Internally suppressed barrel"
	
	realnames["bm_wp_sterling_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_sterling_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%"
	--10rnd Mag
	realnames["bm_wp_sterling_m_short"] = "10rnd L2A1 Magazine"
	realnames["bm_wp_sterling_m_short_desc"] = "Increases reload speed by 15%"
	--34rnd Mag
	realnames["bm_wp_sterling_m_long"] = "34rnd L2A1 Magazine"
	realnames["bm_wp_sterling_m_long_desc"] = "Decreases reload speed by 10%"

	--[[BABBY AR]]
	realnames["bm_w_olympic"] = "Olympic Arms K23B Tactical"
	--Railed Handguard
	realnames["bm_wp_olympic_fg_railed"] = "KAC Free Float Handguard" --a super short version at that, shares the delta ring so I'm assuming this is what it's based off of
	--Shorter Than Short
	realnames["bm_wp_olympic_s_short"] = "Buffer Tube Stock" 
	realnames["bm_wp_m4_uupg_b_medium_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[BABBY SLAVSHIT]]
	realnames["bm_w_akmsu"] = "Soviet Union AKMSU"
	--Moscow Special
	realnames["bm_wp_akmsu_fg_rail"] = "Samson K-Rail" --Seems to be loosely based off of the Samson K-Rail, it's the only thing that looked remotely like this
	realnames["bm_wp_akmsu_fg_rail_desc"] = "Decreases ADS speed by 5%"
	
	--[[OVERPRICED 22LR]]
	realnames["bm_w_p90"] = "FN P90 TR"
	--Long Barrel
	realnames["bm_wp_p90_b_long"] = "PS90 Barrel"
	realnames["bm_wp_p90_b_long_desc"] = "Increases range by 15% \nDecreases ADS speed by 5%" 
	
	--[[LOL SWEDS]]
	realnames["bm_w_m45"] = "Carl Gustaf Kpist M/45"
	--Extended Mag
	realnames["bm_wp_smg_m45_m_extended"] = "50rnd M/45 Magazine"
	realnames["bm_wp_smg_m45_m_extended_desc"] = "Decreases reload speed by 10%" 
	
	--[[YOU SUCK AND WE HATE YOU]]
	realnames["bm_w_mp7"] = "Heckler & Koch MP7A2"
	--Airsoft Supressor
	realnames["bm_wp_mp7_b_suppressed"] = "B&T MP7 Rotex-II Suppressor"	
	realnames["bm_wp_mp7_b_suppressed_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"	
	--Extended Mag
	realnames["bm_wp_mp7_m_extended"] = "MP7 40rnd Magazine"
	realnames["bm_wp_mp7_m_extended_desc"] = "Decreases reload speed by 10%"
	--Extended Stock
	realnames["bm_wp_mp7_s_long"] = "Extended Stock"
	
	--[[DEMOMAN]]
	realnames["bm_w_gre_m79"] = "Springfield Armory M79"
	
	--[[NADE SPAM]]
	realnames["bm_w_m32"] = "Milkor Multiple Grenade Launcher"
	
	
	--[[WEAPON MODS]]
	
	--Ported
	realnames["bm_wp_ns_battle"] = "Battlecomp 2.0 Compensator"
	--MP5 10mm Magazine
	realnames["bm_wp_mp5_m_straight"] = "30rnd MP5/10 10mm Magazine"
	realnames["bm_wp_mp5_m_straight_desc"] = "10mm Auto conversion \nDecreases reload speed by 5%"
	--AK5 CQB
	realnames["bm_wp_ak5_b_short"] = "Short Barrel" 
	realnames["bm_wp_ak5_b_short_desc"] = "Decreases range by 10% \nIncreases ADS speed by 5%" 
	--AUG Raptor
	realnames["bm_wp_aug_body_f90"] = "Thales F90 Body Kit"
	realnames["bm_wp_aug_body_f90_desc"] = "Increases ROF to 850 RPM"
	--SALVO
	realnames["bm_wp_upg_ns_sho_salvo_large"] = "Silencerco Salvo 12 Suppressor"
	realnames["bm_wp_upg_ns_sho_salvo_large_desc"] = "Decreases range by 20% \nDecreases ADS speed by 10%"
	--MP9 Suppressor
	realnames["bm_wp_mp9_b_suppressed"] = "B&T MP9 QD Suppressor"
	realnames["bm_wp_mp9_b_suppressed_desc"] = "Decreases range by 20% \nDecreases ADS speed by 10%"
	--Filter
	realnames["bm_wp_upg_ns_ass_filter"] = "Filter Suppressor"
	realnames["bm_wp_upg_ns_ass_filter_dsc"] = "Decreases range by 20% \nDecreases ADS speed by 10%"
	--M14 Scope Mount
	realnames["bm_wp_upg_o_m14_scopemount"] = "Sun Optics USA M14/M1A Scope Mount"
	--LED Combo
	realnames["bm_wp_upg_fl_ass_utg"] = "UTG P38 LED Laser Combo"
	--M3X
	realnames["bm_wp_upg_fl_pis_m3x"] = "Insight Technology M3X"
	--P90 Mall
	realnames["bm_wp_p90_b_ninja_desc"] = "Internally suppressed barrel \nDecreases ADS speed by 10%"
	--P90 Civ
	realnames["bm_wp_p90_b_civilian"] = "Moerse Lekker Barrel Shroud"
	realnames["bm_wp_p90_b_civilian_desc"] = "Increases range by 15% \nDecreases ADS speed by 7.5%"
	
	
	
	--AK Crab Rail
	realnames["bm_wp_upg_ak_fg_krebs"] = "Krebs UFM Keymod System Handguard"
	--AK Keymod Rail
	realnames["bm_wp_upg_ak_fg_trax"] = "Strike Industries TRAX Handguard"
	--AK Aluminum Grip
	realnames["bm_wp_upg_ak_g_rk3"] = "ZenitCo PK-3 Pistol Grip"
	--AK Aluminum Foregrip
	realnames["bm_wp_upg_ak_fg_zenit"] = "ZenitCo Handguard"
	--Scope Mount
	realnames["bm_wp_upg_o_ak_scopemount"] = "K-VAR KV-04S Optic Mount"
	--Low Drag Magazine
	realnames["bm_wp_upg_ak_m_uspalm"] = "30rnd US PALM AK30 Magazine"
	realnames["bm_wp_upg_ak_m_uspalm_desc"] = "Increases reload speed by 5%"
	--PBS Suppressor
	realnames["bm_wp_upg_ns_ass_pbs1"] = "PBS-1 Suppressor"
	realnames["bm_wp_upg_ns_ass_pbs1_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 10%"
	--DMR Kit
	realnames["bm_wp_upg_ass_ak_b_zastava"] = "Zastava M76 Barrel"
	realnames["bm_wp_upg_ass_ak_b_zastava_desc"] = "Increases range by 30% \nDecreases ADS speed by 10%"
	--Modern Barrel
	realnames["bm_wp_upg_ak_b_ak105"] = "AK-105 Barrel"
	realnames["bm_wp_upg_ak_b_ak105_desc"] = "Decreases range by 10%"
	
	--Exotique Receiver
	realnames["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver"
	realnames["bm_wp_m4_upper_reciever_edge_desc"] = "Increases ROF by 2%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "2A-Arm BALIOS Upper Receiver" --????
	realnames["bm_wp_upg_ass_m4_upper_reciever_ballos_desc"] = "Decreases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 Upper Receiver"
	realnames["bm_wp_upg_ass_m4_upper_reciever_core_desc"] = "Increases ROF by 5%"
	
	realnames["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 Lower Receiver"
	realnames["bm_wp_upg_ass_m4_lower_reciever_core_desc"] = "Increases reload speed by 5%"
	
	realnames["bm_wp_upg_m4_s_ubr"] = "Magpul UBR Stock"
	
	realnames["bm_wp_upg_m4_m_l5"] = "30rnd Lancer Systems L5 AW Magazine"
	
	realnames["bm_wp_upg_smg_olympic_fg_lr300"] = "Short LR300 Handguard"
	
	realnames["bm_wp_upg_ass_m16_fg_stag"] = "Stag Arms Model 8T Handguard"
	
	realnames["bm_wp_upg_ass_m4_fg_moe"] = "Magpul MOE SL Handguard"
	realnames["bm_wp_upg_ass_m4_fg_moe_desc"] = "Increases ADS speed by 5%"
	
	realnames["wpn_fps_upg_ass_m4_fg_lvoa"] = "War Sport LVOA Handguard"
	
	realnames["bm_wp_upg_ass_m4_b_beowulf"] = "Beowulf Barrel"
	realnames["bm_wp_upg_ass_m4_b_beowulf_desc"] = "Increases range by 30%\nDecreases ADS speed by 10%"
	
	--Descriptions are gone (for now) so I figured I'd change their names to reflect that they're locking the firemode
	--Single Fire
	realnames["bm_wp_upg_i_singlefire"] = "Single Fire Lock"
	realnames["bm_wp_upg_i_singlefire_desc"] = "Locks fire mode to semi-auto and reduces ROF by 10%"
	--Auto Fire
	realnames["bm_wp_upg_i_autofire"] = "Automatic Fire Lock"
	realnames["bm_wp_upg_i_autofire_desc"] = "Locks fire mode to full-auto with a 15% ROF boost. \nSets the C96's ROF to 1000 RPM. \nSets the TEC-9's ROF to 800 RPM."
	
	--Pistol Light
	realnames["bm_wp_upg_fl_pis_tlr1"] = "Streamlight TLR1"
	--Pistol Laser
	realnames["bm_wp_upg_fl_pis_laser"] = "Aim Sports LH002 Laser Sight" --it seems to be more based on the RAP4 Paintball Pistol Laser sight but it's a lot less cool calling it that since paintball so the next closest thing will suffice	
	--Pistol Laser
	realnames["bm_wp_upg_fl_x400v"] = "SureFire X400V-IRC"
	realnames["bm_wp_upg_fl_crimson"] = "Crimson Trace CMR Laser Sight"
	
	realnames["bm_wp_pis_g_laser"] = "Crimson Trace Glock Laser Grip"
	realnames["bm_wp_pis_g_beavertail"] = "Beavertail Grip Extension"
	
	--Assault Light
	realnames["bm_wp_upg_fl_ass_smg_sho_surefire"] = "Surefire Scout Light" --based off of but doesnt seem to take from a specific model
	--Compact Laser
	realnames["bm_wp_upg_fl_ass_laser"] = "Offset Laser Mount & Sight"
	--Tactical Laser
	realnames["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "Insight Technology AN/PEQ-5"
	--Military Laser 
	realnames["bm_wp_upg_fl_ass_peq15"] = "Insight Technology AN/PEQ-15"

	--Shark Teeth
	realnames["bm_wp_upg_ns_shot_shark"] = "Tromix Shark Breaching Brake"
	--King's Crown
	realnames["bm_wp_upg_shot_ns_king"] = "King Armory KA-1212 Breaching Brake"
	
	--Pistol Flash Hider
	realnames["bm_wp_upg_pis_ns_flash_desc"] = "Hides muzzle flash"

	--Low Profile Suppressor
	realnames["bm_wp_upg_ns_ass_smg_small"] = "GemTech HALO Suppressor" --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
	realnames["bm_wp_upg_ns_ass_smg_small_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10%"
	--Medium Suppressor
	realnames["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor" --Thanks Overkill for being vauge as fuck, I'm surprised I even found this
	realnames["bm_wp_upg_ns_ass_smg_medium_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	--Bigger the Better **Don't know
	realnames["bm_wp_upg_ns_ass_smg_large"] = "Large Suppressor"
	realnames["bm_wp_upg_ns_ass_smg_large_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--Size Doesn't Matter 
	realnames["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor"	
	realnames["bm_wp_upg_ns_pis_small_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10%"	
	--Standard Issue
	realnames["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor" --Close enough... it's sectioned similarly enough for me to just name it this
	realnames["bm_wp_upg_ns_pis_medium_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	--Monolith 
	realnames["bm_wp_upg_ns_pis_large"] = "Silencerco Osprey Suppressor"
	realnames["bm_wp_upg_ns_pis_large_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor"
	realnames["bm_wp_upg_ns_medium_gem_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 5%"
	
	realnames["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor"
	realnames["bm_wp_upg_ns_large_kac_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	realnames["bm_wp_upg_ns_pis_medium_slim_desc"] = "Decreases range by 20% \nDecreases minimum damage by 10% \nDecreases ADS speed by 7.5%"
	
	--Shotgun Suppressor
	realnames["bm_wp_upg_ns_shot_thick"] = "Shotgun Suppressor"
	realnames["bm_wp_upg_ns_shot_thick_desc"] = "Decreases range by 20% \nDecreases ADS speed by 10%"
	
	realnames["bm_wp_upg_ns_meatgrinder"] = "Standoff Muzzle Device"
	
	--Stubby
	realnames["bm_wp_upg_ns_ass_smg_stubby"] = "Stinger Flash Hider" --Based on the VFC Stinger's pseudo flash-hider
	realnames["bm_wp_upg_ns_ass_smg_stubby_desc"] = "Hides muzzle flash"
	--Tank **Don't know, could quite literally be based off of a tank compensator
	realnames["bm_wp_upg_ns_ass_smg_tank"] = "Tank Compensator"
	realnames["bm_wp_upg_ns_ass_smg_tank_desc"] = "Vents muzzle flash to the sides"
	--Firebreather
	realnames["bm_wp_upg_ns_ass_smg_firepig"] = "Noveske KX3 Compensator"
	realnames["bm_wp_upg_ns_ass_smg_firepig_desc"] = "Increases muzzle flash"
	
	--Competitors
	realnames["bm_wp_upg_ass_ns_jprifles"] = "JPE Bennie Cooley Muzzle Brake"
	--Funnel of Fun
	realnames["bm_wp_upg_ass_ns_linear"] = "KIES Blast Master Linear Compensator"
	realnames["bm_wp_upg_ass_ns_linear_desc"] = "Increases muzzle flash"
	--Tactical
	realnames["bm_wp_upg_ass_ns_surefire"] = "Surefire MBK Muzzle Brake"
	
	--Muldon
	realnames["bm_wp_r870_s_folding"] = "R870 Top Folding Stock"
	
	--Standard
	realnames["bm_wp_m4_s_standard"] = "Bushmaster LE Stock"
	--Tactical
	realnames["bm_wp_m4_s_pts"] = "Magpul PTS Stock"
	--Folding
	realnames["bm_wp_m4_uupg_s_fold"] = "LR300 Folding Stock"
	--Wide
	realnames["bm_wp_upg_m4_s_crane"] = "NSWC Crane Stock"
	--War-Torn
	realnames["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/ Cheek Pad" --looking at it now, the rudimentary cheek pad is generally useless since you hold the gun right handed (so you make a cheekweld with the left side of the gun) and the pad is mostly on the right. GJ Overkill.
	
	--Folding Stock (underfolder)
	realnames["bm_wp_ak_s_folding"] = "Folding AK Stock"
	--Folding Stock (sidefolder)
	realnames["bm_wp_ak_s_skfoldable"] = "Folding AK Stock"
	--Wooden Sniper Stock
	realnames["bm_wp_ak_s_psl"] = "PSL Thumbhole Stock"
	
	--Ergo (Glocks)
	realnames["bm_wp_g18c_g_ergo"] = "Hogue Handall Grip Sleeve"
	realnames["bm_wp_g18c_g_ergo_desc"] = "Increases ADS speed by 5%"
	--Ergo
	realnames["bm_wp_m4_g_ergo"] = "Command Arms UPG16 Pistol Grip"
	realnames["bm_wp_m4_g_ergo_desc"] = "Increases ADS speed by 5%"
	--Pro
	realnames["bm_wp_m4_g_sniper"] = "PSG Style Pistol Grip" --there are a bunch of grips styled after the PSG-1's grip but the one in PD2 doesn't seem to take from any specific real-life model
	--Rubber
	realnames["bm_wp_upg_m4_g_hgrip"] = "Hogue OverMolded AR Pistol Grip"
	--Straight
	realnames["bm_wp_upg_m4_g_mgrip"] = "Magpul MOE-K Pistol Grip"
	
	--Rubber
	realnames["bm_wp_upg_ak_g_hgrip"] = "Hogue OverMolded AK Pistol Grip"
	--Plastic
	realnames["bm_wp_upg_ak_g_pgrip"] = "US PALM Enhanced Pistol Grip"
	realnames["bm_wp_upg_ak_g_pgrip_desc"] = "Increases ADS speed by 5%"
	
	--Wood Rail
	realnames["bm_wp_ak_fg_combo2"] = "Ultimak AK Optic Mount"
	--Tact. Russian
	realnames["bm_wp_ak_fg_combo3"] = "Ultimak AK Modular Rail Forend System"
	--Battleproven
	realnames["bm_wp_upg_ak_fg_tapco"] = "Tapco Intrafuse Handguard" --This is actually for the Saiga. lolOverkill
	--Lightweight
	realnames["bm_wp_upg_fg_midwest"] = "Midwest Industries Quad Rail"
	
	--Slav. Dragon
	realnames["bm_wp_upg_ak_b_draco"] = "Draco Pistol Barrel"
	realnames["bm_wp_upg_ak_b_draco_desc"] = "Decreases range by 10% \nIncreases ADS speed by 10%"
	
	--Extended Mag (Glocks)
	realnames["bm_wp_g18c_m_mag_33rnd"] = "33/22rnd Glock Magazine (9mm/.40S&W)"	
	--Vintage Mag
	realnames["bm_wp_m4_m_straight"] = "20rnd STANAG Magazine" --Hesitant to call them this since they're so off-model and resemble the M4A1 mags used in MW3
	realnames["bm_wp_m4_m_straight_desc"] = "Increases reload speed by 10%"
	--Milspec Mag
	realnames["bm_wp_m4_uupg_m_std"] = "30rnd STANAG Magazine"	
	--Tactical Mag
	realnames["bm_wp_m4_m_pmag"] = "31rnd Magpul PMAG Magazine" --you can actually shove 31 rounds into one of the PMAG models and still have it load
	realnames["bm_wp_m4_m_pmag_desc"] = "Increases reload speed by 5%"
	--Expert Mag
	realnames["bm_wp_l85a2_m_emag"] = "30rnd Magpul EMAG Magazine"
	realnames["bm_wp_l85a2_m_emag_desc"] = "Decreases reload speed by 5%"
	--CAR Quad
	realnames["bm_wp_upg_m4_m_quad"] = "60rnd Surefire Magazine"
	realnames["bm_wp_upg_m4_m_quad_desc"] = "Decreases reload speed by 10%"
	--AK Quad
	realnames["bm_wp_upg_ak_m_quad"] = "60rnd Concern Kalashnikov Magazine"
	realnames["bm_wp_upg_ak_m_quad_desc"] = "Decreases reload speed by 10%"
	--Beta-C
	realnames["bm_wp_m4_m_drum"] = "100rnd Beta-C Dual Drum"
	realnames["bm_wp_m4_m_drum_desc"] = "Decreases reload speed by 15%"
	--AK Drum
	realnames["bm_wp_ak_m_drum"] = "75rnd AK Drum"
	realnames["bm_wp_ak_m_drum_desc"] = "Decreases reload speed by 15%"
	
	--Pistol Red Dot
	realnames["bm_wp_upg_o_rmr"] = "Trijicon RMR Red Dot"
	realnames["bm_wp_upg_o_rmr_desc"] = "Low power red dot sight"
	--Marksman Irons
	realnames["bm_wp_upg_o_marksmansight_rear_desc"] = "Custom iron sights"
	
	--Military Red Dot
	realnames["bm_wp_upg_o_aimpoint"] = "Aimpoint PRO Red Dot"
	realnames["bm_wp_upg_o_aimpoint_desc"] = "Encased red dot sight"
	--Holographic
	realnames["bm_wp_upg_o_eotech"] = "EOTech 553 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_desc"] = "Low power holographic sight"
	--Professional
	realnames["bm_wp_upg_o_t1micro"] = "Aimpoint Micro T-1 Red Dot"
	realnames["bm_wp_upg_o_t1micro_desc"] = "Low power red dot sight"
	--Surgeon
	realnames["bm_wp_upg_o_docter"] = "IRONDOT w/ Docter Sight II Plus Red Dot"
	realnames["bm_wp_upg_o_docter_desc"] = "Low power red dot sight"
	--ACOUGH
	realnames["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope"
	realnames["bm_wp_upg_o_acog_desc"] = "Medium range scope \nDecreases ADS speed by 5%"
	--Milspec
	realnames["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope"
	realnames["bm_wp_upg_o_specter_desc"] = "Medium range scope \nDecreases ADS speed by 5%"
	--See More
	realnames["bm_wp_upg_o_cmore"] = "C-More Railway Red Dot"
	realnames["bm_wp_upg_o_cmore_desc"] = "Low power red dot sight"
	--Combat
	realnames["bm_wp_upg_o_cs"] = "Aimpoint CS Red Dot"
	realnames["bm_wp_upg_o_cs_desc"] = "Encased red dot sight"
	--Compact Holo
	realnames["bm_wp_upg_o_eotech_xps"] = "EOTech EXPS3 Holographic Sight"
	realnames["bm_wp_upg_o_eotech_xps_desc"] = "Low power holographic sight"
	--Speculator
	realnames["bm_wp_upg_o_reflex"] = "Sightmark Sureshot Red Dot" --super generic so I just went with what COD4 based it off of
	realnames["bm_wp_upg_o_reflex_desc"] = "Low power red dot sight"
	--Trigonom
	realnames["bm_wp_upg_o_rx01"] = "Trijicon RX01 Red Dot"
	realnames["bm_wp_upg_o_rx01_desc"] = "Low power red dot sight"
	--Solar
	realnames["bm_wp_upg_o_rx30"] = "Trijicon RX30 Red Dot"	
	realnames["bm_wp_upg_o_rx30_desc"] = "Low power red dot sight"	
	--Theia
	realnames["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 Illum. Ret. w/BORS"
	realnames["bm_wp_upg_o_leupold_desc"] = "Ballistic scope that auto marks in stealth/specials \nDecreases ADS speed by 10%"
	--45 irons
	realnames["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights" --these are literally the worst things IRL, don't buy them for your gun if you have one and want angled sights to mount on it
	--Flip-Up (KSG sights)
	realnames["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights"
	realnames["bm_wp_upg_o_mbus_rear_desc"] = "Flip-up sights"
	realnames["dd_rear"] = "Daniel Defence Fixed Sight Combo"
	
	realnames["bm_wp_mosin_iron_sight"] = "Iron sights"
	realnames["bm_wp_mosin_iron_sight_desc"] = "Remove the scope and use iron sights"
	
	--Dragons Breath
	realnames["bm_wp_upg_a_dragons_breath"] = "Dragon's Breath Rounds"
	realnames["bm_wp_upg_a_dragons_breath_desc"] = "Magnesium pellets capable of setting targets on fire. Shoot a blast of 8 pellets, each with a 50% chance to set your target on fire within 30 meters \nThe reduced charge per shell lowers the ROF of non-pump/manual action shotguns by 10%"
	--AP Slug
	realnames["bm_wp_upg_a_slug"] = "Armor Piercing SABOT Slugs"
	realnames["bm_wp_upg_a_slug_desc"] = "A slug capable of going through most surfaces. Shoot a single, accurate slug with -50% max damage range and +300% range at a distance."
	--Birdshot (originally the free 000 Buck)
	realnames["bm_wp_upg_a_bird"] = "Birdshot"
	realnames["bm_wp_upg_a_bird_desc"] = "Shoot 50 tiny pellets (30 in the Judge) for greater pellet coverage. Not very good for killing...\nCAN CAUSE FPS DROPS ON LOW END SYSTEMS" 
	--000 Buck
	realnames["bm_wp_upg_a_custom"] = "000 Buck"
	realnames["bm_wp_upg_a_custom_desc"] = "Large pellets with greater stopping power. Shoot 6 pellets (4 in the Judge) with +20% max damage range, -30% range at a distance and greater spread." 
	--Flechette
	realnames["bm_wp_upg_a_piercing"] = "Flechette Rounds"
	realnames["bm_wp_upg_a_piercing_desc"] = "Darts capable of penetrating armour. Shoot 15 darts (10 in the Judge) with +50% range at a distance and tighter spread."
	--HE
	realnames["bm_wp_upg_a_explosive"] = "Fragmentation Rounds"
	realnames["bm_wp_upg_a_explosive_desc"] = "Fin stabilized rounds that explode on impact. Shoot explosives that can stun and/or kill targets in its blast radius. Deals a flat 100 damage."
	
	--URSA
	realnames["bm_melee_kabar"] = "USMC KA-BAR"
	realnames["bm_melee_kabar_desc"] = "The most famous fixed blade knife in the World, the KA-BAR. \n\nDesigned to serve US troops during World War II and is still doing its job, in the hands of robbers, years later.\n"
	--Krieger
	realnames["bm_melee_kampfmesser"] = "KM 2000"
	realnames["bm_melee_kampfmesser_desc"] = "The official combat knife of the German Bundeswehr Armed Forces. The new series KM2000 is manufactured to exacting ISO standards with substantially improved cutting edge capacity.\n"
	--Berger
	realnames["bm_melee_gerber"] = "Gerber DMF Folder"
	realnames["bm_melee_gerber_desc"] = "The manual opening DMF Folder brings the much sought after tactical innovations and technologies of the Automatic DMF to a large, ambidextrous-use knife. Textured G-10 handle gives the DMF Folder a sure grip and maintains a perfect weight balance.\n"
	
	--Tomahawk
	realnames["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk"
	realnames["bm_melee_tomahawk_desc"] = "When you're in a situation where time is of the essence, you can't waste time wondering if you have the right tool for the heist. No matter what's on the other side of that door or barrier, you want a tool with the same single-minded determination as the heister wielding it.\n"
	--Machete
	realnames["bm_melee_becker"] = "KA-BAR Becker Tac Tool"
	realnames["bm_melee_becker_desc"] = "A design collaboration between Ethan Becker of BK&T and John Benner of TDI, the Tac Tool smashes, bashes, prys, hammers and cuts. It is equally powerful at lifting stubborn hinge pins, prying open doors or windows, and hammering out display cases as it is efficient at cutting 550. cord.\n\n"
	--Baton
	realnames["bm_melee_baton"] = "ASP Friction Loc Baton"
	realnames["bm_melee_baton_desc"] = "The ASP Friction Loc Baton is the most tactically sophisticated impact weapon currently available to law enforcement. Tested by the most elite federal teams, the Friction Loc has proven itself virtually indestructible. \nAnd yet you have it. Ironic, isn't it?\n"	
	--Shovel
	realnames["bm_melee_shovel"] = "KLAS Shovel"
	realnames["bm_melee_shovel_desc"] = "The KLAS shovel can be used for a variety of recreational purposes. It can also be used as a weapon - sharpen the edges and you'll be cutting through flesh and bone. If you use it correctly, that is. \nWhich you don't.                                                        \n"
	
	--EMONE Toggle
	realnames["bm_melee_emone"] = "LODS OF EMONE"
	realnames["emone"] = "L-O-D-S OF E-M-O-N-E\nWhat's that spell?\nLOADSAMONEY!\n\nProb'ly.\n\nWOP IT OUT!\n"

	--TWD Bat toggle
	realnames["bm_melee_baseballbat"] = "\"Lucille\""
	realnames["bm_melee_baseballbat_desc"] = "A baseball bat that has been given the name of \"Lucille\". It's been said that Lucille was used to bash a man's skull in, teach some unruly folks a lesson.\n\nNow that you have it, perhaps you could do the same and teach those cops a thing or two.\n"
	
	--Bayonet
	realnames["bm_melee_bayonet"] = "AKM Type II Bayonet"	
	realnames["bm_melee_bayonet_desc"] = "A rugged bayonet, meant for mounting on the end of your AK and thrusting it into the bodies of your foes. \n\nDoing that makes sense though. You'll just use it like a regular knife, won't you?\n"	
	
	--Bullseye
	realnames["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet"	
	
	--X46
	realnames["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife"
	
	--Gunther
	realnames["bm_melee_dingdong"] = "Gerber Ding Dong Breaching Tool"
	
	--Cleaver
	realnames["bm_melee_cleaver"] = "Cleaver"
	
	--Machete
	realnames["bm_melee_machete"] = "Machete"
	
	realnames["bm_melee_fireaxe_desc"] = "This drill is on fire! This drill is on fire! It's working on fire! This drill is on fire!\n\nThis axe won't help you with that flaming drill though.\n"
	realnames["bm_melee_briefcase_desc"] = "Call it a blessing, but maybe it was for the best you lost the lock combination.\n\nNow you have an excuse to bash people over the head with it!\n"
	
	--Tanto
	realnames["bm_melee_kabar_tanto"] = "KA-BAR Tanto"
	
	--Chef
	realnames["bm_melee_chef"] = "Chef Knife"
	
	--Trench Knife
	realnames["bm_melee_fairbair"] = "Fairbairn-Sykes Fighting Knife"
	realnames["bm_melee_fairbair_desc"] = "The Fairbairn-Sykes fighting knife is a double-edged fighting knife resembling a dagger or poignard with a foil grip."
	
	realnames["bm_melee_swagger_desc"] = "Hello, heisters. Look at your knife, now back to this, now back at your knife, now back to this. \n\nSadly, your knife isn't as swag as this, but if you stopped using that pansy knife and started using this swagger stick, you could be swagging all over those cops.                                                                             \n"

	--Erica Hartmann
	realnames["bm_melee_model24"] = "Model 24 Stielhandgranate"
	realnames["bm_melee_model24_desc"] = "Why would anyone ever use a grenade as a melee weapon? \n\nI guess those that have tried and lived are really grenade-ful it didn't go off...\n"
	
	realnames["bm_armor_level_5"] = "Flak Jacket A Bigger Shit"
	realnames["bm_armor_level_6"] = "Combined Tactical Vest A Shit"
	
	
	realnames["bm_menu_custom"] = "Internal Mod"
	realnames["bm_menu_extra"] = "Rail"
	realnames["bm_menu_upper_reciever"] = "Upper Body Mod"
	realnames["bm_menu_lower_reciever"] = "Lower Body Mod"
	realnames["bm_menu_slide"] = "Barrel/Slide"
	realnames["bm_menu_grip"] = "Pistol Grip"
	realnames["bm_menu_barrel_ext"] = "Barrel Extension"
	realnames["bm_menu_foregrip"] = "Handguard"
	realnames["bm_menu_sight"] = "Optic"
	
	
	realnames["menu_anti_mat"] = "Anti Materiel Rifles"
	realnames["menu_pdw"] = "PDWs"
	realnames["menu_mach_pis"] = "Machine Pistols"
	realnames["menu_battle_rifle"] = "Battle Rifles"
	realnames["menu_carbine"] = "Carbines"
	realnames["menu_gpmg"] = "General Purpose Machine Guns"
	
	realnames["menu_lmg"] = "Light Machine Guns"
	realnames["menu_shotgun"] = "Shotguns"
	realnames["menu_pistol"] = "Handguns"
	realnames["menu_assault_rifle"] = "Assault Rifles"
	realnames["menu_snp"] = "Snipers"
	realnames["menu_smg"] = "Sub-Machine Guns"
	
	realnames["menu_jowi"] = "Wick"

    if realnames[string_id] then return realnames[string_id] end
    return LocalizationManager_text(self, string_id, macros)
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