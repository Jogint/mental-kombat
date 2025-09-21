if (global.jogador_atual != global.tipos_jogadores[0]) {
	if (is_certo) {
		scr_proxima_pergunta();
	} else {
		global.errou_resposta = true;
	}
}