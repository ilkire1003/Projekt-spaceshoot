class Player{

  PVector playerPos;
  float playerWidth = 80;
  float accX = 0, velX =0;
  boolean left, right, isHit;
  

  
  Player(float pw){
      playerPos = new PVector(width/2, height*14/16);
      left = false;
      right = false;
      isHit = false; 
      playerWidth = pw;
  }
  
  float getLeftCornerX(){
    return playerPos.x - playerWidth/2;  
  }
  
  float getRightCornerX(){
    return playerPos.x + playerWidth/2;
  }
  
  void setForce(float sped){
    velX = sped;
  }
  
  void update(){
      velX += accX;
      playerPos.x = playerPos.x + velX;
      
  }
  
  void display(){
    if(isHit == false)
    {
      fill(240);
      triangle(playerPos.x, playerPos.y, playerPos.x - playerWidth/2, playerPos.y + playerWidth, playerPos.x + playerWidth/2, playerPos.y + playerWidth);
    }
  }
  
  
}
