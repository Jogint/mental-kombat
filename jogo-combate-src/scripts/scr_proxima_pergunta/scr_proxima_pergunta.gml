function scr_proxima_pergunta(){
	static _index_pergunta = 0;
	if (global.pergunta_atual >= array_length(global.perguntas_geradas) - 1) {
		global.perguntas_geradas = scr_gerar_perguntas();
		_index_pergunta = 0
	}
	global.pergunta_atual = global.perguntas_geradas[_index_pergunta];
	_index_pergunta++
	show_debug_message(global.pergunta_atual);
}