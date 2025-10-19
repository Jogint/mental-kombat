/// @function scr_selecionou_perso(obj)
/// @description Define o personagem como selecionado (insere no array global.perso_atuais)
/// @param {Asset.GMObject|Id.Instance} obj Objeto do personagem que foi selecionado
function scr_selecionou_perso(obj){
	// Adiciona o personagem no array
	if (global.modo_jogo_atual == global.modos_jogo[1]) {
		global.perso_atuais[0] = obj;
	} else {
		var _next_char = array_get_index(global.perso_atuais, noone)
		if (_next_char >= 0) {
			global.perso_atuais[_next_char] = obj;
			global.ultimo_selecionado = noone;
		}
	}
}