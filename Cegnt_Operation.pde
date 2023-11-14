import processing.core.PApplet;
import processing.sound.*;
import java.util.ArrayList;

ArrayList<SeaStallion> unit1 = new ArrayList<SeaStallion>();
ArrayList<TankDardoIrv> unit2 = new ArrayList<TankDardoIrv>();
ArrayList<Lav25> unit3 = new ArrayList<Lav25>();
ArrayList<TrukRoket> unit4 = new ArrayList<TrukRoket>();
ArrayList<Slv> unit5 = new ArrayList<Slv>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Opening mainMenu;
Mountain mountain = new Mountain();

int kes, highlightedUnit = -1, numStars = 200;
Star[] sky = new Star[numStars];
float lajuLav = 2;  // laju Lav 25
float lajuSS = 2.5;  // Sea Stallion
float lajuSLV = 2;  // Sherpa Light Vehicle
float lajuDIrv = 2;  // Tank DardoIrv
float lajuTR = 0.8;  // Truk Roket
boolean selected, rocketLaunch, rocketDown;

Sound In;
SoundFile audioClick;
SoundFile audioBackground;
SoundFile audioHydraulic;
SoundFile audioTruckDriving;

void setup(){
  size(1000,600,P3D);
  smooth();
  ortho();  // supaya perspective Objek 3d menjadi datar(searah)
  
  // Font MainMenu
  PFont menuFont, exitFont;
  menuFont = loadFont("./font/Harrington-55.vlw");
  exitFont = loadFont("./font/Harrington-44.vlw");
  mainMenu = new Opening(menuFont, exitFont, 0);

  // background
  b1 = color(46, 2, 173);
  b2 = color(0, 105, 229);
  m1 = color(19, 0, 115);
  m2 = color(1, 16, 142);
  for (int i = 0; i < numStars; i++) {
    sky[i] = new Star();
  }

  // Audio
  audioClick = new SoundFile(this, "./sound/klik_button.mp3");
  audioHydraulic = new SoundFile(this, "./sound/hydraulic lift SoundEffectsFactory.wav");
  audioTruckDriving = new SoundFile(this, "./sound/truck_driving.wav");
  //audioBackground = new SoundFile(this, "./sound/backsound");
  
  // Audio Volume
  audioClick.amp(0.5);
  audioHydraulic.amp(0.5);
  audioTruckDriving.amp(0.4);

  enemies.add(new Enemy((width - 90), 340, 0, 500));
}

void draw(){  
  background(0);
  push();
  translate(0,-250,-1);
  
  // Latar Belakang (Langit malam dan Pegunungan)
  setGradient(0, 0, width, 0.85 * height, b1, b2, 1);
  stroke(m1);
  mountain.display(5, 450);
  stroke(m2);
  mountain.display(1.5, 550);
  noStroke();
  
  // kode bintang
  for (int i = 0; i < numStars; i++) {
    sky[i] = new Star();
  }
  pop();
  
  // Enemy Comeback!!!  
  if (enemies.size() == 0 && second() == 30) {
    enemies.add(new Enemy((width - 90), 340, 0, 500));
  }
  
  //mainMenu.show();
  bottomNavigation(0,460);
    
  println(kes);

  push();
  textSize(20);
  text("Mouse X = " + mouseX, width/2, 20);
  text("Mouse Y = " + mouseY, width/2, 60);
  pop();
}

void mouseClicked() {
  int btnNav = 0;  // Untuk memberikan space pada pengulangan button
  for (int i = 0; i < 6; i++) {
    float buttonX = ((width / 100) * 16) + btnNav;
    float buttonY = 510;
    float buttonWidth = 100;
    float buttonHeight = 80;
    if ((mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) && selected) {
      audioClick.play();
      if (i == 0) {
        unit1.add(new SeaStallion(0, 100, lajuSS, 0.1));  // Menambahkan objek SeaStallion ke ArrayList
      } else if (i == 1) {
        unit2.add(new TankDardoIrv(-50, 350, lajuDIrv, 0)); // Menambahkan objek TankDardoIrv ke ArrayList
      } else if (i == 2) {
        unit3.add(new Lav25(-200, 333, lajuLav, 0)); // Menambahkan objek Lav 25 ke ArrayList
      } else if (i == 3) {
        unit4.add(new TrukRoket(-100, 277, lajuTR,0)); // Menambahkan objek Truk Roket ke ArrayList
      } else if (i == 4) {
        unit5.add(new Slv(-100, 345, 2,0)); // Menambahkan objek Slv ke ArrayList
      }
      
      println("Tombol Unit " + (i + 1) + " diklik!");  // Untuk cek posisi array/ tombol yang ditekan
      kes = i;
      break;
    }
    btnNav += 115;  // jarak antar box button
  }
  
  // menu keluar dari game
  //if (mouseX ) {
    
  //}

}

