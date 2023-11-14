class Opening {
  PFont menuFont, exitFont;
  int panels;
  
  Opening(PFont menuFont, PFont exitFont, int panels){
    this.menuFont = menuFont;
    this.exitFont = exitFont;
    this.panels = panels;
  }

  void show() { 
    switch(panels) {
      case 0: menu(); break;
      case 1: play(); break;
      case 2: credits(); break;
      case 3: leave(); break;
    }
  } 
  
  // ---------------------------- Menu --------------------------------
  void menu() {
    println("->menu");
    textFont(menuFont);
    fill(224,224,224);
    
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
    bottomNavigation(0,460);    
  }  
  
  
  // -------------------------- Credits -----------------------------
  void credits() {
    println("->credits");
    fill(224,224,224);
    text("Back", 180, 560);
  
    if (dist(mouseX, mouseY, 250, 550)<39) {
      fill(102, 178, 255);
      text("Back", 180, 560);
      if (mousePressed) {
        panels = 0;
        delay(100);
      }
    }
  }
  
  
  // ------------------------- Exit the Game --------------------------
  void leave() {
    println("->exit");
    textFont(exitFont);
    
    fill(224,224,224);
    text("Are you Sure?", 354, 502);
    text("Yes...", 365, 554);
    text("No!", 555, 554);
  
    if (dist(mouseX, mouseY, 395, 544)<35) {
      fill(102, 178, 255);
      text("Yes...", 365, 554);
      if (mousePressed) {
        exit();
      }
    }
    if (dist(mouseX, mouseY, 580, 544)<35) {
      fill(102, 178, 255);
      text("No!", 555, 554);
      if (mousePressed) {
        soundOpening(0);
        panels = 0;
        delay(100);
      }
    }
  }


  // Sound
  void soundOpening(int i){
    switch(i){
      case 0: 
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
