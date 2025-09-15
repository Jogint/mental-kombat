function scr_criar_personagem(obj, aumento_energia, aumento_tempo, aumento_vida, aumento_energia_max) {
    with (obj) {
		hp_total = scr_definir_vida(aumento_vida);
		energia_total = scr_definir_energia_max(aumento_energia_max);
		energia_por_acerto = scr_definir_energia(aumento_energia);
        tempo_turno = scr_definir_tempo(aumento_tempo);
	}
}