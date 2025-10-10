if (global.jogador_atual == "" && choosing_state == 0) {
    show_debug_message("Starting Alarm Sequence");
    choosing_state = 1;
    var _total_flicker_time = 3; // 3 seconds
    var _flicker_rate_steps = 4; // Pisca 4x por segundo
    flicker_count = _total_flicker_time * (game_get_speed(gamespeed_fps) / _flicker_rate_steps);
    current_selection_name = global.perso_atuais[1].controlador; // primeiro nome
    alarm[0] = _flicker_rate_steps;
}