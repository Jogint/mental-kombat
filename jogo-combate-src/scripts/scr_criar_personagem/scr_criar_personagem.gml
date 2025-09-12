function scr_criar_personagem(nome, aumento_energia, aumento_tempo, aumento_vida) {
    return {
        energia_por_acerto: scr_definir_energia(aumento_energia),
        tempo_resposta: scr_definir_tempo(aumento_tempo),
		vida_total: scr_definir_vida(aumento_vida),
    };
}