function scr_desenha_pop_up (obj, textos_arr, cor_fundo, cor_texto_arr, fonte_arr) {
	if (obj.pop_up_aberto) {
		// define a cor
		if (is_undefined(cor_fundo)) cor_fundo = c_ltgray;
		if (is_undefined(cor_texto_arr)) cor_texto_arr = [c_black];
		if (is_undefined(fonte_arr)) fonte_arr = [fnt_principal];
		
		// verifica se está correto
		if (!is_array(textos_arr)) show_error("pop up precisa dos textos num array.", true);
		if (!is_array(cor_texto_arr)) {
			cor_texto_arr = [c_black]
			show_error("pop up precisa da cor dos textos num array.", false);
		}
		if (!is_array(textos_arr)) {
			fonte_arr = [fnt_principal]
			show_error("pop up precisa da fonte dos textos num array.", false);
		}
	
		// tamanho pop-up
		var pop_up_width = room_width / 2;
		var pop_up_height = room_height / 2;
		var pop_up_x = room_width / 2 - pop_up_width / 2;
		var pop_up_y = room_height / 2 - pop_up_height / 2;
		var espacamento = 30;
	
		// cria pop-up
		draw_set_color(cor_fundo);
		draw_rectangle(pop_up_x, pop_up_y, pop_up_x + pop_up_width, pop_up_y + pop_up_height, false);
		
		// cálculo da altura do texto
		var altura_total_texto = 0;
		for (var i = 0; i < array_length(textos_arr); i++) {
			altura_total_texto += string_height_ext(textos_arr[i], espacamento, pop_up_width);
		
			if (i < array_length(textos_arr) - 1) {
				altura_total_texto += espacamento; // Adiciona um espaçamento extra entre as linhas, exceto para a última
			}
		}
		
		// escrita do texto
		var y_texto = pop_up_y + (pop_up_height / 2) - (altura_total_texto / 2);
		var x_texto = pop_up_x + (pop_up_width / 2);
		
		for (var i = 0; i < array_length(textos_arr); i++) {
			// caracteristicas do texto
			if (i < array_length(cor_texto_arr)) {
				draw_set_color(cor_texto_arr[i]);
			} else {
				draw_set_color(cor_texto_arr[0])
			}
			if (i < array_length(fonte_arr)) {
				draw_set_font(fonte_arr[i]);
			} else {
				draw_set_font(fonte_arr[0])
			}
			draw_set_halign(fa_center);
			
			//escrita
			draw_text_ext(x_texto, y_texto, textos_arr[i], espacamento, pop_up_width);
			y_texto += string_height_ext(textos_arr[i], espacamento, pop_up_width) + espacamento;
		}
		
	}
	// volta pro padrão no fim da execução
	scr_reset_draw();
}