event_inherited(); // mantém o criar do obj pai

habilidades = [
	// scr_definir_hab(nome, custo, tipo da habilidade, valor do efeito, sprite da habilidade),
	scr_definir_hab("Pular", 0, global.tipos_hab[0], 0, spr_teste_opcao_2, 0),
	scr_definir_hab("Pequena Cura", (round(energia_total * 0.2)), global.tipos_hab[2], 10, spr_teste_opcao, 4), // Cura (Mais Barato)
	scr_definir_hab("Ataque Firme", (round(energia_total * 0.55)), global.tipos_hab[1], 35, spr_teste_opcao, 4), // Dano
	scr_definir_hab("Restaurar Vitalidade", (energia_total), global.tipos_hab[2], 50, spr_teste_opcao, 4), // Cura (Custo Máx)
]