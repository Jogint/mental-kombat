draw_self();

var _texto;

if (global.modo_jogo_atual == global.modos_jogo[MODO.HIST]) { // historia
	_texto = "Próximo";
	
} else { // default
	
	_texto = "Jogar novamente";
}

draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text(x, y, _texto);

scr_reset_draw();