event_inherited(); // mantém o criar do obj pai

habilidades = [
	scr_definir_hab("Recompor", (round(energia_total * 0.25)), global.tipos_hab[HABS.CURA], 15,spr_lily_1hab), // Cura (Mais Barato)
	// TODO: Editar a habilidade de teste abaixo
	scr_definir_hab("Ataque Equil.", (round(energia_total * 0.1)), global.tipos_hab[HABS.ATAQUE], 200, spr_lily_1hab), // Dano
	scr_definir_hab("Foco Total", 1, global.tipos_hab[HABS.ENERGETICO], 1.5, spr_lily_1hab), // Prorroga (Custo Máx)
]