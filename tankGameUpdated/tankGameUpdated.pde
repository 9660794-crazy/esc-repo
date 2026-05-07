// NOAH KERGAYE | Tank Game | April 14, 2026
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
int score;
Timer obsTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage("BG1.png");
  tank1 = new Tank();
  //obstacles.add(new Obstacle(250, 250));
  //obstacles.add(new Obstacle(25, 400));
  //obstacles.add(new Obstacle(100, 200));
  //obstacles.add(new Obstacle(400, 650));
  score=0;
  obsTimer = new Timer(1000);
  obsTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  // Add timer to distribution
  if (obsTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, int(random(height))));
    obsTimer.start();
  }
  //obstacle.add(new Obstacle(250, 250));

  if (puTimer.isFinished()) {

    powerups.add(new PowerUp(int (random(width)), -100));

    puTimer.start();
  }
  // Add timer to distribute powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();

    if (pu.reachedSide()) {
      powerups.remove(pu);
    }
    if (pu.intersect(tank1)) {
      if (pu.type == 'h') {
        tank1.health = tank1.health + 100;
        powerups.remove(pu);
      } else if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 100;
        powerups.remove(pu);
      } else if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount + 1;
        powerups.remove(pu);
      }
    }
  }

  //displaying Obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedSide()) {
      obstacles.remove(i);
    }
    //detect collistion to tank
    if (tank1.intersect(o)) {
      //impact to change score, health and obstacle
    }
  }
  //displaying Projectiles
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score +100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedSide()) {
      projectiles.remove(p);
    }
  }
  tank1.display();

  scorepanel();
  println("Objects in Memory:"+obstacles.size());
  println("Projectiles in Memory:"+projectiles.size());
}
void scorepanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 50);
  text("Health:" + tank1.health, width/2-150, 30);
  text("Ammo:" + tank1.laserCount, width/2+150, 30);
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    tank1.move('w');
  } else if (key == 's' || key == 'S') {
    tank1.move('s');
  } else if (key == 'a' || key == 'A') {
    tank1.move('a');
  } else if (key == 'd' || key == 'D') {
    tank1.move('d');
  }
}

void mousePressed() {
  if 9tank1.turretCount
  projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
}
