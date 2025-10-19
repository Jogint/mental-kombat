event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2, 0),
	scr_definir_hab("Dreno de Vida", (round(energia_total * 0.2)), global.tipos_hab[3], 15, spr_teste_opcao, 4), // Dreno (Mais Barato)
	scr_definir_hab("Fortalecer", (round(energia_total * 0.5)), global.tipos_hab[2], 25, spr_teste_opcao, 4), // Cura
	scr_definir_hab("Bloqueio Total", (energia_total), global.tipos_hab[5], 0.5, spr_teste_opcao, 4), // Atrasar (Custo Máx)
]