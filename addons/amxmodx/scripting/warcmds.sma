#include <amxmodx>
#include <amxmisc>
#include <cstrike>

#define ACCESS ADMIN_SLAY
new tcount = 0;
new ctcount = 0;
new sum = 0;
new fhalf = 0;
new shalf = 0;
new warm = 0;
new g_on = 0;
new gameBreak = 0;
new sctcount = 0;
new stcount = 0;
new ftcount;
new fctcount;
new tagct[32] = "<B>";
new tagt[32] = "<A>";
new ttagct[32] = "<B>";
new ttagt[32] = "<A>";
new livem = 0;


public plugin_init() 
{
	register_plugin("warcmds","3.0","vladpaul10")
	register_clcmd("say /rr","say_restart",ACCESS)
	register_clcmd("say /restart","say_restart",ACCESS)
	register_clcmd("say /warm","say_warm",ACCESS)
	register_clcmd("say /live","say_live",ACCESS)
	register_clcmd("say /blades","say_blades",ACCESS)
	register_clcmd("say /elections","say_elections",ACCESS)
	register_clcmd("say /stop","say_stop",ACCESS)
	register_clcmd("say /score","say_score")
	
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
	if (read_argc() < 2) 
	{
		console_print(id,"[ WarCmds ] Usage: amx_tagct < Tag CT >")
		console_print(id,"[ WarCmds ] CT team tag is %s", tagct)
		return PLUGIN_HANDLED;
	}    
        new tagcttt[32];
    	read_argv(1, tagcttt, 31);
	copy(tagct, 31, tagcttt);
	remove_quotes(tagcttt);
	console_print(id, "CT team tag is %s", tagcttt) 

	return PLUGIN_HANDLED
} 

public tagtt( id, level, cid ) 
{ 

	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED;
	if (read_argc() < 2) 
	{
		console_print(id,"[ WarCmds ] Usage: amx_tagt < Tag T >")
		console_print(id,"[ WarCmds ] T team tag is: %s", tagt)
		return PLUGIN_HANDLED;
	} 
        new tagttt[32];
	read_argv(1, tagttt, 31); 
	copy(tagt, 31, tagttt)
        remove_quotes(tagttt); 
	console_print(id, "T team tag is %s", tagttt) 
		
	return PLUGIN_HANDLED
}

public say_restart(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
     
	server_cmd("sv_restart 1")
        
	if(livem == 0)
	{
		if(fhalf == 1)
		{	
		livem = 1;
        	sum = 0;
       		tcount = 0;
        	ctcount = 0;
        	set_task(0.5, "msg1");
		set_task(1.0, "msg2");
		set_task(2.0, "msg3");
		set_task(3.0, "msg4");
		set_task(3.0, "msg12");
		set_task(4.0, "msg5");
		set_task(4.5, "msg6");
		set_task(5.0, "msg14");
		}
        	if(shalf == 1)
		{
		livem = 1;
        	sum = 16;
		sctcount = 0;
		stcount = 0;
		set_task(0.5, "msg7");
		set_task(1.0, "msg8");
		set_task(2.0, "msg9");
		set_task(3.0, "msg13");
		set_task(3.0, "msg10");
		set_task(4.0, "msg11");
		set_task(4.5, "msg14");
		}
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
	sum = 0;
	sctcount = 0;
	stcount = 0;
	copy(tagct, 31, ttagct)
	copy(tagt, 31, ttagt)

	client_print(0, print_chat, "[ WarCmds ] The match has been stopped!")
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
	sum = 0;
	sctcount = 0;
	stcount = 0;
	copy(tagct, 31, ttagct)
	copy(tagt, 31, ttagt)

	client_print(0, print_chat, "[ WarCmds ] The match has been stopped!")
        }

}

