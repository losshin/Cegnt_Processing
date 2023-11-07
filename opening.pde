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
    
    text("Play", 150, 320);
    text("Credits", 170, 400);
    text("Exit", 160, 480);
    
    if (dist(mouseX, mouseY, 215, 310)<35 || dist(mouseX, mouseY, 280, 310)<35) {
      fill(102, 178, 255);
      text("Play", 150, 320);
      if (mousePressed) {
        panels = 1;
      }
    }
    if (dist(mouseX, mouseY, 240, 390)<35 || dist(mouseX, mouseY, 170, 380)<35 || dist(mouseX, mouseY, 320, 390)<35) {
      fill(102, 178, 255);
      text("Credits", 170, 400);
      if (mousePressed) {
        panels = 2;
      }
    }
    if (dist(mouseX, mouseY, 210, 470)<35 || dist(mouseX, mouseY, 280, 470)<35) {
      fill(102, 178, 255);
      text("Exit", 160, 480);
      if (mousePressed) {
        panels = 3;
      }
    }
  }
  
  
  // ------------------- Game --------------------------------------
  void play() {
    // masukkan kode game disini
    
    // Land
    push();
    fill(0);
    rect(0,400,width,400);
    pop();
    
    bottomNavigation(0,460);
    
    // Sea Stallion
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
    
    // Tank Dardo-Irv
    for (TankDardoIrv unit : unit2) {
      //for (Enemy enemy : enemies) {
      //  float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
      //  if (distance < 300) {
      //    unit.Xspeed = 0;
      //    enemy.Xspeed = 0;
      //  }
      //}
      unit.display();
      unit.move();
      unit.tabrakEnemies(enemies);
    }  
    
    // Truk Roket
    s400.display();
    s400.controlled();
    //s.keyReleased();
    //s.move();
    
    // Enemy
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy enemy = enemies.get(i);
      enemy.display();
      enemy.move();
    }
    //-------------------------- end -----------------------
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
    text("Are you Sure?", 100, 280);
    text("Yes...", 200, 390);
    text("No!", 200, 480);
  
    if (dist(mouseX, mouseY, 230, 380)<35) {
      fill(102, 178, 255);
      text("Yes...", 200, 390);
      if (mousePressed) {
        exit();
      }
    }
    if (dist(mouseX, mouseY, 230, 480)<35) {
      fill(102, 178, 255);
      text("No!", 200, 480);
      if (mousePressed) {
        panels = 0;
        delay(100);
      }
    }
  }

}
