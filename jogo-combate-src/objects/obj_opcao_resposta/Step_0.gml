/// @description Alterar pergunta
if (global.pergunta_atual != pergunta) {
	atualizar_dados();
}

// Lógica para desligar o desenho do feedback após o tempo
if (tempo_feedback_bot > 0) {
    tempo_feedback_bot--;
    if (tempo_feedback_bot <= 0) {
        desenhar_circulo = false;
    }
}

//if (global.errou_resposta) {
//	instance_deactivate();
//}