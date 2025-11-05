function scr_cria_enum(){
	// 1. Tipos de Operações
	enum OPERACOES {
	    SOMA,
	    SUBTRACAO,
	    MULTIPLICACAO,
	    DIVISAO,
	    COUNT
	}

	// 2. Tipos de Jogadores
	enum TIPO_JOGADOR {
	    BOT,
	    PLAYER1,
	    PLAYER2,
	    COUNT
	}

	// 3. Níveis de Dificuldade
	enum DIFICULDADE {
	    FACIL,
	    MEDIO,
	    DIFICIL,
	    COUNT
	}

	// 4. Modos de Jogo
	enum MODO_JOGO {
	    DOIS_JOGADORES,
	    HISTORIA,
	    RAPIDO,
	    COUNT
	}

	// 5. Tipos de Habilidades
	enum HABILIDADES {
	    PULAR,
	    ATAQUE,
	    CURA,
	    DRENAR_VIDA,
	    PRORROGA_TEMPO,
	    ACELERA,
	    ENERGETICO,
	    COUNT
	}
}