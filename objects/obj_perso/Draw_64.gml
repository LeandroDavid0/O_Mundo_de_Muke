//Se tiver id_olho, ativa a animação do olho
//Usar global.id_olho para ativar o olho 
if global.id_olho == 1 {
	if (layer_get_visible("terc_olho_layer")) {
	draw_sprite(spr_terc_olho_aber, 0, 50, 50);
	}
	else
	{
		draw_sprite(spr_terc_olho_fec, 0, 50, 50);
	}
}