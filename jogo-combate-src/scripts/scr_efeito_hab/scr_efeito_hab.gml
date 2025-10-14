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
			obj.alterou_tempo[0] = global.tipos_hab[4];
			obj.alterou_tempo[1] = hab.valor_efeito;
			break;
		case global.tipos_hab[5]: // atrasa
			obj.alterou_tempo[0] = global.tipos_hab[5];
			obj.alterou_tempo[1] = hab.valor_efeito;
			break;
		case global.tipos_hab[6]: // energetico
			// codar
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