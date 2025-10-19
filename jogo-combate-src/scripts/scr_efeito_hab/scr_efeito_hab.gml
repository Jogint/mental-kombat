/// @function scr_efeito_hab(obj, obj_inimigo, hab)
/// @description Efetua o efeito da habilidade nos personagens
/// @param {Asset.GMObject|Id.Instance} obj Objeto que está atacando
/// @param {Asset.GMObject|Id.Instance} obj_inimigo Objeto que está sofrendo o ataque
/// @param {Struct} hab Qual habilidade foi selecionada
function scr_efeito_hab(obj, obj_inimigo, hab){
	switch (hab.tipo) {
		case global.tipos_hab[1]: // dano
			efetua_dano(obj_inimigo, hab.valor_efeito);
			break;
		case global.tipos_hab[2]: // cura
			aumenta_vida(obj, hab.valor_efeito);
			break;
		case global.tipos_hab[3]: // drena
			efetua_dano(obj_inimigo, hab.valor_efeito);
			if (obj_inimigo.hp_atual > 0) aumenta_vida(obj, hab.valor_efeito);
			break;
		case global.tipos_hab[4]: // prorroga
			show_debug_message(hab);
			show_debug_message(hab.valor_efeito);
			if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O tempo deve aumentar em até 2.0 e maior que 1. Recebeu " + string(hab.valor_efeito), true);
			obj.alterou_tempo = hab.valor_efeito;
			break;
		case global.tipos_hab[5]: // atrasa
		if (hab.valor_efeito >= 1 || hab.valor_efeito < 0.5) show_error("O tempo inimigo deve reduzir em até 0.5 e ser menor que 1. Recebeu " + string(hab.valor_efeito), true);
			obj_inimigo.alterou_tempo = hab.valor_efeito;
			break;
		case global.tipos_hab[6]: // energetico
			if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O ganho energético deve aumentar em até 2.0 e ser maior que 1. Recebeu " + string(hab.valor_efeito), true);
			// no próximo turno, o player ganha um aumento de hab.valor_efeito no seu energia_por_acerto
			break;
	}
	if (global.modo_jogo_atual != global.modos_jogo[2]) {
		scr_toggle_hab([]);
		if (hab.animacao == 0) {
			scr_encerrar_turno();
		} else {
			obj.alarm[3] = hab.animacao * game_get_speed(gamespeed_fps);
		}
	}
}

/// @function efetua_dano(_inimigo, _valor)
/// @param {Asset.GMObject|Id.Instance} _inimigo Objeto que está sofrendo o ataque
/// @param {Real} _valor Quanto dano será recebido
function efetua_dano(_inimigo, _valor) {
	_inimigo.hp_atual -= _valor;
	if (_inimigo.hp_atual <= 0) {
		_inimigo.hp_atual = 0;
		global.partida_acabou = true;
	}
}

/// @function efetua_dano(_inimigo, _valor)
/// @param {Asset.GMObject|Id.Instance} _obj Objeto que está recebendo cura
/// @param {Real} _valor Quanto cura será recebido
function aumenta_vida(_obj, _valor) {
	_obj.hp_atual += _valor;
	if (_obj.hp_atual > _obj.hp_total) _obj.hp_atual = _obj.hp_total;
}