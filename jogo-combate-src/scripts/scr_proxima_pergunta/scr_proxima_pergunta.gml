/// @function scr_proxima_pergunta()
/// @description Altera a obj_gestao_rodada.pergunta_atual para a próxima do array
function scr_proxima_pergunta(){
	static _index_pergunta = 0;
	
	if (_index_pergunta  >= array_length(obj_gestao_rodada.perguntas_geradas)) {
		_index_pergunta = 0;
	    obj_gestao_rodada.perguntas_geradas = scr_gerar_perguntas();
	}
	
	obj_gestao_rodada.pergunta_atual = obj_gestao_rodada.perguntas_geradas[_index_pergunta];
	_index_pergunta++;
}