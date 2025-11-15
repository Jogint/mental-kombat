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
	var _pergunta_atual = obj_gestao_rodada.pergunta_atual;
	var _n1 = _pergunta_atual.n1;
	var _n2 = _pergunta_atual.n2;
	var _n1_eh_zero = (_n1 == 0);
	var _n2_eh_zero = (_n2 == 0);
	var _add_um = 0;
	if (_n1_eh_zero || _n2_eh_zero) _add_um = 1;
	var _possui_1_digito = (_n1 < 10) || (_n2 < 10);
	
	
	
	// ==================================================
	// BÔNUS POR QUESTÃO
	// ==================================================
	switch(_pergunta_atual.conta) {

	    case global.operacoes[OPERACOES.MULT]:
			var _mult_zero = false;
	        var _mult_um = (_n1 == 1) || (_n2 == 1);
			
			if (_n1_eh_zero) {
				if (array_get_index(_pergunta_atual.opcoes, _n2) >= 0) _mult_zero = true;
			} else if (_n2_eh_zero) {
				if (array_get_index(_pergunta_atual.opcoes, _n1) >= 0) _mult_zero = true;
			}
			
    
	        if (_mult_zero) {
	            _bonus -= 80; // Bonus: 20
	        } else if (_mult_um) {
	            _bonus = 100; // Bonus: 100
	        } else {
	            _bonus /= (sqrt(_pergunta_atual.correto) + _add_um); // Bonus: 100 - 11
	        }
	    break;
    
	    case global.operacoes[OPERACOES.DIVI]:
	        var _divi_um = _n2 == 1;
        
	        if (_divi_um) {
	            _bonus = 100; // Bonus: 100
	        } else {
	            _bonus /= (sqrt(_n1) + _add_um); // Bonus: 100 - 11
	        }
	    break;
    
	    case global.operacoes[OPERACOES.SOMA]:
	        var _soma_redonda = (_n1 + _n2) % 10 == 0;
        
	        if (_possui_1_digito || _soma_redonda) {
	            _bonus /= (sqrt(min(_n1, _n2)) + _add_um); // Bonus: 100 - 14
	        } else {
	            _bonus /= (sqrt(max(_n1, _n2)) + _add_um); // Bonus: 100 - 14
	        }
	    break;
    
	    case global.operacoes[OPERACOES.SUB]:
	        var _mesma_unidade = (_n1 % 10) == (_n2 % 10);
	        var _unidade_simples = (_n1 % 10) > (_n2 % 10);
    
	        if (_mesma_unidade || _unidade_simples || _possui_1_digito) {
	            _bonus /= (sqrt(min(_n1, _n2)) + _add_um); // Bonus: 100 - 14
	        } else {
	            _bonus /= (sqrt(max(_n1, _n2)) + _add_um); // Bonus: 100 - 14
	        }
	    break;
	}
	
	// ---------- CALCULO DO CORTE ----------
	var _i_dif = array_get_index(global.niveis_dif, global.dif_atual);
	var _min_para_acerto = 50;
	var _reducao_base = 10;
	_bonus -= clamp(((_reducao_base * 2) / (_i_dif + 1)), 0, 100); // Bonus: 60 - 0
	_chance = clamp((_chance + _bonus), 0, 100);
	var _corte = clamp(_min_para_acerto - (_reducao_base * _i_dif), 0, 100); // Corte: 50 - 10
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
