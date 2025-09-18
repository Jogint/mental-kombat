/// @description Alterar pergunta
if (global.pergunta_atual != pergunta) {
	atualizar_dados();
}

// Deleta as opções se errar a pergunta
//if (global.errou_resposta) {
//	instance_destroy();
//}

// Altera a sprite enquanto selecionado NO TURNO DO PLAYER
if (global.jogador_atual != global.jogadores[0] && mouse_check_button(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        sprite_index = spr_teste_opcao_1; 
    } else {
        sprite_index = spr_teste_opcao; 
    }
}
else {
    sprite_index = spr_teste_opcao;
}
