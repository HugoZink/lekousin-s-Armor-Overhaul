ArmorOverhaul created by lekousin



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



<h4>Credits to :</h4>
- hejoro for its localization text script
- v00d00, 90e, gir489 and 420MuNkEy for the Lua sources



<h4>Recommended mods:</h4>
- DMCWO (a weapon overhaul mod): http://steamcommunity.com/groups/DMCWpnOverhaul



<h4>What to do ?</h4>

<h5>BLT Hook users</h5>
Put the content of the BLT Hook folder in PAYDAY 2 root folder (usually C:\Program Files (x86)\Steam\SteamApps\common\PAYDAY2\\)

<h5>Non-BLT Hook users (HoxHUD or old Hook)</h5>
Just put the content of the HoxHUD Hook folder in PAYDAY 2 root folder

Note: if you already use DMCWO (or another mod touching to localizationmanager), put the content of the method (all the armortext[...] = ...) into the corresponding script (in realnames.lua for DMCWO e.g.) and rename the armortext accordingly. Even if ArmorOverhaul has a DMCWO support, it seems that DMCWO's localization method overrides ArmorOverhaul one, that's why you need to copy/paste.



<h4>Known bugs</h4>

In the skill trees, the Ace line of description tweaked skills is blue, even when not buyable.



<h4>Changelog</h4>

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