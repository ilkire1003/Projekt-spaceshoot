class enemyBullet {
  PVector bulletPos;
  PVector bulletAcc;
  PVector bulletSpeed;
  float bTopspeed = 4.5;
  int bulletRadius = 10;


  enemyBullet(float x, float y) {
    bulletPos = new PVector(x,y+40);
    bulletAcc = new PVector(0, 1);
    bulletSpeed = new PVector (0, 0);
  }
  //udseende
  void bullet() {
    fill(255, 0, 0);
    ellipse(bulletPos.x, bulletPos.y, bulletRadius, bulletRadius);
  }
  //bevægelse
  void bulletMove() {
    bulletAcc.normalize();
    bulletAcc.mult(0.5);
    bulletSpeed.add(bulletAcc);
    bulletSpeed.limit(bTopspeed);
    bulletPos.add(bulletSpeed);
  }
  //despawn
  void delete(int i) {
    
    
    if (bulletPos.x < 0 || bulletPos.y > height) bullets.remove(i);

  }
  
  boolean collision() {
    
    beta1= p.playerPos.y - (alpha1*p.playerPos.x);
    beta2= p.playerPos.y - (alpha2*p.playerPos.x);
    
    if(bulletRadius > pow(pow(bulletPos.x - p.playerPos.x - (p.playerWidth/2), 2) + pow(bulletPos.y - p.playerPos.y + p.playerWidth, 2),0.5)  ||  bulletRadius > pow(pow(bulletPos.x - (p.playerPos.x + (p.playerWidth/2)), 2) + pow(bulletPos.y - p.playerPos.y + p.playerWidth, 2),0.5)) 
    {
      return true;
    }
    
    if(bulletPos.x <= p.playerPos.x && bulletPos.x >= p.playerPos.x - (p.playerWidth/2) - bulletRadius && bulletPos.y >= p.playerPos.y - bulletRadius && bulletPos.y <= p.playerPos.y + p.playerWidth)
    {
      if(bulletRadius >= abs( (alpha1*bulletPos.x) + beta1 - bulletPos.y)/alpha2_1 ) return true;
    }
    
    if(bulletPos.x >= p.playerPos.x && bulletPos.x <= p.playerPos.x + (p.playerWidth/2) + bulletRadius && bulletPos.y >= p.playerPos.y - bulletRadius && bulletPos.y <= p.playerPos.y + p.playerWidth)
    {
      if(bulletRadius >= abs( (alpha2*bulletPos.x) + beta2 - bulletPos.y)/alpha2_1 ) return true;
    }
    
    return false;
    
  }
}
