/// @description Treme resposta incorreta
qtd_frames_tremendo--;

// ==================================================
// EXECUTA ENQUANDO TIVER TEMPO
// ==================================================
if (qtd_frames_tremendo > 0) {
	x =  x >= x_base ? x - 2 : x + 4;
	alarm[0] = frames_por_mexida; // exibe o próximo nome
} else {
	with (player_atual) {
		retornou_erro = false;
	}
	x = x_base;
}