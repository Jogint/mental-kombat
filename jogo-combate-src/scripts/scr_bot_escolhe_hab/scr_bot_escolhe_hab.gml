/// @function scr_bot_escolhe_hab
/// @description Decide se o bot vai usar uma habilidade e qual delas
/// @param {GMObject|Instance.Id} _bot Instancia do bot
/// @param {GMObject|Instance.Id} _oponente Instancia do player
function scr_bot_escolhe_hab(_bot, _oponente){
	var _habs = _bot.habilidades;
	var _habs_indisponiveis = [];
	var _maior_score = [0, noone];
	var _hab_atual = {};
	var _score_atual;
	
	for (var i = 0; i < array_length(_habs); i++) {
		_hab_atual = _habs[i];
		
		if (_bot.energia_atual >= _hab_atual.custo) {
			_score_atual = score_hab(_hab_atual, _bot, _oponente);
			
			if (_score_atual > _maior_score[0]) {
				_maior_score[0] = _score_atual;
				_maior_score[1] = _hab_atual;
			}
			
		} else {
			array_push(_habs_indisponiveis, _hab_atual);
		}
	}
	
	if (array_length(_habs_indisponiveis) > 0) {
		
		var _energia_proxima = _bot.energia_atual + _bot.energia_total * 0.25
		
		for (var i = 0; i < array_length(_habs_indisponiveis); i++) {
			_hab_atual = _habs_indisponiveis[i];
			
			if (_energia_proxima >= _hab_atual.custo) {
				_score_atual = score_hab(_hab_atual, _bot, _oponente);
			
				if (_score_atual > _maior_score[0]) {
					_maior_score[0] = _score_atual;
					_maior_score[1] = global.tipos_hab[HABS.PULAR];
				}
			}
		}
	}
	
	ultima_hab_usada = _maior_score[1]; // TODO: justificar essa var aqui
	
	if (ultima_hab_usada == global.tipos_hab[HABS.PULAR]) return;
	
	if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
		scr_ativa_animacao(global.inst_perso_partida[1], ultima_hab_usada);
		return;
	}
	
	alarm[1] = game_get_speed(gamespeed_fps);
}

function score_hab(_hab_atual, _bot, _oponente) {
	var _score_atual = 0;
	
	// Todos os números mágicos nesse switch são vozes da minha cabeça
	switch (_hab_atual.tipo) {
				
		case global.tipos_hab[HABS.ATAQUE]:
			_score_atual = 10;
			
			if (_hab_atual.valor >= _oponente.hp_atual) _score_atual += 1000;
		break;
				
		case global.tipos_hab[HABS.CURA]:
			_score_atual = 3;
			
			if (_bot.hp_atual <= _bot.hp_total * 0.3) _score_atual += 10;
			if (_bot.hp_atual >= _bot.hp_total * 0.8) _score_atual = -1;
		break;
				
		case global.tipos_hab[HABS.DRENA]:
			_score_atual = 6;
					
			if (_bot.hp_atual <= _bot.hp_total * 0.5) _score_atual += 5;
		break;
		
		case global.tipos_hab[HABS.PRORROGA]:
			_score_atual = 2;
		
			if (global.dif_atual == global.niveis_dif[DIF.DIFICIL]) _score_atual += 3;
		break;
				
		case global.tipos_hab[HABS.ACELERA]:
			_score_atual = 4;
		
			if (_oponente.energia_atual >= _oponente.energia_total * 0.6) _score_atual += 3;
		break;
				
		case global.tipos_hab[HABS.ENERGETICO]:
			_score_atual = 2;
		
			if (_bot.energia_atual <= _bot.energia_total * 0.5) _score_atual += 2;
					
			if (global.dif_atual == global.niveis_dif[DIF.MEDIO]) {
				_score_atual += 2;
			} else if (global.dif_atual == global.niveis_dif[DIF.DIFICIL]) {
				_score_atual += 3;
			}
			
			if (_bot.energia_atual == _bot.energia_total) _score_atual = -1;
		break;
	}
	
	return _score_atual;
}
