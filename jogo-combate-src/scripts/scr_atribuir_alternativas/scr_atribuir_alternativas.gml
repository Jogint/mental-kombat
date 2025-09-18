function scr_atribuir_alternativas(){
	var alternativas = global.pergunta_atual.opcoes;
	if (array_length(alternativas) != global.qtd_alternativas) {
		show_error("Quantidade de alternativas no array diferente de " + global.qtd_alternativas, true);
		return;
	}
	
	static _vezes_chamado = 0;
	
	if (_vezes_chamado == global.qtd_alternativas) _vezes_chamado = 0;
	
	var _return_value = alternativas[_vezes_chamado];
	
	_vezes_chamado++;
	
	var _is_correta = (_return_value == global.pergunta_atual.correto);
	
	return [_return_value, _is_correta];
}