function scr_toggle_hab(hab_arr){
	if (!global.exibir_hab) {
		if (global.modo_jogo_atual != global.modos_jogo[2]) {
			global.exibir_hab = true;
			layer_set_visible("Opcoes", false);
		}
		var _camada_alvo = "Habilidades"; 

		for (var i = 0; i < array_length(hab_arr); i++) {
		    var _obj_a_criar = obj_habilidade;
    
		    // Define a posição para a nova instância. 
			var _x = 480;
			var _largura_desejada = 895 - _x;
			var _altura_desejada = 80;
			var _y = 200 + (i * (_altura_desejada + 30));
			
			if (global.modo_jogo_atual == global.modos_jogo[2]) {
				static _entradas = 0;
				
				if (_entradas < 4) {
					_x = 10;
					_entradas++;
				} else {
					_x = 1276;
					_entradas++;
				}
				
				if (_entradas == 7) _entradas = 0; // 7 equivale a 2 arrays de 0 a 3 índices
				
				_largura_desejada = _altura_desejada;
			}
    
		    // Cria a instância e guarda o ID dela na variável
		    var _nova_instancia = instance_create_layer(_x, _y, _camada_alvo, _obj_a_criar);
			array_push(global.hab_visiveis, _nova_instancia);
			
			// Atribui os efeitos
			with (_nova_instancia) {
				habilidade = {
					nome: hab_arr[i].nome,
					custo: hab_arr[i].custo,
					tipo: hab_arr[i].tipo,
					valor_efeito: hab_arr[i].valor_efeito,
				}
				scr_trocar_sprite(self, _largura_desejada, _altura_desejada, hab_arr[i].sprite);
			}
		}
	} else {
		layer_set_visible("Opcoes", true);
		while (array_length(global.hab_visiveis) > 0) {
			var _hab_removida = array_pop(global.hab_visiveis);
			instance_destroy(_hab_removida);
		}
		global.exibir_hab = false;
	}
}