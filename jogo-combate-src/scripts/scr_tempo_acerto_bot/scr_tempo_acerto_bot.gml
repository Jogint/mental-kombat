/// @function scr_tempo_acerto_bot()
/// @description define o tempo que o bot leva pra responder a conta
/// @return {Real}
function scr_tempo_acerto_bot() {
	// TODO: Mudar para receber pergunta como argumento via obj_gestao_rodada
	var _tipo_pergunta = obj_gestao_rodada.pergunta_atual.conta;
	var _n1 = obj_gestao_rodada.pergunta_atual.n1;
	var _n2 = obj_gestao_rodada.pergunta_atual.n2;
	var _possui_1_digito = (_n1 < 10) || (_n2 < 10);
	var _unidade_simples = false;
	
	if (_n1 < 100 && _n2 < 100) { // caso passe a ter +100, não quebra o jogo
		_unidade_simples = (_n1 % 10) >= (_n2 % 10);
	}
	
	var _tempo_resposta = 0;
	var _tempo_base, _bonus;

	switch(_tipo_pergunta) {
		
		case global.operacoes[OPERACOES.MULT]: 
			_tempo_base = random_range(2, 4);
			_bonus = (_n1 * _n2) / 81; // Valor de 0 a 1, 81 = 9 x 9 (valor max)
			
			_tempo_resposta = round(_tempo_base + (_bonus * 2)); // Adiciona até 2s extras
		break;
		
		case global.operacoes[OPERACOES.DIVI]:
			_tempo_base = random_range(3, 6);
			_bonus = _n2 / 9; // Valor de 0 a 1, 9 é o valor max
			
			_tempo_resposta = round(_tempo_base + (_bonus * 2)); // Adiciona até 2s extras
		break;
		
		case global.operacoes[OPERACOES.SOMA]:
			if (_possui_1_digito) {
				_tempo_resposta = irandom_range(1, 5);
			} else {
				_tempo_resposta = irandom_range(4, 10);
			}
		break;
		
		case global.operacoes[OPERACOES.SUB]:
			if (_possui_1_digito || _unidade_simples) {
				_tempo_resposta = irandom_range(1, 6);
			} else {
				_tempo_resposta = irandom_range(6, 12);
			}
		break;
	}
	
	return _tempo_resposta;
}