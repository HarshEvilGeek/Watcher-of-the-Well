import fisica.*;

FWorld world;
FPoly poly;
Maxim maxim;
AudioPlayer exp,laser,treegrowth,r1sound1,r1sound2,r1sound3,r2sound,r3sound,metsound,bhSound,spiritSound;
PImage[] explosion,cooldown;
int CDN=13;
int s;
int dispScore=0;
PImage[] num;
PImage titlescreen,title,play,playh,instr,instrh,credits,creditsh,creditstext,gobacktomenu,gobacktomenuh,page1text,page2text,page3text,page4text;
PImage pausepage1text,pausepage2text,pausepage3text,pausepage4text, pausenext, pauseback, pausehome, pausenexth, pausebackh, pausehomeh, next, nexth, back, backh;
PImage levelText,comboText,krakenText;
PImage[] Numbers;
PImage[] sentinel;
PFont aharoni20;
int[] gvx={-40, 65, 138, 201, 258, 297, 332, 362, 373, 402, 418, 440, 516, 550, 634, 785, 791, 820, 834, 865, 870};
int[] gvy={380, 380, 372, 355, 428, 428, 414, 427, 426, 395, 392, 407, 394, 384, 366, 360, 495, 534, 564, 604, 636};
int gbits;
int level=0,levelwait=100,levelCount=0;
int count=0;
int rockWait=125,treeWait=450,astWait=400,spiritWait=1250,bholeWait=1250;
float psize=100;
float maxX=0,maxY=0,minX=1000,minY=1000,maxYsX,minXsY;
ArrayList<FPoly> grounds;
ArrayList<FCircle> robot1;
ArrayList<FCircle> robot2;
ArrayList<FCircle> robot3;
PImage background, sky, tower, Robot1, Robot2, Robot3, tree, meteor, spirit, blackhole;
PImage rockButton,treeButton,astButton,spiritButton,bholeButton,rBox;
PImage pcredits,pcreditsh,pinstructions,pinstructionsh,pnewgame,pnewgameh,presumegame,presumegameh,ptitle,pwash;
PImage[] healthbar;
boolean crob1=false,crob2=false,crob3=false;
int waitR1=300,waitR2=3400,waitR3=10000;
int rob1=0,maxrob1=250,countR1=0,rob2=0,maxrob2=150,countR2=0,rob3=0,maxrob3=100,countR3=0;
int r1wait=350,r2wait=550,r3wait=650;
int r1speed=5,r2speed=7,r2boost=0,r3speed=0;
boolean r3rand=false;
boolean[] destR1,destR2,destR3;
boolean groundTouch=false;
boolean drawTree;
float treex,treey;
FPoly tree1,tree2,tree3;
int[] explosionX,explosionY;
int expNo=0;
int expdisp[];
int trees=0, maxtrees=0;
int tree1count=0,tree2count=0,tree3count=0;
float tree1height,tree2height,tree3height,tree1x,tree2x,tree3x,tree1y,tree2y,tree3y;
boolean tree1on=false,tree2on=false,tree3on=false,gotPosition=false;
int score=0;
int experience=0;
int health=100;
int rockCount=100, sbCount=0,cometCount=0, BHCount=0;
boolean createSB=false,createComet=false,cometPressed=false,createBH=false,BHPressed=false;
int cometX, cometY, waves=0, maxWaves=0, BHX, BHY;
int rockLevel=1,treeLevel=0,astLevel=0,spiritLevel=0,bholeLevel=0;
int nrockLevel=1,ntreeLevel=3,nastLevel=4,nspiritLevel=8,nbholeLevel=10;
int nextExperiencePoint=100;
int lastkillX,lastkillY,comboX,comboY,comboCount=-1,comboKill;
int killcount=0,killtimer=0;
FCircle sb;
FCircle com1,com2,com3,com4,com5;
FCircle BH;
Button rockB,treeB,astB,spiritB,bholeB;
FBox outline;
boolean rpressed=false,tpressed=false,apressed=false,spressed=false,bpressed=false;
boolean pause=false, intro=true;
boolean playHov=false,instrHov=false,creditsHov=false,playP=false,instrP=false,creditsP=false,instrDo=false,creditsDo=false;
boolean GoBackMenuHov=false,GoBackMenuP=false,instrNextHov=false,instrNextP=false,instrBackHov=false,instrBackP=false;
int instPage=1;
boolean pauseResumeHov=false,pauseResumeP=false,pauseNGHov=false,pauseNGP=false,pauseInstrHov=false,pauseInstrP=false,pauseInstrDo=false,pauseGBHov=false,pauseGBP=false;
int recent;
boolean lev2tree=false;

