/// @description Variáveis

// ==================================================
// GERA PRINCIPAIS VARIÁVEIS DO PERSONAGEM
// ==================================================
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

if (room == rm_selecao_personagem) exit; // nessa rm é criada uma instancia para acessar os dados acima

// ==================================================
// VARIAVEIS DE GESTÃO DE TURNOS E AÇÕES DO PERSONAGEM
// ==================================================
// ---------- MULTIUSO ----------
estado_turno = ESTADOS_TURNO.SETUP;
controlador = noone; // alterado em scr_inserir_players. É bot, p1 ou p2 (global.tipos_jogadores)
oponente = noone; // instancia do oponente
meu_turno = false; // flag que define se o step pode ser executado
treme_resposta_errada = false; // interrompe execução enquanto treme a opcao com erro
tempo_rapido = 120; // 2 minutos de execução
is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];

// ---------- ESCALA DE SPRITE ----------
inverteu_sprite = false; // flag para inverter p2 no inicio da partida
escala_padrao = calcular_escala_padrao_sprite(); // guarda para voltar ao normal fora do seu turno
dados_escala = {
	menor: 0.9,
	maior: 1.1,
}
inversao_sinal = 1;

// ---------- GESTÃO DE HABILIDADES ----------
efeitos = { // controla os efeitos de longa duração das hab
	mult_tempo: 1, // representa a porcentagem da alteração do tempo
	mult_energia: 1, // representa a porcentagem de alteração da energia
	timer_energia: 0, // conta segundos (ou até acabar o turno) para aplicação do energético.
}
segs_por_habilidade = 10; // duração máxima dos buffs persistentes
habilidades = []; // objetos filho definem as habilidades nos seus objetos
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab para exibir seleção
hab_em_uso = noone; // guarda a habilidade que será usada ao fim da animação
sprite_padrao = object_get_sprite(object_index); // sprite idle do personagem para pós animação

// ==================================================
// FUNÇÕES DE USO INTERNO
// ==================================================

// ---------- GESTÃO DE SPRITES ----------
// ---------------------------------------

/// @function calcular_escala_padrao_sprite()
/// @description Padroniza o tamanho das sprites in game para efeitos de aumentar / diminuir
function calcular_escala_padrao_sprite() {
    // TODO: ADICIONA ESSE CARALHO DE global.tamanhos.perso_maior NUMA GLOBAL
    var _target_width = 65 * 5;
    var _target_height = 65 * 5;

    // Obtém as dimensões do sprite_index atual do objeto
    var _sprite_width = sprite_get_width(sprite_index);
    var _sprite_height = sprite_get_height(sprite_index);

    return [_target_width / _sprite_width, _target_height / _sprite_height];
}

