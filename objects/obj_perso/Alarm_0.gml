//Desativa o olho e zera seu id_olho
audio_stop_sound(snd_terc_olho_on);
layer_set_visible("terc_olho_layer", false);
layer_set_visible("tl_wall", true);
layer_set_visible("tl_terc_olho", false);
global.id_olho = 0;
instance_destroy(global.terc_npc);	
