// resetar
global.move_up = false;
global.move_down = false;
global.move_left = false;
global.move_right = false;

// multitouch (até 5 dedos)
for (var i = 0; i < 5; i++) {

    if (device_mouse_check_button(i, mb_left)) {

        var mx = device_mouse_x(i);
        var my = device_mouse_y(i);

        // esquerda
        if (point_in_rectangle(mx, my, 50, 500, 150, 600)) {
            global.move_left = true;
        }

        // direita
        if (point_in_rectangle(mx, my, 200, 500, 300, 600)) {
            global.move_right = true;
        }

        // cima
        if (point_in_rectangle(mx, my, 125, 450, 225, 550)) {
            global.move_up = true;
        }

        // baixo
        if (point_in_rectangle(mx, my, 125, 550, 225, 650)) {
            global.move_down = true;
        }
    }
}
