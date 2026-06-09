/*
* The object for the character you shake around.
*/

class Sprite
{
  private float x, y;
  private float dX, dY; //how much the sprite moves
  private int skin; //variable that tells us which sprite skin to use
  private int xDirection = 1; //left and right
  private int yDirection = 1; //up and down
  private PImage image;
  
  private final float GRAVITY_SPEED = 3.0;
  private final float SPEED = random(6, 8);
 
  
  public Sprite(float xPos, float yPos, int skinNumber)
  {
    x = xPos;
    y = yPos;
    skin = skinNumber;
    chooseSkin();
  }
  
  private void chooseSkin()
  {
    if(skin == 1)
    {
      image = loadImage("rivaan.png");
    }
    else if(skin == 2)
    {
      image = loadImage("chosen.png");
    }
    else if(skin == 3)
    {
      image = loadImage("dark.png");
    }
  }
  
  public void display()
  {
    imageMode(CENTER);
    image(image, x, y);
  }
  
  public void move()
  { 
    x = x + (dX*xDirection);
    y = y + (dY*yDirection);
  }
  
  public void bounce(boolean isShaken)
  {
    if(isShaken == false)
    {
      slowBounce();
    }
    else if(isShaken == true)
    {
      speedBounce();
    }
    boundEnforce();
  }
  
  private void slowBounce() //slows down the bouncing
  {
    if(x <= 0+image.width/2 || x >= width-(image.width/2))
    {
      xDirection *= -1;
      decreaseSpeedX();
    }
    if(y <= 0+image.height/2 || y >= height-(image.height/2))
    {
      
      if(yDirection == -1)
      {
        yDirection = 1;
      }
      decreaseSpeedY();
    }
  }
  
  
  private void speedBounce() //speeds up the bouncing
  {
    if(x <= 0+image.width/2 || x >= width-(image.width/2))
    {
      xDirection *= -1;
      increaseSpeedX();
    }
    if(y <= 0+image.height/2 || y >= height-(image.height/2))
    {
      yDirection *= -1;
      increaseSpeedY();
    }
  }
  
  public void gravity(boolean isShake)
  {
    
    if(isShake == false)
    {
      if(yDirection == -1)
      {
        yDirection = 1;
      }
      if(y <= width-(image.height/2))
      {
        dY = GRAVITY_SPEED;
      }
      else
      {
        dY = 0;
      }
    }
    else if(isShake == true)
    {
       dY += 0.1;
       dX += 0.1;
    }
    
  }
  
  //increases the speed for the x value
  private void increaseSpeedX()
  {
    if(x == dX)
    {
      dX += 0.1;
    }
    else 
    {
      if(abs(dX) - abs(x) < SPEED)
      {
        dX *= 2.0;
      }
      else
      {
        dX = SPEED;
      }
    }
  }
  
  //increases the speed for the y value
  private void increaseSpeedY()
  {
    if(y == dY)
    {
      dY += 1.0;
    }
    else 
    {
      if(abs(dY) - abs(y) < SPEED)
      {
        dY *= 2.0;
      }
      else
      {
        dY = SPEED;
      }
    }
  }
  
  //decrease speed
  
  //decreases speed for x value
  private void decreaseSpeedX()
  {
    if(dX < 0.7)
    {
      dX = 0;
    }
    else 
    {
      if(dX > 0)
      {
        dX /= 1.5;
      }
      else
      {
        dX = 0;
      }
    }
  }
  
  private void decreaseSpeedY()
  {
    if(y <= width-(image.height/2))
    {
      if(dY < GRAVITY_SPEED)
      {
        dY = GRAVITY_SPEED;
      }
      else 
      {
        if(dY > 0)
        {
          dY /= 2.0;
        }
        else
        {
          dY = GRAVITY_SPEED;
        }
      }
    }
  }
  
  
  //keeps it from going out of bounds
  private void boundEnforce() 
  {
    if(x <= 0)
    {
      x = image.width;
    }
    if(y <= 0)
    {
      y = image.height;
    }
  }
  
  
  //makes sprites bounce off of each other
  public void spriteCollide(float otherXpos, float otherYpos, boolean isShake)
  {
    if(isShake == true)
    {
      if(y <= otherYpos-(image.height/2) || y >= otherYpos+(image.height/2))
      {
        if(x <= otherXpos-(image.width/2) || x >= otherXpos+(image.width/2))
        {
          //change x direction
          xDirection *= -1;
          increaseSpeedX();
          
          //change y direction
          yDirection *= -1;
          increaseSpeedY();
          
        }//if x
      } //if y 
    } //if(isShake == true)
  }//spriteCollide
  
  
  //returns current x and y of sprite
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  
} //End of class - NO CODE PAST HERE
