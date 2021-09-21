class Enemy {
  PVector enemyPos;
  PVector speed;
  PVector acceleration;
  float topspeed = 4;
  boolean enemyHit = false;


  Enemy() {
    enemyPos = new PVector (random(200, width-200), height*0.25);  
    acceleration = new PVector(1, 0);
    speed = new PVector(0, 0);
  }




//udseende
  void display() {
    fill(240);
    rect(enemyPos.x, enemyPos.y, 50, 50);
    
}
//bevægelse
  void movement() {
if(life > 0) {
    acceleration.normalize();
    acceleration.mult(0.5);
    speed.add(acceleration);
    speed.limit(topspeed);
    enemyPos.add(speed);
}
//borders//
    
  }

  //bullet delay
  void update() {

    if (enemyBTimer == 120 && life > 0) {
      bullets.add(new enemyBullet(enemyPos.x, enemyPos.y));
      

    }
  }
}
