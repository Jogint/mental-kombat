/// Chamado em scr_definir_globais e; TODO ao terminar uma fase no modo história 
function scr_atualizar_arr_sprites(){
	global.arr_sprite_perso = [];
	
	for (var i = 0; i < array_length(global.perso_disponiveis); i++) {
		var _obj_id = global.perso_disponiveis[i];
		var _sprite_do_objeto = object_get_sprite(_obj_id);
		
		array_push(global.arr_sprite_perso, _sprite_do_objeto);
	}
}