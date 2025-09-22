function scr_encerrar_turno(){
	scr_toggle_hab([]);
	scr_trocar_turno();
	scr_proxima_pergunta();
	show_debug_message("trocou turno para: " + global.jogador_atual);
	global.turno_iniciou = false;
}