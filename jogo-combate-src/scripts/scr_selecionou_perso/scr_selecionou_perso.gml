/// Chamado no obj_btn_avancar em rm_selecao
function scr_selecionou_perso(obj){
	// Adiciona o personagem no array
	if (global.modo_jogo_atual == global.modos_jogo[1]) {
		global.perso_atuais[0] = obj;
	} else {
		var _next_char = array_get_index(global.perso_atuais, noone)
		if (_next_char >= 0) {
			global.perso_atuais[_next_char] = obj;
			global.ultimo_selecionado = "";
		}
	}
}