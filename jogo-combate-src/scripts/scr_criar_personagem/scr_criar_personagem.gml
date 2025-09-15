function scr_criar_personagem(obj, aumento_energia, aumento_tempo, aumento_vida) {
    with (obj) {
		hp_inicial = scr_definir_vida(aumento_vida);
		energia_por_acerto = scr_definir_energia(aumento_energia);
        tempo_turno = scr_definir_tempo(aumento_tempo);
	}
}