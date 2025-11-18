// ==================================================
/// @description Treme resposta incorreta
// ==================================================

var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
qtd_frames_tremendo--;

// ---------- EXECUTA ENQUANDO TIVER TEMPO ---------- 
if (qtd_frames_tremendo > 0) {
	x =  x >= x_base ? x - 2 : x + 4;
	alarm[0] = frames_por_mexida; // exibe o próximo nome
} else {
	// ---------- CONFIRMA O ERRO ---------- 
	with (player_atual) {
		treme_resposta_errada = false;
		
		if (!_is_rapido) {
            estado_turno = ESTADOS_TURNO.ESCOLHA_HAB;
        }
	}
	
	x = x_base;
}