event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2, 0),
	scr_definir_hab("Rajada Leve", (round(energia_total * 0.25)), global.tipos_hab[1], 20, spr_teste_opcao, 4), // Dano (Mais Barato)
	scr_definir_hab("Carga Rápida", (round(energia_total * 0.45)), global.tipos_hab[6], 1.3, spr_teste_opcao, 4), // Energético
	scr_definir_hab("Explosão Nuclear", (energia_total), global.tipos_hab[1], 150, spr_teste_opcao, 4), // Dano (Custo Máx - Alto Valor)
]