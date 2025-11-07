/// @function scr_valor_unico_array(arr, val)
/// @description Verifica se um valor aparece mais de uma vez no array
/// @param {Array} arr O array a ser analisado
/// @param {Any} val O valor que será comparado
/// @return {bool}
function scr_valor_unico_array(arr, val) {
    for (var i = 0; i < array_length(arr); i++) {
        if (arr[i] == val) return false;
    }
    return true;
}