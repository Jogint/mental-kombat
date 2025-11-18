event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Pew pew", (round(energia_total * 0.1)), global.tipos_hab[HABS.ATAQUE], 5, spr_anim_teste), // Dano
	scr_definir_hab("Absorção geral", (round(energia_total * 0.45)), global.tipos_hab[HABS.DRENA], 15, spr_anim_teste), // Dreno
	scr_definir_hab("Explosão energética", (energia_total), global.tipos_hab[HABS.ACELERA], 35, spr_anim_teste), // Dano
]