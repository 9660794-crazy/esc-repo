class Tank {
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;
  int turretCount, laserCount;

  Tank() {
    x = 250;
    y = 250;
    w = 100;
    h = 100;
    speed = 15;
    health = 75;

    iTankW = loadImage("TankW.png");
    iTankA = loadImage("TankA.png");
    iTankS = loadImage("TankS.png");
    iTankD = loadImage("TankD.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }

  void display() {
    imageMode(CENTER);

    if (idir == 'w') {
      image(iTankW, x, y);
      println("w");
    } else if (idir == 'a') {
      image(iTankA, x, y);
      println("a");
    } else if (idir == 's') {
      image(iTankS, x, y);
      println("s");
    } else if (idir == 'd') {
      image(iTankD, x, y);
      println("d");
    }

  }

  void move(char dir) {
    idir = dir;

    if (dir == 'w') {
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  void fire () {
  }
  boolean intersect(Obstacle o) {
    float distance = dist (x, y, o.x, o.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}
