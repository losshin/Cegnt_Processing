class SeaStallion{
  float Xpos;  // posisi x
  float Ypos;  // posisi y
  float Xspeed;  // kelajuan
  float Zrotate;  // rotasi pada sumbu-Z
  
  // Constructor Unit
  SeaStallion(float Xpos, float Ypos, float Xspeed, float Zrotate){
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.Xspeed = Xspeed;
    this.Zrotate = Zrotate;
  }  

  // Pergerakan Sea Stallion
  void move() {
    Xpos += Xspeed;
    if (Xpos > width) {
      
    }
  }

  // Display Sea Stallion
  void display(){
    push();
    translate(Xpos,Ypos);  // Sea Stallion Position
    scale(radians(12));  // Sea Stallion size
    rotateX(radians(0));
    rotateZ(Zrotate);
    rotateY(radians(180));
    fill(0);
    seaStallion(frameCount);
    pop();
  }

  // Icon
  void icon(){
    push();
    translate(Xpos, Ypos, 5);
    rotateY(radians(180));
    scale(radians(5));  // Sea Stallion size
    fill(0);
    seaStallion(0);
    pop();
  }


  // Heli Sea Stallion
  void seaStallion(float rtsBilah){
    push();

    strokeWeight(2); // tebal baris luar

    // Heli Sea Stallion
    beginShape();
    vertex(225,431,0);
    curveVertex(225,431,0);
    curveVertex(225,431,0);
    curveVertex(176,499,0);
    curveVertex(203,539,0);
    curveVertex(203,539,0);
    vertex(614,538,0);
    vertex(805,457,0);
    vertex(907,458,0);
    vertex(987,353,0);
    vertex(987,343,0);
    vertex(977,328,0);
    vertex(940,328,0);
    vertex(935,360,0);
    vertex(875,430,0);
    curveVertex(590,430,0);
    curveVertex(590,430,0);
    curveVertex(554,395,0);
    curveVertex(454,382,0);
    curveVertex(288,411,0);
    curveVertex(288,411,0);
    vertex(279,429,0);
    endShape(CLOSE);
    
    // Main Rotor
    push();
    translate(974,351,1);
    rotate(rtsBilah);  // Rotor berputar
    ellipseMode(CENTER);
    ellipse(0,0,20,20);
    // Bilah Main Rotor
    for(int i = 0; i < 4; i++){
      rotate(radians(90));
      rect(0,0,20,-3);
      rect(10,0,90,-10);
    }
    pop();
    
    // Tail Rotor
    push();
    translate(436,363);
    rotateZ(radians(-5));
    rectMode(CENTER);
    rotateY(rtsBilah);  // Rotor Berputar pada Y-Axis
    // Bilah Tail Rotor
    for(int i = 0; i < 2; i++){
      rotateY(radians(90));
      box(60,20,20);
      box(800,2,10);
    }
    translate(0,7);
    sphere(15);
    pop();  
    
    // Tire
    ellipseMode(RADIUS);  // Ban Depan
    ellipse(197,547,12,12);
    ellipseMode(CENTER);  // Velg Depan
    ellipse(197,547,12,12);
    ellipseMode(RADIUS);  // Ban Belakang
    ellipse(533,547,12,12);
    ellipseMode(CENTER);  // Velg Belakang
    ellipse(533,547,12,12);  
    pop();
  }
}
