/// @function scr_atribuir_alternativas()
/// @description Chamado em cada obj_opcao_resposta para atribuir um valor a si
/// @return {Array<Any>|Undefined} [0] é o número a ser exibido, [1] se ele é a opção correta
function scr_atribuir_alternativas(){
	var _alternativas = obj_gestao_rodada.pergunta_atual.opcoes;
	if (array_length(_alternativas) != global.qtd_alternativas) {
		show_error("Quantidade de alternativas no array diferente de " + global.qtd_alternativas, true);
		return;
	}
	
	static _vezes_chamado = 0;
	
	if (_vezes_chamado == global.qtd_alternativas) _vezes_chamado = 0;
	
	var _return_value = _alternativas[_vezes_chamado];
	
	_vezes_chamado++;
	
	var _is_correta = (_return_value == obj_gestao_rodada.pergunta_atual.correto);
	
	return [_return_value, _is_correta];
}