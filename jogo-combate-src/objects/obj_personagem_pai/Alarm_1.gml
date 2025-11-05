/// @description Exibir escolha bot


//var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];

//if (_is_rapido) {

    altera_sprite_hab(spr_hab_selecionada); // no momento, ambos os modos usam esse
	
//} else {

	// TODO: Criar uma sprite de confirmação para o obj_fundo_hab
	// ?: Usar o sprite_get_height/width dela para definir o fundo na global de tamanhos
	
//}

//2 Segundos mostrando a sprite de confirmação do bot. tbm presente em scr_bot_escolhe_hab
alarm[2] = 2 * game_get_speed(gamespeed_fps);