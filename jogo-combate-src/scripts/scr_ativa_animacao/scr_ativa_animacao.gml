/// @function scr_ativa_animacao
/// @description Efetua o inicio da animação do personagem
/// @param {Asset.GMObject|Id.Instance} obj Objeto que está atacando
/// @param {Struct|String} _hab Qual habilidade foi selecionada

function scr_ativa_animacao(obj, _hab){
	var _chaves = variable_struct_get_names(_hab);
	
    if (array_length(_chaves) == 0) { // struct vazio = pulo
		obj.estado_turno = ESTADOS_TURNO.EXIBINDO_HAB;
	    return;
	}
	
	with (obj) {
		energia_atual -= _hab.custo;
		sprite_index = _hab.sprite;
		hab_em_uso = _hab;
		estado_turno = ESTADOS_TURNO.EXIBINDO_HAB
	}
	
}

// REMOVE: Cheio de atribuições indevidas aqui