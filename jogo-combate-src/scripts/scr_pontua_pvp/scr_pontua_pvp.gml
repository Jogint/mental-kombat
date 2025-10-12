function scr_pontua_pvp(){
	var _i = array_get_index(global.tipos_jogadores, global.quem_venceu) - 1;
	if (_i >= 0 && _i < array_length(global.pontuacao_pvp)) global.pontuacao_pvp[_i]++;
}