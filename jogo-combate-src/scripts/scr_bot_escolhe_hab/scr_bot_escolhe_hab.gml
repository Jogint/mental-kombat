/// @function scr_bot_escolhe_hab
/// @description Decide se o bot vai usar uma habilidade e qual delas
/// @param {Asset.GMObject|Id.Instance} _bot Instancia do bot
/// @param {Asset.GMObject|Id.Instance} _oponente Instancia do player
function scr_bot_escolhe_hab(_bot, _oponente){
	var _habs = _bot.habilidades;
	var _habs_indisponiveis = [];
	var _maior_score = [0, noone];
	var _hab_atual = {};
	var _score_atual;
	
	// ==================================================
	// AVALIA AS HABILIDADES DISPONÍVEIS
	// ==================================================
	for (var i = 0; i < array_length(_habs); i++) {
		_hab_atual = _habs[i];
		
		// ---------- VERIFICA USABILIDADE ----------
		if (_bot.energia_atual >= _hab_atual.custo) {
			_score_atual = score_hab(_hab_atual, _bot, _oponente);
			
			// ---------- ADICIONA COMO MELHOR POSSIBILIDADE ----------
			if (_score_atual > _maior_score[0]) {
				_maior_score[0] = _score_atual;
				_maior_score[1] = _hab_atual;
			}
			
		} else {
			array_push(_habs_indisponiveis, _hab_atual);
		}
	}
	
	// ==================================================
	// AVALIA AS HABILIDADES INDISPONÍVEIS
	// ==================================================
	if (array_length(_habs_indisponiveis) > 0) {
		
		// ---------- CALCULA ENERGIA DO PROX TURNO ----------
		var _energia_proxima = _bot.energia_atual;
		
		switch (global.dif_atual) {
			case global.niveis_dif[DIF.FACIL]:
				_energia_proxima += _bot.energia_total * 0.15;
			break;
			
			case global.niveis_dif[DIF.MEDIO]:
				_energia_proxima += _bot.energia_total * 0.225;
			break;
			
			case global.niveis_dif[DIF.DIFICIL]:
				_energia_proxima += _bot.energia_total * 0.30;
			break;
		}
		
		_energia_proxima = round(_energia_proxima);
		
		// ---------- VERIFICA SE PULAR É VANTAJOSO ----------
		for (var i = 0; i < array_length(_habs_indisponiveis); i++) {
			_hab_atual = _habs_indisponiveis[i];
			
			if (_energia_proxima >= _hab_atual.custo) {
				_score_atual = score_hab(_hab_atual, _bot, _oponente);
			
				// ---------- DECIDE PULAR ----------
				if (_score_atual >= _maior_score[0]) {
					_maior_score[0] = _score_atual;
					_maior_score[1] = global.tipos_hab[HABS.PULAR];
				}
			}
		}
	}
	
	return _maior_score[1];
}

/// @function score_hab
/// @description Atribui uma avaliação à habilidade
/// @param {struct} _hab_atual Qual a habilidade que será avaliada
/// @param {Asset.GMObject|Id.Instance} _bot Instância do bot
/// @param {Asset.GMObject|Id.Instance} _bot Instância do player
/// @return {struct}
function score_hab(_hab_atual, _bot, _oponente) {
	var _score_atual = 0;
	
	// Todos os números mágicos nesse switch são vozes da minha cabeça
	switch (_hab_atual.tipo) {
				
		case global.tipos_hab[HABS.ATAQUE]:
			_score_atual = 10;
			
			if (_hab_atual.valor_efeito >= _oponente.hp_atual) _score_atual += 1000;
		break;
				
		case global.tipos_hab[HABS.CURA]:
			_score_atual = 3;
			
			if (_bot.hp_atual <= _bot.hp_total * 0.3) _score_atual += 10;
			if (_bot.hp_atual >= _bot.hp_total * 0.8) _score_atual = -1;
		break;
				
		case global.tipos_hab[HABS.DRENA]:
			_score_atual = 6;
					
			if (_hab_atual.valor_efeito >= _oponente.hp_atual) _score_atual += 1000;
			if (_bot.hp_atual <= _bot.hp_total * 0.5) _score_atual += 5;
		break;
		
		case global.tipos_hab[HABS.PRORROGA]:
			_score_atual = 2;
		
			if (global.dif_atual == global.niveis_dif[DIF.DIFICIL]) _score_atual += 3;
		break;
				
		case global.tipos_hab[HABS.CONGELA]:
			_score_atual = 4;
		
			if (_oponente.energia_atual >= _oponente.energia_total * 0.6) _score_atual += 3;
		break;
				
		case global.tipos_hab[HABS.ENERGETICO]:
			_score_atual = 2;
		
			if (_bot.energia_atual <= _bot.energia_total * 0.5) _score_atual += 2;
					
			if (global.dif_atual == global.niveis_dif[DIF.MEDIO]) {
				_score_atual += 1;
			} else if (global.dif_atual == global.niveis_dif[DIF.DIFICIL]) {
				_score_atual += 2;
			}
			
			if (_bot.energia_atual == _bot.energia_total) _score_atual = -1;
		break;
	}
	
	return _score_atual;
}
