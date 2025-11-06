/// @description Variáveis

// ==================================================
// GERA PRINCIPAIS VARIÁVEIS DO PERSONAGEM
// ==================================================
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

if (room == rm_selecao_personagem) exit; // nessa rm é criada uma instancia para acessar os dados acima

// ==================================================
// VARIAVEIS DE GESTÃO DE TURNOS E AÇÕES DO PERSONAGEM
// ==================================================
//estado_turno = ESTADOS_TURNO.AGUARDANDO;
// ---------- MULTIUSO ----------
controlador = noone; // alterado em scr_inserir_players. É bot, p1 ou p2 (global.tipos_jogadores)
meu_turno = false; // flag que define se o step pode ser executado
bot_executou = false; // flag para a primeira chamada de alarm[0] do bot
retornou_erro = false;
// ---------- ESCALA DE SPRITE ----------
inverteu_sprite = false; // flag para inverter p2 no inicio da partida
escala_padrao = calcular_escala_padrao_sprite(); // guarda para voltar ao normal fora do seu turno
alterou_tamanho = false; // flag para aumentar ou diminuir o tamanho do objeto no seu turno
inversao_sinal = 1;
// ---------- GESTÃO DE HABILIDADES ----------
efeitos = { // controla os efeitos de longa duração das hab
	mult_tempo: 1, // representa a porcentagem da alteração do tempo
	mult_energia: 1, // representa a porcentagem de alteração da energia
	timer_energia: 0, // conta segundos (ou até acabar o turno) para aplicação do energético.
}
habilidades = []; // objetos filho definem as habilidades nos seus objetos
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab para exibir seleção
pos_turno = true; // flag para intervalo de animação (oculta opções de resposta e hab)
animacao_em_uso = noone; // guarda a habilidade que será usada ao fim da animação
sprite_padrao = object_get_sprite(object_index); // sprite idle do personagem para pós animação

// ==================================================
// FUNÇÕES CHAMADAS NO STEP DURANTE O TURNO
// ==================================================

/// @function calcular_escala_padrao_sprite()
/// @description Padroniza o tamanho das sprites in game para efeitos de aumentar / diminuir
function calcular_escala_padrao_sprite() {
    // TODO: ADICIONA ESSE CARALHO DE 64 * 5 NUMA GLOBAL
    var _target_width = 65 * 5;
    var _target_height = 65 * 5;

    // Obtém as dimensões do sprite_index atual do objeto
    var _sprite_width = sprite_get_width(sprite_index);
    var _sprite_height = sprite_get_height(sprite_index);

    return [_target_width / _sprite_width, _target_height / _sprite_height];
}

/// @function aumentar_energia()
/// @description Aumenta a energia atual do personagem com base em `energia_por_acerto`,
/// limitando ao máximo `energia_total`.
function aumentar_energia() {
    energia_atual += round(energia_por_acerto * efeitos.mult_energia);
    if (energia_atual >= energia_total) {
        energia_atual = energia_total;
    }
}

/// @function bot_ataca()
/// @description Executa o ataque do bot iniciando um alarme que aguarda antes de responder.
/// Só dispara se `bot_executou` ainda for false.
function bot_ataca() {
    if (!bot_executou &&
	(controlador == global.tipos_jogadores[JOGADOR.BOT] ||
	global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO])) {
        bot_executou = true;
        var _tempo_para_responder = scr_tempo_acerto_bot(); // segundos antes de responder
		//show_debug_message("Bot irá responder em " + string(_tempo_para_responder));
        alarm[0] = _tempo_para_responder * game_get_speed(gamespeed_fps);
    }
}

/// @function altera_sprite_hab(sprite_mudada)
/// @description Altera a sprite da habilidade que o bot escolheu (padrão > confirmação > padrão)
/// @param {Asset.GMSprite} sprite_mudada A sprite que deseja colocar no lugar da atual
function altera_sprite_hab(sprite_mudada) {
    var _inicio_escolha = 0; // começa em 0 pois vai percorrer todo o array
    var _tamanho = [300, 450]; // tamanho do obj_fundo_hab, definido em scr_toggle_hab
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
    
    if (_is_rapido) {
        _inicio_escolha = 3; // começa em 3 pois os indices anteriores são habilidades do p1
        _tamanho = [80, 80]; // tamanho do obj_habilidade, definido em scr_toggle_hab
    }
    
    for (var i = _inicio_escolha; i < array_length(global.hab_visiveis); i++) {
        var _hab_atual = global.hab_visiveis[i];
		
		if (!is_string(ultima_hab_usada)) { // ignora se for pulo
			
			if (_hab_atual.habilidade.nome == ultima_hab_usada.nome) {
				// busca qual foi a habilidade que o bot escolheu
				
				if (_is_rapido) { // confirma via obj_habilidade
					scr_trocar_sprite(_hab_atual, _tamanho[0], _tamanho[1], sprite_mudada);
				} else { // confirma via obj_fundo_hab
					var _fundo_hab_atual = global.fundo_hab_visiveis[i];
					scr_trocar_sprite(_fundo_hab_atual, _tamanho[0], _tamanho[1], sprite_mudada);
				}
				
				// a diferenciação acima existe pq no modo rápido, não há obj_fundo_hab
				
				break;
			}
		}
    }
}
