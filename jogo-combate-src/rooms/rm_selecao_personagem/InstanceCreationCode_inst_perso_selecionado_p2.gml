if (global.modo_jogo_atual == global.modos_jogo[MODO.HIST]) { //puxa dados da seleção em trilha
	scr_trocar_sprite(self, 65*5, 65*5, object_get_sprite(global.perso_atuais[1]));
}