function player_collision() {
    var _collision = false;
    
    //Tiles horizontais
    if (tilemap_get_at_pixel(collision_map, x + h_speed, y)) {
        x -= x mod TILESIZE;
        if (sign(h_speed) == 1) {
            x += TILESIZE - 1;
        }
        h_speed = 0;
        _collision = true;
    }
    
    //Movimento horizontal
    x += h_speed;
    
    //Tiles verticais
        if (tilemap_get_at_pixel(collision_map, x, y + v_speed)) {
        y -= y mod TILESIZE;
        if (sign(v_speed) == 1) {
            y += TILESIZE - 1;
        }
        v_speed = 0;
        _collision = true;
    }
    
    //Movimento vertical
    y += v_speed
    
    
    return _collision
}