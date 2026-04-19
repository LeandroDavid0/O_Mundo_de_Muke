if inicializar == true{
	if caractere < string_length(texto_grid[# Infos.Texto, pagina]){
		//Se tiver mais sons, pode ser colocar o choose para divercificar os sons
		var _snd = (snd_voice_1);
		audio_play_sound(snd_voice_1, 1, 0);
		caractere++;
		alarm[0] = 3;
	}
}