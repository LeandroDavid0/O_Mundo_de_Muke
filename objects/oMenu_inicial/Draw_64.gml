var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);


draw_set_font(ft_menu_inicial);
draw_set_halign(fa_center);
draw_set_valign(fa_center);


var tam_menu = array_length(menu_inicial);
for(var i = 0; i < tam_menu; i++)
{
	var _wgui = display_get_gui_width();
	var _hgui = display_get_gui_height();
	
	var _hstr = string_height("I");
	var _wstr = string_width(menu_inicial[i]);
	
	var x1 =  _wgui / 2 - 500 - _wstr / 2
	var y1 =  _hgui / 2 - _hstr / 2 + _hstr * i
	
	var x2 =  _wgui / 2 - 500 + _wstr / 2
	var y2 =  _hgui / 2 + _hstr / 2 + _hstr * i
  
  
	if(point_in_rectangle(_mx,_my,x1,y1,x2,y2))
	{
		
		esc[i] = lerp(esc[i], 1.3, 0.15);
		
		if(mouse_check_button(mb_left)){
			
			switch menu_inicial[i]
			{
				case menu_inicial[0]: // Novo Jogo
				
					room_goto_next();
				
				break;
				
				case menu_inicial[1]: // Opções
				
					
				
				break;
				
				case menu_inicial[2]: // Creditos
				
					
				
				break;
				
				case menu_inicial[3]: // sair
					
				game_end();
				
				break;
			}
		}
		
	}else{
		esc[i] = lerp(esc[i],1, 0.15);
		
	}
	

	//Centralizando o texto
	draw_text_transformed(_wgui / 2 - 500, _hgui / 2 + _hstr * i, menu_inicial[i], esc[i], esc[i], 0);
	
}

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);