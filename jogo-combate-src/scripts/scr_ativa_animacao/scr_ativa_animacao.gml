/// @function scr_ativa_animacao(hab)
/// @description Efetua o inicio da animação do personagem
/// @param {Asset.GMObject|Id.Instance} obj Objeto que está atacando
/// @param {Struct|String} hab Qual habilidade foi selecionada
function scr_ativa_animacao(obj, hab){
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
	
	if (is_string(hab)) {
	    if (!_is_rapido) {
	        scr_toggle_hab([]);
	    }
		
		obj.estado_turno = ESTADOS_TURNO.FINALIZANDO;
	    return;
	}
	
	obj.energia_atual -= hab.custo;
	
	if (!_is_rapido) {
		scr_toggle_hab([]);
	}
	
	obj.sprite_index = hab.sprite;
	obj.animacao_em_uso = hab;
	obj.estado_turno = ESTADOS_TURNO.EXIBINDO_HAB
}