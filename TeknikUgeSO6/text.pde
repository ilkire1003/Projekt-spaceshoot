
//Viser scoren og vores liv
void score() {
  fill(255);
  textSize(30);
  text("Score: "+score, width/2-100, 50);
  text("Life: "+life, width-140, 50);
  textSize(50);
  if (life<1) {
    text("Game over", width/2-135, height/2);
    }
  
  
  if(dead == true){
  if(life < 1){

    if(keyPressed == true){
      
      //Genstarter spillet
      life = 3;
      score = 0;
       
     dead = false; 
       
      
      }
    }
  }
}
