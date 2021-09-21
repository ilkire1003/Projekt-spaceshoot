boolean left, right;
boolean playerHit = false; 
boolean dead = false;

int unit = 10;
int count = 8;
int enemyBTimer = 60;
int life = 3;
int score;


float playerWidth = 80;
float alpha1;
float beta1;
float alpha2;
float beta2;
float alpha2_1;


Player p;
playerBullet PB;
Enemy e = new Enemy();
enemyBullet eB;


ArrayList<enemyBullet> bullets;
ArrayList<Enemy> enemies;
ArrayList<particleSystem> PSS = new ArrayList<particleSystem>();
ArrayList<playerBullet> pbullets = new ArrayList<playerBullet>();



void setup() {
  fullScreen();
  background(255);
  p = new Player(playerWidth);
  PB = new playerBullet();
  left = false;
  right = false;
  e = new Enemy();
  //Array
  int wideCount = (width / unit) / 40;
  int highCount = (height / unit) / 40;
  count = wideCount*highCount;
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<enemyBullet>();
  alpha1 = (playerWidth/2) / (playerWidth);
  alpha2 = -alpha1;
  alpha2_1 = pow(pow(alpha1, 2)+1, 0.5);


  for (int y = 0; y<highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      //enemies[index++] = new Enemy();
      enemies.add(new Enemy());
    }
  }
}

void draw() {
  background(0);
  noStroke();



  if (enemyBTimer>120)enemyBTimer = 0;

  for (int i = pbullets.size()-1; i>=0; i--) {
    PB = pbullets.get(i);
    PB.updatePlayerBulletPos(enemies);
    PB.display();
    PB.bulletShoot();
  }

  // kalder på arraylist for skud
  for (int i = bullets.size()-1; i>=0; i--) {
    if (bullets.get(i).collision() == true)
    {
      p.isHit = true;
      bullets.remove(i);
    } else
    {
      bullets.get(i).bullet();
      bullets.get(i).bulletMove();
      bullets.get(i).delete(i);
    }
  }
  /*if (e.enemyHit == true) {
    score++;
  }*/
  if (key == ' ') {
    //PB.playerBulletPos.y += 10;
    PB.bulletShoot();
  }
  enemyBTimer++;

  PB.updatePlayerBulletPos(enemies);

  //kalder på array for enemy
  for (int i = enemies.size()-1; i>=0; i--) {// (Enemy e : enemies) { 
    if (enemies.get(i).enemyHit == false)
    {
      enemies.get(i).display();
      enemies.get(i).movement();
      enemies.get(i).update();
      if (enemies.get(i).enemyPos.x > width - 100 || enemies.get(i).enemyPos.x < 0 + 100) {
        for (Enemy u : enemies) {
          u.speed.mult(-1);
          u.acceleration.mult(-1);
          u.enemyPos.y = u.enemyPos.y + 5;
        }
      }
    } else
    {
      PSS.add(new particleSystem(55, 6, enemies.get(i).enemyPos, 30, 400));
      enemies.remove(i);
      score = score + 100;
      count--;
      
      //    enemies.remove(e);
    }
  }
  p.update();
  PB.display();
  p.display();

  for (int i = PSS.size()-1; i >= 0; i--) {
    PSS.get(i).update();
    // if(PSS.get(i).timeCount == 0) PSS.remove(i);
  }

  handleBorder();
}

void handleBorder() {

  if ( p.getLeftCornerX() < 0) {     
    p.velX = 0; 
    p.playerPos.x = 0 + 40;
  }

  if ( p.getRightCornerX() > width) {
    p.velX = 0;
    p.playerPos.x = width - 40;
  }
  if (p.isHit == true) {
    life--;
    if (life < 0) {
      dead = true;
      e.speed.mult(0);
      e.acceleration.mult(0);
    }
    p.isHit = false;
  }
  score();
  if(count == 0){
  text("You WIN", width/2-135, height/2);
  }
}


void keyPressed() {

  /*
  player.setForce(0);
   if(keyCode != LEFT && keyCode != RIGHT)return;
   */
   if(dead == false) {
  if (keyCode == LEFT && !left) {
    p.setForce(-10);
    left = true;
  } 
  if (keyCode == RIGHT && !right) {
    p.setForce(10);
    right = true;
  }
   }
}

void keyReleased() {
  if (keyCode == LEFT) {
    p.setForce(0);
    left = false;
  }

  if (keyCode == RIGHT) {    
    p.setForce(0);
    right = false;
  }

}
