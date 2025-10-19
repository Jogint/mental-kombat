/// @function scr_proxima_pergunta()
/// @description Altera a global.pergunta_atual para a próxima do array
function scr_proxima_pergunta(){
	static _index_pergunta = 0;
	
	if (_index_pergunta  >= array_length(global.perguntas_geradas)) {
		_index_pergunta = 0;
	    global.perguntas_geradas = scr_gerar_perguntas();
	}
	
	global.pergunta_atual = global.perguntas_geradas[_index_pergunta];
	_index_pergunta++;
}