/// @function altera_sprite_hab(sprite_mudada)
/// @description Altera a sprite da habilidade que o bot escolheu (padrão > confirmação > padrão)
/// @param {Asset.GMSprite} sprite_mudada A sprite que deseja colocar no lugar da atual
function altera_sprite_hab(sprite_mudada = spr_hab_indisponivel) {
    var _inicio_escolha = 0; // começa em 0 pois vai percorrer todo o array
    var _tamanho = [300, 450]; // tamanho do obj_fundo_hab, definido em scr_toggle_hab
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
    
    if (_is_rapido) {
        _inicio_escolha = 3; // começa em 3 pois os indices anteriores são habilidades do p1
        _tamanho = [80, 80]; // tamanho do obj_habilidade, definido em scr_toggle_hab
    }
    
    for (var i = _inicio_escolha; i < array_length(global.hab_visiveis); i++) {
        var _hab_atual = global.hab_visiveis[i];
		
		if (is_struct(ultima_hab_usada)) { // ignora se for pulo
			
			if (_hab_atual.habilidade.nome == ultima_hab_usada.nome) {
				// busca qual foi a habilidade que o bot escolheu
				
				if (sprite_mudada == spr_hab_indisponivel) sprite_mudada = _hab_atual.sprite_padrao;
				
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

/// @function altera_escala_sprite(_fator_escala)
/// @description Aumenta ou reduz ligeiramente o tamanho quando inicia o turno
/// @param {Real} _fator_escala A porcentagem da mudança
function altera_escala_sprite(_fator_escala) {
	image_xscale = escala_padrao[0] * _fator_escala * inversao_sinal;
	image_yscale = escala_padrao[1] * _fator_escala;
}

// ---------- ENERGIA E HABILIDADES ----------
// -------------------------------------------

/// @function aumentar_energia()
/// @description Aumenta a energia atual do personagem com base em `energia_por_acerto`,
/// limitando ao máximo `energia_total`.
function aumentar_energia() {
    energia_atual += round(energia_por_acerto * efeitos.mult_energia);
    if (energia_atual >= energia_total) {
        energia_atual = energia_total;
    }
}

// ---------- FUNCOES DO BOT ----------
// ------------------------------------

/// @function bot_marcou_opcao
/// @description chama função de exibir um circulo na seleção
function bot_marcou_opcao(_acertou) {
	var _respostas_array = []; 
	with (obj_opcao_resposta) {
	    array_push(_respostas_array, id);
	}
	
	_respostas_array = array_shuffle(_respostas_array);

	if (_acertou) {
		for (var i = 0; i < array_length(_respostas_array); ++i) {
			
		    if (_respostas_array[i].is_certo) {
				// show_debug_message("acertou: " + string(_respostas_array[i].numero));
				_respostas_array[i].opcao_selecionada(true, _acertou);
				
				break;
			}
		}
		
		return;
	}
	
	// ----- DELETAR SESSÃO PÓS TESTES -----
	// -------------------------------------
	array_push(global.tempo_para_erro, (global.inst_perso_partida[1].tempo_turno - round((obj_gestao_rodada.timer_turno / game_get_speed(gamespeed_fps)))));
	//show_debug_message(global.tempo_para_erro);
	var _soma = 0;
	for (var i = 0; i < array_length(global.tempo_para_erro); i++) {
		_soma += global.tempo_para_erro[i];
		if (i == array_length(global.tempo_para_erro) - 1) {
			show_debug_message("Média do erro: " + string(_soma / array_length(global.tempo_para_erro)));
		}
	}
	
	var _opcao_aleatoria = _respostas_array[0];
	if (_opcao_aleatoria.is_certo) _opcao_aleatoria = _respostas_array[1];
	// show_debug_message("errou: " + string(_opcao_aleatoria.numero));
	_opcao_aleatoria.opcao_selecionada(true, _acertou);
}

function set_bot_responde(_obj) {
	var _is_rapido = global.modo_jogo_atual == global.modos_jogo[MODO.RAPIDO];
	
	if (_obj.controlador != global.tipos_jogadores[JOGADOR.BOT]) return;
	
	// ---------- VERIFICA SE PODE RESPONDER MAIS UMA ----------
	var _secs_restantes = round(obj_gestao_rodada.timer_turno / game_get_speed(gamespeed_fps));
	var _tempo_resp = scr_tempo_acerto_bot();
	if (_is_rapido) _tempo_resp += 1; // 1 segundo extra pra evitar o spam absurdo
		
	if (_secs_restantes > _tempo_resp && _obj.alarm[0] <= 0) {
	    // show_debug_message("O bot executará novamente em " + string(_tempo_resp));
	    var _frames = _tempo_resp * game_get_speed(gamespeed_fps);
	    _obj.alarm[0] = _frames;
	}
	
	if (_is_rapido && _obj.alarm[3] <= 0) {
		var _segundos_para_atacar = 10;
		_obj.alarm[3] = _segundos_para_atacar * game_get_speed(gamespeed_fps);
	}
}

/// @function efetua_dano(_inimigo, _valor)
/// @param {Asset.GMObject|Id.Instance} _inimigo Objeto que está sofrendo o ataque
/// @param {Real} _valor Quanto dano será recebido
function efetua_dano(_inimigo, _valor) {
	//var crit = irandom_range(0, 100) >= 90;
	//_inimigo.hp_atual -= (_valor + (_valor * 0.2));
	_inimigo.hp_atual -= _valor;
	if (_inimigo.hp_atual <= 0) {
		_inimigo.hp_atual = 0;
		obj_gestao_rodada.partida_acabou = true;
	}
}

/// @function aumenta_vida(_obj, _valor)
/// @param {Asset.GMObject|Id.Instance} _obj Objeto que está recebendo cura
/// @param {Real} _valor Quanto cura será recebido
function aumenta_vida(_obj, _valor) {
	_obj.hp_atual += _valor;
	if (_obj.hp_atual > _obj.hp_total) _obj.hp_atual = _obj.hp_total;
}

/// @function bot_encerrar_turno(_bot)
function bot_encerrar_turno(_bot) {
    _bot.alarm[0] = -1;
    obj_gestao_rodada.errou_resposta = true;
}