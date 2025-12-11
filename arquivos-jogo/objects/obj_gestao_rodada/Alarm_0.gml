// ==================================================
/// @description Nome piscando
// ==================================================

if (estado_sorteio == 1) {
	
    qtd_frames_piscando--;

	// ==================================================
	// EXECUTA ENQUANDO TIVER TEMPO
	// ==================================================
    if (qtd_frames_piscando > 0) {
		var _nome_p1 = global.inst_perso_partida[0].controlador;
		var _nome_p2 = global.inst_perso_partida[1].controlador;

		if (nome_sorteado_atual == _nome_p2) {
		    nome_sorteado_atual = _nome_p1;
		} else {
		    nome_sorteado_atual = _nome_p2;
		}

        // ==================================================
		// DESACELERA O CONTADOR NOS ULTIMOS SEGUNDOS
		// ==================================================
        var _frames_por_nome = 4;
        if (qtd_frames_piscando < 30) {
            _frames_por_nome = 8;
        }

        alarm[0] = _frames_por_nome; // exibe o próximo nome

    } else {
		// ==================================================
		// EXIBE O RESULTADO APÓS ACABAR O TEMPO
		// ==================================================
        estado_sorteio = 2;
        var _resultado_sorteio = irandom_range(0, 1);
        nome_sorteado_atual = global.inst_perso_partida[_resultado_sorteio].controlador;
        alarm[1] = game_get_speed(gamespeed_fps) * 1; // 1 segundo de resultado
    }
}