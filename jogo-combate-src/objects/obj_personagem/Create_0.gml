event_inherited(); // mantém o criar do obj pai

habilidades = [
	scr_definir_hab("Recompor", (round(energia_total * 0.25)), global.tipos_hab[HABS.CURA], 15,spr_lily_1hab), // Cura (Mais Barato)
	scr_definir_hab("Ataque Equil.", (round(energia_total * 0.5)), global.tipos_hab[HABS.ATAQUE], 15, spr_lily_1hab), // Dano
	scr_definir_hab("Foco Total", (round(energia_total)), global.tipos_hab[HABS.ENERGETICO], 1.5, spr_lily_1hab), // Prorroga (Custo Máx)
]