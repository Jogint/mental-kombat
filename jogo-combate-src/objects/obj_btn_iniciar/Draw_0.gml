draw_self();
draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

sprite_index = spr_btn_menu;

var _texto = "Jogar!";

if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
	if (!global.tem_modo_rapido) {
		_texto = "Vença modo história";
		sprite_index = spr_btn_menu_bloqueado;
	}
}

draw_text(x, y, _texto);
	
scr_reset_draw();
