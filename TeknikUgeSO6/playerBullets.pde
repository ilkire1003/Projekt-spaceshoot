class playerBullet {
 
  PVector playerBulletPos;
  boolean isShot = false;
  
  playerBullet() {
  playerBulletPos = new PVector(p.playerPos.x, p.playerPos.y);
  
  }
  
  void updatePlayerBulletPos(ArrayList<Enemy> es)
  {
    if(!isShot == true) {
    playerBulletPos = new PVector(p.playerPos.x, p.playerPos.y );
    
    }
    
    else { 
      playerBulletPos = new PVector(playerBulletPos.x, playerBulletPos.y - 30);
      
    }
    
    //Collision
    for(Enemy e : es)
    {
      if( playerBulletPos.y <=  e.enemyPos.y + 40 && playerBulletPos.y >=  e.enemyPos.y - 40 && playerBulletPos.x <=  e.enemyPos.x + 40 && playerBulletPos.x >=  e.enemyPos.x - 40) {
      isShot = false;
      e.enemyHit = true;
      break;
      }
    }
    
    
    if(playerBulletPos.y <= 0) {
      isShot = false;
     
    }
  }
  
  void display() {
      
    fill(255, 0, 255);
    ellipseMode(CENTER);
    ellipse(playerBulletPos.x, playerBulletPos.y, 10, 10);
    
  }
  
  void bulletShoot() {
   isShot = true;
  }
}
