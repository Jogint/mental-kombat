/// @function scr_retorna_perso(_is_selecao_inimigo)
/// @description Atribui valores ao obj_opcao_inimigo (trilha) e obj_opcao_perso (selecao)
/// @param {bool} _is_selecao_inimigo Se o objeto chamando a função é o obj_opcao_inimigo
/// @return {Array<Any>} [sprite, objeto]
function scr_retorna_perso(_is_selecao_inimigo){
	static _vezes_chamado = 0;
	
	if(is_undefined(_is_selecao_inimigo)) {
		_is_selecao_inimigo = false;
	}
	
	if (_vezes_chamado == array_length(global.miniaturas_perso)) _vezes_chamado = 0;
	if (_is_selecao_inimigo && _vezes_chamado == 0) _vezes_chamado = 2; // ignora os personagens iniciais 
		
	var _return_value = [global.miniaturas_perso[_vezes_chamado], global.todos_perso[_vezes_chamado]];
	
	_vezes_chamado++;
	
	return _return_value;
}