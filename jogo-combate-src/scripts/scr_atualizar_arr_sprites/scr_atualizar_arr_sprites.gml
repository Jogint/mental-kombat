/// @function scr_atualizar_arr_sprites()
/// @description Responsável por receber todas as sprites dos objetos em definir_globais
function scr_atualizar_arr_sprites(){
	global.arr_sprite_perso = [];
	
	for (var i = 0; i < array_length(global.todos_perso); i++) {
		var _obj_id = global.todos_perso[i];
		var _sprite_do_objeto = object_get_sprite(_obj_id);
		
		if (_sprite_do_objeto == -1) {
            if (i == 0) {
	            var _sprite_name = "spr_teste_player";
	        } else {
	            var _sprite_name = "spr_teste_player_" + string(i); 
	        }
        }
		
		array_push(global.arr_sprite_perso, _sprite_do_objeto);
	}
}