event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	
	scr_definir_hab("Dreno de Vida", (round(energia_total * 0.2)), global.tipos_hab[HABS.DRENA], 15, spr_anim_teste), // Dreno (Mais Barato)
	scr_definir_hab("Fortalecer", (round(energia_total * 0.5)), global.tipos_hab[HABS.CURA], 25, spr_anim_teste), // Cura
	scr_definir_hab("Bloqueio Total", (energia_total), global.tipos_hab[HABS.ACELERA], 0.5, spr_anim_teste), // Acelerar (Custo Máx)
]