//int ex = 0; 
// size of boxes
int b = 2; // game border
int co = 0;
int evn = 0;// even evnnter
int[] rnd;
boolean[] boo;
boolean scrmb = false;
boolean[] btns;

void setup(){
  size(620, 480);
  background(0);
  stroke(0);
  strokeWeight(4);
  fill(250);
  smooth();
  textSize(30);
  textAlign(CENTER);

btns = new boolean[16];//these booleans will be attached to each square to create buttons
for(int a=0; a< 16; a=a+1){
    //println(a);
    btns[a]=false;
    println(btns[a]);
  }

  boo = new boolean [16];
  for(int a=0; a< 16; a=a+1){
    //println(a);
    boo[a]=false;
    //println(boo[a]);
  }

  rnd = new int[16];  
  for(int i = 0; i < 15; i=i+1){
    rnd[i] = floor(random(1,16)); //BETWEEN 1 and 17, rounded down
    //println(rnd[i]);
    if (boo[rnd[i] -1 ]==true){  //need to bump 1 down to 0 because 16 is too big
      i= i-1;
    }
    else{
      boo[rnd[i] -1 ]=true;
     // println(rnd[i]);
    }
  }
}


void draw(){
  int yi = width/8;
  co = 0;//evnnter
  evn = 0;
  rectMode(CENTER);
  fill(250);
  rect(width/2, height-50, 160, 60);
  fill(0);
  text("Scramble",width/2, height-45);

  if(mouseX > width/2-80 && mouseX < width/2+80 && mouseY > height-90 && mouseY < height-  10 ){
    scrmb = true;
  }else{
    scrmb = false;
  }

  rectMode(CORNER);

  for (int h = 0; h < 4; h = h+1){ 
    for (int w = 0; w < 4; w = w+1){

      fill(250);
      if (co < 15 && rnd[co]%2 == 0){
        evn = evn+1;
        println(co);
        fill(125);

      }
      else if(co < 15 && rnd[co]%2 != 0){      
        fill(250);
      }
      else{
        fill(0);
      }      
/*btns[] holds the boolean that tells you which box is blank*/
//yi=width/8, b=2, w= a number b/w 0 and 3
      rect ( (b+w)*yi, (b+h)*yi, yi, yi);
      fill(0);
      text (rnd[co], ((b+w)*yi)+30, ((b+h)*yi)+35); 
      co = co+1;
      /*if (co>3 && btns[co-4] == true){
      println("i'm a button");
      }
      else if(co<13 && btns[co+4] == true){
      println("i'm a button");
      }*/
    }
  }
  
  //println(evn);
  //println(scrmb);

}

void mouseClicked(){
  if(scrmb){
    setup();
  }
}


/*void rectMove(){
 mouseClicked*/


//Box(float xpos, float ypos, onOff, btnBoo, float faceNumb)











