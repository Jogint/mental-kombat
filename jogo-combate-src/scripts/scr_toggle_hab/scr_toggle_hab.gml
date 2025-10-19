/// @function scr_toggle_hab(hab_arr)
/// @description Exibe ou deleta as habilidades da tela
/// @param {Array} hab_arr Array que possui as habilidades a serem exibidas
function scr_toggle_hab(hab_arr){
	var _is_modo_rapido = global.modo_jogo_atual == global.modos_jogo[2];
	
	if (!global.exibir_hab) {
		if (!_is_modo_rapido) {
			global.exibir_hab = true;
			layer_set_visible("Opcoes", false);
		}
		
		cria_instancias_hab(_is_modo_rapido, hab_arr);
	} else {
		ocultar_hab();	
	}
}

/// @function define_tamanho_habilidades(_is_rapido, i)
/// @return {Array<Real>} [x, y, largura, altura]
function define_tamanho_habilidades(_is_rapido, i) {
	var _x = 480;
	var _largura_desejada = 895 - _x;
	var _altura_desejada = 80;
	var _y = 200 + (i * (_altura_desejada + 30));
			
	if (_is_rapido) { // chamado apenas 1x por partida, rodando obrigatóriamente 8 vezes
		static _entradas = 0;
				
		if (_entradas < 4) {
			_x = 10;
			_entradas++;
		} else {
			_x = 1276;
			_entradas++;
		}
		
		if (_entradas == 8) _entradas = 0; // Todos os dois arrays foram percorridos
		
		_largura_desejada = _altura_desejada;
	}
	
	return [_x, _y, _largura_desejada, _altura_desejada];
}

/// @function cria_instancias_hab(_is_rapido)
function cria_instancias_hab(_is_rapido, hab_arr) {
	for (var i = 0; i < array_length(hab_arr); i++) {
		var _camada_alvo = "Habilidades";
		var _obj_a_criar = obj_habilidade;
		var _posi_e_tam = define_tamanho_habilidades(_is_rapido, i); // posição e tamanhos
		var _nova_instancia = instance_create_layer(_posi_e_tam[0], _posi_e_tam[1], _camada_alvo, _obj_a_criar);
		
		array_push(global.hab_visiveis, _nova_instancia);
		
		with (_nova_instancia) { // Atribui os efeitos ao novo objeto
			habilidade = {
				nome: hab_arr[i].nome,
				custo: hab_arr[i].custo,
				tipo: hab_arr[i].tipo,
				valor_efeito: hab_arr[i].valor_efeito,
				animacao: hab_arr[i].animacao,
			}
			
			scr_trocar_sprite(self, _posi_e_tam[2], _posi_e_tam[3], hab_arr[i].sprite);
		}
	}
}

/// @function ocultar_hab()
function ocultar_hab() {	
	for (var i = 0; i < array_length(global.hab_visiveis); i++) {
		instance_destroy(global.hab_visiveis[i]);
	}
	
	global.hab_visiveis = [];	
	global.exibir_hab = false;
}
