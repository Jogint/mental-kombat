// perso = personagem
// hab = habilidade

randomise();

/// DEFINIÇÕES DO JOGO: Variáveis fixas para evitar erros de digitação.
global.operacoes = ["soma", "subtracao", "multiplicacao", "divisao"];
global.tipos_jogadores = ["bot", "player"];
global.niveis_dificuldade = ["facil", "medio", "dificil"];
global.tipos_hab = ["pular", "dano", "cura"];
global.qtd_alternativas = 4;
global.qtd_players_partida = 2;
global.todos_perso = [obj_personagem,
					obj_personagem_1,
					obj_personagem_2,
					obj_personagem_3,
					obj_personagem_4,
					obj_personagem_5,
					obj_personagem_6,
					obj_personagem_7,
					obj_personagem_8,
					obj_personagem_9,
					obj_personagem_10,
					obj_personagem_11];
global.perso_disponiveis = [obj_personagem];
global.inimigos_disponiveis = [obj_personagem_1];
scr_atualizar_arr_sprites(); //cria o global.arr_sprite_perso

/// ESTADO DA PARTIDA: Variáveis que controlam o fluxo do jogo.
global.dificuldade_atual = global.niveis_dificuldade[2]; // Define o nível de dificuldade da partida
global.jogador_atual = global.tipos_jogadores[1]; // Indica quem pode responder a pergunta
global.perso_atuais = []; // quais objetos de personagem cada instancia vai usar
global.inst_perso_partida = []; // intâncias de personagens em jogo
global.perguntas_geradas = scr_gerar_perguntas(); // Banco de perguntas para a partida
global.pergunta_atual = global.perguntas_geradas[0]; // A pergunta que está sendo exibida no momento
global.partida_acabou = true; // começa sem partidas em andamento
global.quem_venceu = "noone";

/// VARIÁVEIS DE CONTROLE DE FLUXO: Variáveis temporárias para lógicas de jogo.
global.timer_turno = 0; // Temporizador para o tempo de resposta
global.turno_iniciou = false; // Flag para controlar o início do turno
global.errou_resposta = false; // Flag para controlar se a resposta foi errada
global.exibir_hab = false; // flag para abrir o pop up de habilidades
global.hab_visiveis = []; // guarda as habilidades do pop up enquanto aberto
