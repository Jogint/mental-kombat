/// @description Variáveis

// ==================================================
// GERA PRINCIPAIS VARIÁVEIS DO PERSONAGEM
// ==================================================
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

if (room == rm_selecao_personagem) exit; // nessa rm é criada uma instancia para acessar os dados acima

// ==================================================
// VARIAVEIS DE GESTÃO DE TURNOS E AÇÕES DO PERSONAGEM
// ==================================================
controlador = noone; // alterado em scr_inserir_players. É bot, p1 ou p2 (global.tipos_jogadores)
meu_turno = false; // flag que define se o step pode ser executado
bot_executou = false; // flag para a primeira chamada de alarm[0] do bot
inverteu_sprite = false; // flag para inverter p2 no inicio da partida
efeitos = [1, 1, 0]; // controla os efeitos de longa duração das hab. Mais info em Notes/Importante.txt
habilidades = []; // objetos filho definem as habilidades nos seus objetos
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab para exibir seleção
pausa_animacao = true; // flag para intervalo de animação (oculta opções de resposta e hab)
animacao_em_uso = noone; // guarda a habilidade que será usada ao fim da animação
sprite_padrao = object_get_sprite(object_index); // sprite idle do personagem para pós animação
global.partida_acabou = false; // define o início da partida

// ==================================================
// FUNÇÕES CHAMADAS NO STEP DURANTE O TURNO
// ==================================================

/// @function aumentar_energia()
/// @description Aumenta a energia atual do personagem com base em `energia_por_acerto`,
/// limitando ao máximo `energia_total`.
function aumentar_energia() {
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
/// @description Altera a sprite da habilidade que o bot escolheu (padrão > confirmação > padrão)
/// @param {Asset.GMSprite} sprite_mudada A sprite que deseja colocar no lugar da atual
function altera_sprite_hab(sprite_mudada) {
    var _inicio_escolha = 0; // começa em 0 pois vai percorrer todo o array
    var _tamanho = [300, 450]; // tamanho do obj_fundo_hab, definido em scr_toggle_hab
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[2];
    
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
