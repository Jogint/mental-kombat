/// @function atualizar_dados()
/// @description Altera a opção de resposta quando troca de pergunta
function atualizar_dados() {
	pergunta = global.pergunta_atual;
	valor_botao = scr_atribuir_alternativas();
	numero = valor_botao[0];
	is_certo = valor_botao[1];
	sprite_index = spr_teste_opcao;
}

atualizar_dados();