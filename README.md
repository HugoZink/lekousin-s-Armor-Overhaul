ArmorOverhaul created by lekousin

This is the beta version of the mod. So you are more likely to see a bug or crash. If you encounter one, please report it. It's a beta for a reason.



<h4>What does it do ?</h4>

The mod is made to completely change how armor works by adding new mechanics as well as tweaking already exitent ones.

<h5>1. Progressive armor regeneration</h5>

If you didn't notice, when your bar starts filling up, all your armor is already regenerated. Now, armor regenerates over time, after the initial regen delay (3 seconds if no skill and not suppressed).
Each armor level requires more time to fully regenerate, the ICTV being the slowest armor to regen.
When suppressed while armor is regenerating, your armor will regen slower for some amount of time.

<h5>2. Bullet deflection</h5>

In a similar way to dodge, this system just nullifies bullets.
But the chances of deflecting bullets are not just be a simple value like dodge, it also depends on the damage of the bullet you're receiving. The more powerful the bullet, the less chances your armor has to deflect it.
This mechanic only works when your armor is up.

<h5>3. Health Damage Reduction</h5>

When your armor is down, you'll no longer be that crawling glass cannon deseperately seeking for cover. Sure, you'll still take damage, but the better your armor, the better the damage will be reduced.

<h5>4. Ammo bonus/malus</h5>

Some armors get an ammo pool bonus/malus. This is done for balancing purposes. Some armors will be too usefull if they had ammo bonus (think about an ICTV tank with 25% bonus ammo from the armor).
Currently, two armors affect ammo pool (Suit reduces it by 25%, Flak Jacket increases it by 35% and Lightweight Tactical Vest by 40%).

<h5>5. Explosive Damage Reduction</h5>

All armors (except suit) decrease damage you get when you're hit by an explosion.

<h5>6. Stat tweaking</h5>

When we play PAYDAY 2, we often see some armors being completely useless, or some completely OP, simply due to a bad stat tweaking. With this stat tweak, you may get some love back for some forgotten armors like the Flack Jacket.

<h5>7. Health bonus</h5>

Some armors buff/nerf your health, which is then factored by other skills.

<h5>8. Variable jump speed</h5>

The heavier your armor, the lowest you jump.

<h5>9. New armors</h5>

4 new armors have been introduced, each having a specialization (each one of them is in a different major skill tree). This meant that some skill trees needed some rework. ICTV has been demoted to Tier 3. 

<h5>10. Custom armor</h5>

An entirely new armor in which you can customize stats. By The Way, you are limited in the way you cannot max every stat, you need to make choices.

<h5>11. Bleeding</h5>

When you take health damage, you have a chance to start bleeding. The odds and bleed rate depend on health loss, with a maximum of 50% chance to bleed and a rate of 10 HP per second for a 100+ HP loss. The bleeding rate decreases when your armor is up. The debleeding rate varies accordingly to your armor and its current armor / max armor ratio. That being said, Thin suit can't stop bleeding, so you may lose all your health. Note that you cannot go into bleedout due to bleeding, and bleeding can be stopped also by using a medic bag.

<h5>12. Difficulty scaling stats</h5>

Some statistics, like armor, vary depending on the difficulty played, to ensure lower difficulties do not become a walk in the park.

<h5>13. Armor reduction on break</h5>

When your armor breaks, its maximum protection decreases by 1% of its base maximum value, with a minimum of 50% of its base max armor. It also grants you a 0.2% speed bonus each time it breaks, up to 10%.

<h5>14. Armor drainer</h5>

To compensate armor reduction on break, a new perk deck has been introduced. When you deal a headshot, you are granted some bonus max armor. It has a 3.5 seconds cooldwon. This bonus is lost when your armor breaks.

<h5>15. Mechanics explanations</h5>

In main menu a new sub menu appeared. It explains how the mechanics introduced by the mod work.



<h4>Credits to :</h4>
- hejoro for its localization text script
- v00d00, 90e, gir489 and 420MuNkEy for the Lua sources
- Hafatus for its Simple Menu implementation
- notwa for its menu hijacking



<h4>Recommended mods:</h4>
- DMCWO (a weapon overhaul mod): http://steamcommunity.com/groups/DMCWpnOverhaul



<h4>What to do ?</h4>

<h5>Non-BLT Hook users (HoxHUD or old Hook)</h5>
Just put the lib folder in PAYDAY 2 root folder

Note: if you already use DMCWO (or another mod touching to localizationmanager), put the content of the method (all the armortext[...] = ...) into the corresponding script (in realnames.lua for DMCWO e.g.) and rename the armortext accordingly. Even if ArmorOverhaul has a DMCWO support, it seems that DMCWO's localization method overrides ArmorOverhaul one, that's why you need to copy/paste.



<h4>Known bugs</h4>

- In skill trees, the Ace line of description tweaked skills is blue, even when not buyable.
- In preplanning, non-vanilla armors aren't properly rendered (nothing in loadout and the missing texture file in crew setup)
- Primary and Secondary weapon screen have reduced FPS



<h4>Changelog</h4>

<h5>v0.6b WIP</h5>

Not a detailed changelog cause too many things in too many files (and some changes are in many files).

