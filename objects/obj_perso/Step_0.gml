var  tecla_cima = keyboard_check(ord("W"));
var  tecla_baixo = keyboard_check(ord("S"));
var  tecla_esquerda = keyboard_check(ord("A"));
var  tecla_direita = keyboard_check(ord("D"));


var tecla = tecla_direita - tecla_esquerda != 0 || tecla_baixo - tecla_cima != 0;

dir = point_direction(0,0,tecla_direita - tecla_esquerda,tecla_baixo - tecla_cima);

//Com base na minha direção, eu vou dar minha velocidade
velh = lengthdir_x(velc * tecla,dir);
velv = lengthdir_y(velc * tecla,dir);

//Colisão Horizontal

if(place_meeting(x+velh,y,obj_wall)){
	while(!place_meeting(x+sign(velh),y,obj_wall)){
		
		x = x + sign(velh);
		
	}
	velh = 0;	
	
}

x+=velh;

//Colisão Vertical

if(place_meeting(x,y+velv,obj_wall)){
	while(!place_meeting(x,y+sign(velv),obj_wall)){

		y = y + sign(velv);
	
	}
	
	velv = 0;
	
}

y+=velv;

//Troca de Sprite
//Sprite Padrão
sprite_index = spr_perso;

//Andando para cima
if(tecla_cima)
{
		sprite_index = spr_perso_walk_up;
}

//Andando para baixo
if(tecla_baixo)
{
		sprite_index = spr_perso_walk_down;
}

//Andando para esquerda
if(tecla_esquerda)
{
	sprite_index = spr_perso_walk_left;
}

//Andando para direita
if(tecla_direita)
{
	sprite_index = spr_perso_walk_right;
}

//Arrumando Bug #1
if tecla_cima and tecla_baixo
{
	sprite_index = spr_perso;
}

//Arrumando Bug #2
if tecla_direita and tecla_esquerda
{
	sprite_index = spr_perso;
}


#region //Arrumando bug do personagem se mover ao estar no dialogo
if (global.dialogo == true){
	velc = 0;
	sprite_index = spr_perso;
}
else{
	velc = 2.0;
}

#endregion

//Habilidades
//Terceiro olho
//Global dos npc para destruit depois que o olho sumir
//A cada instance_create, colocar o nome no global e posicionar ele na room, baseado no x e y
global.terc_npc = obj_perso_okko;
/// Aparecer layer
// Se tiver id_olho, você ode usar o terceiro olho
if global.id_olho == 1{
	if (keyboard_check_pressed(vk_shift)){
		if (global.dialogo == false){
			#region Personagens que aparecem no terceiro olho
				instance_create_layer(600, 400, "terc_olho_layer", obj_perso_okko)
			#endregion
			audio_play_sound(snd_terc_olho_on,1,true);
	   layer_set_visible("terc_olho_layer", true);
		layer_set_visible("tl_wall", false);
		layer_set_visible("tl_terc_olho", true);
		alarm[0]=60*10;
		}
	}
}


#region Sistema de dialogo

if (distance_to_object(obj_par_npcs)) <= 10{
	if(global.tecla) and (global.dialogo == false) {
		var _npc = instance_nearest(x, y, obj_par_npcs);
		var _dialogo = instance_create_layer(x, y, "inst_dialogo", obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
	}
}





#endregion