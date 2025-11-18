event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Arsenal", (round(energia_total * 0.2)), global.tipos_hab[HABS.ATAQUE], 25, spr_anim_teste), // Dano
	scr_definir_hab("Ataque Veloz", (round(energia_total * 0.4)), global.tipos_hab[HABS.ATAQUE], 60, spr_anim_teste), // Dano
	scr_definir_hab("Devorando", (energia_total), global.tipos_hab[HABS.PRORROGA], 2, spr_anim_teste), // Prorroga
]