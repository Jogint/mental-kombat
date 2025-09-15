function scr_valor_unico_array(arr, val) {
    for (var i = 0; i < array_length(arr); i++) {
        if (arr[i] == val) return false;
    }
    return true;
}