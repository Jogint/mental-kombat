/// @description Variáveis
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

controlador = global.tipos_jogadores[1]; //alterado em scr_inserir_players
meu_turno = false;
bot_executou = false;
definiu_hab = false;
efeitos = [1, 1, 0]; // acelera/atrasa, energia, coutdown energia
habilidades = []; // objetos filho definem as habilidades
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab
pausa_animacao = true;
sprite_padrao = object_get_sprite(object_index);
global.partida_acabou = false;

/// @function aumentar_energia()
/// @description Aumenta a energia atual do personagem com base em `energia_por_acerto`,
/// limitando ao máximo `energia_total`.
function aumentar_energia() {
	// Considerar se existe buff nos proximos 10 segundos
	if (efeitos[1] > 1) {
		if (efeitos[2] <= 0) {
			efeitos[2] += 10 * game_get_speed(gamespeed_fps);
		} else {
			efeitos[2]--;
		}
		
		if (efeitos[2] <= 0 ) {
			efeitos[1] = 1;
			efeitos[2] = 0;
		}
	}
	
    energia_atual += round(energia_por_acerto * efeitos[1]);
    if (energia_atual >= energia_total) {
        energia_atual = energia_total;
    }
}

/// @function bot_ataca()
/// @description Executa o ataque do bot iniciando um alarme que aguarda antes de responder.
/// Só dispara se `bot_executou` ainda for false.
function bot_ataca() {
    if (!bot_executou && controlador == global.tipos_jogadores[0]) {
        bot_executou = true;
        var _tempo_para_responder = scr_tempo_acerto_bot(); // segundos antes de responder
		//show_debug_message("Bot irá responder em " + string(_tempo_para_responder));
        alarm[0] = _tempo_para_responder * game_get_speed(gamespeed_fps);
    }
}

/// @function altera_sprite_hab(sprite_mudada)
/// @description Muda a sprite da habilidade selecionada dentre `global.hab_visiveis`,
/// comparando com `ultima_hab_usada` do bot. Tamanho muda no rápido.
/// @param {Asset.GMSprite} sprite_mudada A sprite que deseja colocar no lugar da atual
function altera_sprite_hab(sprite_mudada) {
    var _inicio_escolha = 0; // valores em scr_toggle_hab
    var _tamanho = [300, 450];
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
    
    if (_is_rapido) {
        _inicio_escolha = 3; //indices bot 3, 4, 5
        _tamanho = [80, 80]; 
    }
    
    for (var i = _inicio_escolha; i < array_length(global.hab_visiveis); i++) {
        var _hab_atual = global.hab_visiveis[i];
		
		if (!is_string(ultima_hab_usada)) {
			
			if (_hab_atual.habilidade.nome == ultima_hab_usada.nome) {
				
				if (_is_rapido) {
					scr_trocar_sprite(_hab_atual, _tamanho[0], _tamanho[1], sprite_mudada);
				} else {
					var _fundo_hab_atual = global.fundo_hab_visiveis[i];
					scr_trocar_sprite(_fundo_hab_atual, _tamanho[0], _tamanho[1], sprite_mudada);
				}
				
				break;
			}
		}
    }
}