void setup() {
  explosionX=new int[500];
  explosionY=new int[500];
  expdisp=new int[500];
  maxim=new Maxim(this);
  size(980, 640);
  smooth();
  destR1=new boolean[maxrob1];
  destR2=new boolean[maxrob1];
  destR3=new boolean[maxrob1];
  for(int i=0;i<maxrob1;i++)
    destR1[i]=false;
  for(int i=0;i<maxrob2;i++)
    destR2[i]=false;
  for(int i=0;i<maxrob3;i++)
    destR3[i]=false;
  background=loadImage("Background1.png");
  sky=loadImage("Sky.png");
  tower=loadImage("tower.png");
  Robot1=loadImage("Robot1.png");
  Robot2=loadImage("Robot2.png");
  Robot3=loadImage("Robot3.png");
  tree=loadImage("tree.png");
  meteor=loadImage("Meteor.png");
  spirit=loadImage("SpiritBall.png");
  blackhole=loadImage("BlackHole.png");
  rockButton=loadImage("RockButton.png");
  treeButton=loadImage("TreeButton.png");
  astButton=loadImage("AstButton.png");
  spiritButton=loadImage("SpiritButton.png");
  bholeButton=loadImage("BHoleButton.png");
  rBox=loadImage("box.png");
  title=loadImage("Title.png");
  play=loadImage("Play.png");
  instr=loadImage("Instructions.png");
  credits=loadImage("Credits.png");
  playh=loadImage("PlayH.png");
  instrh=loadImage("InstructionsH.png");
  creditsh=loadImage("CreditsH.png");
  titlescreen=loadImage("TitleScreen.png");
  pcredits=loadImage("PCredits.PNG");
  pcreditsh=loadImage("PCreditsH.PNG");
  pinstructions=loadImage("PInstructions.PNG");
  pinstructionsh=loadImage("PInstructionsH.PNG");
  pnewgame=loadImage("PNewGame.PNG");
  pnewgameh=loadImage("PNewGameH.PNG");
  presumegame=loadImage("PResumeGame.PNG");
  presumegameh=loadImage("PResumeGameH.PNG");
  ptitle=loadImage("PTitle.PNG");
  pwash=loadImage("PWash.png"); 
  pausepage1text=loadImage("PausePage1Text.png");
  pausepage2text=loadImage("PausePage2Text.png");
  pausepage3text=loadImage("PausePage3Text.png");
  pausepage4text=loadImage("PausePage4Text.png");
  pauseback=loadImage("PauseBack.png");
  pausenext=loadImage("PauseNext.png");
  pausehome=loadImage("PauseHome.png");
  pausenexth=loadImage("PauseNextH.PNG");
  pausebackh=loadImage("PauseBackH.png");
  pausehomeh=loadImage("PauseHomeH.PNG");
  creditstext=loadImage("CreditsText.png");
  gobacktomenu=loadImage("GoBackToMenu.png");
  gobacktomenuh=loadImage("GoBackToMenuH.png");
  next=loadImage("Next.PNG");
  nexth=loadImage("NextH.png");
  back=loadImage("Back.png");
  backh=loadImage("BackH.png");
  page1text=loadImage("Page1Text.png");
  page2text=loadImage("Page2Text.png");
  page3text=loadImage("Page3Text.png");
  page4text=loadImage("Page4Text.png");
  levelText=loadImage("Writing/LEVEL.png");
  comboText=loadImage("Writing/COMBO X.png");
  krakenText=loadImage("Writing/Kraken.png");
  Numbers=loadImages("Writing/Numbers/n",".png",10);
  aharoni20=loadFont("Aharoni-Bold-20.vlw");
  healthbar=loadImages("Health Bar/hb",".png",21);
  sentinel=loadImages("Sentinel/Sentinel",".png",3);
  rockB=new Button(20,520,50,50);
  rockB.setImage(rockButton);
  treeB=new Button(100,520,50,50);
  treeB.setImage(treeButton);
  astB=new Button(180,520,50,50);
  astB.setImage(astButton);
  spiritB=new Button(260,520,50,50);
  spiritB.setImage(spiritButton);
  bholeB=new Button(340,520,50,50);
  bholeB.setImage(bholeButton);
  explosion=loadImages("Explosion/Explosion",".png",13);
  cooldown=loadImages("CoolDown/CoolDown",".png",CDN);
  exp=maxim.loadFile("explosion.wav");
  exp.setLooping(false);
  laser=maxim.loadFile("DestroyRock.wav");
  laser.setLooping(false);
  laser.volume(0.8);
  treegrowth=maxim.loadFile("tree.wav");
  treegrowth.setLooping(false);
  treegrowth.speed(1.2);
  metsound=maxim.loadFile("meteor.wav");
  metsound.setLooping(false);
  metsound.speed(1.2);
  r1sound1=maxim.loadFile("R1sound1.wav");
  r1sound1.setLooping(false);
  r1sound1.volume(0.1);
  r1sound2=maxim.loadFile("R1sound2.wav");
  r1sound2.setLooping(false);
  r1sound2.volume(0.1);
  r1sound3=maxim.loadFile("R1sound3.wav");
  r1sound3.setLooping(false);
  r1sound3.volume(0.1);
  r2sound=maxim.loadFile("R2sound.wav");
  r2sound.setLooping(false);
  r2sound.volume(0.4);
  r3sound=maxim.loadFile("R3sound.wav");
  r3sound.setLooping(false);
  r3sound.speed(0.8);
  bhSound=maxim.loadFile("blackhole.wav");
  bhSound.setLooping(false);
  bhSound.volume(3);
  Fisica.init(this);
  gbits=gvx.length-1;
  grounds=new ArrayList<FPoly>();
  robot1=new ArrayList<FCircle>();
  robot2=new ArrayList<FCircle>();
  robot3=new ArrayList<FCircle>();
  world = new FWorld();
  world.setGravity(0, 1500);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  world.setEdgesRestitution(0.5);
  for(int i=0;i<gbits;i++)
  {
    FPoly ground=new FPoly();
    ground.setNoStroke();
    ground.setFill(0, 0, 0, 0);
    if(i<gbits-8)
      ground.setDensity(0.1);
    ground.setStatic(true);
    ground.setRestitution(0.5);
    ground.vertex(gvx[i],gvy[i]);
    ground.vertex(gvx[i+1],gvy[i+1]);
    ground.vertex(gvx[i+1],height);
    ground.vertex(gvx[i], height);
    ground.setGrabbable(false);
    ground.setRotatable(false);
    grounds.add(ground);
    world.add(ground);
  }
  FPoly tow1=new FPoly();
  FPoly tow2=new FPoly();
  FPoly edge= new FPoly();
  edge.setFill(0, 0, 0, 0);
  edge.setDensity(0);
  edge.setStatic(true);
  edge.setRestitution(0.5);
  edge.setNoStroke();
  edge.vertex(785,359);
  edge.vertex(804,358);
  edge.vertex(813,366);
  edge.vertex(812,380);
  edge.vertex(787,381);
  edge.setGrabbable(false);
  edge.setRotatable(false);
  grounds.add(edge);
  world.add(edge);
  tow1.setFill(0, 0, 0, 0);
  tow1.setDensity(1.5);
  tow1.setStatic(true);
  tow1.setNoStroke();
  tow1.setRestitution(0.5);
  tow1.vertex(552,384);
  tow1.vertex(582,294);
  tow1.vertex(620,288);
  tow1.vertex(633,365);
  tow1.setGrabbable(false);
  tow1.setRotatable(false);
  grounds.add(tow1);
  world.add(tow1);
  tow2.setFill(0, 0, 0, 0);
  tow2.setDensity(1.5);
  tow2.setStatic(true);
  tow2.setRestitution(0.5);
  tow2.setNoStroke();
  tow2.vertex(582,294);
  tow2.vertex(504,173);
  tow2.vertex(512,160);
  tow2.vertex(530,144);
  tow2.vertex(644,141);
  tow2.vertex(668,148);
  tow2.vertex(675,168);
  tow2.vertex(622,289);
  tow2.setGrabbable(false);
  tow2.setRotatable(false);
  grounds.add(tow2);
  gbits+=3;
  world.add(tow2);
  imageMode(CENTER);
  s=0;
}

