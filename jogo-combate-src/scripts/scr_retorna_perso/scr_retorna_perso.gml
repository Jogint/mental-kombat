function scr_retorna_perso(pular_primeiro){
	static _vezes_chamado = 0;
	
	if(is_undefined(pular_primeiro)) {
		pular_primeiro = false;
	}
	
	if (_vezes_chamado == array_length(global.arr_sprite_perso)) _vezes_chamado = 0;
	if (pular_primeiro && _vezes_chamado == 0) _vezes_chamado = 1;
		
	var _return_value = [global.arr_sprite_perso[_vezes_chamado], global.todos_perso[_vezes_chamado]];
	
	_vezes_chamado++;
	
	return _return_value;
}