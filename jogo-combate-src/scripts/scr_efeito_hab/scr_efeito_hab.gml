function scr_efeito_hab(obj, obj_inimigo, hab){
	show_debug_message(hab);
	
	switch (hab.tipo) {
		case global.tipos_hab[1]: //dano
			obj_inimigo.hp_atual -= hab.valor_efeito;
			if (obj_inimigo.hp_atual <= 0) {
				obj_inimigo.hp_atual = 0;
				global.partida_acabou = true;
			}
		case global.tipos_hab[2]: //cura
			if (obj.hp_atual < obj.hp_total) {
				obj.hp_atual += hab.valor_efeito;
				if (obj.hp_atual > obj.hp_total) obj.hp_atual = obj.hp_total;
			}
		default: // pulou
			scr_encerrar_turno();
			break;
	}
}