void draw() {
  if(!intro)
  {
  if(!pause)
    killtimer++;
  if(killtimer>100)
  {
    killcount=0;
    killtimer=0;
  }
  
  if((killtimer==100)&&(killcount>1))
  {
    comboCount=0;
    comboX=lastkillX;
    comboY=lastkillY;
    comboKill=killcount;
  }
  
  if((BHCount>1)&&(BHCount<300))
    tint(200,200,255);
  image(sky,width/2,height/2,width,height);
  tint(255,255,255);
  
  
  
  if(!pause)
    levelCount++;
  if(levelCount>levelwait)
  {
    if(level<5)
    {
      if(levelCount<(levelwait+255))
      {
        tint(255,(levelCount-levelwait));
        image(levelText,width/2 - 90,height/2);
        image(Numbers[level+1],width/2, height/2);
        tint(255);
      }
      else
      {
        levelwait=3000;
        levelCount=0;
        level++;
        if(level==5)
          r3rand=true;
        r1speed+=1;
        r2speed+=1;
        r3speed+=50;
        r2boost+=10;
        if(level>3)
          r2boost+=10;
        r1wait-=25;
        r2wait-=25;
        r3wait-=25;
      }
    }
    else
    {
      if((levelCount<(levelwait+255))&&(level==5))
      {
        tint(255,(levelCount-levelwait));
        image(krakenText,width/2-100,height/2-100);
        tint(255);
      }
      else
      {
        levelwait=500;
        r1wait=max(r1wait-=25,0);
        r2wait=max(r2wait-=25,0);
        r2wait=max(r2wait-=25,0);
        levelCount=0;
        level++;
        r1speed++;
        r2boost+=10;
        r2speed++;
        r3speed+=25;
      }
      
    }
  }
  if(tree1on)
  {
    if(!pause)
      tree1count++;
    float imght;
    if(tree1count<=20)
    {
      if(tree1count<=10)
        s=2;
      else
        s=1;
      tree1.setPosition(0,-(tree1count*tree1height/20));
      imght=tree1height*(float)tree1count/20;
    }
    else if(tree1count>280)
    {
      tree1.setPosition(0,-((300-tree1count)*tree1height/20));
      imght=tree1height*(float)(300-tree1count)/20;
    }
    else
      imght=tree1height;
    if(tree1count>=300)
    {
      world.remove(tree1);
    }
    else
      image(tree,tree1x,tree1y-imght/2+10,imght*5/15+5,imght+15);
    if(tree1count>=treeWait)
    {
      tree1count=0;
      tree1on=false;
      trees--;
    }
  }
  if(tree2on)
  {
    if(!pause)
      tree2count++;
    float imght;
    if(tree2count<=20)
    {
      if(tree2count<=10)
        s=2;
      else
        s=1;
      tree2.setPosition(0,-(tree2count*tree2height/20));
      imght=tree2height*(float)tree2count/20;
    }
    else if(tree2count>280)
    {
      tree2.setPosition(0,-((300-tree2count)*tree2height/20));
      imght=tree2height*(float)(300-tree2count)/20;
    }
    else
      imght=tree2height;
    if(tree2count>=300)
    {
      world.remove(tree2);
    }
    else
      image(tree,tree2x,tree2y-imght/2+10,imght*5/15+5,imght+15);
    if(tree2count>=treeWait)
    {
      tree2count=0;
      tree2on=false;
      trees--;
    }
  }
  if(tree3on)
  {
    if(!pause)
      tree3count++;
    float imght;
    if(tree3count<=20)
    {
      if(tree3count<=10)
        s=2;
      else
        s=1;
      tree3.setPosition(0,-(tree3count*tree3height/20));
      imght=tree3height*(float)tree3count/20;
    }
    else if(tree3count>280)
    {
      tree3.setPosition(0,-((300-tree3count)*tree3height/20));
      imght=tree3height*(float)(300-tree3count)/20;
    }
    else
      imght=tree3height;
    if(tree3count>=300)
    {
      world.remove(tree3);
    }
    else
      image(tree,tree3x,tree3y-imght/2+10,imght*5/15+5,imght+15);
    if(tree3count>=treeWait)
    {
      tree3count=0;
      tree3on=false;
      trees--;
    }
  }
  
  image(sentinel[s],(17*width)/30+4,(38*height)/108-3);
  s=0;
  image(tower,width/2+100,height/2-53,width/5,height/2.5);
  image(background,width/2,height/2,width,height);
  int combolength=240;//how long you want it to stay
  if(comboCount>=0)
  {
    if(comboCount==0)
      score+=comboKill*10*comboKill;
    tint(255,comboCount);
    image(comboText,comboX+10,comboY-10,200,20);
    if(comboKill>9)
      comboKill=9; //Can't be greater than 9 right now, you can fix this by taking mod 10 and dividing by 10 and displaying 2 numbers. 10 might be possible with a blackhole
    image(Numbers[comboKill],comboX+65,comboY-10,30,20);
    tint(255);
    comboCount++;
    if(comboCount>combolength)
      comboCount=-1;
  }
  }
  if(!intro)
  {
    rockB.display();
    treeB.display();
    astB.display();
    spiritB.display();
    bholeB.display();
    if(treeLevel==0)
      image(cooldown[0],125,545,50,50);
    if(astLevel==0)
      image(cooldown[0],205,545,50,50);
    if(spiritLevel==0)
      image(cooldown[0],285,545,50,50);
    if(bholeLevel==0)
      image(cooldown[0],365,545,50,50);
    if(!pause)
    {
      if(rockCount<rockWait)
      {
        image(cooldown[rockCount*CDN/rockWait],45,545,50,50);
      }
      if(treeLevel==1)
      {
        if((tree1count>0)&&(tree1count<treeWait))
          image(cooldown[tree1count*CDN/treeWait],125,545,50,50);
      }
      
      if(treeLevel==2)
      {
        if((tree1count<treeWait)&&(trees==maxtrees))
        {
          if(!lev2tree)
            recent=max(max(tree1count,tree2count),tree3count);
          lev2tree=true;
          int tc=max(max(tree1count,tree2count),tree3count);
          image(cooldown[((tc-recent)*CDN)/(treeWait-recent)],125,545,50,50);
        }
        else
          lev2tree=false;
      }
      if(astLevel>0)
      {
        if((cometCount>0)&&(cometCount<astWait))
          image(cooldown[cometCount*CDN/(astWait+2)],205,545,50,50);
      }
      
      if(spiritLevel==1&&(sbCount>0))
        image(cooldown[sbCount*CDN/(spiritWait+2)],285,545,50,50);
      if(bholeLevel==1&&(BHCount>0))
        image(cooldown[BHCount*CDN/(bholeWait+2)],365,545,50,50);
    }
    
    fill(0,0,0);
    textFont(aharoni20,20);
    if(dispScore<score)
      dispScore++;
    text("SCORE: "+dispScore,745,70);
    text("EXPERIENCE: "+experience,745,105);
    int h=max(health,0);
    image(healthbar[h/5],(3*width)/5,(height*2)/11,102,8);
  }
  
  if((!pause)&&(!intro))
    world.step();
  world.draw(this); 
 
  if(score>nextExperiencePoint)
  {
    experience++;
    if(level<3)
      nextExperiencePoint+=90;
    else if(level<5)
      nextExperiencePoint+=120;
    else
      nextExperiencePoint+=150;
  }
  rockCount++;
  
  if(expNo>0)
  {
    for(int i=0;i<expNo;i++)
    {
      if(expdisp[i]>0)
      {
        if(expdisp[i]<=13)
        {
          image(explosion[expdisp[i]-1],explosionX[i],explosionY[i],60,60);
          expdisp[i]++;
        }
        else
          expdisp[i]=0;
      }
    }
  }
  
  for(int i=0;i<gbits;i++)
  {
    FPoly ground=grounds.get(i);
    ground.draw(this);
  }
  
  if(intro)
    {
      image(titlescreen,width/2,height/2,width,height);
    if((!instrDo)&&(!creditsDo))      
    {
    int playPosX=100,instPosX=290,creditsPosX=500;
    int playPosY=324,instPosY=320,creditsPosY=320;
    float scale=2;
    image(title,240,180,756.0/2.3,234.0/2.3);
    if((mouseX>playPosX-44)&&(mouseX<playPosX+44)&&(mouseY>playPosY-15)&&(mouseY<playPosY+15))
    {
      image(playh,playPosX,playPosY,165/scale,69/scale);
      playHov=true;
    }
    else
    {
      image(play,playPosX,playPosY,165/scale,69/scale);
      playHov=false;
    }
    if((mouseX>instPosX-100)&&(mouseX<instPosX+100)&&(mouseY>instPosY-15)&&(mouseY<instPosY+15))
    {
      image(instrh,instPosX,instPosY,413/scale,56/scale);
      instrHov=true;
    }
    else
    {
      image(instr,instPosX,instPosY,413/scale,56/scale);
      instrHov=false;
    }
    if((mouseX>creditsPosX-60)&&(mouseX<creditsPosX+60)&&(mouseY>creditsPosY-15)&&(mouseY<creditsPosY+15))
    {
      image(creditsh,creditsPosX,creditsPosY,242/scale,56/scale);
      creditsHov=true;
    }
    else
    {
      image(credits,creditsPosX,creditsPosY,242/scale,56/scale);
      creditsHov=false;
    }
  }
  else if(creditsDo)
  {
   int homePosX=148;
   int homePosY=389; 
    image(creditstext,253,209);
    if((mouseX>homePosX-60)&&(mouseX<homePosX+60)&&(mouseY>homePosY-15)&&(mouseY<homePosY+15))
    {
      image(gobacktomenuh,homePosX,homePosY);
      GoBackMenuHov=true;
    }
    else
    {
      image(gobacktomenu,homePosX,homePosY);
      GoBackMenuHov=false;
    }
  }
   else if(instrDo)
   {
    int nextPosX=138, homePosX=148, backPosX=83;
    int nextPosY=418, homePosY=389, backPosY=418;
     if((mouseX>homePosX-60)&&(mouseX<homePosX+60)&&(mouseY>homePosY-15)&&(mouseY<homePosY+15))
    {
      image(gobacktomenuh,homePosX,homePosY);
      GoBackMenuHov=true;
    }
    else
    {
      image(gobacktomenu,homePosX,homePosY);
      GoBackMenuHov=false;
    }
    if((mouseX>nextPosX-25)&&(mouseX<nextPosX+25)&&(mouseY>nextPosY-9)&&(mouseY<nextPosY+9))
    {
      image(nexth,nextPosX,nextPosY);
      instrNextHov=true;
    }
    else
    {
      image(next,nextPosX,nextPosY);
      instrNextHov=false;
    }
   if((mouseX>backPosX-25)&&(mouseX<backPosX+25)&&(mouseY>backPosY-9)&&(mouseY<backPosY+9))
    {
      image(backh,backPosX,backPosY);
      instrBackHov=true;
    }
    else
    {
      image(back,backPosX,backPosY);
      instrBackHov=false;
    }
   if(instPage==1)
    {image(page1text,253,197);
    }
   else if(instPage==2)
    {image(page2text,253,197);
    }
   else if(instPage==3)
    {image(page3text,253,197);
    }
   else if(instPage==4)
    {image(page4text,253,197);
    }
  }
  }
  
  
  
  if(!intro)
  {
  fill(0,0,0);
  textFont(aharoni20,10);
  text("Draw in Sky",17,590);
  text("Drag Ground Up",88,590);
  text("A + Click",183,590);
  text("S + Drag",265,590);
  text("D + Click",343,590);
  text("Level "+rockLevel,27,605);
  text("Level "+treeLevel,107,605);
  text("Level "+astLevel,187,605);
  text("Level "+spiritLevel,267,605);
  text("Level "+bholeLevel,347,605);
  if(rockLevel<3)
    text(nrockLevel+" to Upgrade",14,620);
  else
    text("Final Level",19,620);
  if(treeLevel==0)
    text(ntreeLevel+" to Acquire",94,620);
  else if(treeLevel<2)
    text(ntreeLevel+" to Upgrade",94,620);
  else
    text("Final Level",99,620);
  if(astLevel==0)
    text(nastLevel+" to Acquire",174,620);
  else if(astLevel<2)
    text(nastLevel+" to Upgrade",174,620);
  else
    text("Final Level",179,620);
  if(spiritLevel==0)
    text(nspiritLevel+" to Acquire",254,620);
  else
    text("Final Level",259,620);
  if(bholeLevel==0)
    text(nbholeLevel+" to Acquire",334,620);
  else
    text("Final Level",339,620);
  
  if(createSB)
  {
    if(sbCount==1)
    {
    sb=new FCircle(30);
    sb.setFill(0,0,0,0);
    sb.setPosition(500,300);
    sb.setNoStroke();
    sb.setDensity(12);
    sb.setStatic(true);
    world.add(sb);
    }
    if(!pause)
      sbCount++;
    if(sbCount<=250)
    {
      pushMatrix();
      translate(sb.getX(),sb.getY());
      rotate((float)sbCount/10);
      if(sbCount<=25)
        image(spirit,0,0,2*sbCount,2*sbCount);
      else
        image(spirit,0,0,50,50);
      popMatrix();
      s=2;
    }
    if(sbCount>=250)
      world.remove(sb);
    if(sbCount>spiritWait)
    {
      createSB=false;
      sbCount=0;
    }
  }
  
  if(createComet)
  {
    if(cometCount==0||((astLevel>1)&&(cometCount==75))||((astLevel>1)&&(cometCount==150)))
    {
    com1=new FCircle(20);
    com2=new FCircle(20);
    com3=new FCircle(20);
    com4=new FCircle(20);
    com5=new FCircle(20);
    com1.setFill(100,0,0,100);
    com2.setFill(0,0,0,0);
    com3.setFill(0,0,0,0);
    com4.setFill(0,0,0,0);
    com5.setFill(0,0,0,0);
    com1.setNoStroke();
    com2.setNoStroke();
    com3.setNoStroke();
    com4.setNoStroke();
    com5.setNoStroke();
    com1.setDensity(12);
    com2.setDensity(12);
    com3.setDensity(12);
    com4.setDensity(12);
    com5.setDensity(12);
    com1.setVelocity(-80,100);
    com2.setVelocity(-80,100);
    com3.setVelocity(-80,100);
    com4.setVelocity(-80,100);
    com5.setVelocity(-80,100);
    com1.setPosition(cometX-40,-30);
    com2.setPosition(cometX,-30);
    com3.setPosition(cometX+40,-30);
    com4.setPosition(cometX+80,-30);
    com5.setPosition(cometX+120,-30);
    world.add(com1);
    world.add(com2);
    world.add(com3);
    world.add(com4);
    world.add(com5);
    metsound.cue(0);
    metsound.play();
    waves++;
    }
    if(cometCount<25)
    {
      if(cometCount<12)
        s=1;
      else
        s=2;
    }
    image(meteor,com1.getX(),com1.getY(),30,100);
    image(meteor,com2.getX(),com2.getY(),30,100);
    image(meteor,com3.getX(),com3.getY(),30,100);
    image(meteor,com4.getX(),com4.getY(),30,100);
    image(meteor,com5.getX(),com5.getY(),30,100);
    if(!pause)
      cometCount++;
    if(cometCount==73||((astLevel>1)&&(cometCount==148))||((astLevel>1)&&(cometCount==223)))
    {
      metsound.stop();
      world.remove(com1);
      world.remove(com2);
      world.remove(com3);
      world.remove(com4);
      world.remove(com5);
    }
    if(cometCount>astWait)
    {
      createComet=false;
      cometPressed=false;
      cometCount=0;
      waves=0;
    }
  }
  if(createBH)
  {
    BHPressed=false;
    if(BHCount==0)
    {
      BH=new FCircle(40);
      BH.setStatic(true);
      BH.setGrabbable(false);
      BH.setFill(0,0,0,0);
      BH.setNoStroke();
      BH.setPosition(BHX,BHY);
      BH.setDensity(13);
      world.add(BH);
      bhSound.cue(0);
      bhSound.play();
    }
    if(BHCount<=300)
    {
      pushMatrix();
      translate(BH.getX(),BH.getY());
      rotate(-(float)BHCount/10);
      image(blackhole,0,0,75,75);
      popMatrix();
      s=1;
    }
    if(!pause)
      BHCount++;
    if(BHCount>300)
    {
      bhSound.stop();
      world.remove(BH);
    }
    if(BHCount>bholeWait)
    {
      createBH=false;
      BHCount=0;
    }
  }
  if(health<=0)
    intro=true;
  if (poly != null) {
    poly.draw(this);
  }
  if((!pause)&&(!intro))
  {
  countR1++;
  if((countR1>waitR1)&(rob1<maxrob1))
    crob1=true;
  countR2++;
  if((countR2>waitR2)&(rob2<maxrob2))
    crob2=true;
  countR3++;
  if((countR3>waitR3)&(rob3<maxrob3))
    crob3=true;
  
  if(poly!=null)
  {
    fill(0,0,0,0);
    s=1;
  if((maxX-minX<psize/2)&&(maxY-minY<psize/2))
  {
    image(rBox,mouseX,mouseY,psize,psize);
  }
  else if(maxX-minX<psize/2)
    image(rBox,mouseX,minY+psize/2,psize,psize);
  else if(maxY-minY<psize/2)
    image(rBox,minX+psize/2,mouseY,psize,psize);
  else
    image(rBox,minX+psize/2,minY+psize/2,psize,psize);
  }  
  }
  if(crob1&&!pause&&!intro)
  {  
    crob1=false;
    waitR1=(int)random(r1wait,r1wait+150);
    countR1=0;
    FCircle r1=new FCircle(40);
    r1.setPosition(-20,359);
    r1.setAngularVelocity(r1speed);
    r1.setFill(0,0,0,0);
    r1.setNoStroke();
    r1.setDensity(9);
    r1.setFriction(20);
    r1.setGrabbable(false);
    robot1.add(r1);
    world.add(r1);
    rob1++;
  }
  for(int i=0;i<rob1;i++)
  {
    FCircle r1=robot1.get(i);
     if((r1!=null)&&(!destR1[i]))
     {
       float r1x=r1.getX();
       float r1y=r1.getY();
       float r1angle=r1.getRotation();
       if((!pause)&&(r1x>10))
       {
       if(i%3==0)
         r1sound1.play();
       else if(i%3==1)
         r1sound2.play();
       else
         r1sound3.play();
       }
       r1.setAngularVelocity(r1speed);
       pushMatrix();
       translate(r1x,r1y);
       rotate(r1angle);
       image(Robot1,0,0,35,35);
       popMatrix();
       r1.draw(this);
       if((BHCount>0)&&(BHCount<150))
       {
         float vx=BHX-r1x;
         float vy=BHY-r1y;
         float disp=((vx*vx)+(vy*vy));
         float mult=(100000-disp*5)/5000;
         if(mult<-500)
           mult=0.4;   
         else if(mult<1)
           mult=1;
         r1.setVelocity(mult*vx,mult*vy);
       }
     }
  }
  if(crob2&&!pause&&!intro)
  {  
    crob2=false;
    waitR2=(int)random(r2wait,r2wait+200);
    countR2=0;
    FCircle r2=new FCircle(40);
    r2.setPosition(-20,300);
    r2.setVelocity(125,-40);
    r2.setRestitution(1.1);
    r2.setFill(0,0,0,0);
    r2.setNoStroke();
    r2.setDensity(5);
    r2.setFriction(20);
    r2.setGrabbable(false);
    robot2.add(r2);
    world.add(r2);
    rob2++;
  }
  for(int i=0;i<rob2;i++)
  {
    FCircle r2=robot2.get(i);
     if((r2!=null)&&(!destR2[i]))
     {
       float r2x=r2.getX();
       float r2y=r2.getY();
       float r2angle=r2.getRotation();
       r2.setAngularVelocity(r2speed);
       pushMatrix();
       translate(r2x,r2y);
       rotate(r2angle);
       image(Robot2,0,0,35,35);
       popMatrix();
       r2.draw(this);
       if((BHCount>0)&&(BHCount<150))
       {
         float vx=BHX-r2x;
         float vy=BHY-r2y;
         float disp=((vx*vx)+(vy*vy));
         float mult=(100000-disp*5)/5000;
         if(mult<-500)
           mult=0.4;
         else if(mult<1)
           mult=1;
         r2.setVelocity(mult*vx,mult*vy);
       }
       
     }
  }
  if(crob3&&!pause&&!intro)
  {  
    crob3=false;
    waitR3=(int)random(r3wait,r3wait+400);
    countR3=0;
    FCircle r3=new FCircle(30);
    int r3h=250;
    if(r3rand)
      r3h=(int)random(0,400);
    r3.setPosition(-20,r3h);
    r3.setVelocity(r3speed,0);
    r3.setFill(0,0,0,0);
    r3.setNoStroke();
    r3.setDensity(2);
    r3.setFriction(20);
    r3.setGrabbable(false);
    robot3.add(r3);
    world.add(r3);
    rob3++;
    r3sound.cue(0);
    r3sound.play();
  }
  for(int i=0;i<rob3;i++)
  {
    FCircle r3=robot3.get(i);
     if((r3!=null)&&(!destR3[i]))
     {
       float r3x=r3.getX();
       float r3y=r3.getY();
       float r3angle=r3.getRotation();
       float yspeed=((250-r3y)*(250-r3y))/15;
       if(r3y>250)
         yspeed=-yspeed;
       if(abs(250-r3y)<10)
         yspeed=250-r3y;
       r3.setVelocity(r3speed,yspeed);
       pushMatrix();
       translate(r3x,r3y);
       rotate(r3angle);
       image(Robot3,0,0,35,35);
       popMatrix();
       r3.draw(this);
       if((BHCount>0)&&(BHCount<150))
       {
         float vx=BHX-r3x;
         float vy=BHY-r3y;
         float disp=((vx*vx)+(vy*vy));
         float mult=(100000-disp*5)/5000;
         if(mult<-500)
           mult=0.4;
         else if(mult<1)
           mult=1;
         r3.setVelocity(mult*vx,mult*vy);
       }
       
     }
  }
  }
  if(pause)
  {
    image(pwash,width/2,height/2,width,height);
  if(!pauseInstrDo)
  {
    int pinstPosX=width/2,pnewPosX=width/2,presPosX=width/2;
    int pinstPosY=280, pnewPosY=310, presPosY=250;
    float scale=2;
    image(ptitle,width/2,height/5);
    if((mouseX>presPosX-88)&&(mouseX<presPosX+88)&&(mouseY>presPosY-10)&&(mouseY<presPosY+10))
    {
      image(presumegameh,presPosX,presPosY);
      pauseResumeHov=true;
    }
    else
    {
      image(presumegame,presPosX,presPosY);
      pauseResumeHov=false;
    }
    if((mouseX>pinstPosX-73)&&(mouseX<pinstPosX+73)&&(mouseY>pinstPosY-10)&&(mouseY<pinstPosY+10))
      {
        image(pinstructionsh,pinstPosX,pinstPosY);
        pauseInstrHov=true;
      }
    else
     { 
       image(pinstructions,pinstPosX,pinstPosY);
       pauseInstrHov=false;
     }
    if((mouseX>pnewPosX-67)&&(mouseX<pnewPosX+67)&&(mouseY>pnewPosY-10)&&(mouseY<pnewPosY+10))
    {
      image(pnewgameh,pnewPosX,pnewPosY);
      pauseNGHov=true;
    }
    else
    {
      image(pnewgame,pnewPosX,pnewPosY); 
      pauseNGHov=false;
    } 
  }
  else
  {
    int pnextPosX=520, pbackPosX=460, phomePosX=490;
    int pnextPosY=400, pbackPosY=400, phomePosY=400;
    
    if((mouseX>pnextPosX-10)&&(mouseX<pnextPosX+10)&&(mouseY>pnextPosY-10)&&(mouseY<pnextPosY+10))
      {image(pausenexth,520,400);
       instrNextHov=true;
       instrBackHov=false;
       pauseGBHov=false;
      }
     else 
       {image(pausenext,520,400);
         instrNextHov=false;
       }
     if((mouseX>pbackPosX-10)&&(mouseX<pbackPosX+10)&&(mouseY>pbackPosY-10)&&(mouseY<pbackPosY+10))
      {image(pausebackh,460,400);
       instrBackHov=true;
       instrNextHov=false;
       pauseGBHov=false;
      }  
     else 
      {image(pauseback,460,400);
       instrBackHov=false;
      }
    if((mouseX>phomePosX-10)&&(mouseX<phomePosX+10)&&(mouseY>phomePosY-10)&&(mouseY<phomePosY+10))
      {image(pausehomeh,490,400);
       pauseGBHov=true;
       instrBackHov=false;
       instrNextHov=false;
      }  
     else 
      {image(pausehome,490,400);
       pauseGBP=false;
      }
    if(instPage==1)
    {image(pausepage1text,490,200);
    }
    if(instPage==2)
    {image(pausepage2text,490,200);
    }
    if(instPage==3)
    {image(pausepage3text,490,200);
    }
    if(instPage==4)
    {image(pausepage4text,490,200);
    }
 }
}
}


