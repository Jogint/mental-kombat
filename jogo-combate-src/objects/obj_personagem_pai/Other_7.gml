/// @description Encerra o turno
if (room == rm_selecao_personagem) exit;

// CASO A ANIMAÇÃO SEJA UMA DAS HABILIDADES
if (sprite_index == habilidades[0].sprite ||
sprite_index == habilidades[1].sprite ||
sprite_index == habilidades[2].sprite) {
	
	var _oponente = 0;
	if (array_get_index(global.inst_perso_partida, id) == 0) _oponente = 1;
	
	efeito_hab(self, global.inst_perso_partida[_oponente], animacao_em_uso);
	
    sprite_index = sprite_padrao;
    image_index = 0; 
    image_speed = 1;
	
	if (global.inst_perso_partida[0].hp_atual <= 0) {
		global.inst_perso_partida[0].hp_atual = 0;
		global.partida_acabou = true;
	}
	
	if (global.inst_perso_partida[1].hp_atual <= 0) {
		global.inst_perso_partida[1].hp_atual = 0;
		global.partida_acabou = true;
	}
	
	animacao_em_uso = noone;
	scr_encerrar_turno();
}

/// @function efeito_hab(obj, obj_inimigo, hab)
/// @description Efetua o efeito da habilidade nos personagens
/// @param {Asset.GMObject|Id.Instance} obj Objeto que está atacando
/// @param {Asset.GMObject|Id.Instance} obj_inimigo Objeto que está sofrendo o ataque
/// @param {Struct|String} hab Qual habilidade foi selecionada
function efeito_hab(obj, obj_inimigo, hab){
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
	
	if (is_string(hab)) {
	    if (!_is_rapido) {
	        scr_toggle_hab([]);
	        scr_encerrar_turno();
	    }
	    return;
	}
	
	switch (hab.tipo) {
		case global.tipos_hab[1]: // dano
			efetua_dano(obj_inimigo, hab.valor_efeito);
			break;
		case global.tipos_hab[2]: // cura
			aumenta_vida(obj, hab.valor_efeito);
			break;
		case global.tipos_hab[3]: // dreno
			efetua_dano(obj_inimigo, hab.valor_efeito);
			if (obj_inimigo.hp_atual > 0) aumenta_vida(obj, hab.valor_efeito);
			break;
		case global.tipos_hab[4]: // prorroga
			if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O tempo deve aumentar em até 2.0 e maior que 1. Recebeu " + string(hab.valor_efeito), true);
			obj.efeitos[0] = hab.valor_efeito;
			break;
		case global.tipos_hab[5]: // acelera
		if (hab.valor_efeito >= 1 || hab.valor_efeito < 0.5) show_error("O tempo inimigo deve reduzir em até 0.5 e ser menor que 1. Recebeu " + string(hab.valor_efeito), true);
			obj_inimigo.efeitos[0] = hab.valor_efeito;
			break;
		case global.tipos_hab[6]: // energetico
			if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O ganho energético deve aumentar em até 2.0 e ser maior que 1. Recebeu " + string(hab.valor_efeito), true);
			obj.efeitos[1] = hab.valor_efeito;
			break;
	}
}

/// @function efetua_dano(_inimigo, _valor)
/// @param {Asset.GMObject|Id.Instance} _inimigo Objeto que está sofrendo o ataque
/// @param {Real} _valor Quanto dano será recebido
function efetua_dano(_inimigo, _valor) {
	_inimigo.hp_atual -= _valor;
}

/// @function aumenta_vida(_obj, _valor)
/// @param {Asset.GMObject|Id.Instance} _obj Objeto que está recebendo cura
/// @param {Real} _valor Quanto cura será recebido
function aumenta_vida(_obj, _valor) {
	_obj.hp_atual += _valor;
	if (_obj.hp_atual > _obj.hp_total) _obj.hp_atual = _obj.hp_total;
}