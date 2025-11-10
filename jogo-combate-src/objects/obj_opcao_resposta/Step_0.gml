// ==================================================
/// @description Configura opcoes
// ==================================================

if (!instance_exists(obj_gestao_rodada)) exit; // evita erros, por consultar diretamente o obj

// ---------- Identifica quem joga ----------
// TODO: Transformar player atual NA INSTÂNCIA
if (obj_gestao_rodada.jogador_atual == global.tipos_jogadores[JOGADOR.P1]) {
	player_atual = global.inst_perso_partida[0]; // p1
} else {
	player_atual = global.inst_perso_partida[1]; // p2/bot
}

// ---------- Reconhece mudança de pergunta ----------
if (obj_gestao_rodada.pergunta_atual != pergunta) {
	atualizar_dados();
}

// ==================================================
// Gerencia a exibição do cículo de selecionado
// ==================================================

opcao_selecionada();

if (tempo_feedback_bot > 0) {
    tempo_feedback_bot--;
    if (tempo_feedback_bot <= 0) {
		
		if (bot_acertou) {
			scr_proxima_pergunta();
			player_atual.set_bot_responde(player_atual);
		} else {
			bot_acertou = true;
		}
		
        desenhar_circulo = false;
    }
}

//if (obj_gestao_rodada.errou_resposta) {
//	instance_deactivate();
//}