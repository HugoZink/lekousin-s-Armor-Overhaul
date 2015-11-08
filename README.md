ArmorOverhaul created by lekousin



<h4>What does it do ?</h4>

The mod is made to completely change how armor works by adding new mechanics as well as tweaking already exitent ones.
Below is a non-exhaustive list of what has been change/added.

<h5>1. Progressive armor regeneration</h5>

If you didn't notice, when your bar starts filling up, all your armor is already regenerated. Now, armor regenerates over time, after the initial regen delay (3 seconds if no skill and not suppressed).
Each armor level requires more time to fully regenerate, the EOD Suit being the slowest armor to regen.
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



<h4>Credits to :</h4>
- hejoro for its localization text script
- v00d00, 90e, gir489 and 420MuNkEy for the Lua sources
- Harfatus for its Simple Menu implementation
- notwa for its menu hijacking



<h4>Recommended mods:</h4>
- DMCWO (a weapon overhaul mod): http://steamcommunity.com/groups/DMCWpnOverhaul



<h4>What to do ?</h4>

<h5>BLT Hook users</h5>
Put the content of the BLT Hook folder in PAYDAY 2 root folder (usually C:\Program Files (x86)\Steam\SteamApps\common\PAYDAY2\\)

<h5>Non-BLT Hook users (HoxHUD or old Hook)</h5>
Just put the content of the HoxHUD Hook folder in PAYDAY 2 root folder

Note: if you already use DMCWO (or another mod touching to localizationmanager), put the content of the method (all the armortext[...] = ...) into the corresponding script (in realnames.lua for DMCWO e.g.) and rename the armortext accordingly. Even if ArmorOverhaul has a DMCWO support, it seems that DMCWO's localization method overrides ArmorOverhaul one, that's why you need to copy/paste.



<h4>Known bugs</h4>

- In the skill trees, the Ace line of description tweaked skills is blue, even when not buyable.
- In preplanning, non-vanilla armors are not rendered



<h4>Changelog</h4>

<h5>Crimefest 2</h5>

<h6>Fixes</h6>

- Fixed blackmarket issues
	- Could not change character
	- Could not mod weapons
	- Could not do anything in Steam inventory

<h6>HUD</h6>

- You can now change the position of the numerical values
	- Only changeable in options.lua
	- This change allows more compatibility with HUD mods
- Added a "Bleeding!" text when you are bleeding
	- You can also see current bleeding rate

<h6>Gameplay</h6>

- Interverted dodge checks
	- Now entropy dodge will trigger only when you didn't dodge through classic dodge
- When not moving, dodge is reduced to 35% of its original value
- When down, your armor's deflect is reduced to 40% of its original value
- Fall damage now starts at 4m (originally 3m), and is fatal at 8m (originally 6.31m)
	- It is also progressive. The higher your fall, the higher the fall damage (so you lose neglictible amount of HP from a 4.1m fall)
	

<h5>Evolution</h5>

<h6>Armor regeneration</h6>

- Added a multiplier for armor regeneration rate while suppressed
	- Only affects EOD Suit at a 75% rate

<h6>Blackmarket</h6>

- Separated armor stats in 3 pages
	- They can be switched with a key press (F1 and F2 by default with HoxHook, modifiable in keybinds for BLT Hook)
	- This fixed all blackmarket issues
- Added a '%' to percentage stats

<h6>Language</h6>

- Added the ability to change mod's language
	- Can be changed in ArmorOverhaul's option menu
	- Currently only in English and French

<h6>Bleeding</h6>

- Completely new mechanic
- When you take health damage, you have a chance to bleed, odds varying according to health damage, the higher the damage, the higher the chances to bleed, up to 50%
- You will continously bleed, but the bleeding rate will reduce over time as your armor is up
- However, if your armor does not regen, you can still stop the bleeding by using a medical bag

<h6>HUD</h6>
- Added two lines on top of HP/AP circle, showing their numerical value
- Added an icon when you bleed in the center of the HP/AP circle
- Those can be enabled/disabled via options menu

<h6>Crew bonus</h6>

- Added crew bonus
	- They enhance your crew members (only those you use ArmorOverhaul Evolution)
	- You can equip only one at a time
	- Crew bonus is selectable in main menu

<h6>Armor Drainer</h6>

