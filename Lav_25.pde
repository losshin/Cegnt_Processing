class Lav25{
  
  float Xpos;  // posisi x
  float Ypos;  // posisi y
  float Xspeed;  // kelajuan
  float Zrotate;  // rotasi pada sumbu-Z
  float turretMuzzleRotation; // Rotasi turret muzzle
  
  // Constructor Unit
  Lav25(float Xpos, float Ypos, float Xspeed, float Zrotate) {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.Xspeed = Xspeed;
    this.Zrotate = Zrotate;
    this.turretMuzzleRotation = 0;
  } 
  
  void lav25(){
    stroke(1);
    fill(000);    
    strokeWeight(1);
    stroke(1);
    hint(DISABLE_DEPTH_TEST);
    rect(427,215,20,30);
    hint(ENABLE_DEPTH_TEST);
    
    hint(DISABLE_DEPTH_TEST);
    circle(807,290,15);
    rect(805,256,2,28);
    rect(809,269,2,24);
    ellipse(715,267,38,22);
    hint(ENABLE_DEPTH_TEST);
    beginShape();
    //noFill();
    vertex(355,256);
    vertex(629,256);
    vertex(631,251);
    vertex(673,253);
    vertex(675,258);
    vertex(743,266);
    vertex(767,267);
    vertex(852,312);
    vertex(798,367);
    vertex(390,367);
    vertex(370,347);
    vertex(371,314);
    vertex(354,254);
    endShape();
    
    //beginShape();
    beginShape();    
    //vertex(628,325);
    //vertex(486,295);
    //vertex(522,300);
    vertex(465,257);
    vertex(467,251);
    vertex(465,247);
    vertex(438,246);
    vertex(449,212);
    
    vertex(542,207);
    vertex(543,197);
    vertex(554,197);
    vertex(554,207);
    vertex(559,209);
    vertex(589,210);
    vertex(610,230);
    vertex(601,247);
    vertex(602,251);
    vertex(599,256);
    vertex(465,256);
    endShape();  
    beginShape();    
    vertex(601,218);  //1
    vertex(623,211);  //2
    vertex(625,215);  //3
    vertex(626,220);  //4
    vertex(630,221);  //5
    vertex(637,227);  //6
    vertex(641,229);  //7
    vertex(722,229);  //8
    vertex(724,227);  //9
    vertex(731,227);  //10
    vertex(732,228);  //11
    vertex(743,229);  //12
    vertex(743,235);  //13
    vertex(730,234);  //14
    vertex(729,235);  //15
    vertex(723,236);  //16
    vertex(723,234);  //17
    vertex(641,235);  //18
    vertex(636,236);  //19
    vertex(631,241);  //20
    vertex(606,240);  //21
    vertex(610,230);  //22
    vertex(602,220);  //23
    endShape();
    line(782,365,834,310);
    line(833,309,851,310);
    line(740,264,780,288);
    line(780,288,835,310);
    line(370,309,833,309);
    
    //endShape();
    //noFill();    
    ban(0,0);    
    ban(85,0);    
    ban(188,0);        
    ban(275,0);
    
    
    //vertex(383,94);  //24
  }
  
  // Show 
  void display(){    
    push();
    translate(Xpos,Ypos);
    scale(radians(9.2));
    lav25();
    pop();
  }
  
   // Icon
  void icon(){
    push();
    translate(Xpos, Ypos, 5);
    scale(radians(8.5));  // Lav25 size
    fill(0);
    lav25();
    pop();
  }
  
  // Pergerakan
  void move() {
    Xpos += Xspeed;
    if (Xpos > width+100) {
       unit3.remove(0);
    }
  }
  
  // Ketika bertabrakan
  void tabrakEnemies(ArrayList<Enemy> enemies) {
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy enemy = enemies.get(i);
      float distance = dist(Xpos, Ypos, enemy.Xpos, enemy.Ypos);
      if (distance < 100) { // Jarak yang diperlukan untuk tabrakan
        enemy.kurangiKesehatan(10); // Kurangi kesehatan musuh
        if (enemy.kesehatan <= 0) {
          enemies.remove(i); // Hapus musuh jika kesehatannya habis
        }
      }
    }
  }
}

void ban(int x, int y){
  fill(000);
  pushMatrix();
  translate(x,y);
  circle(459,378,20);
  circle(459,378,52);
  circle(459,378,80);
  
  //fill(#FAF7F7);
  //strokeWeight(0);  
  //ellipse(472-11, 353+12, 4, 4);
  //ellipse(504-25, 384, 4, 4);
  //ellipse(472-11, 412-15, 4, 4);
  //ellipse(442, 384, 4, 4);
  popMatrix();
}
