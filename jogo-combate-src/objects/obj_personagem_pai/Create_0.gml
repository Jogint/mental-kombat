/// @description Variáveis
//? O script abaixo adiciona ao objeto:
// Constantes: hp_total, energia_total, energia_por_acerto e tempo_turno
// Variáveis: hp_atual, energia_atual
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

controlador = global.tipos_jogadores[1]; //alterado em scr_inserir_players
meu_turno = false;
bot_executou = false;
definiu_hab = false;
alterou_tempo = 1;
habilidades = []; // objetos filho definem as habilidades
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab
global.partida_acabou = false;

function aumentar_energia() {
	energia_atual += energia_por_acerto;
	if (energia_atual >= energia_total) energia_atual = energia_total;
}

function bot_ataca() {
	if (!bot_executou) {
		bot_executou = true;
		var _tempo_para_responder = scr_tempo_acerto_bot(); // segundos antes de responder
		alarm[0] = _tempo_para_responder * game_get_speed(gamespeed_fps);
	}
}

function revisa_hab(sprite_mudada) {
	var _inicio_escolha = 0;
	var _tamanho = [415, 80]
	
	if (global.modo_jogo_atual == global.modos_jogo[2]) {
		_inicio_escolha = 4;
		_tamanho = [80, 80]
	}
	
	for (var i = _inicio_escolha; i < array_length(global.hab_visiveis); i++) {
		var _hab_atual = global.hab_visiveis[i]
		if (_hab_atual.habilidade.nome == ultima_hab_usada.nome) {
			scr_trocar_sprite(_hab_atual, _tamanho[0], _tamanho[1], sprite_mudada);
			break;
		}
	}
}