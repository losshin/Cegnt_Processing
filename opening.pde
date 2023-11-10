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
        panels = 1;
      }
    }
    if (dist(mouseX, mouseY, 360, 540)<80) {
      fill(102, 178, 255);
      text("Credits", 283, 556);
      if (mousePressed) {
        panels = 2;
      }
    }
    if (dist(mouseX, mouseY, 640, 536)<35) {
      fill(102, 178, 255);
      text("Exit", 600, 556);
      if (mousePressed) {
        panels = 3;
      }
    }
  }
  
  // ------------------- Game --------------------------------------
  void play() {
    // masukkan kode game disini
  if(keyPressed){
    if(keyCode == LEFT){
      if(moveCam != 0){
        moveCam -= 5;
      } 
     } else if (keyCode == RIGHT){
       if(moveCam != 600){
         moveCam += 5;
       }
     }
    }
    //camera(moveCam+0,0,2, moveCam+0,0,2,0,0,0);
    
    // Land
    push();
    fill(0);
    rect(0,400,width,400);
    pop();
    
    bottomNavigation(0,460);
    
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
      unit.display();
      unit.move();
      unit.tabrakEnemies(enemies);
    }  
    
    // [Lav-25]
    for (Lav25 unit : unit3) {
      for (Enemy enemy : enemies) {
        float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
        if (distance < 700) {
          unit.Xspeed = 0;
          enemy.Xspeed = 0;
        }
      }
      unit.display();
      unit.move();
      unit.tabrakEnemies(enemies);
    }
    
    
    // [Truk Roket]
    for (TrukRoket unit : unit4) {
      for (Enemy enemy : enemies) {
        float distance = dist(unit.Xpos, unit.Ypos, enemy.Xpos, enemy.Ypos);
        if (distance < 800) {
          unit.kecepatan = 0;
          enemy.Xspeed = 0;
        }
      }
      unit.display();
      unit.move();
    }
    
    // [Enemy]
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
        panels = 0;
        delay(100);
      }
    }
  }

}
