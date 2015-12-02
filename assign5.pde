//You should implement your assign2 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LOSE = 2;
final int E1 = 10;
final int E2 = 11;
final int E3 = 12;

int numFrames=5;
PImage [] flame = new PImage[numFrames];
PImage Hp;
PImage Enemyship;
PImage Fightership;
PImage bg1;
PImage bg2;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
PImage shoot;


int x, y, bx;
int randomP,HP_num;
int gameState;
int enemyState;
int space=10;
int [][] emyDATA={{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}};
int [][] boomDATA={{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
int [][] shootDATA={{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}};
float EnemyshipX,EnemyshipY;
float FightershipX,FightershipY;
float treasureX,treasureY;
float speed = 10;
int shootspeed=5;
int currentFrame;
int score=0;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean spacePressed = false;
//boolean rightPressed = false;
boolean onetime= false;


void setup(){
  size(640,480);
  x =0;
  bx=0;
  y = 200;
  HP_num=20;
  randomP=floor(random(100));  
  start2= loadImage("img/start1.png");
  start1= loadImage("img/start2.png");
  end2= loadImage("img/end1.png");
  end1= loadImage("img/end2.png");
  Fightership= loadImage("img/fighter.png");
  Enemyship = loadImage("img/enemy.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  treasure= loadImage("img/treasure.png");
  Hp = loadImage("img/hp.png");
  shoot =loadImage("img/shoot.png");
  EnemyshipY=floor(random(0,height-Enemyship.height));
//  EnemyshipY=0;
  gameState = GAME_START;
  FightershipX=640-Fightership.width-10;
  FightershipY=480/2;
  enemyState=E1;
  for (int i=0; i<numFrames; i++){
    flame[i] = loadImage("img/flame" + (i+1) + ".png");
  }
  frameRate(60);
   currentFrame = 0;
    smooth();
                    
}

void draw(){
  background(255);
//  println(emyDATA.length);

  switch (gameState){
    case GAME_START:
    image(start1,0,0);
      if ((mouseX > 200 && mouseX < 460) && (mouseY > 375 && mouseY < 420)){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
        }else{
          // hover
          noStroke();
          image(start2,0,0);        
        }
      }   
    break;
    
    case GAME_RUN:

      fill(255,0,0);
      image(bg1,((bx+640)%1280-640),0);
      image(bg2,bx%1280-640,0);
      int emyNum=0;
      scoreChange(score);      
      switch (enemyState)
      {
        case E1:
        emyNum=5;
        EnemyshipX=x%(640+5*(Enemyship.width+space))-Enemyship.width;
         for (int i=0;i<emyNum;i++){
            emyDATA[i][1]=(int) EnemyshipY;
            emyDATA[i][0]=(int) EnemyshipX-i*(Enemyship.width+space);
            if (emyDATA[i][2]==0)
             image(Enemyship,emyDATA[i][0],emyDATA[i][1]);
          }
/*
        if (EnemyshipX>=((640+5*(Enemyship.width+space))-1-Enemyship.width))
          onetime=true;
*/          
        if (EnemyshipX==919)
        {
         EnemyshipY=floor(random(Enemyship.height/2,height-Enemyship.height*5));
         enemyState=E2;
         for (int i=0;i<emyNum;i++){
           emyDATA[i][2]=0;
         }
         x=0;
        } 
        
        break;
        
        case E2:
        emyNum=5;
          EnemyshipX=x%(640+5*(Enemyship.width+space))-Enemyship.width;
            for (int i=0;i<emyNum;i++){
              emyDATA[i][1]=(int) EnemyshipY+i*Enemyship.height;
              emyDATA[i][0]=(int) EnemyshipX-i*(Enemyship.width+space);             
            if (emyDATA[i][2]==0)
             image(Enemyship,emyDATA[i][0],emyDATA[i][1]);              
            }
            
         if (EnemyshipX==919)
         {
          EnemyshipY=floor(random(Enemyship.height*2,height-Enemyship.height*3));
          enemyState=E3;
         for (int i=0;i<emyNum;i++){
           emyDATA[i][2]=0;
         }
          x=0;
         }             
            
        break;
        
        case E3:
         emyNum=8;
 
                EnemyshipX=x%(640+5*(Enemyship.width+space))-Enemyship.width;
          
                emyDATA[0][0]=(int) EnemyshipX;
                emyDATA[0][1]=(int) EnemyshipY;

                emyDATA[1][0]=(int) EnemyshipX-1*(Enemyship.width+space);
                emyDATA[1][1]=(int) EnemyshipY+1*Enemyship.height;
                emyDATA[2][0]=(int) EnemyshipX-1*(Enemyship.width+space);
                emyDATA[2][1]=(int) EnemyshipY-1*Enemyship.height;

                emyDATA[3][0]=(int) EnemyshipX-2*(Enemyship.width+space);
                emyDATA[3][1]=(int) EnemyshipY+2*Enemyship.height;
                emyDATA[4][0]=(int) EnemyshipX-2*(Enemyship.width+space);
                emyDATA[4][1]=(int) EnemyshipY-2*Enemyship.height;
                
                emyDATA[5][0]=(int) EnemyshipX-3*(Enemyship.width+space);
                emyDATA[5][1]=(int) EnemyshipY+(4-3)*Enemyship.height;
                emyDATA[6][0]=(int) EnemyshipX-3*(Enemyship.width+space);  
                emyDATA[6][1]=(int) EnemyshipY-(4-3)*Enemyship.height;

                emyDATA[7][0]=(int) EnemyshipX-4*(Enemyship.width+space);  
                emyDATA[7][1]=(int) EnemyshipY;

                
                for (int i=0;i<emyNum;i++)
                {
                 if (emyDATA[i][2]==0)
                  image(Enemyship,emyDATA[i][0],emyDATA[i][1]);              
                }
                
          
         if (EnemyshipX==919)
         {
          EnemyshipY=floor(random(0,height-Enemyship.height));
//  EnemyshipY=0;

          enemyState=E1;
          for (int i=0;i<emyNum;i++){
           emyDATA[i][2]=0;
          }
         }             

        
        break;
      }
      
/*      
       EnemyshipX=x%(640+Enemyship.width-1)-Enemyship.width;
           if (EnemyshipX==-(Enemyship.width))
         EnemyshipY=floor(random(Enemyship.height/2,height-Enemyship.height/2));
        image(Enemyship,EnemyshipX,EnemyshipY);
*/ 
      
      
      image(Fightership,FightershipX,FightershipY);
       treasureX=(640-treasure.width)*randomP/100;
       treasureY=(480-treasure.height)*randomP/100;
      image(treasure,treasureX,treasureY);
      colorMode(RGB);
      rect(10, 2, (Hp.width-15)*HP_num/100, Hp.height*0.7);
      fill(255,0,0);
      image(Hp,0,0);
      x+=5;
      bx++;
      
      
      for (int i=0;i<5;i++)
      {
        if (shootDATA[i][2]==1)
         if (closestEmemy(shootDATA[i][0],shootDATA[i][1],emyNum)!=-1)
          if ((emyDATA[closestEmemy(shootDATA[i][0],shootDATA[i][1],emyNum)][1]+Enemyship.height/2-shootDATA[i][1])>0)
           shootDATA[i][1]+=3;
          else
           shootDATA[i][1]-=3;
      }
      
      
      
      for (int i=0;i<emyNum;i++){
       if (emyDATA[i][2]==0){
        if (isHit(emyDATA[i][0],emyDATA[i][1],Enemyship.width,Enemyship.height,FightershipX,FightershipY,Fightership.width,Fightership.height))
        {
            if (emyDATA[i][2]==0)
            {
             HP_num-=20;
             onetime=true;
            }
            emyDATA[i][2]=1;
            boomDATA[i][0]=emyDATA[i][0];
            boomDATA[i][1]=emyDATA[i][1];
            boomDATA[i][2]=emyDATA[i][2];
            boomDATA[i][3]=frameCount;

        }
/*
        if (((emyDATA[i][0]+Enemyship.width>=FightershipX) && (emyDATA[i][0]+Enemyship.width<=(FightershipX+Fightership.width))) || ((emyDATA[i][0]>=FightershipX) && (emyDATA[i][0]<=(FightershipX+Fightership.width))))
         if (((emyDATA[i][1]+Enemyship.height>=FightershipY) && (emyDATA[i][1]+Enemyship.height<=(FightershipY+Fightership.height))) || ((emyDATA[i][1]>=FightershipY) && (emyDATA[i][1]<=(FightershipY+Fightership.height))))
          {
            if (emyDATA[i][2]==0)
            {
             HP_num-=20;
             onetime=true;
            }
            emyDATA[i][2]=1;
            boomDATA[i][0]=emyDATA[i][0];
            boomDATA[i][1]=emyDATA[i][1];
            boomDATA[i][2]=emyDATA[i][2];
            boomDATA[i][3]=frameCount;
          }
*/        
        
        for (int j=0;j<5;j++)
        {
         if (shootDATA[j][2]==1)
          if (isHit(emyDATA[i][0],emyDATA[i][1],Enemyship.width,Enemyship.height,shootDATA[j][0],shootDATA[j][1],shoot.width,shoot.height))
          {
            shootDATA[j][2]=0;
            emyDATA[i][2]=1;
            boomDATA[i][0]=emyDATA[i][0];
            boomDATA[i][1]=emyDATA[i][1];
            boomDATA[i][2]=emyDATA[i][2];
            boomDATA[i][3]=frameCount;       
            score+=20;
          }
         
/*
          if ((emyDATA[i][0]+Enemyship.width>shootDATA[j][0]) && (emyDATA[i][0]<shootDATA[j][0]+shoot.width)) 
           if ((emyDATA[i][1]+Enemyship.height>shootDATA[j][1]) && (emyDATA[i][1]<(shootDATA[j][1]+shoot.height)))
           {
            shootDATA[j][2]=0;
            emyDATA[i][2]=1;
            boomDATA[i][0]=emyDATA[i][0];
            boomDATA[i][1]=emyDATA[i][1];
            boomDATA[i][2]=emyDATA[i][2];
            boomDATA[i][3]=frameCount;       
            score+=20;
           }
*/          
        }
          
       }
         
         
         
      }

    
     
      for (int i=0;i<emyNum;i++){
        if (boomDATA[i][2]==1)
        if ((frameCount-boomDATA[i][3])<60)
        {
          int f = (currentFrame ++) % numFrames;
          image(flame[f],boomDATA[i][0],boomDATA[i][1]);          
        }
        else
         boomDATA[i][2]=0;
         
      }
      
      
      
      
     if (isHit(treasureX,treasureY,treasure.width,treasure.height,FightershipX,FightershipY,Fightership.width,Fightership.height))
     {
          HP_num+=10;
          if (HP_num>=100)
           HP_num=100;
           randomP=floor(random(100));

     }

/*     
      if (((treasureX+treasure.width>=FightershipX) && (treasureX+treasure.width<=(FightershipX+Fightership.width))) || ((treasureX>=FightershipX) && (treasureX<=(FightershipX+Fightership.width))))
       if (((treasureY+treasure.height>=FightershipY) && (treasureY+treasure.height<=(FightershipY+Fightership.height))) || ((treasureY>=FightershipY) && (treasureY<=(FightershipY+Fightership.height))))
        {
          HP_num+=10;
          if (HP_num>=100)
           HP_num=100;
           randomP=floor(random(100));
        }
        
*/


      for (int i=0;i<5;i++){
        if (shootDATA[i][2]==1){
         image(shoot,shootDATA[i][0],shootDATA[i][1]);
         shootDATA[i][0]-=shootspeed;
        }
        if ((shootDATA[i][0]+shoot.width)<0)
         shootDATA[i][2]=0;
      }
     
   
   
      if (upPressed == true)
        FightershipY-=speed;
      if (FightershipY<=0)
        FightershipY=0;

      if (downPressed == true)
        FightershipY+=speed;
      if (FightershipY>(480-Fightership.height))
        FightershipY=480-Fightership.height;
        

      if (leftPressed == true)
        FightershipX-=speed;
      if (FightershipX<0)
        FightershipX=0;        

      if (rightPressed == true)
        FightershipX+=speed;
      if (FightershipX>(640-Fightership.width))
        FightershipX=640-Fightership.width;
         
      if (HP_num<=0)
         gameState = GAME_LOSE;
      
    break;
     
    case GAME_LOSE:
    image(end1,0,0);
      if ((mouseX > 200 && mouseX < 436) && (mouseY > 305 && mouseY < 349)){
        if (mousePressed){
          // click
       EnemyshipY=floor(random(0,height-Enemyship.height));
          gameState = GAME_START;
          FightershipX=640-Fightership.width-10;
          FightershipY=480/2;
          x=0;
          HP_num=20;
            for (int i=0;i<10;i++){
             emyDATA[i][2]=0;
           }
            for (int i=0;i<5;i++){
             shootDATA[i][2]=0;
           }
           enemyState=E1;
          gameState = GAME_RUN;
          score=0;
        }else{
          // hover
          noStroke();
          image(end2,0,0);        
        }
      }
    
    break;
  }
  
  
}

void scoreChange(int score)
{
  textSize(20);
  String showscore="Score: ";
  showscore+=score;
  text(showscore, 0, height-20);  
}

boolean isHit(float ax,float ay,float aw,float ah,float bx,float by,float bw,float bh)
{
  if (((by<(ay+ah)) && (ay<(by+bh))) && (((ax+aw)>bx) && ((bx+bw)>ax)))
   return true;
  else
   return false;
}

int closestEmemy(int x,int y,int emyNum)
{
   float distance=0;
   float predistance=0;
   int close=9;
   for (int i=0;i<=emyNum;i++)
   {
     if (emyDATA[i][2]==0)
      distance=(x-emyDATA[i][0])^2+(y-emyDATA[i][1])^2;
      
     if (distance!=0)
      if (predistance>distance)
      {
       predistance=distance;
        close=i;
      }
   }
   
   if (close==9)
    return -1;
   else
    return close;
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      case 13:
        spacePressed = true;
        println("haha");
        break;
    }
  }
      if (key == ' '){
        int s=0;
        for (int i=0;i<5;i++){
         if (shootDATA[i][2]==0){
           if (s==0){
             shootDATA[i][0]=(int) FightershipX;
             shootDATA[i][1]=(int) FightershipY+Fightership.height/2-shoot.height/2;
             shootDATA[i][2]=1;
             s=1;
           }
         }
        }
      }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      case 13:
        spacePressed = false;
        break;

  }
  }


}
