event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2),
	scr_definir_hab("Preparar", (round(energia_total * 0.3)), global.tipos_hab[6], 1.2, spr_teste_opcao), // Energético (Mais Barato)
	scr_definir_hab("Ataque de Dreno", (round(energia_total * 0.6)), global.tipos_hab[3], 30, spr_teste_opcao), // Dreno
	scr_definir_hab("Impacto Pesado", (energia_total), global.tipos_hab[1], 80, spr_teste_opcao), // Dano (Custo Máx)
]