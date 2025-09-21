/// Chamada no obj_opcao_perso, que exibe os personagens disponíveis
function scr_config_selecao_perso(){
	static _vezes_chamado = 0;
	
	if (_vezes_chamado == array_length(global.arr_sprite_perso)) _vezes_chamado = 0;
	
	var _return_value = [global.arr_sprite_perso[_vezes_chamado], global.perso_disponiveis[_vezes_chamado]];
	
	_vezes_chamado++;
	
	return _return_value;
}