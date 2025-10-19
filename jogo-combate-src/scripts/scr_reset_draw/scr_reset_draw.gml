/// @function scr_reset_draw()
/// @description Volta os dados de cor, alinhamento, transparência e fonte ao padrão
function scr_reset_draw(){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_set_font(fnt_principal);
}