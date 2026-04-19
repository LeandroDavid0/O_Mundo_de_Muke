// Script assets have changed for v2.3.0 see
function scr_textos(){
	switch npc_nome{
		//Usar case para escolher os perso e texto[] para a fala de cada um
		//posso colocar valores ao conseguir uma resposta, tipo: resposta 3 = global.id_olho += 1;
		
#region		//Dialogo do Aiki
		case "Aiki":
			ds_grid_add_text("Eu já dei risada até rosto desfigurado.", spr_desen_perso, 0, "Muke")
			ds_grid_add_text("segundo  texto", spr_perso_aiki, 1, "Personagem 2")
				add_op("primeira opção", "resposta 1")
				add_op("segunda opção",	 "resposta 2")
				add_op("terceira opção", "resposta 3")
		break;
				case "resposta 1":
					ds_grid_add_text("essa é a primeira resposta.", spr_desen_perso, 0, "Personagem 1")
					ds_grid_add_text("a gente pode botar quanto texto quiser", spr_perso_aiki, 1, "Personagem 2")
				break;
				case "resposta 2":
					ds_grid_add_text("essa é a segunda resposta.", spr_desen_perso, 0, "Personagem 1")
					ds_grid_add_text("a gente pode botar quanto texto quiser", spr_perso_aiki, 1, "Personagem 2")
				break;
				case "resposta 3":
					ds_grid_add_text("essa é a terceira resposta.", spr_desen_perso, 0, "Personagem 1")
					ds_grid_add_text("a gente pode botar quanto texto quiser", spr_perso_aiki, 1, "Personagem 2")
					
					global.id_olho += 1;
					
				break;
				
#endregion	

#region		//Dialogo da Denise
		case "Denise":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Muke")
			ds_grid_add_text("segundo  texto", spr_perso_denise, 1, "Denise")
		break;
#endregion	

#region		//Dialogo do Iko
		case "Iko":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_iko, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Kaos
		case "Kaos":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_kaos, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Krael
		case "Krael":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_krael, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Nixx
		case "Nixx":
		
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_nixx, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Okko
		case "Okko":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_okko, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Planta_olho
		case "Planta_olho":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_planta_olho, 1, "Personagem 2")
		break;
#endregion		

#region		//Dialogo do Toku
		case "Toku":
			ds_grid_add_text("primeiro texto", spr_desen_perso, 0, "Personagem 1")
			ds_grid_add_text("segundo  texto", spr_perso_toku, 1, "Personagem 2")
		break;
#endregion

	}
}

function ds_grid_add_row(){
	///@arg ds_grid
 
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return(ds_grid_height(_grid)-1);	
}
 
function ds_grid_add_text(){
	///@arg texto
	///@arg retrato
	///@arg lado
	///@arg nome
 
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}
	
function add_op(_texto, _resposta){
	op[op_num] = _texto;
	op_resposta[op_num] = _resposta;
	
	op_num++;
}