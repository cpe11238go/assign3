
//Player
float PlayerX;
float PlayerY;
float PlayerSpeed = 5;
boolean upPressed    = false;
boolean downPressed  = false;
boolean leftPressed  = false;
boolean rightPressed = false;
int PlayerHp = 100;

//Background 
float BGX1 = 0;
float BGX2 = 0;
float BGSpeed = 3;

//Emeny
float EnemyX = 0;
float EnemyY = 0;
float EnemySpeed = 4;
float EnemyState = 1;

//Treasure
float TreasureX = 0;
float TreasureY = 0;

//Picture
PImage bg1;
PImage bg2;
PImage fighter;
PImage enemy;
PImage hp;
PImage treasure;

void setup () 
{
  //Picture Load
  bg1       = loadImage("img/bg1.png");
  bg2       = loadImage("img/bg2.png");
  fighter   = loadImage("img/fighter.png");
  enemy     = loadImage("img/enemy.png");
  hp        = loadImage("img/hp.png");
  treasure  = loadImage("img/treasure.png");
  size(640, 480) ;
  BGX2 = BGX2-width;
  PlayerX = width-50;
  PlayerY = height/2;
  TreasureX = random(width-50);
  TreasureY = random(height-50);
}

void draw() 
{
  
      //Background 
      image(bg1,BGX1,0);
      image(bg2,BGX2,0);
      BGX1 += BGSpeed;
      BGX2 += BGSpeed;
      if(BGX1>width)
        BGX1 = 0-width;
      if(BGX2>width)
        BGX2 = 0-width;
        
      //Player HP
      colorMode(RGB);
      fill(255,0,0);
      rect(5,5,200,23);
      
      image(hp,0,0);
      
      //Player move
      if (upPressed) 
        PlayerY -= PlayerSpeed;
      if (downPressed) 
        PlayerY += PlayerSpeed;
      if (leftPressed) 
        PlayerX -= PlayerSpeed;
      if (rightPressed) 
        PlayerX += PlayerSpeed;
      
      // boundary detection
      if(PlayerX>width-50)
        PlayerX=width-50;
      if(PlayerX<0)
        PlayerX=0;
      if(PlayerY>height-50)
        PlayerY=height-50;
      if(PlayerY<0)
        PlayerY=0;
      
      //Player Location
      image(fighter,PlayerX,PlayerY);
        
      //Enemy
      if(EnemyState==1)
      {
        image(enemy,EnemyX,EnemyY);
        image(enemy,EnemyX-80,EnemyY);
        image(enemy,EnemyX-160,EnemyY);
        image(enemy,EnemyX-240,EnemyY);
        image(enemy,EnemyX-320,EnemyY);
        EnemyX += EnemySpeed; 
        if(EnemyX-320>width)
        {
          EnemyX = 0;
          EnemyY = random(height-210);
          EnemyState+=1;
        }
      }
     if(EnemyState==2)
      {
        image(enemy,EnemyX,EnemyY);
        image(enemy,EnemyX-80,EnemyY+40);
        image(enemy,EnemyX-160,EnemyY+80);
        image(enemy,EnemyX-240,EnemyY+120);
        image(enemy,EnemyX-320,EnemyY+160);
        EnemyX += EnemySpeed; 
        if(EnemyX-320>width)
        {
          EnemyX = 0;
          EnemyY = random(140,height-190);
          EnemyState+=1;
        }
      }
      if(EnemyState==3)
      {
        image(enemy,EnemyX,EnemyY);
        image(enemy,EnemyX-70,EnemyY+70);
        image(enemy,EnemyX-70,EnemyY-70);
        image(enemy,EnemyX-140,EnemyY+140);
        image(enemy,EnemyX-140,EnemyY-140);
        image(enemy,EnemyX-210,EnemyY+70);
        image(enemy,EnemyX-210,EnemyY-70);
        image(enemy,EnemyX-280,EnemyY);
        EnemyX += EnemySpeed; 
        if(EnemyX-320>width)
        {
          EnemyX = 0;
          EnemyY = random(height-50);
          EnemyState = 1;
        }
      }
      
      //Treasure
      image(treasure,TreasureX,TreasureY);
      
      //Collision (Player and Treasure)
      if(abs(PlayerX-TreasureX)<50)
      {
        if(abs(PlayerY-TreasureY)<50)
        {
          TreasureX = random(width-50);
          TreasureY = random(height-50);
        }    
      }
}
void keyPressed()
{
   if (key == CODED) 
   { 
    switch (keyCode) 
    {
      case UP:
        upPressed    = true;
        break;
      case DOWN:
        downPressed  = true;
        break;
      case LEFT:
        leftPressed  = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}
void keyReleased()
{
   if (key == CODED) 
   {
      switch (keyCode) 
      {
        case UP:
          upPressed    = false;
          break;
        case DOWN:
          downPressed  = false;
          break;
        case LEFT:
          leftPressed  = false;
          break;
        case RIGHT:
          rightPressed = false;
          break;
    }
  }
}
