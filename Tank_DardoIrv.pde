class TankDardoIrv{
  float Xpos;  // posisi x
  float Ypos;  // posisi y
  float Xspeed;  // kelajuan
  float Zrotate;  // rotasi pada sumbu-Z
  float turretMuzzleRotation; // Rotasi turret muzzle
  
  // Constructor Unit
  TankDardoIrv(float Xpos, float Ypos, float Xspeed, float Zrotate) {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.Xspeed = Xspeed;
    this.Zrotate = Zrotate;
    this.turretMuzzleRotation = 0;
  } 
    
  // Tank dardo-irv
  void dardo_irv(){
    int tireMount = 0;
    
    // Body
    push();
    beginShape();
    vertex(86,312);
    vertex(154,427);
    vertex(140,458);
    vertex(188,494);
    vertex(1005,489);
    vertex(1046,429);
    vertex(1041,426);
    vertex(1067,391);
    vertex(734,322);
    vertex(352,322);
    vertex(353,317);
    vertex(265,318);
    vertex(264,313);
    vertex(109,313);
    endShape(CLOSE);
    
    // Dalam Bawah
    beginShape();
    vertex(192,489);
    vertex(222,523);
    vertex(940,523);
    vertex(1004,479);
    endShape(CLOSE);
    
    // Cerobong Asap
    beginShape();
    vertex(95,322);
    vertex(60,322);
    vertex(100,396);
    vertex(140,396);
    endShape(CLOSE);
    quad(64,328,46,338,80,400,100,394);
    
    //  Roda
    push();
    strokeWeight(6);

    circle(204,486,60);
    circle(204,486,30);
    for (int i=0; i < 6; i++) {
      circle(322+tireMount,527,80);
      circle(322+tireMount,527,35);
      tireMount += 111;
    }
    circle(995,478,70);
    circle(995,478,30);
    pop();
    
    // Turret
    push();
      strokeWeight(2);
      beginShape();
      vertex(647,322);
      vertex(679,311);
      vertex(662,267);
      vertex(617,241);
      vertex(545,233);
      vertex(536,215);
      vertex(381,215);
      vertex(344,308);
      vertex(387,311);
      vertex(394,322);
      endShape();    
      
      // Rocket
      push();
        translate(444,237);
        rotate(radians(330));
        rectMode(CENTER);
        box(190,48,0);
      pop();
      
      // Turret Muzzle
      push();
        translate(640,285);
        //box(100,50,0);
        rect(0,-25,70,50);
        rect(70,-8,225,9);
        rect(295,-9,25,11);
      pop();
      
      // Antena
      quad(408,215,417,215,417,200,409,200);
      rect(410,200,2,-25);
    pop();
    
    // Lamp
    push();
      beginShape();
      vertex(1038,385);
      vertex(1038,365);
      vertex(1005,365);
      vertex(1000,377);
      endShape(CLOSE);
    pop();
    
    pop();
  }
    
  // Fungsi display Tank
  void display(){
    push();
    translate(Xpos, Ypos);
    scale(radians(5));
    rotateZ(Zrotate);
    
    // Tank dardo-ifv
    fill(0);
    dardo_irv();
    
    // Turret muzzle
    push();
    translate(640, 285);
    rotate(radians(turretMuzzleRotation)); // Rotasi turret muzzle
    rect(0, -25, 70, 50);
    rect(70, -8, 225, 9);
    rect(295, -9, 25, 11);
    pop();
    pop();
  }  
  
  // Pergerakan TankDardoIrv
  void move() {
    Xpos += Xspeed;
    tabrakEnemies(enemies); // Cek tabrakan dengan musuh
    turretMuzzleRotation += 0; // Kecepatan rotasi
  }
  
  // Icon
  void icon(){
    push();
    translate(Xpos, Ypos, 5);
    //rotateY(radians(180));
    scale(radians(5));  // Tank Dardo Irv size
    fill(0);
    dardo_irv();
    pop();
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