void mousePressed() {
  if(pause)
  {
    if(pauseResumeHov)
      pauseResumeP=true;
    if(pauseNGHov)
      pauseNGP=true;
    if(pauseInstrHov)
      pauseInstrP=true;
    if(instrNextHov)
      instrNextP=true;
    if(instrBackHov)
      instrBackP=true;
    if(pauseGBHov)
      pauseGBP=true;
    return;
  }
  if(intro)
  {
    if(playHov)
      playP=true;
    if(instrHov)
      instrP=true;
    if(creditsHov)
      creditsP=true;
    if(GoBackMenuHov)
      GoBackMenuP=true;
    if(instrNextHov)
      instrNextP=true;
    if(instrBackHov)
      instrBackP=true;
    return;
  }
  if(rockB.mousePressed())
    rpressed=true;
  if(treeB.mousePressed())
    tpressed=true;
  if(astB.mousePressed())
    apressed=true;
  if(spiritB.mousePressed())
    spressed=true;
  if(bholeB.mousePressed())
    bpressed=true;
  if (world.getBody(mouseX, mouseY) != null) {
    FBody b=world.getBody(mouseX,mouseY);
    if((b.getDensity()==0.1)&&(trees<maxtrees)&&(!drawTree))
    {
      drawTree=true;
    }
    return;
  }
  if(cometPressed)
    return;
  if(BHPressed)
    return;
  
  
  if(rockCount>rockWait)
  {
  poly = new FPoly();
  poly.setStrokeWeight(2);
  poly.setGrabbable(false);
  poly.setFill(100, 100, 100);
  poly.setDensity(10);
  poly.setRestitution(0.5);
  poly.vertex(mouseX, mouseY);
  fill(0,0,0,0);
  image(rBox,mouseX,mouseY,psize,psize);
  if(mouseX>maxX)
    maxX=mouseX;
  if(mouseY>maxY)
  {
    maxY=mouseY;
    maxYsX=mouseX;
  }
  if(mouseX<minX)
  {
    minXsY=mouseY;
    minX=mouseX;
  }
  if(mouseY<minY)
    minY=mouseY;
  }
}

