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
    this.healthBarWidth = 100; // Lebar health bar awal
  }

  // Display
  void display() {
    push();
    translate(Xpos, Ypos);
    box(100);
    // Tampilkan health bar di atas musuh
    fill(255, 0, 0);
    rect(-50, -70, healthBarWidth, 5);
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
    
  }
}
