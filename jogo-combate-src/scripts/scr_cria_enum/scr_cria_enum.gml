function scr_cria_enum(){
	// 1. Tipos de Operações
	enum OPERACOES {
	    SOMA,
	    SUB,
	    MULT,
	    DIVI,
	    COUNT
	}

	// 2. Tipos de Jogadores
	enum JOGADOR {
	    BOT,
	    P1,
	    P2,
	    COUNT
	}

	// 3. Níveis de Dificuldade
	enum DIF {
	    FACIL,
	    MEDIO,
	    DIFICIL,
	    COUNT
	}

	// 4. Modos de Jogo
	enum MODO {
	    PVP,
	    HIST,
	    RAPIDO,
	    COUNT
	}

	// 5. Tipos de Habilidades
	enum HABS {
	    PULAR,
	    ATAQUE,
	    CURA,
	    DRENA,
	    PRORROGA,
	    ACELERA,
	    ENERGETICO,
	    COUNT
	}
}