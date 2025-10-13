/// chamado em obj_personagem_pai, scr_encerrar_turno e scr_acerto_bot ao acertar a resposta
function scr_proxima_pergunta(){
	static _index_pergunta = 0;
	
	if (_index_pergunta  >= array_length(global.perguntas_geradas)) {
		_index_pergunta = 0;
	    global.perguntas_geradas = scr_gerar_perguntas();
	}
	
	global.pergunta_atual = global.perguntas_geradas[_index_pergunta];
	_index_pergunta++;
	//show_debug_message(global.pergunta_atual);
}