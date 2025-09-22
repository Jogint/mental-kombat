/// @description Alterar pergunta
if (global.pergunta_atual != pergunta) {
	atualizar_dados();
}

// Deleta as opções se errar a pergunta
//if (global.errou_resposta) {
//	instance_destroy();
//}

// Altera a sprite enquanto selecionado NO TURNO DO PLAYER

else {
    sprite_index = spr_teste_opcao;
}
