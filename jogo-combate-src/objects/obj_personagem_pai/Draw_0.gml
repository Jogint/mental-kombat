if (!(meu_turno || obj_gestao_rodada.sorteio_em_andamento()) && !is_rapido) {
	shader_set(shd_grayscale);
}

draw_self();

shader_reset();