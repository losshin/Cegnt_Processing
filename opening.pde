class Opening {
  PFont menuFont, exitFont;
  int panels;
  Logo logo = new Logo(350,100);


  Opening(PFont menuFont, PFont exitFont, int panels) {
    this.menuFont = menuFont;
    this.exitFont = exitFont;
    this.panels = panels;
  }

  void show() {
    switch(panels) {
    case 0:
      menu();
      break;
    case 1:
      play();
      break;
    case 2:
      credits();
      break;
    case 3:
      leave();
      break;
    }
  }

  // ---------------------------- Menu --------------------------------
  void menu() {
    println("->menu");
    textFont(menuFont);
    fill(224, 224, 224);

    logo.display();

    text("Play", 460, 496);
    textSize(50);
    text("Credits", 283, 556);
    text("Exit", 600, 556);

    if (dist(mouseX, mouseY, 515, 483)<50) {
      fill(102, 178, 255);
      textSize(55);
      text("Play", 460, 496);
      if (mousePressed) {
        soundOpening(0);
        panels = 1;
      }
    }
    if (dist(mouseX, mouseY, 360, 540)<80) {
      fill(102, 178, 255);
      text("Credits", 283, 556);
      if (mousePressed) {
        soundOpening(0);
        panels = 2;
      }
    }
    if (dist(mouseX, mouseY, 640, 536)<35) {
      fill(102, 178, 255);
      text("Exit", 600, 556);
      if (mousePressed) {
        soundOpening(0);
        panels = 3;
      }
    }
  }
  

  // ------------------- Game --------------------------------------
  void play() {
    if (keyPressed) {
      if (key == 'q' || key == 'Q') {
        unit1.clear();
        unit2.clear();
        unit3.clear();
        unit4.clear();
        unit5.clear();
        audioHeliBlades.stop();
        audioTankMove.stop();
        audioClick.stop();
        audioBackground.stop();
        audioHydraulic.stop();
        audioTruckDriving.stop();
        selected = false;
        panels = 0;
      }
    }
    bottomNavigation(0, 460);    
  }


  // -------------------------- Credits -----------------------------
  void credits() {
    println("->credits");
    selected = false;
    fill(224, 224, 224);
    text("Back", 180, 560);
    if (!audioBackground.isPlaying()) {
      audioBackground.play();
    }

    // Tim Editor
    push();
      push();
      translate(width/2, 215, 0);
      rectMode(CENTER);
      fill(100);
      box(650, 190, 0);
      pop();
    stroke(0);
    textSize(20);
    textAlign(CENTER);
    text("Created By", width/2, 150);
    text("2109106044_Riski Agung Romadhon, Lead Developer", width/2, 200);
    text("2109106032_M. Novan Saputra Ramadhan, Main Menu Asset", width/2, 230);
    text("2109106045_Muh. Hafiz, Game Asset Maker", width/2, 260);
    text("2109106047_M. Irsyadul Asyrof Haryono, Background asset", width/2, 290);
    pop();

    if (dist(mouseX, mouseY, 250, 550)<39) {
      fill(102, 178, 255);
      text("Back", 180, 560);
      if (mousePressed) {
        audioBackground.stop();
        soundOpening(0);
        panels = 0;
      }
    }
  }


  // ------------------------- Exit the Game --------------------------
  void leave() {
    println("->exit");
    textFont(exitFont);
    selected = false;
    fill(224, 224, 224);
    text("Are you Sure?", 354, 502);
    text("Yes...", 365, 554);
    text("No!", 555, 554);

    if (dist(mouseX, mouseY, 395, 544)<35) {
      fill(102, 178, 255);
      text("Yes...", 365, 554);
      if (mousePressed) {
        soundOpening(0);
        exit();
      }
    }
    if (dist(mouseX, mouseY, 580, 544)<35) {
      fill(102, 178, 255);
      text("No!", 555, 554);
      if (mousePressed) {
        soundOpening(0);
        panels = 0;
      }
    }
  }


  // Sound
  void soundOpening(int i) {
    switch(i) {
    case 0:  // audio Click
      audioClick.play();
      delay(10);
      audioClick.stop();
      break;
    case 1:
      
      break;
    case 2:

      break;
    }
  }
}


// ------------------ Logo ----------------
class Logo {
  int Xpos, Ypos;
  
  Logo(int Xpos, int Ypos){
    this.Xpos = Xpos;
    this.Ypos = Ypos;
  }

  void display() {
    push();
    lights();
    directionalLight(231, 255, 52, 0, -1000, 2);
    translate(325, 100, 2);
    scale(0.3);
    logoDesign();
    pop();
  }
  
  void logoDesign() {
    push();
    fill(97,128,139);
    push();
    beginShape();
    // Rear
    vertex(723,256,2);
    vertex(641,184,2);
    vertex(430,184,2);
    vertex(377,274,2);
    vertex(377,493,2);
    vertex(415,562,2);
    vertex(636,562,2);
    vertex(719,480,2);
    vertex(659,467,2);
    vertex(607,521,2);
    vertex(461,521,2);
    vertex(432,473,2);
    vertex(432,277,2);
    vertex(455,242,2);
    vertex(615,242,2);
    vertex(656,280,2);
    
    // Front
    vertex(723,256,-2);
    vertex(641,184,-2);
    vertex(430,184,-2);
    vertex(377,274,-2);
    vertex(377,493,-2);
    vertex(415,562,-2);
    vertex(636,562,-2);
    vertex(719,480,-2);
    vertex(659,467,-2);
    vertex(607,521,-2);
    vertex(461,521,-2);
    vertex(432,473,-2);
    vertex(432,277,-2);
    vertex(455,242,-2);
    vertex(615,242,-2);
    vertex(656,280,-2);
    endShape();
    pop();
    
    beginShape();
    // Front
    vertex(466,365,-2);
    vertex(451,395,-2);
    vertex(663,395,-2);
    vertex(676,447,-2);
    vertex(716,465,-2);
    vertex(688,287,-2);
    vertex(661,302,-2);
    vertex(655,351,-2);
    
    // Rear
    vertex(466,365,2);
    vertex(451,395,2);
    vertex(663,395,2);
    vertex(676,447,2);
    vertex(716,465,2);
    vertex(688,287,2);
    vertex(661,302,2);
    vertex(655,351,2);
    endShape(CLOSE);
    pop();
  }
}
