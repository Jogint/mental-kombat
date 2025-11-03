/// @function scr_toggle_hab(hab_arr)
/// @description Exibe ou deleta as habilidades da tela
/// @param {Array} hab_arr Array que possui as habilidades a serem exibidas
function scr_toggle_hab(hab_arr){
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
	var _player_index = array_get_index(global.tipos_jogadores, global.jogador_atual) - 1;
	
	if (!global.exibir_hab) {
		if (!_is_rapido) {
			global.exibir_hab = true;
			layer_set_visible("Opcoes", false);
			
			if (_player_index >= 0){
				var _camada_alvo = "Habilidades";
				var _obj_a_criar = obj_pular_turno;
				var _nova_instancia = instance_create_layer(600, 630, _camada_alvo, _obj_a_criar);
			}
		}
		
		cria_instancias_hab(_is_rapido, hab_arr);
	} else {
		ocultar_hab();	
	}
}

/// @function cria_instancias_hab(_is_rapido, hab_arr)
function cria_instancias_hab(_is_rapido, hab_arr) {
	for (var i = 0; i < array_length(hab_arr); i++) {
		// ================ IMAGEM DAS HABILIDADES ================
		var _camada_alvo = "Habilidades";
		var _obj_a_criar = obj_habilidade;
		var _posi_e_tam = scr_define_tamanho_hab(i, _is_rapido, 300, 80, false); // 300 de espaçamento e 80 largura
		var _nova_instancia = instance_create_layer(_posi_e_tam[0], _posi_e_tam[1], _camada_alvo, _obj_a_criar);
		
		array_push(global.hab_visiveis, _nova_instancia);
		
		with (_nova_instancia) { // Atribui os efeitos ao novo objeto
			habilidade = hab_arr[i];
			scr_trocar_sprite(self, _posi_e_tam[2], _posi_e_tam[3], atribui_sprite_hab(hab_arr[i].tipo));
		}
		
		if (!_is_rapido) {
			// ================ FUNDO DAS HABILIDADES ================
			_camada_alvo = "FundoHabilidades";
			_obj_a_criar = obj_fundo_hab;
			_posi_e_tam = scr_define_tamanho_hab(i, false, 80, 300, true);
			_nova_instancia = instance_create_layer(_posi_e_tam[0], _posi_e_tam[1], _camada_alvo, _obj_a_criar);
		
			array_push(global.fundo_hab_visiveis, _nova_instancia);
		
			with (_nova_instancia) { // Atribui os efeitos ao novo objeto
				habilidade = hab_arr[i];
				scr_trocar_sprite(self, _posi_e_tam[2], _posi_e_tam[3], spr_hab_indisponivel);
			}
		}
	}
}

/// @function atribui_sprite_hab(tipo)
/// @description Acessa a sprite da categoria da habilidade
/// @param {String} tipo A categoria da habilidade em global.tipos_hab
/// @return {Asset.GMSprite}
function atribui_sprite_hab(tipo) {
	switch (tipo) {
		case global.tipos_hab[0]: // pular
			return spr_teste_opcao;
		case global.tipos_hab[1]: // dano
			return spr_hab_dano;
		case global.tipos_hab[2]: // cura
			return spr_hab_cura;
		case global.tipos_hab[3]: // dreno
			return spr_hab_dreno;
		case global.tipos_hab[4]: // prorroga
			return spr_hab_prorroga;
		case global.tipos_hab[5]: // acelera
			return spr_hab_acelera;
		case global.tipos_hab[6]: // energetico
			return spr_hab_energetico;
	}
}

/// @function ocultar_hab()
function ocultar_hab() {	
	for (var i = 0; i < array_length(global.hab_visiveis); i++) {
		instance_destroy(global.hab_visiveis[i]);
		if (array_length(global.fundo_hab_visiveis) > 0) {
			instance_destroy(global.fundo_hab_visiveis[i]);
		}
	}
	
	global.hab_visiveis = [];
	global.fundo_hab_visiveis = [];
	global.exibir_hab = false;
	if (instance_exists(obj_pular_turno)) instance_destroy(obj_pular_turno);
}
