#include <amxmodx>
#include <amxmisc>
#include <cstrike>

#define ACCESS ADMIN_SLAY
new tcount = 0;
new ctcount = 0;
new suma = 0;
new fhalf = 0;
new shalf = 0;
new warm = 0;
new g_on = 0;
new pauza = 0;
new sctcount = 0;
new stcount = 0;
new ftcount;
new fctcount;
new tagct[32] = "<B>";
new tagt[32] = "<A>";
new ttagct[32] = "<B>";
new ttagt[32] = "<A>";

public plugin_init() 
{
	register_plugin("warcmds","2.5","VisioN")
	register_clcmd("say .rr","say_restart",ACCESS)
	register_clcmd("say .restart","say_restart",ACCESS)
	register_clcmd("say .warm","say_warm",ACCESS)
	register_clcmd("say .live","say_live",ACCESS)
	register_clcmd("say .lame","say_lame",ACCESS)
	register_clcmd("say .alegeri","say_alegeri",ACCESS)
	register_clcmd("say .stop","say_stop",ACCESS)
	register_clcmd("say .scor","say_score")
	register_clcmd("say .score","say_score")
	
	register_concmd("amx_tagct", "tagctt", ACCESS, "<Tagct> - CT Tag");
	register_concmd("amx_tagt", "tagtt", ACCESS, "<Tagt> - T Tag");
        
        register_event("SendAudio", "t_win", "a", "2&%!MRAD_terwin") 
        register_event("SendAudio", "ct_win", "a", "2&%!MRAD_ctwin") 
        register_event("HLTV", "new_round", "a", "1=0", "2=0");

}


public tagctt( id, level, cid ) 
{ 

	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED;    
        new tagcttt[32];
    	read_argv(1, tagcttt, 31);
	copy(tagct, 31, tagcttt);
	remove_quotes(tagcttt);
	console_print(id, "Tag from CT team is  %s", tagcttt) 

	return PLUGIN_HANDLED
} 

public tagtt( id, level, cid ) 
{ 

	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED; 
        new tagttt[32];
	read_argv(1, tagttt, 31); 
	copy(tagt, 31, tagttt)
        remove_quotes(tagttt); 
	console_print(id, "Tag from T team is %s", tagttt) 
		
	return PLUGIN_HANDLED
}

public say_restart(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
     
	server_cmd("sv_restart 1")
        if(fhalf == 1)
{
        suma = 0;
        tcount = 0;
        ctcount = 0;
        set_task(0.5, "mesaj1");
	set_task(1.0, "mesaj2");
	set_task(2.0, "mesaj3");
	set_task(3.0, "mesaj4");
	set_task(3.0, "mesaj12");
	set_task(4.0, "mesaj5");
	set_task(4.5, "mesaj6");
}
        if(shalf == 1)
{
        suma = 16;
	sctcount = 0;
	stcount = 0;
	set_task(0.5, "mesaj7");
	set_task(1.0, "mesaj8");
	set_task(2.0, "mesaj9");
	set_task(3.0, "mesaj13");
	set_task(3.0, "mesaj10");
	set_task(4.0, "mesaj11");
}
}

public say_stop(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
        if(g_on == 1)
        {
	server_cmd("mp_freezetime 0") 
	server_cmd("mp_startmoney 16000")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_friendlyfire 0")
	server_cmd("sv_restart 1")
        g_on = 0;
	warm = 0;
	fhalf = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	suma = 0;
	sctcount = 0;
	stcount = 0;
	copy(tagct, 31, ttagct)
	copy(tagt, 31, ttagt)

	client_print(0, print_chat, "[ WarCmds ] Meciul a fost oprit!")
        }
        if(fhalf == 2)
	{
	server_cmd("mp_freezetime 0") 
	server_cmd("mp_startmoney 16000")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_friendlyfire 0")
	server_cmd("sv_restart 1")
        g_on = 0;
	warm = 0;
	fhalf = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	suma = 0;
	sctcount = 0;
	stcount = 0;
	copy(tagct, 31, ttagct)
	copy(tagt, 31, ttagt)

	client_print(0, print_chat, "[ WarCmds ] Meciul a fost oprit!")
        }

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
        g_on = 0;
	warm = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	suma = 0;
	sctcount = 0;
	stcount = 0;
	client_print(0, print_chat, "[ WarCmds ] Runda de incalzire a inceput!")

}

public say_live(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
        
        g_on = 1;
        if(fhalf == 0)
{
        suma = 0;
        tcount = 0;
        ctcount = 0;
        fhalf = 1;
	server_cmd("mp_fadetoblack 0") 
	server_cmd("mp_maxrounds 0")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_startmoney 800")
	server_cmd("mp_freezetime 10")
	server_cmd("mp_friendlyfire 1")
	server_cmd("sv_restart 1")
        client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;ex_interp 0.01")

        set_task(0.5, "mesaj1");
	set_task(1.0, "mesaj2");
	set_task(2.0, "mesaj3");
	set_task(3.0, "mesaj4");
	set_task(3.0, "mesaj12");
	set_task(4.0, "mesaj5");
	set_task(4.5, "mesaj6");
}
        if(fhalf == 2)
{
	server_cmd("mp_fadetoblack 0") 
	server_cmd("mp_maxrounds 0")
	server_cmd("mp_roundtime 1.75")
	server_cmd("mp_startmoney 800")
	server_cmd("mp_freezetime 10")
	server_cmd("mp_friendlyfire 1")
	server_cmd("sv_restart 1")
        client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;ex_interp 0.01")

	set_task(0.5, "mesaj7");
	set_task(1.0, "mesaj8");
	set_task(2.0, "mesaj9");
	set_task(3.0, "mesaj13");
	set_task(3.0, "mesaj10");
	set_task(4.0, "mesaj11");
        shalf = 1;
        warm = 0;
        fhalf = 3;
        suma = 15;
}
        

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
        g_on = 0;
	warm = 0;
	fhalf = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	suma = 0;
	sctcount = 0;
	stcount = 0;
         
	client_print(0, print_chat, "[ WarCmds ] Runda de lame a inceput!")
	client_print(0, print_chat, "[ WarCmds ] Aruncati armele in baza!")

}

