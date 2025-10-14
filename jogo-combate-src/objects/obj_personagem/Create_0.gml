event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Recompor", (round(energia_total * 0.25)), global.tipos_hab[2], 15, spr_teste_opcao), // Cura (Mais Barato)
	scr_definir_hab("Ataque Equil.", (round(energia_total * 0.5)), global.tipos_hab[1], 40, spr_teste_opcao), // Dano
	scr_definir_hab("Foco Total", (energia_total), global.tipos_hab[4], 1.5, spr_teste_opcao), // Prorroga (Custo Máx)
]