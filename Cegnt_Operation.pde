import processing.core.PApplet;
import processing.sound.*;
import java.util.ArrayList;

ArrayList<SeaStallion> unit1 = new ArrayList<SeaStallion>();
ArrayList<TankDardoIrv> unit2 = new ArrayList<TankDardoIrv>();
ArrayList<Lav25> unit3 = new ArrayList<Lav25>();
ArrayList<TrukRoket> unit4 = new ArrayList<TrukRoket>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Opening mainMenu;
Mountain mountain = new Mountain();

int kes, highlightedUnit = -1, numStars = 200;
Star[] sky = new Star[numStars];
float moveCam;
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
  audioHydraulic = new SoundFile(this, "./sound/hydraulic lift SoundEffectsFactory.wav");
  audioTruckDriving = new SoundFile(this, "./sound/truck_driving.wav");
  
  // Audio Volume
  audioHydraulic.amp(0.3);
  audioTruckDriving.amp(0.1);
  
  enemies.add(new Enemy((width - 100), 350, 0, 500));
}

void draw(){  
  background(0);
  push();
  translate(0,-250,-1);
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
  
  mainMenu.show();
    
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
    if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
      if (i == 0) {
        unit1.add(new SeaStallion(0, 100, 2.1, 0.1));  // Menambahkan objek SeaStallion ke ArrayList
      } else if (i == 1) {
        unit2.add(new TankDardoIrv(-50, 350, 2, 0)); // Menambahkan objek TankDardoIrv ke ArrayList
      } else if (i == 2) {
        unit3.add(new Lav25(-200, 333, 3, 0)); // Menambahkan objek Lav 25 ke ArrayList
      } else if (i == 3) {
        unit4.add(new TrukRoket(-100, 277, 0.5,0)); // Menambahkan objek Truk Roket ke ArrayList
      }
      
      
      println("Tombol Unit " + (i + 1) + " diklik!");  // Untuk cek posisi array/ tombol yang ditekan
      kes = i;
      break;
    }
    btnNav += 115;  // jarak yang diberikan
  } 
}

// Bottom Navigation
void bottomNavigation(int posX, int posY) {
  int btnNav = 0;
  // icon
  SeaStallion ssIcon = new SeaStallion((width / 100) * 26, 510, 0,0);
  ssIcon.icon();
  TankDardoIrv diIcon = new TankDardoIrv((width / 100) * 27.5, 517, 0,0);
  diIcon.icon();
  Lav25 lavIcon = new Lav25((width / 100) * 35, 505, 0,0);
  lavIcon.icon();
  TrukRoket trIcon = new TrukRoket((width / 100) * 50.5, 511, 0,0);
  trIcon.icon();
    
  // Box Navigation
  push();    
    translate(posX, posY);
    noStroke();
    fill(28,21,21);
    rect(0, 0, width, height-125);
    
    // Box Units
    push();
      //fill(255);
      translate(((width/100)*5),0,0);
      for (int i = 0; i < 6; i++) {
        if (i == highlightedUnit) {
          fill(137, 137, 137); // Warna button ketika di tekan
        } else {
          fill(255);  // Warna default (putih)
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