public say_warm(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED;
	if(fhalf == 2)
	{
		server_cmd("sv_restart 1")
		return PLUGIN_HANDLED;
	}
	if(g_on == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command /stop")		
		return PLUGIN_HANDLED;
	}
	if(gameBreak == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command / stop")		
		return PLUGIN_HANDLED;
	}
	if(livem == 1)
	{
		return PLUGIN_HANDLED;
	}
    
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
	sum = 0;
	sctcount = 0;
	stcount = 0;
	client_print(0, print_chat, "[ WarCmds ] The warm-up round has begun!")
	
	return PLUGIN_HANDLED;

}

public say_live(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return
        if(livem == 0)
	{
        	g_on = 1;
        	if(fhalf == 0)
		{
		livem = 1;
        	sum = 0;
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

        	set_task(0.5, "msg1");
		set_task(1.0, "msg2");
		set_task(2.0, "msg3");
		set_task(3.0, "msg4");
		set_task(3.0, "msg12");
		set_task(4.0, "msg5");
		set_task(4.5, "msg6");
		set_task(5.0, "msg14");
		}
        	if(fhalf == 2)
		{
		livem = 1;
		server_cmd("mp_fadetoblack 0") 
		server_cmd("mp_maxrounds 0")
		server_cmd("mp_roundtime 1.75")
		server_cmd("mp_startmoney 800")
		server_cmd("mp_freezetime 10")
		server_cmd("mp_friendlyfire 1")
		server_cmd("sv_restart 1")
        	client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;ex_interp 0.01")

		set_task(0.5, "msg7");
		set_task(1.0, "msg8");
		set_task(2.0, "msg9");
		set_task(3.0, "msg13");
		set_task(3.0, "msg10");
		set_task(4.0, "msg11");
		set_task(4.5, "msg14");
        	shalf = 1;
        	warm = 0;
        	fhalf = 3;
        	sum = 15;
		}
	}	
        
}

public say_blades(id) 
{
	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED;
	if(g_on == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command /stop")		
		return PLUGIN_HANDLED;
	}
	if(gameBreak == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command /stop")		
		return PLUGIN_HANDLED;
	}
	if(livem == 1)
	{
		return PLUGIN_HANDLED;
	}
    
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
	sum = 0;
	sctcount = 0;
	stcount = 0;
         
	client_print(0, print_chat, "[ WarCmds ] The round of blades has begun!")
	client_print(0, print_chat, "[ WarCmds ] Drop your weapons on the base!")
	return PLUGIN_HANDLED;
}

public say_elections(id)
{
	if(!(get_user_flags(id) & ACCESS))
		return PLUGIN_HANDLED;
	if(g_on == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command /stop")		
		return PLUGIN_HANDLED;
	}
	if(gameBreak == 1)
	{
		client_print(id, print_chat, "[ WarCmds ] Match in progress! To stop the match use the command /stop")		
		return PLUGIN_HANDLED;
	}
	if(livem == 1)
	{
		return PLUGIN_HANDLED;
	}

	server_cmd("sv_restart 1");    
     	new Players[32], Num, iPlr, i;
	get_players(Players, Num, "c");
	for (i=0;i<Num;i++)
	{
		iPlr=Players[i];
		user_kill(iPlr);
		client_cmd(iPlr,"jointeam 6");
	}	
        g_on = 0;
	warm = 0;
	fhalf = 0;
	shalf = 0;
	tcount = 0;
	ctcount = 0;
	sum = 0;
	sctcount = 0;
	stcount = 0;
	
        client_print(0, print_chat, "[ WarCmds ] Elections! Elections! Elections!");

	return PLUGIN_HANDLED;
}

public t_win(id) 
{
	if(fhalf != 2)
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
} 

public ct_win(id) 
{ 
	if(fhalf != 2)
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
} 

