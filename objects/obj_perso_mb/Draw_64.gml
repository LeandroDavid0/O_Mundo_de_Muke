if (global.dialogo == true) {
    exit; // não desenha nada
}


// esquerda
draw_set_alpha(move_left ? 0.5 : 1);
draw_rectangle(40, 360, 120, 440, false);

// direita
draw_set_alpha(move_right ? 0.5 : 1);
draw_rectangle(160, 360, 240, 440, false);

// cima
draw_set_alpha(move_up ? 0.5 : 1);
draw_rectangle(100, 300, 180, 380, false);

// baixo
draw_set_alpha(move_down ? 0.5 : 1);
draw_rectangle(100, 420, 180, 500, false);

//Botao interacao

var cx = 810; // centro X
var cy = 410; // centro Y
var r = 50;   // raio

// feedback visual (pressionado)
draw_set_alpha(interact ? 0.5 : 1);

// círculo
draw_circle(cx, cy, r, false);

// letra F centralizada
draw_text(cx - 10, cy - 10, "F");

draw_set_alpha(1);