void mouseDragged() {
  if(pause)
  {
    return;
  }
  if(intro)
  {
    return;
  }
  cometPressed=false;
  BHPressed=false;
  rpressed=tpressed=apressed=spressed=bpressed=false;
  if (poly!=null) {
    poly.vertex(mouseX, mouseY);
  FBody ch=world.getBody(mouseX,mouseY);
  
  if(ch!=null)
    groundTouch=true;
  if(mouseX>maxX)
    maxX=mouseX;
  if(mouseY>maxY)
  {
    maxYsX=mouseX;
    maxY=mouseY;
  }
  if(mouseX<minX)
  {
    minX=mouseX;
    minXsY=mouseY;
  }
  if(mouseY<minY)
    minY=mouseY;
  if(((maxX-minX)>psize)||((maxY-minY)>psize))
  {
    poly=null;
    maxX=maxY=0;
    minY=minX=1000;
  }
  }
  
  else if(drawTree)
  {
    FBody b=world.getBody(mouseX,mouseY);
    if(b==null)
    {
      if(!gotPosition)
      {
      treex=mouseX;
      treey=mouseY+5;
      b=world.getBody(treex,treey);
      while((b==null)||(b.getDensity()!=0.1))
      {
        treey++;
        b=world.getBody(treex,treey);
      }
      gotPosition=true;
      }
    }
    else
    {
      float x=b.getDensity();
      if(x==2||x==0.1||x==8||x==5||x==10||x==13||x==9)
      {
        if((!gotPosition)&&(x!=0.1))
        {
        treex=mouseX;
        treey=mouseY+5;
        b=world.getBody(treex,treey);
        while((b==null)||(b.getDensity()!=0.1))
        {
          treey++;
          b=world.getBody(treex,treey);
        }
        gotPosition=true;
      }
      }
      else
        drawTree=false;
    }
    
  }
}

