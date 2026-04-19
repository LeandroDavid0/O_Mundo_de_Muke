//
if inicializar == false
{
	scr_textos();
	inicializar = true;
	alarm[0] = 3;
}

//Para ir para a proxima fala

	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
		if (keyboard_check_pressed(ord("R"))){
		caractere = string_length(texto_grid[# Infos.Texto, pagina]);
		}
	}else{
		if pagina < ds_grid_height(texto_grid) - 1{
			if (keyboard_check_pressed(ord("R"))){
				alarm[0] = 3;
				caractere = 0;
				pagina++;	
			}
			}else{
			if op_num != 0{
				op_draw = true;
			}else{
				if (keyboard_check_pressed(ord("R"))){
				global.dialogo = false;
				instance_destroy();
			}
		}
	}
}

////Para voltar na fala anterior
//if (keyboard_check_pressed(ord("E")))
//{
//	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
//		caractere = string_length(texto_grid[# Infos.Texto, pagina]);
//	}else{
//		alarm[0] = 1;
//		caractere = 0;
	
//    pagina--;
//    if (pagina < 0)
//    {
//        pagina = ds_grid_height(texto_grid) = 0;
//		}
//	 }
//}