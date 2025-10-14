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
		if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O tempo inimigo deve reduzir em até 0.5. Recebeu " + string(hab.valor_efeito), true);
			obj_inimigo.alterou_tempo = hab.valor_efeito;
			break;
		case global.tipos_hab[6]: // energetico
			if (hab.valor_efeito > 2 || hab.valor_efeito < 1.1) show_error("O ganho energético deve aumentar em até 2.0. Recebeu " + string(hab.valor_efeito), true);
			// no próximo turno, o player ganha um aumento de hab.valor_efeito no seu energia_por_acerto
			break;
	}
	if (global.modo_jogo_atual != global.modos_jogo[2]) scr_encerrar_turno();
}

function efetua_dano(inimigo, valor) {
	inimigo.hp_atual -= valor;
	if (inimigo.hp_atual <= 0) {
		inimigo.hp_atual = 0;
		global.partida_acabou = true;
	}
}

function aumenta_vida(obj, valor) {
	obj.hp_atual += valor;
	if (obj.hp_atual > obj.hp_total) obj.hp_atual = obj.hp_total;
}