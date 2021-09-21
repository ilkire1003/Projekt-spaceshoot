class particleSystem {
  ArrayList<particle> particles = new ArrayList<particle>();
  int timeCount;
  int expansionForce;
  int accCounter = 4;
  PVector location;
  
  particleSystem(int numberOfParticles, int accC, PVector loc, int expForc, int timeC) {
    particle tempParticle;
    timeCount = timeC;
    expansionForce = expForc;
    location = loc;
    accCounter = accC;
    
    
    for(int i = 0; i < numberOfParticles; i++) {
      tempParticle = new particle((int)random(1,17), expansionForce, location, timeCount);
      particles.add(tempParticle);
    }
  }
  
  void update() {
    if(accCounter > 0) accCounter--;
    timeCount--;
    
    for(int i = particles.size() - 1; i >= 0; i--) {
      if(particles.get(i).update(accCounter) == true) {
        particles.remove(i);
      }
      else {
        particles.get(i).drawP();
      }
    }
    
  } 
}

class particle {
  int mass;
  int TCP;
  PVector acceleration;
  PVector speed;
  color Color;
  PVector location;
  int konstant = 5;
  
  particle(int m, int expForce, PVector loc, int TC){
   mass = m;
   acceleration = new PVector(random(-2,2) * expForce/m, random(-2,2) * expForce/m);
   speed = new PVector(0,0);
   Color = color(255, 0, 0);
   location = loc.copy();
   TCP = round(TC * log(m) / konstant);
   
  }
  
  boolean update(int accT) {
    float tempRed = 255;
    float tempBlue = 255;
    
    if(accT == 0) acceleration.mult(0);
    speed.add(acceleration);
    location.add(speed);
    TCP--;
    tempRed = red(Color) - round(100/mass);
    tempBlue = blue(Color) + round(100/mass);
    if(tempRed < 100) tempRed = 100;
    if(tempBlue > 250) tempBlue = 250;
    Color = color(tempRed, 0 , tempBlue);
    
    
    if(TCP <= 0) return true;
    else return false;
  }
  
  void drawP() {
    int max = 255;
    if(TCP <= 5) max *= TCP/6;
    //fill(Color, max);
    fill(Color);
    ellipse(location.x, location.y, 10*round(pow((mass/4), 0.33)), 10*round(pow((mass/4), 0.33)));
  }
  
}