void mouseReleased() {
  if(pause)
  {
    if(pauseNGP&&pauseNGHov)
    {
      pauseNGP=false;
      restart();
    }
    if(pauseResumeHov&&pauseResumeP)
    {
      pause=!pause;
      pauseResumeP=false;
    }
    if(pauseInstrHov&&pauseInstrP)
    {
      pauseInstrDo=true;
      pauseInstrP=false;
      pauseInstrHov=false;
    }
    if(instrNextP&&instrNextHov)
    {
      if(instPage<4)
        instPage++;
      instrNextP=false;
      instrNextHov=false;
    }
    if(instrBackP&&instrBackHov)
    {
      if(instPage>1)
        instPage--;
      instrBackP=false;
      instrBackHov=false;
    }
    if(pauseGBHov&&pauseGBP)
    {
      pauseGBP=false;
      pauseInstrDo=false;
      pauseGBHov=false;
      instPage=1;
    }
    return;
  }
  if(intro)
  {
    if(playHov&&playP)
    {
      intro=false;
      experience=0;
      if(health!=100||experience!=0)
        restart();
      playP=false;
    }
    if(instrHov&&instrP)
    {
      instrDo=true;
      instrP=false;
      instrHov=false;
    }
    if(creditsHov&&creditsP)
    {
      creditsDo=true;
      creditsP=false;
      creditsHov=false;
    }
    if(GoBackMenuP&&GoBackMenuHov)
    {
      GoBackMenuP=false;
      creditsDo=false;
      instrDo=false;
      GoBackMenuHov=false;
      instPage=1;
    }
    if(instrNextP&&instrNextHov)
    {
      if(instPage<4)
        instPage++;
    }
    if(instrBackP&&instrBackHov)
    {
      if(instPage>1)
        instPage--;
    }
    return;
  }
  if((rpressed)&&(experience>=nrockLevel)&&(nrockLevel!=0))
    {
      
        rockLevel++;
        experience-=nrockLevel;
        if(rockLevel==2)
        {
          rockWait=75;
          psize=150;
          nrockLevel=2;
        }
        if(rockLevel==3)
        {
          psize=200;
          rockWait=30;
          nrockLevel=0;
        }
    }
    if((tpressed)&&(experience>=ntreeLevel)&&(ntreeLevel!=0))
    {
        treeLevel++;
        experience-=ntreeLevel;
        if(treeLevel==2)
        {
          ntreeLevel=0;
          maxtrees=3;
          treeWait=700;
        }
        else
        {
          maxtrees=1;
          ntreeLevel=2;
        }
    }
    if((apressed)&&(experience>=nastLevel)&&(nastLevel!=0))
    {
        astLevel++;
        experience-=nastLevel;
        if(nastLevel==2)
        {
          maxWaves=3;
          astWait=650;
          nastLevel=0;
        }
        else
        {
          nastLevel=2;
          maxWaves=1;
        }
    }
    if((spressed)&&(experience>=nspiritLevel)&&(nspiritLevel!=0))
    {
        spiritLevel++;
        experience-=nspiritLevel;
        nspiritLevel=0;
    }
    if((bpressed)&&(experience>=nbholeLevel)&&(nbholeLevel!=0))
    {
        bholeLevel++;
        experience-=nbholeLevel;
        nbholeLevel=0;
    }
    rpressed=tpressed=apressed=spressed=bpressed=false;
  if (poly!=null) {
    
    float w=maxX-minX;
    float h=maxY-minY;
    maxX=maxY=0;
    minX=minY=1000;
    if((w>5)&&(h>5)&&(w<psize)&&(h<psize)&&(!groundTouch))
    {
      rockCount=0;
      world.add(poly);
    }
    groundTouch=false;
    poly = null;
  }
  if(cometPressed)
  {
     createComet=true;
     cometX=mouseX;
     cometY=mouseY;
  }
  if(BHPressed)
  {
     createBH=true;
     BHX=mouseX;
     BHY=mouseY;
  }
  else if(drawTree&&gotPosition)
  {
    drawTree=false;
    gotPosition=false;
    trees++;
    treegrowth.cue(0);
    treegrowth.play();
    int tht,twt;
    if(treey-mouseY>150)
    {
      tht=150;
      twt=30;
    }
    else
    {
      tht=(int)treey-mouseY;
      twt=tht*3/15;
    }
    if((!tree1on)&&(tree1count==0))
    {
      tree1=new FPoly();
      tree1on=true;
      tree1x=treex;
      tree1y=treey;
      tree1height=tht;
      tree1.setDensity(0);
      tree1.setStatic(true);
      tree1.setFill(0,0,0,0);
      tree1.setGrabbable(false);
      tree1.setNoStroke();
      tree1.vertex(treex-twt/2,treey);
      tree1.vertex(treex+twt/2,treey);
      tree1.vertex(treex+twt/2,treey+tht);
      tree1.vertex(treex-twt/2,treey+tht);
      world.add(tree1);
    }
    else if((!tree2on)&&(tree2count==0))
    {
      tree2=new FPoly();
      tree2on=true;
      tree2x=treex;
      tree2y=treey;
      tree2height=tht;
      tree2.setDensity(0);
      tree2.setGrabbable(false);
      tree2.setStatic(true);
      tree2.setFill(0,0,0,0);
      tree2.setNoStroke();
      tree2.vertex(treex-twt/2,treey);
      tree2.vertex(treex+twt/2,treey);
      tree2.vertex(treex+twt/2,treey+tht);
      tree2.vertex(treex-twt/2,treey+tht);
      world.add(tree2);
    }
    else if((!tree3on)&&(tree3count==0))
    {
      tree3= new FPoly();
      tree3on=true;
      tree3x=treex;
      tree3y=treey;
      tree3height=tht;
      tree3.setDensity(0);
      tree3.setStatic(true);
      tree3.setGrabbable(false);
      tree3.setFill(0,0,0,0);
      tree3.setNoStroke();
      tree3.vertex(treex-twt/2,treey);
      tree3.vertex(treex+twt/2,treey);
      tree3.vertex(treex+twt/2,treey+tht);
      tree3.vertex(treex-twt/2,treey+tht);
      world.add(tree3);
    }
  }
}
void contactStarted(FContact c) {
  FBody b1=c.getBody1();
  FBody b2=c.getBody2();
  if((b1.getDensity()==12)&&((b2.getDensity()==9)||(b2.getDensity()==5)||(b2.getDensity()==2)||(b2.getDensity()==0)||(b2.getDensity()==0.1)||(b2.getDensity()==10)))
  {
    if((!(b1.isStatic()))&&(b2.getDensity()<2))
    {
      world.remove(b1);
      return;
    }
    explosionX[expNo]=(int)b2.getX();
    explosionY[expNo]=(int)b2.getY();
    lastkillX=(int)b2.getX();
    lastkillY=(int)b2.getY();
    expdisp[expNo]=1;
    expNo++;
    exp.cue(0);
    exp.play();
    
           for(int i=0;i<rob1;i++)
           {
             if((robot1.get(i)==b2)&&(destR1[i]==false))
             {
               score+=30;
               killcount++; 
               if(killcount==1) killtimer=0;
               if(killtimer>100)
               {
                 killtimer=0;
                 killcount=1;
               }
               destR1[i]=true;
               if(i%3==0)
                 r1sound1.stop();
               else if(i%3==1)
                 r1sound2.stop();
               else
                 r1sound3.stop();
             }
             if(i<rob2)
             {
               if((robot2.get(i)==b2)&&(destR2[i]==false))
               {
                 score+=50;
                 killcount++; if(killcount==1) killtimer=0;
                 if(killtimer>100)
                 {
                   killtimer=0;
                   killcount=1;
                 }
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==b2)&&(destR3[i]==false))
               {
                 score+=100;
                 killcount++; if(killcount==1) killtimer=0;
                 if(killtimer>100)
                 {
                   killtimer=0;
                   killcount=1;
                 }
                 destR3[i]=true;
               }
             }
           }
           world.remove(b2);
           b2=null;
           return;
  }
  if(b2.getDensity()==13)
  {
    if(b1.getDensity()==9)
      score+=30;
    if(b1.getDensity()==5)
      score+=50;
    if(b1.getDensity()==2)
      score+=100;
    lastkillX=(int)b1.getX();
    lastkillY=(int)b1.getY();
    killcount++; if(killcount==1) killtimer=0;
    if(killtimer>100)
    {
      killtimer=0;
      killcount=1;
    }
    world.remove(b1);
  }
  if(b1.getDensity()==13)
  {
    if(b2.getDensity()==9)
      score+=30;
    if(b2.getDensity()==5)
      score+=50;
    if(b2.getDensity()==2)
      score+=100;
    lastkillX=(int)b2.getX();
    lastkillY=(int)b2.getY();
    killcount++; if(killcount==1) killtimer=0;
    if(killtimer>100)
    {
     killtimer=0;
     killcount=1;
    }
    world.remove(b2);
  }
  b1=c.getBody2();
  b2=c.getBody1();
  if((b1.getDensity()==12)&&((b2.getDensity()==9)||(b2.getDensity()==5)||(b2.getDensity()==2)||(b2.getDensity()==0)||(b2.getDensity()==0.1)||(b2.getDensity()==10)))
  {
    if((!(b1.isStatic()))&&(b2.getDensity()<2))
    {
      world.remove(b1);
      return;
    }
    explosionX[expNo]=(int)b2.getX();
    explosionY[expNo]=(int)b2.getY();
    expdisp[expNo]=1;
    expNo++;
    exp.cue(0);
    exp.play();
           for(int i=0;i<rob1;i++)
           {
             if((robot1.get(i)==b2)&&(destR1[i]==false))
             {
               score+=30;
               lastkillX=(int)b2.getX();
               lastkillY=(int)b2.getY();
               killcount++; if(killcount==1) killtimer=0;
               if(killtimer>100)
               {
                 killtimer=0;
                 killcount=1;
               }
               destR1[i]=true;
               if(i%3==0)
                 r1sound1.stop();
               else if(i%3==1)
                 r1sound2.stop();
               else
                 r1sound3.stop();
             }
             if(i<rob2)
             {
               if((robot2.get(i)==b2)&&(destR2[i]==false))
               {
                 score+=50;
                 lastkillX=(int)b2.getX();
                 lastkillY=(int)b2.getY();
                 killcount++; if(killcount==1) killtimer=0;
                 if(killtimer>100)
                 {
                   killtimer=0;
                   killcount=1;
                 }
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==b2)&&(destR3[i]==false))
               {
                 score+=100;
                 lastkillX=(int)b2.getX();
                 lastkillY=(int)b2.getY();
                 killcount++; if(killcount==1) killtimer=0;
                 if(killtimer>100)
                 {
                   killtimer=0;
                   killcount=1;
                 }
                 destR3[i]=true;
               }
             }
           }
           world.remove(b2);
           b2=null;
           return;
  }
}

