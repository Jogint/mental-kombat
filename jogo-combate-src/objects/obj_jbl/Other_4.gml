// ==================================================
/// @description Toca musica na sala
// ==================================================

acabou_partida = false;

var _faixa_desejada;

switch (room) {
	
	case rm_combate:
		_faixa_desejada = snd_musica_combate;
	break;
	
	default:
		_faixa_desejada = snd_musica_padrao;
	break;
	
}

if (_faixa_desejada != musica_atual) {
	audio_stop_all();
	audio_play_sound(_faixa_desejada, 1, true);
	musica_atual = _faixa_desejada;
}
