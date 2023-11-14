class Enemy {
  float Xpos;  // Posisi x musuh
  float Ypos;  // Posisi y musuh
  float Xspeed;  // Kelajuan musuh
  float kesehatan; // Kesehatan musuh
  float healthBarWidth; // Lebar health bar

  // Constructor
  Enemy(float Xpos, float Ypos, float Xspeed, float kesehatan) {
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.Xspeed = Xspeed;
    this.kesehatan = kesehatan;
  }

  // Display
  void display() {
    push();
    translate(Xpos, Ypos);
    musuh();
    //box(100);
    pop();
  }

  // Movement
  void move() {
    Xpos += Xspeed;
  }

  // Kurangi kesehatan musuh
  void kurangiKesehatan(float damage) {
    kesehatan -= damage;
    healthBarWidth = map(kesehatan, 0, 100, 0, 100); // Perbarui lebar health bar
  }
  
  // Enemy Tower
  void musuh() {
    pushMatrix();
    fill(250);
    translate(0,50,0);
    box(80,15,100);
    translate(0,-10,0);
    box(50,10,50);
    push();
    translate(0,-15,0);
    box(15, 35, 15);    
    //rotateY(second());
    translate(10,-15,0);
    box(80, 25, 30);
    pop();
    popMatrix();
  }
}