void contactEnded(FContact c) {
  FBody b1=c.getBody1();
  FBody b2=c.getBody2();
  float b1Density=b1.getDensity();
  float b2Density=b2.getDensity();
  FBody hittree=null;
  if(b1Density==1.5)
    hittree=b2;
  else if(b2Density==1.5)
    hittree=b1;
  if(hittree!=null)
  {
    if((hittree.getDensity()==10)||(hittree.getDensity()==12));
    else
    {
    explosionX[expNo]=(int)hittree.getX();
    explosionY[expNo]=(int)hittree.getY();
    if(hittree.getDensity()==9)
      health-=5;
    else if(hittree.getDensity()==5)
      health-=7;
    else if(hittree.getDensity()==2)
      health-=10;
    expdisp[expNo]=1;
    expNo++;
    exp.cue(0);
    exp.play();
    }
    world.remove(hittree);
    return;
  }
  FBody hitground=null;
  if(b1Density==0.1)
    hitground=b2;
  else if(b2Density==0.1)
    hitground=b1;
    
  if(hitground!=null)
  {
    if(hitground.getDensity()==5)
    {
      r2sound.cue(0);
      r2sound.play();
      float r2vx=hitground.getVelocityX();
      float r2vy=hitground.getVelocityY();
      hitground.setVelocity(r2vx+(2*r2boost),r2vy-r2boost);
    }
    return;
  }
  
  FBody robot=null;
  FBody othobj=null;
  if((b1Density==9)||(b1Density==5)||(b1Density==2))
  {
    robot=b1;
    othobj=b2;
  }
  if((b2Density==9)||(b2Density==5)||(b2Density==2))
  {
    robot=b2;
    othobj=b1;
  }
  if(robot!=null)
  {
   float fx,fy;
   if(othobj.getDensity()==10)
   {
   fx=othobj.getVelocityX();
   fy=othobj.getVelocityY();
   float net=(fx*fx)+(fy*fy);
   if(net>(30000-(rockLevel*3000)))
   {
     explosionX[expNo]=(int)robot.getX();
     explosionY[expNo]=(int)robot.getY();
     expdisp[expNo]=1;
     expNo++;
     exp.cue(0);
     exp.play();
     for(int i=0;i<rob1;i++)
     {
       if((robot1.get(i)==robot)&&(destR1[i]==false))
       {
         score+=30;
         lastkillX=(int)robot.getX();
         lastkillY=(int)robot.getY();
         killcount++; if(killcount==1) killtimer=0;
         if(killtimer>100)
         {
           killtimer=0;
           killcount=1;
         }
         destR1[i]=true;
         if(i%3==0)
           r1sound1.stop();
         else if(i%3==1)
           r1sound2.stop();
         else
           r1sound3.stop();
       }
       if(i<rob2)
       {
         if((robot2.get(i)==robot)&&(destR2[i]==false))
         {
           score+=50;
           lastkillX=(int)robot.getX();
           lastkillY=(int)robot.getY();
           killcount++; if(killcount==1) killtimer=0;
           if(killtimer>100)
           {
             killtimer=0;
             killcount=1;
           }
           destR2[i]=true;
         }
       }
       if(i<rob3)
       {
         if((robot3.get(i)==robot)&&(destR3[i]==false))
         {
           score+=100;
           lastkillX=(int)robot.getX();
           lastkillY=(int)robot.getY();
           killcount++; if(killcount==1) killtimer=0;
           if(killtimer>100)
           {
             killtimer=0;
             killcount=1;
           }
           destR3[i]=true;
         }
       }
     }
     world.remove(robot);
     robot=null;
   }
   else
   { 
     laser.cue(0);
     laser.play();
     world.remove(othobj);
   }
   }
  }
}

