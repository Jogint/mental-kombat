/// @description Alterar pergunta
if (!instance_exists(obj_gestao_rodada)) exit;

if (obj_gestao_rodada.jogador_atual == global.tipos_jogadores[JOGADOR.P1]) {
	player_atual = global.inst_perso_partida[0]; // p1
} else {
	player_atual = global.inst_perso_partida[1]; // p2/bot
}

if (obj_gestao_rodada.pergunta_atual != pergunta) {
	atualizar_dados();
}

// Lógica para desligar o desenho do feedback após o tempo
if (tempo_feedback_bot > 0) {
    tempo_feedback_bot--;
    if (tempo_feedback_bot <= 0) {
        desenhar_circulo = false;
    }
}

//if (obj_gestao_rodada.errou_resposta) {
//	instance_deactivate();
//}