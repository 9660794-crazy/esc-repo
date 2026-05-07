class PowerUp {
  int x, y, w, h, speed;
  char type;

  // Constructor
  PowerUp(int x, int y) {

    this.y = y;
    w = 100;
    h = 100;
    speed = 2;
    x = 100;
    y = -100;

    if (random(3) ==  1) {
      type = 'h';
    } else if (random(2) ==  1) {
      type = 't';
    } else {
      type = 'a';
    }
  }

  void display() {
    if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Ammo", x, y);
    } else if (type == 'h') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Health", x, y);
    } else {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER, CENTER);
    }
  }

  void move() {
    y = y + speed;
  }
  boolean reachedSide() {
    return x>= width+150 || x<= -150 || y > height +150 || y < -150;
  }
  boolean intersect (Tank t) {
    float distance = dist (x, y, t.x, t.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