void restart()
{
      health=100;
      instPage=1;
      r3rand=false;
      experience=0;
      level=0;
      levelCount=0;
      levelwait=100;
      rockWait=125;treeWait=450;astWait=400;
      psize=100;
      maxtrees=0;
      dispScore=0;
      killcount=0;
      score=0;
      crob1=false;crob2=false;crob3=false;
      waitR1=200;waitR2=3400;waitR3=10000;
      r1wait=350;r2wait=550;r3wait=650;
      r1speed=5;r2speed=7;r2boost=0;r3speed=0;
      countR1=countR2=countR3=0;
      pause=false;
      rockLevel=1;treeLevel=0;astLevel=0;spiritLevel=0;bholeLevel=0;
      nrockLevel=1;ntreeLevel=3;nastLevel=4;nspiritLevel=8;nbholeLevel=10;
      FCircle r1,r2,r3;
      createBH=createComet=createSB=tree1on=tree2on=tree3on=false;
      tree1count=sbCount=cometCount=BHCount=tree2count=tree3count=0;
      rockCount=100;
      for(int i=0;i<rob1;i++)
      {
        destR1[i]=false;
        r1=robot1.get(i);
        world.remove(r1);
      }
      for(int i=0;i<rob2;i++)
      {
        destR2[i]=false;
        r2=robot2.get(i);
        world.remove(r2);
      }
      for(int i=0;i<rob3;i++)
      {
        destR3[i]=false;
        r2=robot2.get(i);
        world.remove(r2);
      }
      ArrayList <FBody> stones=world.getBodies();
      for(int i=0;i<stones.size();i++)
      {
        FBody g=stones.get(i);
        float x=g.getDensity();
        if((x==10)||(x==13)||(x==12))
          world.remove(g);
      }
      rob1=rob2=rob3=0;
      robot1=new ArrayList<FCircle>();
      robot2=new ArrayList<FCircle>();
      robot3=new ArrayList<FCircle>();
      bhSound.stop();
      r3sound.stop();
}

void keyPressed() {
  if ((key == 's'||key == 's')&&(createSB==false)&&(spiritLevel>0)) 
  {
    createSB=true;
    cometPressed=false;
    BHPressed=false;
    sbCount=1;
  }
  if ((key == 'a'||key == 'A')&&(createComet==false)&&(astLevel>0)) 
  {
    cometPressed=true;
    BHPressed=false;
  }
  if ((key == 'd'||key == 'D')&&(createBH==false)&&(bholeLevel>0)) 
  {
    BHPressed=true;  
    cometPressed=false;
  }
  if((!intro)&&(key==' '))
  {
    pause=!pause;
    pauseInstrDo=false;
  }
}
