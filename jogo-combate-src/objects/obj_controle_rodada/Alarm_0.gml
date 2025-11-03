/// @description Nome piscando
if (choosing_state == 1) {
    flicker_count--;

    if (flicker_count > 0) {
        if (current_selection_name == global.inst_perso_partida[1].controlador) {
            current_selection_name = global.inst_perso_partida[0].controlador;
        } else {
            current_selection_name = global.inst_perso_partida[1].controlador;
        }

        // --- RESCHEDULE THE ALARM ---
        // Optional: Slow down the rate towards the end for a cooler effect
        var _flicker_rate_steps = 4; // Start rate
        if (flicker_count < 30) { // If less than 30 flickers left, slow down
            _flicker_rate_steps = 8;
        }

        // Set the alarm to run again
        alarm[0] = _flicker_rate_steps;

    } else {
        choosing_state = 2; // Vai pro resultado
        var _resultado_sorteio = irandom_range(0, 1);
        current_selection_name = global.inst_perso_partida[_resultado_sorteio].controlador;
        alarm[1] = game_get_speed(gamespeed_fps) * 1; // 1 segundo de resultado
    }
}