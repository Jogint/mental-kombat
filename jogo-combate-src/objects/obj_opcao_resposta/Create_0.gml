atualizar_dados();

function atualizar_dados() {
	pergunta = global.pergunta_atual;
	valor_botao = scr_atribuir_alternativas();
	numero = valor_botao[0];
	is_certo = valor_botao[1];
	show_debug_message(valor_botao);
	sprite_index = spr_teste_opcao;
}