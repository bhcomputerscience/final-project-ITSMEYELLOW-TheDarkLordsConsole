/**
 * A program that lets you shake sprites around
 *
 * @author ROWAN
 * @version May 7, 2026
 */
 
 ArrayList<Sprite> sprites;
 
 boolean jarShaken;
 final color BACKGROUND = 204;
 
 void setup()
 {
   size(300, 300);
   sprites = new ArrayList<Sprite>();
   jarShaken = false;
   
   
   for(int index = 0; index < 2; index++)
  {
    Sprite newSprite = new Sprite(random(width/8, width-(width/8)), random(height/8, height-(height/8)), 2+index);
    sprites.add(newSprite);
  }
  
 }
 
 void draw()
 {
   background(BACKGROUND);
   showSprites();
   //collideSprites(); //DO NOT CALL THIS IN!
   
 }
 
 void mousePressed()
 {
   //changeJarStatus();
   if(jarShaken == false)
   {
     jarShaken = true;
   }
   else if(jarShaken == true)
   {
     jarShaken = false;
   }
   
   
 }
 
/* void changeJarStatus()
 {
   if(jarShaken == false)
   {
     jarShaken = true;
   }
   else if(jarShaken == true)
   {
     jarShaken = false;
   }
 }
 */
 void showSprites()
 {
   for(int index = 0; index < sprites.size(); index++)
  {
    (sprites.get(index)).display();
    (sprites.get(index)).gravity(jarShaken);
    (sprites.get(index)).bounce(jarShaken);
    (sprites.get(index)).move();
    
  }
 }
 
 void collideSprites()
 {
   Sprite first = sprites.get(0);
   Sprite second = sprites.get(1);
   
   first.spriteCollide(second.getX(), second.getY(), jarShaken);
   second.spriteCollide(first.getX(), first.getY(), jarShaken);
   
 }