public say_alegeri(id)
{
	if(!(get_user_flags(id) & ACCESS))
		return

	server_cmd("sv_restart 1")    
        client_cmd(0,"kill;wait;jointeam 6")
        g_on = 0;
	warm = 0;
	fhalf = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	suma = 0;
	sctcount = 0;
	stcount = 0;
	
        client_print(0, print_chat, "[ WarCmds ] Alegeri! Alegeri! Alegeri!")


}

public t_win(id) 
{ 
	if(fhalf == 1)
{
	tcount++;
}
	if(shalf == 1) 
{
	stcount++;
}
} 

public ct_win(id) 
{ 
	if(fhalf == 1)
{
	ctcount++;
}
	if(shalf == 1)
{
	sctcount++;
}
} 

public new_round()
{       
	ftcount = ctcount + stcount;
	fctcount = tcount + sctcount;
	client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;fps_max 101;fps_modem 101;ex_interp 0.01");
     	if(g_on == 1)
	{
    	suma++;
    		if(fhalf == 1)
		{       if(suma > 1)
			{
				if(suma < 16)
				{
				client_print(0, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagct, ctcount, tagt, tcount);
				}
			}
    			if(suma == 15)
			{
			client_print(0, print_chat, "[ WarCmds ] Dupa aceasta runda echipele se vor schimba automat!");
			}
		
			if(suma == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] Prima repriza s-a incheiat!");     
			client_print(0, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagt, tcount, tagct, ctcount);
        		warm = 1;
			g_on = 0;
                        fhalf = 2;
        		new Players[32], Num, iPlr, CsTeams:Team
			get_players(Players, Num, "c")
	
			for (new i = 0; i < Num; i++)
			{
				iPlr = Players[i]
				Team = cs_get_user_team(iPlr)
		
				switch (Team)
				{
					case CS_TEAM_CT: cs_set_user_team(iPlr, CS_TEAM_T)
					case CS_TEAM_T: cs_set_user_team(iPlr, CS_TEAM_CT)
				}
         		}
			server_cmd("sv_restart 1");
			}
		}




		if(shalf == 1)
		{       if(suma > 17)
			{
			client_print(0, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagt, fctcount, tagct, ftcount);
			}
                        pauza = 0
			if(fctcount == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] Echipa %s a castigat!", tagt);
			copy(tagct, 31, ttagct)
			copy(tagt, 31, ttagt)
        		g_on = 0;
			warm = 0;
			fhalf = 0;
			shalf = 0;
			tcount = 0;
			ctcount = 0;
			suma = 0;
			sctcount = 0;
			stcount = 0;
			}
	
			if(ftcount == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] Echipa %s a castigat!", tagct);
			copy(tagct, 31, ttagct)
			copy(tagt, 31, ttagt)
        		g_on = 0;
			warm = 0;
			fhalf = 0;
			shalf = 0;
			tcount = 0;
			ctcount = 0;
			suma = 0;
			sctcount = 0;
			stcount = 0;
			}

		}
        }	
	if(warm == 1)
	{	
	server_cmd("mp_freezetime 0");
	server_cmd("mp_startmoney 16000");
	server_cmd("mp_roundtime 1.75");
	server_cmd("mp_friendlyfire 0");
 
        warm = 0;
        pauza = 1;
	}
	return PLUGIN_CONTINUE;
}


public say_score(id) 
{
	if(fhalf == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagct, ctcount, tagt, tcount);    
	}
	if(pauza == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagt, tcount,tagct, ctcount);
	}
        if(shalf == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Scorul este %s: %d %s: %d", tagt, fctcount, tagct, ftcount);	
        }
}

public mesaj1() 
{
	client_print(0, print_chat, "[ WarCmds ] Meciul incepe in... ");
} 

public mesaj2() 
{
	client_print(0, print_chat, "[ WarCmds ] 3");   
} 

public mesaj3() 
{
	client_print(0, print_chat, "[ WarCmds ] 2");       
} 
public mesaj4() 
{
	client_print(0, print_chat, "[ WarCmds ] 1");       
} 
public mesaj5() 
{
	client_print(0, print_chat, "[ WarCmds ] Meciul a inceput!");       
} 
public mesaj6() 
{
	client_print(0, print_chat, "[ WarCmds ] Good Luck & Have Fun!");       
} 
public mesaj7() 
{
	client_print(0, print_chat, "[ WarCmds ] A doua repriza incepe in...");       
} 
public mesaj8() 
{
	client_print(0, print_chat, "[ WarCmds ] 3");       
} 
public mesaj9() 
{
	client_print(0, print_chat, "[ WarCmds ] 2");       
} 
public mesaj10() 
{
	client_print(0, print_chat, "[ WarCmds ] 1");       
}
public mesaj11() 
{
	client_print(0, print_chat, "[ WarCmds ] A doua repriza a inceput!");       
}  
public mesaj12() 
{       
	suma = 0;
	server_cmd("sv_restart 1")      
} 
public mesaj13() 
{       
	suma = 16;
	server_cmd("sv_restart 1")      
}