/// @function scr_tempo_acerto_bot()
/// @description define o tempo que o bot leva pra responder
/// @return {Real}
function scr_tempo_acerto_bot() {
	var _tipo_pergunta = global.pergunta_atual.conta;
	var _n1 = global.pergunta_atual.n1;
	var _n2 = global.pergunta_atual.n2;

	var _is_soma_ou_sub = (_tipo_pergunta == global.operacoes[OPERACOES.SOMA]) || (_tipo_pergunta == global.operacoes[OPERACOES.SUB]);
	var _possui_1_digito = (_n1 < 10) || (_n2 < 10);

	if (_is_soma_ou_sub && _possui_1_digito) {
		_tipo_pergunta += "_simples";
	}
	
	var _tempo_resposta = 0;
	if (global.modo_jogo_atual != global.modos_jogo[MODO.RAPIDO]) _tempo_resposta = 1;
	
	switch(_tipo_pergunta) {
		case "soma_simples": _tempo_resposta += irandom_range(1, 5); break;
		case "subtracao_simples": _tempo_resposta += irandom_range(1, 6); break; 
		case "multiplicacao": _tempo_resposta += irandom_range(3, 8); break; 
		case "divisao": _tempo_resposta += irandom_range(5, 10); break; 
		case "soma": _tempo_resposta += irandom_range(4, 12); break; 
		case "subtracao": _tempo_resposta += irandom_range(6, 15); break;
	}
	return _tempo_resposta;
}