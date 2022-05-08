# Warcmds

Counter-Strike 1.6 - AMX MOD X plugin to control matchmaking 

I started this project when I was in high school because of my passion for online games. I launched the first version in the ninth grade and the development of the plugin took about 1 year, tested on 5-10 competitive servers. I have improved the plugin according to the needs of the players.

I think this plugin was my first step on the road to software engineering.



## Installation

Copy the amxmodx directory to the addons path

[Online compiler](https://www.amxmodx.org/webcompiler.cgi "AMX Mod X - Half-Life Scripting for Pros!")


## Usage

```C++
// Chat commands
	register_clcmd("say /rr","say_restart",ACCESS)
	register_clcmd("say /restart","say_restart",ACCESS)
	register_clcmd("say /warm","say_warm",ACCESS)
	register_clcmd("say /live","say_live",ACCESS)
	register_clcmd("say /blades","say_blades",ACCESS)
	register_clcmd("say /elections","say_elections",ACCESS)
	register_clcmd("say /stop","say_stop",ACCESS)
	register_clcmd("say /score","say_score")

// Console commands
	register_concmd("amx_tagct", "tagctt", ACCESS, "<Tagct> - CT Tag");
	register_concmd("amx_tagt", "tagtt", ACCESS, "<Tagt> - T Tag");
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[
GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html)