- Added localization (only en and fr files are here for now; fr hasn't been translated yet)
- Revamped custom armor system, now a RPG-ish one (with helmet, chestplate, leggings...)
- Added a start of crew bonus (which would work only for LAO users). Currently not choosable, only more 10% deflect chance and 20% more health for other LAO users
- Fixed a huge memory consumption in blackmarket, which made the game crashing if staying for too long on it
- Reduced LBV, BV, HBV, FJ and CTV dodge by 5%
- Added percentage to percent stats in blackmarket
- Added Bleeding reduction stat in blackmarket
- Reintroduced original dodge and bullet deflection; entropy is still there but only use 10% of dodge and deflect chance
- Decreased ammo penalty on Two-piece suit and thin suit from -25% and -65% to -20% and -50%
- Rebalanced deflect chance for most armors
- Made the mod sysouts less hook dependant; now the same print call should work for both HoxHUD and BLT hook

<h5>v0.6b2 - Entropy</h5>

<h6>blackmarketgui.lua</h6>

- Raised dodge cap to 95
- Added Total Health stat in armor screen
	- Removed Added Health stat because obsolete

<h6>localizationmanager.lua</h6>

- Renamed some stats
	- "Ammo multiplier" to "Bonus ammo"
	- "Jump speed multiplier" to "Bonus jump speed"
	- Added missing p in "Maximum regen supressed"

<h6>upgradestweakdata.lua</h6>

- Increased dodge chance for most armors
	- Suit changed from 5 to 20
	- LBV from -5 to 10
	- BV from -20 to 5
	- HBV from -25 to -5
	- FJ from -30 to -20
	- CTV from -40 to -35
	- Lightweight Tactical Vest from -35 to -25
	- Thin Suit from 30 to 35

<h6>playerdamage.lua</h6>

- Changed function called on hit to check for "grace" at the start of it
	- This prevents anything damage-related to be proced while you're in "grace"
- Introduced entropy mechanic
	- A copy of Path of Exile's Evasion mechanic (explanation <a href="http://pathofexile.gamepedia.com/Evasion#Mechanics">here</a>)
		- Globally: when you are shot at, a number is increased by the chance you have to be hit (100 - dodge or 100 - deflect). If this value goes above 100 (or hits 100), the player is hit and the value is decreased by 100, otherwise, the bullet is dodged
	- This makes dodging and deflecting much more consistent (with 50 dodge, you'll be hit every 2 rounds)

<h5>v0.6b</h5>

<h6>Localization</h6>

- Added multi-language support
	- Currently only english available
	- Language changeable in ArmorOverhaul.lua
	- If selected language isn't available, it automatically switches to default language (english)
	
<h6>blackmarketgui.lua</h6>

- Seperated armor stats into different pages
	- You can switch to a different page via F1 and F2 (can be modified in ArmorOverhaul.lua, the two last lines)
- Reverted back to the original GUI form
	- This inherently fixed the spare skill points box overlapping item selection grid
	
<h6>HUDTeamate.lua</h6>

- Remove the flash in health bar when losing health
	- You can now see your health and armor when bleeding

<h6>menus.lua</h6>

- Added mechanics explanations
- Added custom armor menu
- Added all the custom armor logic

<h6>blackmarkettweakdata.lua</h6>

- Added Custom Armor

<h6>skilltreetweakdata.lua</h6>

- Added Armor Drainer perk deck

<h6>upgradestweakdata.lua</h6>

- Added difficulty scaling values
- Added a multiplier for armor regen while suppressed
	- Multiplies the maximum amount your armor can regen per second while suppressed
		- Only affects EOD Suit
		- All armor regeneration while suppressed scales with this multiplier
- Added bleeding

<h6>playerdamage.lua</h6>

- Added armor reduction on break
- Added bleeding
- Added bonus armor on headshot
- Fixed regeneration sound bug
	- Your armor can now fully regenerate without periodically hearing the regen sound
- Added a hint when you start bleeding or your max armor changes
	- They will be changed later on to visual icons/values
	
<h6>default_upgrades.lua</h6>

- Automatically unlocks Custom Armor

<h5>v0.5.1</h5>

<h6>upgradestweakdata.lua</h6>

- Increased all negatively affected armors' jump speed (from Two-piece Suit to ICTV, followed by Lifa Vest, Lightweight Tactical Vest, Thin Suit and EOD Suit) from { 1, 1, 0.96, 0.92, 0.875, 0.8, 0.65, 0.775, 0.85, 1.1, 0.2 } to {1, 1, 0.99, 0.98, 0.97, 0.95, 0.93, 0.94, 0.96, 0.9 }

<h5>v0.5</h5>

<h6>upgradestweakdata.lua</h6>

- Decreased Flak Jacket ammo boost from 50% to 35%
- Increased Lightweight Tactical Vest ammo boost from 25% to 40%
- Increased Thin Suit jump speed multiplier from 1.05 to 1.1
- Increased EOD Suit jump speed multiplier from 0.15 to 0.2

<h6>playerdamage.lua</h6>

- Increased Armor suppression time from 3s to 10s (this value is still variable depending on your armor regen skills)

<h6>playermanager.lua</h6>

- Altered Armor regen value according to the suppression ratio
	- The instant you are suppressed, your armor stops to regen, but it slowly regain its potential as long as the suppression progressively vanishes

<h6>localizationmanager.lua</h6>

- Added support for DMCWO (cause why not)

<h6>blackmarketgui.lua</h6>

- Fixed HP bonus being invisible and detection ring being rendered behind armor stats
	- The blackmarket can seem a bit wide, but now it is completely useable
	- Spendable skill points can overlay the selection grid