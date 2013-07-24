import fisica.*;

FWorld world;
FPoly poly;
Maxim maxim;
AudioPlayer exp,laser,treegrowth,r1,r2,r3;
PImage[] explosion,rockexplosion;
int[] gvx={-40, 65, 138, 201, 258, 297, 332, 362, 373, 402, 418, 440, 516, 550, 634, 785, 791, 820, 834, 865, 870};
int[] gvy={380, 380, 372, 355, 428, 428, 414, 427, 426, 395, 392, 407, 394, 384, 366, 360, 495, 534, 564, 604, 636};
int gbits;
int count=0;
float psize=100;
float maxX=0,maxY=0,minX=1000,minY=1000;
ArrayList<FPoly> grounds;
ArrayList<FCircle> robot1;
ArrayList<FCircle> robot2;
ArrayList<FCircle> robot3;
PImage background, sky, tower, Robot1, Robot2, Robot3, tree, meteor, spirit, blackhole;
PImage rockButton,treeButton,astButton,spiritButton,bholeButton;
boolean crob1=false,crob2=false,crob3=false;
int waitR1=100,waitR2=1000,waitR3=2000;
int rob1=0,maxrob1=250,countR1=0,rob2=0,maxrob2=150,countR2=0,rob3=0,maxrob3=100,countR3=0;
boolean[] destR1,destR2,destR3;
boolean groundTouch=false;
boolean drawTree;
float treex,treey;
FPoly tree1,tree2,tree3;
int[] explosionX,explosionY;
int expNo=0;
int expdisp[];
int trees=0, maxtrees=3;
int tree1count=0,tree2count=0,tree3count=0;
float tree1height,tree2height,tree3height,tree1x,tree2x,tree3x,tree1y,tree2y,tree3y;
boolean tree1on=false,tree2on=false,tree3on=false,gotPosition=false;
int score=0;
int experience=0;
int health=100;
int rockCount, sbCount=0,cometCount=0, BHCount=0;
boolean createSB=false,createComet=false,cometPressed=false,createBH=false,BHPressed=false;
int cometX, cometY, waves=0, maxWaves=3, BHX, BHY;
int rockLevel=1,treeLevel=0,astLevel=0,spiritLevel=0,bholeLevel=0;
int nrockLevel=1,ntreeLevel=3,nastLevel=5,nspiritLevel=8,nbholeLevel=10;
int nextExperiencePoint=200;
FCircle sb;
FCircle com1,com2,com3,com4,com5;
FCircle BH;
Button rockB,treeB,astB,spiritB,bholeB;
boolean rpressed=false,tpressed=false,apressed=false,spressed=false,bpressed=false;

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
  rockexplosion=loadImages("RockExplosion/RockExplosion",".png",6);
  exp=maxim.loadFile("explosion.wav");
  exp.setLooping(false);
  exp.volume(1.5);
  laser=maxim.loadFile("DestroyRock.wav");
  laser.setLooping(false);
  laser.volume(0.3);
  treegrowth=maxim.loadFile("tree.wav");
  treegrowth.setLooping(false);
  treegrowth.speed(1.2);
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
  tow1.setDensity(0);
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
  tow2.setDensity(0);
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
}