// Bottom Navigation
void bottomNavigation(int posX, int posY) {
  int btnNav = 0;
  selected = true;

  // icon
  SeaStallion ssIcon = new SeaStallion((width / 100) * 26, 510, 0,0);
  ssIcon.icon();
  TankDardoIrv diIcon = new TankDardoIrv((width / 100) * 27.5, 517, 0,0);
  diIcon.icon();
  Lav25 lavIcon = new Lav25((width / 100) * 35, 505, 0,0);
  lavIcon.icon();
  TrukRoket trIcon = new TrukRoket((width / 100) * 50.5, 511, 0,0);
  trIcon.icon();
  Slv slvIcon = new Slv((width/100) * 55.5, 495,0,0);
  slvIcon.icon();
    
  // land
  fill(0);
  quad(0, 400, 0, height, width, height, width, 400);
    
  // Box Navigation
  push();    
    translate(posX, posY);
    noStroke();
    fill(28,21,21);
    rect(0, 0, width, height-125);
    
    // Box Units
    push();
      translate(((width/100)*5),0,0);
      for (int i = 0; i < 6; i++) {
        if (i == highlightedUnit) {
          fill(#0041FF); // Warna button ketika di tekan
        } else {
          fill(#0E2A74);  // Warna default (putih)
        }
        rect(((width/100)*11.05)+btnNav, 50, 100, 80);  // Button
        btnNav += 115;
      }
    pop();
    
    // Area Show (Sebagai luas pandang map)
    push();
      fill(255);
      rectMode(CENTER);
      rect(width/2, 25, 500, 38);
    pop();   
  pop();
  
  // [Sea Stallion]
  for (SeaStallion unit : unit1) {
    for (Enemy enemy : enemies) {
      float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
      if (distance < 50) {
        unit.Xspeed = 0;
        enemy.Xspeed = 0;
      }
    }
    unit.display();
    unit.move();
  }
    
  // [Tank Dardo-Irv]
  for (TankDardoIrv unit : unit2) {
    //for (Enemy enemy : enemies) {
    //  float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
    //  if (distance < 300) {
    //    unit.Xspeed = 0;
    //    enemy.Xspeed = 0;
    //  }
    //}
    //if (enemies.size() == 0) {  //  ketika enemy lenyap
      //unit.Xspeed = lajuDIrv;
    //}
    //if (!audioTruckDriving.isPlaying()) {
    //    audioTruckDriving.play();
    //    audioTruckDriving.loop(0.5);
    //}
    unit.display();
    unit.move();
    unit.tabrakEnemies(enemies);
  }  
  
  // [Lav-25]
  for (Lav25 unit : unit3) {
    for (Enemy enemy : enemies) {
      float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
      if (distance < 600) {
        unit.Xspeed = 0;
        enemy.Xspeed = 0;
      }
    }
    if (enemies.size() == 0) {  //  ketika enemy lenyap
      unit.Xspeed = lajuLav;
    }
    if (!audioTruckDriving.isPlaying()) {
        audioTruckDriving.play();
        audioTruckDriving.loop(0.5);
    }
    unit.display();
    unit.move();
    unit.tabrakEnemies(enemies);
  }
  
  
  // [Truk Roket]
  for (TrukRoket unit : unit4) {
    for (Enemy enemy : enemies) {
      float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
      if (distance < 900) {    // jarak ally to enemy
        unit.kecepatan = 0;
        enemy.Xspeed = 0;
        audioTruckDriving.stop();
        rocketLaunch = true;
      }
    }
    if (enemies.size() == 0) {  // ketika enemy lenyap, maka peluncur roket naik
      unit.kecepatan = lajuTR;
      rocketLaunch = false;
    }
    if (!audioTruckDriving.isPlaying()) {
        audioTruckDriving.play();
        audioTruckDriving.loop(0.5);
    }
    unit.display();
    unit.move();
  }
  
  // [Slv]
  for (Slv unit : unit5) {
    for (Enemy enemy : enemies) {
      float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
      if (distance < 500) {  // jarak dari enemy
        unit.Xspeed = 0;
        enemy.Xspeed = 0;
      }
    }
    if (enemies.size() == 0) {  //  ketika enemy lenyap
      unit.Xspeed = lajuSLV;
    }
    if (!audioTruckDriving.isPlaying()) {
        audioTruckDriving.play();
        audioTruckDriving.loop(0.5);
    }
    unit.display();
    unit.move();
  }
  
  // [Enemy]
  for (Enemy enemy : enemies) {
    enemy.display();
    enemy.move();
  }
}

void mouseMoved() {
  int btnNav = 0;
  //isCursorOverUnit = false;
  for (int i = 0; i < 6; i++) {
    float buttonX = ((width / 100) * 16) + btnNav;
    float buttonY = 510;
    float buttonWidth = 100;
    float buttonHeight = 80;
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
      highlightedUnit = i;  // Warna ketika kursor berada bada posisi button unit
      break;
    }
    btnNav += 115;
  }
}


// ------------------- background ------------------
color b1, b2, m1, m2, m3;

class Mountain {
  int strokeWeightVal;

  Mountain() {
    strokeWeightVal = 5;
  }

  void display(float t, float h) {
    float x = 0.0;
    while (x < width) {
      beginShape();
      vertex(0, height + 200);
      vertex(x, h + map(noise(t), 0, 1, -75, 75));
      x++;
      t += 0.005;
      vertex(width, height + 200);
      endShape();
    }
  }
}

class Star {
  float x, y, c = 255, a =-1, dir, sz;
  
  Star() {
    noStroke();
  }

  void shine() {
    if (a < 0) {
      x = random(width);
      y = random(0, 270);
      sz = random(3);
      dir = random(1, 3);
      a = 0;
    }
    fill(c, a);
    ellipse(x, y, sz, sz);
    a = a + dir;
    if (a > 255) {
      a = 255;
      dir = random(-5, -10);
    }
  }
}

void setGradient(float x, float y, float w, float h, color c1, color c2, int axis) {
  noFill();
  if (axis == 1) {
    for (int i = 0; i <= h; i++) {
      float inter = map(i, 0, h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x + w, i);
    }
  } else if (axis == 2) {
    for (int i = 0; i <= w; i++) {
      float inter = map(i, 0, w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y + h);
    }
  }
}
