/// @description Acertos bot

// ==================================================
// DURANTE A VEZ DO BOT OU MODO RÁPIDO
// ==================================================
if (!obj_gestao_rodada.partida_acabou &&
(controlador == global.tipos_jogadores[JOGADOR.BOT] ||
is_rapido)) {

	// ---------- CALCULAM A CHANCE DE ACERTO ----------
	var _chance = irandom_range(0, 100); // deve ser um valor entre 0 e 100
	var _bonus = 100; // começa em 100, vai reduzindo
	var _n1 = obj_gestao_rodada.pergunta_atual.n1;
	var _n2 = obj_gestao_rodada.pergunta_atual.n2;
	var _possui_1_digito = (_n1 < 10) || (_n2 < 10);
	
	var _pergunta_atual = obj_gestao_rodada.pergunta_atual;
	
	// ==================================================
	// BÔNUS POR QUESTÃO
	// ==================================================
	switch(_pergunta_atual.conta) {
		// todos os números são vozes da minha cabeça
		
		case global.operacoes[OPERACOES.MULT]:
		
			var _mult_zero = (_n1 == 0) || (_n2 == 0);
			var _mult_um = (_n1 == 1) || (_n2 == 1);
		
			if (_mult_zero) {
				_bonus -= 20;
			} else if (_mult_um) {
				_bonus = 100;
			} else {
				_bonus /= (_pergunta_atual.certo); // divide pelo resultado da mult, entre 0 e 81
			}
			
		break;
		
		case global.operacoes[OPERACOES.DIVI]:
			var _divi_um = _n2 == 1;
			
			_bonus /= _n1; // n1 é um valor entre 1 e 81
			if (_divi_um) _bonus = 100;
			
		break;
		
		case global.operacoes[OPERACOES.SOMA]:
		
			var _soma_redonda = (_n1 + _n2) % 10 == 0;
			
			if (_possui_1_digito) {
				_bonus /= ((min(_n1, _n2) + 1) / 1.5);
			} else if (_soma_redonda) {
				_bonus /= (min(_n1, _n2) + 1);
			} else {
				_bonus /= max(_n1, _n2);
			}
			
		break;
		
		case global.operacoes[OPERACOES.SUB]:
		
			var _mesma_unidade = (_n1 % 10) == (_n2 % 10);
			var _unidade_simples = (_n1 % 10) > (_n2 % 10);
		
			if (_mesma_unidade) {
				_bonus /= ((min(_n1, _n2) + 1) / 1.5);
			} else if (_possui_1_digito || _unidade_simples) {
				_bonus /= (min(_n1, _n2) + 1);
			} else {
				_bonus /= max(_n1, _n2);
			}
			
		break;
	}
	
	// ---------- CALCULO DO CORTE ----------
	var _i_dif = array_get_index(global.niveis_dif, global.dif_atual);
	var _min_para_acerto = 50;
	var _reducao_base = 15;
	_bonus -= clamp(((_reducao_base * 2) / (_i_dif + 1)), 0, 100);
	_chance = clamp((_chance + _bonus), 0, 100);
	var _corte = clamp(_min_para_acerto - (_reducao_base * _i_dif), 0, 100);
    var _bot_acertou_chance = (_chance >= _corte);

	// ---------- BOT ACERTOU ----------
    if (_bot_acertou_chance || is_rapido) {
        aumentar_energia();
		bot_marcou_opcao(true);
        
	// ---------- BOT ERROU ----------
    } else {
		bot_marcou_opcao(false);
        
    }
}