- Introduced a new perk deck
	- Each headshot dealt increases maximum armor
	- Your maximum armor bonus on headshot is limited according to your base maximum armor (armor's base max + skills)
	- Shares the same cooldown as the Bullseye skill
	- Bonus vanishes when your armor breaks

<h6>Armor break</h6>

- When your armor breaks, you lose 1% of your base maximum armor, capped at a 50% loss
- When your armor breaks, you also gain a 0.2% speed boost, capped at a 10% boost

<h6>Difficulty</h6>

- Stats can now vary according to difficulty
- Globally, the higher the difficulty, the higher some stats are
	- Health has been decreased on normal and hard (200 HP), increasing up to 300 on DeathWish
	- Fall damage has been increased and vary to the difficulty
		- You will get down in 4 falls on normal, but on DW, you will get down on the second fall

<h6>On Hit</h6>

- Removed damage cooldown
	- This means you will not be protected by a magical wall for .45s (.35s on DW) anymore
- Added entropy dodge and deflection
	- on hit scheme: entropy dodge check -> dodge check -> entropy deflect check -> deflect check -> take damage
	- When you are hit, a number increases by (1 - entropy dodge/deflect). If the number is higher or equal to 1, then the bullet goes through the check and the bullet is not dodged/deflected (and the number is decremented by 1), otherwise, the bullet is nullified.
	- Entropy dodge/deflect value is equal to 20% of the theorical value of basic version (100% dodge chance (capped at 95%) means 0.2 or 20% entropy dodge)

<h6>Options</h6>

- Added options menu
- You can change there
	- Language
	- Debug
	- If you want the mod to localize itself (if not, it might be because of compatibility issues)
	- HUD options

<h6>Tweaks</h6>

- Doubled snipers' damage
- Changed armor value (XX -> stat on normal)
	- LBV: 30 to 25
	- BV: 40 to 30
	- HBV: 50 to 35
	- FJ: 75 to 45
	- CTV: 100 to 65
	- ICTV: 200 to 100
	- Lifa Vest: 80 to 50
	- LTV: 120 to 80
	- EOD: 500 to 200
- Two-piece Suit now has 30 armor on DW
- Reduced ammo penalties
	- Two-piece Suit: 20% -> 0%
	- Thin Vest: 50% -> 20%
- Increased EOD Suit speed to 10
	- Made EOD unaffected by Blending In (cause too fast with it)
- Changed dodge value
	- Two-piece Suit: 5% to 40%
	- LBV: -5% to 25%
	- BV: -20% to 5%
	- HBV: -25% to -10%
	- FJ: -30% to -25%
	- LTV: -35% to -25%
	- Thin Vest: 30% to 50%
- Reduced Moving Target Ace dodge bonus from 25% to 15%
- Changed deflect values (XX -> stat on DW)
	- LBV
		- 10% at 0 -> 5% at 0
		- 0% at 12 -> 0% at 20
	- BV
		- 12% at 0 -> 10% at 0
		- 0% at 15 -> 0% at 25
	- HBV
		- 0% at 20 -> 0% at 30
	- FJ
		- 20% at 0 -> 25% at 0
		- 0% at 30 -> 0% at 35
	- CTV
		- 25% at 0 -> 30% at 0
		- 0% at 35 -> 0% at 40
	- ICTV
		- 40% at 0 -> 35% at 0
		- 5% at 60 -> 0% at 50
	- Lifa Vest
		- 20% at 0 -> 30% at 0
	- LTV
		- 25% at 0 -> 50% at 10
		- 5% at 35 -> 10% at 90
	- EOD
		- 50% at 10 -> 50% at 5
		- 10% at 40 -> 5% at 50
- Increased Lifa Vest's HP regen from 0.5 per second to 1 per second
- Increased Lifa Vest's HP bonus from 30 to 100 (on normal)
- Increased Curaga Ace's HP regen bonus from 1 HP/s to 2
- Increased HP bonus from Bomb Disposal Expert Ace from 10 to 40 (on normal)
- Increased Speed bonus from BDE Ace from 5.25 to 6
- Increased BDE's Stamina bonus from 200% to 400%

<h5>v0.5.2</h5>

- Fixed an issue making clients crash/disconnect when hosting and playing with a non-vanilla armor

<h5>v0.5.1</h5>

- Reduced Jump penalty for every armor, which goes now up to 10% for EOD Suit

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