class Slv {
  float Xpos;  // posisi x
  float Ypos;  // posisi y
  float Xspeed;  // kelajuan
  float Zrotate;  // rotasi pada sumbu-Z
  float turretMuzzleRotation; // Rotasi turret muzzle
  
  Slv(float Xpos, float Ypos, float Xspeed, float Zrotate){
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.Xspeed = Xspeed;
    this.Zrotate = Zrotate;
    this.turretMuzzleRotation = 0;
  }
  
  void display(){
    push();
    translate(Xpos, Ypos);
    scale(radians(7));
    fill(0);
    slv();
    
    pop();
  }  
  
  // Pergerakan SLV
  void move() {
    Xpos += Xspeed;
    tabrakEnemies(enemies); // Cek tabrakan dengan musuh
    turretMuzzleRotation += 0; // Kecepatan rotasi
  }
  
  // Icon
  void icon(){
    push();
    translate(Xpos, Ypos, 5);
    scale(radians(10));  // Sherpa Light Vehicle size
    fill(0);
    slv();
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
  
  
  // desain slv
  void slv() {
    //strokeWeight(2);
    //stroke(1);
    circle(825,402,97); // ban depan
    circle(500,402,97); // ban belakang

    //bagian luar
    beginShape();
    vertex(420, 245); //2
    vertex(719, 246); //3
    vertex(749, 300); //4
    vertex(751, 300); //5
    vertex(774, 292); //8
    vertex(822, 295); //9
    vertex(875, 311); //10
    vertex(879, 351); //11
    vertex(869, 352);
    vertex(845, 329);
    vertex(802, 329);
    vertex(779, 348);
    vertex(756, 382);
    vertex(756, 392);
    vertex(568, 392);
    vertex(569, 382);
    vertex(556, 359);
    vertex(556, 342);
    vertex(451, 342);
    vertex(451, 357);
    vertex(445, 358);
    vertex(445, 376);
    vertex(422, 377);
    vertex(413, 369);
    vertex(413, 359);
    vertex(409, 359);
    vertex(410, 351);
    vertex(418, 352);
    vertex(415, 349);
    vertex(415, 342);
    vertex(419, 342);
    vertex(420, 244);
    endShape(CLOSE);
    
    //senjata\
    beginShape();
    vertex(667, 245); //1
    vertex(667, 235); //2
    vertex(668, 232); //3
    vertex(668, 216); //4
    vertex(660, 216); //5
    vertex(658, 212); //6
    vertex(660, 195); //7
    vertex(645, 194); //8
    vertex(645, 188); //9
    vertex(663, 189); //10
    vertex(663, 187); //11
    vertex(667, 187); //12
    vertex(667, 179); //13
    vertex(676, 180); //14
    vertex(676, 190); //15
    vertex(697, 231); //16
    vertex(690, 232); //17
    vertex(685, 219); //18
    vertex(685, 233); //19
    vertex(691, 234); //20
    vertex(691, 245); //21
    endShape(CLOSE);
    
    //spion
    beginShape();    
    vertex(676, 186); //1
    vertex(686, 187); //2
    vertex(691, 190); //3
    vertex(715, 190); //4
    vertex(716, 188); //5
    vertex(720, 188); //6
    vertex(722, 189); //7
    vertex(733, 190); //8
    vertex(733, 185); //9
    vertex(736, 184); //10
    vertex(736, 189); //11
    vertex(746, 189); //12
    vertex(746, 192); //13
    vertex(722, 191); //14
    vertex(719, 193); //15
    vertex(719, 194); //16
    vertex(724, 194); //17
    vertex(724, 195); //18
    vertex(697, 195); //19
    vertex(698, 193); //20
    vertex(717, 194); //21
    vertex(717, 192); //22
    vertex(715, 191); //23
    vertex(697, 191); //24
    vertex(695, 192); //25
    vertex(688, 192); //26
    vertex(687, 190); //27
    vertex(683, 190); //28
    vertex(683, 187); //29
    endShape();
    
    beginShape();
    vertex(668, 224); //1
    vertex(649, 220); //2
    vertex(650, 211); //3
    vertex(647, 214); //4
    vertex(640, 212); //5
    vertex(638, 209); //6
    vertex(637, 207); //7
    vertex(637, 202); //8
    vertex(635, 201); //9
    vertex(636, 194); //10
    vertex(637, 192); //11
    vertex(640, 189); //12
    vertex(642, 186); //13
    vertex(651, 184); //14
    vertex(652, 186); //15
    vertex(644, 186); //16
    vertex(643, 191); //17
    vertex(644, 196); //18
    vertex(653, 195); //19
    vertex(657, 196); //20
    vertex(660, 200); //21
    vertex(655, 208); //22
    vertex(651, 208); //23
    vertex(650, 218); //24
    vertex(666, 221); //25
    endShape(CLOSE);
    //kabel gak jelas

    //senjata nembak
    beginShape();
    vertex(805, 306); //1
    vertex(809, 303); //2
    vertex(809, 300); //3
    vertex(804, 300); //4
    vertex(804, 285); //5
    vertex(806, 284); //6
    vertex(809, 286); //7
    vertex(809, 280); //8
    vertex(808, 283); //9
    vertex(805, 283); //10
    vertex(804, 280); //11
    vertex(804, 256); //12
    vertex(807, 255); //13
    vertex(809, 255); //14
    vertex(811, 259); //15
    vertex(811, 261); //16
    vertex(811, 287); //17
    vertex(813, 289); //18
    vertex(813, 296); //19
    vertex(811, 298); //20
    vertex(811, 303); //21
    vertex(807, 308); //22
    endShape(CLOSE);
  }
}