void draw() {
  if(score>nextExperiencePoint)
  {
    experience++;
    nextExperiencePoint+=200;
  }
  if((BHCount>1)&&(BHCount<150))
    tint(200,200,255);
  image(sky,width/2,height/2,width,height);
  tint(255,255,255);
  if(tree1on)
  {
    tree1count++;
    float imght;
    if(tree1count<=20)
    {
      tree1.setPosition(0,-(tree1count*tree1height/20));
      imght=tree1height*(float)tree1count/20;
    }
    else if(tree1count>130)
    {
      tree1.setPosition(0,-((150-tree1count)*tree1height/20));
      imght=tree1height*(float)(150-tree1count)/20;
    }
    else
      imght=tree1height;
    image(tree,tree1x,tree1y-imght/2+10,imght*5/15+5,imght+15);
    if(tree1count>=150)
    {
      tree1count=0;
      tree1on=false;
      world.remove(tree1);
      trees--;
    }
  }
  if(tree2on)
  {
    tree2count++;
    float imght;
    if(tree2count<=20)
    {
      tree2.setPosition(0,-(tree2count*tree2height/20));
      imght=tree2height*(float)tree2count/20;
    }
    else if(tree2count>130)
    {
      tree2.setPosition(0,-((150-tree2count)*tree2height/20));
      imght=tree2height*(float)(150-tree2count)/20;
    }
    else
      imght=tree2height;
    image(tree,tree2x,tree2y-imght/2+10,imght*5/15+5,imght+15);
    if(tree2count>=150)
    {
      tree2count=0;
      tree2on=false;
      world.remove(tree2);
      trees--;
    }
  }
  if(tree3on)
  {
    tree3count++;
    float imght;
    if(tree3count<=20)
    {
      tree3.setPosition(0,-(tree3count*tree3height/20));
      imght=tree3height*(float)tree3count/20;
    }
    else if(tree3count>130)
    {
      tree3.setPosition(0,-((150-tree3count)*tree3height/20));
      imght=tree3height*(float)(150-tree3count)/20;
    }
    else
      imght=tree3height;
    image(tree,tree3x,tree3y-imght/2+10,imght*5/15+5,imght+15);
    if(tree3count>=150)
    {
      tree3count=0;
      tree3on=false;
      world.remove(tree3);
      trees--;
    }
  }
  image(background,width/2,height/2,width,height);
  image(tower,width/2+100,height/2-53,width/5,height/2.5);
  rockB.display();
  treeB.display();
  astB.display();
  spiritB.display();
  bholeB.display();
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
  fill(0,0,0);
  textSize(20);
  text("Score: " + score, 842, 50);
  text("Experience: " + experience, 790, 85);
  fill(0,0,0);
  rect(width-445,110,102,8);
  if(health>75)
    fill(0,255,0);
  else if(health>25)
    fill(255,255,0);
  else
    fill(255,0,0);
  rect(width-444,111,max(health,0),6);
  world.step();
  world.draw(this); 
  for(int i=0;i<gbits;i++)
  {
    FPoly ground=grounds.get(i);
    ground.draw(this);
  }
  textSize(10);
  fill(0,0,0);
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
    sbCount++;
    if(sbCount<=150)
    {
      pushMatrix();
      translate(sb.getX(),sb.getY());
      rotate((float)sbCount/10);
      if(sbCount<=25)
        image(spirit,0,0,2*sbCount,2*sbCount);
      else
        image(spirit,0,0,50,50);
      popMatrix();
      
    }
    if(sbCount>=150)
      world.remove(sb);
    if(sbCount>500)
      createSB=false;
  }
  
  if(createComet)
  {
    if(cometCount==0)
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
    com1.setVelocity(-80,10);
    com2.setVelocity(-80,10);
    com3.setVelocity(-80,10);
    com4.setVelocity(-80,10);
    com5.setVelocity(-80,10);
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
    waves++;
    }
    if(cometCount<73)
    {
      image(meteor,com1.getX(),com1.getY(),30,100);
      image(meteor,com2.getX(),com2.getY(),30,100);
      image(meteor,com3.getX(),com3.getY(),30,100);
      image(meteor,com4.getX(),com4.getY(),30,100);
      image(meteor,com5.getX(),com5.getY(),30,100);
    }
    cometCount++;
    if(cometCount>73)
    {
      world.remove(com1);
      world.remove(com2);
      world.remove(com3);
      world.remove(com4);
      world.remove(com5);
    }
    if((cometCount>74)&&(waves<maxWaves))
      cometCount=0;
    if(cometCount>150)
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
    }
    if(BHCount<=150)
    {
      pushMatrix();
      translate(BH.getX(),BH.getY());
      rotate(-(float)BHCount/10);
      image(blackhole,0,0,75,75);
      popMatrix();
    }
    BHCount++;
    if(BHCount>150)
      world.remove(BH);
    if(BHCount>150)
    {
      createBH=false;
      BHCount=0;
    }
  }
  if(health<=0)
    return;
  if (poly != null) {
    poly.draw(this);
  }
  
  countR1++;
  if((countR1>waitR1)&(rob1<maxrob1))
    crob1=true;
  countR2++;
  if((countR2>waitR2)&(rob2<maxrob2))
    crob2=true;
  countR3++;
  if((countR3>waitR3)&(rob3<maxrob3))
    crob3=true;
    
  if(crob1)
  {  
    crob1=false;
    waitR1=(int)random(50,200);
    countR1=0;
    FCircle r1=new FCircle(40);
    r1.setPosition(-20,359);
    r1.setAngularVelocity(12);
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
       r1.setAngularVelocity(12);
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
  if(crob2)
  {  
    crob2=false;
    waitR2=(int)random(100,300);
    countR2=0;
    FCircle r2=new FCircle(40);
    r2.setPosition(-20,300);
    r2.setVelocity(35,-40);
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
       r2.setAngularVelocity(14);
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
  if(crob3)
  {  
    crob3=false;
    waitR3=(int)random(100,600);
    countR3=0;
    FCircle r3=new FCircle(30);
    r3.setPosition(-20,250);
    r3.setVelocity(400,0);
    r3.setFill(0,0,0,0);
    r3.setNoStroke();
    r3.setDensity(2);
    r3.setFriction(20);
    r3.setGrabbable(false);
    robot3.add(r3);
    world.add(r3);
    rob3++;
  }
  for(int i=0;i<rob3;i++)
  {
    FCircle r3=robot3.get(i);
     if((r3!=null)&&(!destR3[i]))
     {
       float r3x=r3.getX();
       float r3y=r3.getY();
       float r3angle=r3.getRotation();
       r3.setVelocity(400,0);
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


void mousePressed() {
  
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
    if((b.getDensity()==0.1)&&(trees<maxtrees))
    {
      drawTree=true;
    }
    return;
  }
  if(cometPressed)
    return;
  if(BHPressed)
    return;
  poly = new FPoly();
  poly.setStrokeWeight(2);
  poly.setGrabbable(false);
  poly.setFill(100, 100, 100);
  poly.setDensity(10);
  poly.setRestitution(0.5);
  poly.vertex(mouseX, mouseY);
  if(mouseX>maxX)
    maxX=mouseX;
  if(mouseY>maxY)
    maxY=mouseY;
  if(mouseX<minX)
    minX=mouseX;
  if(mouseY<minY)
    minY=mouseY;
}

void mouseDragged() {
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
    maxY=mouseY;
  if(mouseX<minX)
    minX=mouseX;
  if(mouseY<minY)
    minY=mouseY;
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
    else if(b.getDensity()==0.1);
    else
    {
      drawTree=false;
    }
  }
}

void mouseReleased() {
  if((rpressed)&&(experience>=nrockLevel)&&(nrockLevel!=0))
    {
      
        rockLevel++;
        experience-=nrockLevel;
        if(rockLevel==3)
          nrockLevel=0;
    }
    if((tpressed)&&(experience>=ntreeLevel)&&(ntreeLevel!=0))
    {
        treeLevel++;
        experience-=ntreeLevel;
        if(treeLevel==2)
          ntreeLevel=0;
    }
    if((apressed)&&(experience>=nastLevel)&&(nastLevel!=0))
    {
        astLevel++;
        experience-=nastLevel;
        if(nastLevel==2)
          nastLevel=0;
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
      world.add(poly);
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
  if((b1.getDensity()==12)&&((b2.getDensity()==9)||(b2.getDensity()==5)||(b2.getDensity()==2)||(b2.getDensity()==0)||(b2.getDensity()==0.1)))
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
               destR1[i]=true;
             }
             if(i<rob2)
             {
               if((robot2.get(i)==b2)&&(destR2[i]==false))
               {
                 score+=50;
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==b2)&&(destR3[i]==false))
               {
                 score+=100;
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
    world.remove(b2);
  }
  b1=c.getBody2();
  b2=c.getBody1();
  if((b1.getDensity()==12)&&((b2.getDensity()==9)||(b2.getDensity()==5)||(b2.getDensity()==2)||(b2.getDensity()==0)||(b2.getDensity()==0.1)))
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
               destR1[i]=true;
             }
             if(i<rob2)
             {
               if((robot2.get(i)==b2)&&(destR2[i]==false))
               {
                 score+=50;
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==b2)&&(destR3[i]==false))
               {
                 score+=100;
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
  boolean f1=true;
  for(int i=0;i<gbits;i++)
  {
  if (c.getBody1() == grounds.get(i)) 
  {
    f1=false;
    if((i==(gbits-2))||(i==(gbits-1)))
    {
        FBody hittree=c.getBody2();
        if((hittree.getDensity()==10)||(hittree.getDensity()==12));
        else
        {
        explosionX[expNo]=(int)hittree.getX();
        explosionY[expNo]=(int)hittree.getY();
        if(hittree.getDensity()==9)
          health-=5;
        else if(hittree.getDensity()==5)
          health-=10;
        else if(hittree.getDensity()==2)
          health-=15;
        expdisp[expNo]=1;
        expNo++;
        exp.cue(0);
        exp.play();
        }
        world.remove(hittree);
    }
    return;
  }
  if (c.getBody2() == grounds.get(i))
  {
    f1=false;
    if((i==(gbits-2))||(i==(gbits-1)))
    {
        FBody hittree=c.getBody1();
        if((hittree.getDensity()==10)||(hittree.getDensity()==12));
        else
        {
        explosionX[expNo]=(int)hittree.getX();
        explosionY[expNo]=(int)hittree.getY();
        if(hittree.getDensity()==9)
          health-=5;
        else if(hittree.getDensity()==5)
          health-=10;
        else if(hittree.getDensity()==2)
          health-=15;
        expdisp[expNo]=1;
        expNo++;
        exp.cue(0);
        exp.play();
        }
        world.remove(hittree); 
    }
    return;
  }
  }
  if(f1)
  {
      FBody ob1=c.getBody1();
      FBody ob2=c.getBody2();
      if((ob1.getDensity()==9)||(ob1.getDensity()==5)||(ob1.getDensity()==2))
       {
         float fx,fy;
         FBody othobj=c.getBody2();
         if(othobj.getDensity()==10)
         {
         fx=othobj.getVelocityX();
         fy=othobj.getVelocityY();
         float net=(fx*fx)+(fy*fy);
         if(net>30000)
         {
           explosionX[expNo]=(int)ob1.getX();
           explosionY[expNo]=(int)ob1.getY();
           expdisp[expNo]=1;
           expNo++;
           exp.cue(0);
           exp.play();
           for(int i=0;i<rob1;i++)
           {
             if((robot1.get(i)==ob1)&&(destR1[i]==false))
             {
               score+=30;
               destR1[i]=true;
             }
             if(i<rob2)
             {
               if((robot2.get(i)==ob1)&&(destR2[i]==false))
               {
                 score+=50;
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==ob1)&&(destR3[i]==false))
               {
                 score+=100;
                 destR3[i]=true;
               }
             }
           }
           world.remove(ob1);
           ob1=null;
           return;
         }
         else
         {
           laser.cue(0);
           laser.play();
           world.remove(othobj);
         }
         }
         return;
       }
      else if((ob2.getDensity()==9)||(ob2.getDensity()==5)||(ob2.getDensity()==2))
       {
         float fx,fy;
         FBody othobj=c.getBody1();
         if(othobj.getDensity()==10)
         {
         fx=othobj.getVelocityX();
         fy=othobj.getVelocityY();
         float net=(fx*fx)+(fy*fy);
         if(net>30000)
         {
           explosionX[expNo]=(int)ob2.getX();
           explosionY[expNo]=(int)ob2.getY();
           expdisp[expNo]=1;
           expNo++;
           exp.cue(0);
           exp.play();
           for(int i=0;i<rob1;i++)
           {
             if((robot1.get(i)==ob2)&&(destR1[i]==false))
             {
               score+=30;
               destR1[i]=true;
             }
             if(i<rob2)
             {
               if((robot2.get(i)==ob2)&&(destR2[i]==false))
               {
                 score+=50;
                 destR2[i]=true;
               }
             }
             if(i<rob3)
             {
               if((robot3.get(i)==ob2)&&(destR3[i]==false))
               {
                 score+=100;
                 destR3[i]=true;
               }
             }
           }
           world.remove(ob2);
           ob2=null; 
           return;
         }
         else
         { 
           laser.cue(0);
           laser.play();
           world.remove(othobj);
         }
         }
         return;
       }
    
  }
  
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
  /*{
    FBody hovered = world.getBody(mouseX, mouseY);
    if ( hovered != null &&
         hovered.isStatic() == false ) {
      world.remove(hovered);
    }
  } */
}



