/// @description Variáveis
//? O script abaixo adiciona ao objeto:
// Constantes: hp_total, energia_total, energia_por_acerto e tempo_turno
// Variáveis: hp_atual, energia_atual
scr_criar_personagem(self, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max);

controlador = global.tipos_jogadores[1]; //alterado em scr_inserir_players
meu_turno = false;
bot_executou = false;
definiu_hab = false;
habilidades = []; // objetos filho definem as habilidades
ultima_hab_usada = {}; // definido em scr_bot_escolhe_hab
global.partida_acabou = false;

function aumentar_energia() {
	energia_atual += energia_por_acerto;
	if (energia_atual >= energia_total) energia_atual = energia_total;
}