// resetar
move_up = false;
move_down = false;
move_left = false;
move_right = false;

var was_interact = interact;
interact = false;

// multitouch
for (var i = 0; i < 5; i++) {

    if (device_mouse_check_button(i, mb_left)) {

        var mx = device_mouse_x_to_gui(i);
        var my = device_mouse_y_to_gui(i);

// BOTÃO INTERAÇÃO (lado direito da tela)
        var cx = 810;
		var cy = 410;
		var r = 50;

	if (point_distance(mx, my, cx, cy) <= r) {
		interact = true;
}

		
		// detectar clique (pressionou agora)
		interact_pressed = interact && !was_interact;

        // IMPORTANTE: usar IF separados (não else if)

        // ESQUERDA
        if (point_in_rectangle(mx, my, 40, 360, 120, 440)) {
            move_left = true;
        }

        // DIREITA
        if (point_in_rectangle(mx, my, 160, 360, 240, 440)) {
            move_right = true;
        }

        // CIMA
        if (point_in_rectangle(mx, my, 100, 300, 180, 380)) {
            move_up = true;
        }

        // BAIXO
        if (point_in_rectangle(mx, my, 100, 420, 180, 500)) {
            move_down = true;
        }
    }
}

// vetor de movimento
var h = 0;
var v = 0;

if (move_left)  h -= 1;
if (move_right) h += 1;
if (move_up)    v -= 1;
if (move_down)  v += 1;

// normalizar diagonal
if (h != 0 || v != 0) {
    var len = point_distance(0, 0, h, v);
    h /= len;
    v /= len;
}

// movimento com colisão

// horizontal
var nx = x + h * spd;
if (!place_meeting(nx, y, obj_wall)) {
    x = nx;
}

// vertical
var ny = y + v * spd;
if (!place_meeting(x, ny, obj_wall)) {
    y = ny;
}

#region Mudando de Sprite

//Troca de Sprite
//Sprite Padrão
sprite_index = spr_perso;

//Andando para cima
if(move_up == true)
{
		sprite_index = spr_perso_walk_up;
}

//Andando para baixo
if(move_down == true)
{
		sprite_index = spr_perso_walk_down;
}

//Andando para esquerda
if(move_left == true)
{
	sprite_index = spr_perso_walk_left;
}

//Andando para direita
if(move_right == true)
{
	sprite_index = spr_perso_walk_right;
}

//Arrumando Bug #1
if move_up and move_down
{
	sprite_index = spr_perso;
}

//Arrumando Bug #2
if move_right and move_left
{
	sprite_index = spr_perso;
}

#endregion

#region Sistema de dialogo

if (distance_to_object(obj_par_npcs)) <= 10{
	if(global.tecla || interact_pressed) and (global.dialogo == false) {
		var _npc = instance_nearest(x, y, obj_par_npcs);
		var _dialogo = instance_create_layer(x, y, "inst_dialogo", obj_dialogo);
		_dialogo.npc_nome = _npc.nome;
	}
}





#endregion

#region //Arrumando bug do personagem se mover ao estar no dialogo
if (global.dialogo == true){
	spd = 0;
	sprite_index = spr_perso;
}
else{
	spd = 3;
}

#endregion