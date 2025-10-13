/// @description Alterar pergunta
if (global.pergunta_atual != pergunta) {
	atualizar_dados();
}

// TODO: Desativa as opções se errar a pergunta
//if (global.errou_resposta) {
//	instance_deactivate();
//}