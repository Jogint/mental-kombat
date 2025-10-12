if (global.jogador_atual == global.tipos_jogadores[1]){
	if (global.inst_perso_partida[0].energia_atual >= habilidade.custo) {
		global.inst_perso_partida[0].energia_atual -= habilidade.custo;
		scr_efeito_hab(global.inst_perso_partida[0], global.inst_perso_partida[1], habilidade);
	}
} else if (global.jogador_atual == global.tipos_jogadores[2]){
	if (global.inst_perso_partida[1].energia_atual >= habilidade.custo) {
		global.inst_perso_partida[1].energia_atual -= habilidade.custo;
		scr_efeito_hab(global.inst_perso_partida[1], global.inst_perso_partida[0], habilidade);
	}
}