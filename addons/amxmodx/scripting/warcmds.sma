#include <amxmodx>
#include <amxmisc>
#include <engine>

#define ACCESS ADMIN_SLAY


public plugin_init() 
{
	register_plugin("warcmds","2.0","VisioN")
	register_clcmd("say .rr","say_restart",ACCESS)
	register_clcmd("say .restart","say_restart",ACCESS)
	register_clcmd("say .warm","say_warm",ACCESS)
	register_clcmd("say .live","say_live",ACCESS)
	register_clcmd("say .lame","say_lame",ACCESS)
	register_clcmd("say .alegeri","say_alegeri",ACCESS)
    
}

public say_restart(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
     
	server_cmd("sv_restart 1")

}

public say_warm(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
    
	server_cmd("mp_freezetime 0") 
	server_cmd("mp_startmoney 16000")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_friendlyfire 0")
	server_cmd("sv_restart 1")

	client_print(0, print_chat, "[ WarCmds ] Runda de incalzire a inceput!")

}

public say_live(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
    
	server_cmd("mp_fadetoblack 0") 
	server_cmd("mp_maxrounds 0")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_startmoney 800")
	server_cmd("mp_freezetime 10")
	server_cmd("mp_friendlyfire 1")
	server_cmd("sv_restart 1")
        client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;ex_interp 0.01")

	client_print(0, print_chat, "[ WarCmds ] Meciul a inceput!")
	client_print(0, print_chat, "[ WarCmds ] Mult noroc tuturor!")

}

public say_lame(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
    
	server_cmd("mp_fadetoblack 0") 
	server_cmd("mp_maxrounds 0")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_startmoney 800")
	server_cmd("mp_freezetime 0")
	server_cmd("sv_restart 1")

	client_print(0, print_chat, "[ WarCmds ] Runda de lame a inceput!")
	client_print(0, print_chat, "[ WarCmds ] Aruncati armele in baza!")

}

public say_alegeri(id)
{
	if(!(get_user_flags(id) & ACCESS))
		return

	server_cmd("sv_restart 1")    
        client_cmd(0,"kill;wait;jointeam 6")
	
        client_print(0, print_chat, "[ WarCmds ] Alegeri! Alegeri! Alegeri!")


}