public new_round()
{       
	ftcount = ctcount + stcount;
	fctcount = tcount + sctcount;
	client_cmd(0,"rate 25000;cl_cmdrate 101;cl_updaterate 101;fps_max 99.5;ex_interp 0.01");
     	if(g_on == 1)
	{
    		sum++;
    		if(fhalf == 1)
		{       if(sum > 1)
			{
				if((sum < 16)&&(livem == 0))
				{
				client_print(0, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagct, ctcount, tagt, tcount);
				}
			}
    			if(sum == 15)
			{
			client_print(0, print_chat, "[ WarCmds ] After this round the teams will change automatically! Plugin provided by vladpaul10");
			}
		
			if(sum == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] The first half is over!");     
			client_print(0, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagt, tcount, tagct, ctcount);
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
		{	
		        if((sum > 17)&&(livem == 0))
			{
			client_print(0, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagt, fctcount, tagct, ftcount);
			}
                        gameBreak = 0
			if(fctcount == 15)
			{
				if(ftcount == 15)
				{			
				client_print(0, print_chat, "[ WarCmds ] Equal %s vs %s", tagt, tagct);
				set_task(0.5, "msg15");
				copy(tagct, 31, ttagct)
				copy(tagt, 31, ttagt)
        			g_on = 0;
				warm = 0;
				fhalf = 0;
				shalf = 0;
				tcount = 0;
				ctcount = 0;
				sum = 0;
				sctcount = 0;
				stcount = 0;
				}
			}
	
			if(fctcount == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] Team %s won!", tagt);
			set_task(0.5, "msg15");
			copy(tagct, 31, ttagct)
			copy(tagt, 31, ttagt)
        		g_on = 0;
			warm = 0;
			fhalf = 0;
			shalf = 0;
			tcount = 0;
			ctcount = 0;
			sum = 0;
			sctcount = 0;
			stcount = 0;
			}
	
			if(ftcount == 16)
			{
			client_print(0, print_chat, "[ WarCmds ] Team %s won!", tagct);
			set_task(0.5, "msg15");
			copy(tagct, 31, ttagct)
			copy(tagt, 31, ttagt)
        		g_on = 0;
			warm = 0;
			fhalf = 0;
			shalf = 0;
			tcount = 0;
			ctcount = 0;
			sum = 0;
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
        gameBreak = 1;
	}
	return PLUGIN_CONTINUE;
}


public say_score(id) 
{
	if(fhalf == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagct, ctcount, tagt, tcount);    
	}
	if(gameBreak == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagt, tcount,tagct, ctcount);
	}
        if(shalf == 1)
	{
	client_print(id, print_chat, "[ WarCmds ] Score is %s: %d %s: %d", tagt, fctcount, tagct, ftcount);	
        }
}

public msg1() 
{
	client_print(0, print_chat, "[ WarCmds ] The match starts in... ");
} 

public msg2() 
{
	client_print(0, print_chat, "[ WarCmds ] 3");   
} 

public msg3() 
{
	client_print(0, print_chat, "[ WarCmds ] 2");       
} 
public msg4() 
{
	client_print(0, print_chat, "[ WarCmds ] 1");       
} 
public msg5() 
{
	client_print(0, print_chat, "[ WarCmds ] The match has started!");       
} 
public msg6() 
{
	client_print(0, print_chat, "[ WarCmds ] Good Luck & Have Fun!");       
} 
public msg7() 
{
	client_print(0, print_chat, "[ WarCmds ] The second half begins in...");       
} 
public msg8() 
{
	client_print(0, print_chat, "[ WarCmds ] 3");       
} 
public msg9() 
{
	client_print(0, print_chat, "[ WarCmds ] 2");       
} 
public msg10() 
{
	client_print(0, print_chat, "[ WarCmds ] 1");       
}
public msg11() 
{
	client_print(0, print_chat, "[ WarCmds ] The second half has begun!");       
}  
public msg12() 
{       
	sum = 0;
	server_cmd("sv_restart 1")      
} 
public msg13() 
{       
	sum = 16;
	server_cmd("sv_restart 1")      
}
public msg14() 
{       
	livem = 0;    
}
public msg15() 
{       
	client_cmd(0,"snapshot");    
}