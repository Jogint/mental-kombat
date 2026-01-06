// ==================================================
/// @description Desenha texto do botão
// ==================================================

var _texto = "Jogar!";

// ---------- Verifica bloqueio do modo rápido ----------
if (global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO]) {
	if (!global.tem_modo_rapido) {
		_texto = "Vença modo história";
		shader_set(shd_grayscale);
	}
}

draw_self();
shader_reset();

draw_set_color(c_black);
draw_set_font(fnt_principal);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text(x, y, _texto);
	
scr_reset_draw();