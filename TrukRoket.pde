class TrukRoket {
  float Xpos;  // posisi x
  float Ypos;  // posisi y
  float kecepatan;  // kelajuan
  int rotatee = 1;
  float putaranBan = 0;
  float rotateroket = 0;
  
  // Constructor Unit
  TrukRoket(float Xpos, float Ypos, float kecepatan, float rotateroket){
    this.Xpos = Xpos;
    this.Ypos = Ypos;
    this.kecepatan = kecepatan;
    this.rotateroket = rotateroket;
  }  
  
  // Ban
  void banmobil(float x, float y) {
    //hint(DISABLE_DEPTH_TEST);
    strokeWeight(8);
    point(x, y);  
    strokeWeight(1);  
    circle(x, y, 60); 
    circle(x, y, 40);  
    circle(x, y, 10);
    //rect(x,y,20,30);
    pushMatrix();
    translate(12, 1);
    fill(#FAF7F7);
    strokeWeight(0);
    ellipse(x, y, 4, 4);
    ellipse(x-11, y+12, 4, 4);
    ellipse(x-25, y, 4, 4);
    ellipse(x-11, y-15, 4, 4);
    popMatrix();
    fill(#000000);
    strokeWeight(1);
    //hint(ENABLE_DEPTH_TEST);
  }
  void kotak_kehijuan(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) { //fungsi kotak kehijuan pada belakang truk
    //hint(DISABLE_DEPTH_TEST);
    strokeWeight(0);  
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    //hint(ENABLE_DEPTH_TEST);
  }
  void kotak_2(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {//fungsi untuk kotak atas bagian atas warna coklat
    strokeWeight(0);  
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
  void rectt(float x, float y, float w, float h) {//fungsi untuk kotak abu-abu pada bagian atas ban belakang
    strokeWeight(1);  
    rect(x, y, w, h);
  }
  
  void pipa_pipa_kecil(float y) { //pipa kecil pada tempat roket
    strokeWeight(1);
    rect(127-700, y, 6, 55, 90);
    rect(120-700, y, 6, 55, 90);
    rect(113-700, y, 6, 55, 90);
    rect(187-700, y, 6, 55, 90);
    rect(207-700, y, 6, 55, 90);
    rect(227-700, y, 6, 55, 90);
    rect(247-700, y, 6, 55, 90);
    rect(267-700, y, 6, 55, 90);
    rect(287-700, y, 6, 55, 90);
    rect(307-700, y, 6, 55, 90);
    rect(327-700, y, 6, 55, 90);
  
    rect(367-700, y, 6, 55, 90);
    rect(397-700, y, 6, 55, 90);
    rect(417-700, y, 6, 55, 90);
    rect(487-700, y, 6, 55, 90);
    rect(507-700, y, 6, 55, 90);
    rect(557-700, y, 6, 55, 90);
  }
  

  void cobaroket(int x, int y) {
    pushMatrix();
    translate(x, y);  
    arc(113-700, 122, 50, 50, radians(90), radians(270)); //bagian ujung roket (tumpul) roket atas menghadap ke kiri
    arc(113-700, 180, 50, 50, radians(90), radians(270)); //bagian ujung roket (tumpul) roket bawah menghadap ke kiri
    rect(133-700, 156, 470, 48); //tabung roket 1
    rect(133-700, 98, 470, 48); //tabung roket 2
  
    //tabung kecil roket warnah merah gelap  
    rect(597-700, 94, 6, 55, 90); //tabung kecil
    rect(597-700, 153, 6, 55, 90); //tabung kecil
    //ujung lancip roket  
    strokeWeight(0);
    arc(603-700, 122, 30, 50, radians(270), radians(450)); //bagian ujung roket menghadap kanan (tumpul)
    arc(603-700, 181, 30, 50, radians(270), radians(450)); //bagian ujung roket menghadap kanan (tumpul)
  
    pipa_pipa_kecil(94);
    pipa_pipa_kecil(152);
    kotak_2(171-700, 240, 171-700, 204, 583-700, 204, 583-700, 240);//kotak atas bagian atas warna coklat
    popMatrix();
    //pipa pipa kecil
    //garis-garis  
  }
  
  
  void s400(){
    fill(#000000);
    pushMatrix();  
    translate(650, 250);//mengatur posisi mulai truk
    //hint(DISABLE_DEPTH_TEST);
    quad(542-700+kecepatan, 288, 559-700+kecepatan, 268, 676-700+kecepatan, 269, 693-700+kecepatan, 288); //kotak bawah pada ban ke 3 & 4
    //bagian atas ban
    strokeWeight(1);
    //hint(DISABLE_DEPTH_TEST);
    beginShape();  
    vertex(539-700+kecepatan, 296);//point 1
    vertex(539-700+kecepatan, 288); //point 2
    vertex(557-700+kecepatan, 266); //point 3
    vertex(675-700+kecepatan, 266); //point 4
    //vertex(698-700+kecepatan,285); //point 5
    vertex(700-700+kecepatan, 292); //point 6
    vertex(692-700+kecepatan, 292); //point 7
    vertex(675-700+kecepatan, 272);//d 8
    vertex(557-700+kecepatan, 272); // 9
    vertex(545-700+kecepatan, 288); //point 10
    vertex(545-700+kecepatan, 296);//point akhir
    endShape();
    
    kotak_kehijuan(158-700+kecepatan, 305, 158-700+kecepatan, 240, 478-700+kecepatan, 240, 478-700+kecepatan, 305);//kotak kehijuan pada belakang truk
  
    //bagian bawah ban
    //hint(DISABLE_DEPTH_TEST);
    beginShape();
    strokeWeight(0);
    vertex(524-700+kecepatan, 312, 0);
    vertex(524-700+kecepatan, 306, 0);
    vertex(701-700+kecepatan, 306, 0);
    vertex(701-700+kecepatan, 284, 0);
    vertex(817-700+kecepatan, 284, 0); //5
    vertex(817-700+kecepatan, 265, 0); //6
    vertex(1065-700+kecepatan, 265, 0); //7
    vertex(1065-700+kecepatan, 284, 0); //8
    vertex(985-700+kecepatan, 312, 0); //9
    vertex(524-700+kecepatan, 312, 0); //10
    endShape();
  
    strokeWeight(1);
    
    //hint(DISABLE_DEPTH_TEST);
  
    //kepala truk
    //hint(DISABLE_DEPTH_TEST);
    beginShape();
    vertex(940-700+kecepatan, 267);
    vertex(940-700+kecepatan, 182);
    vertex(1004-700+kecepatan, 182);
    vertex(1024-700+kecepatan, 220);
    vertex(1034-700+kecepatan, 238);
    vertex(1034-700+kecepatan, 264);
    vertex(1055-700+kecepatan, 265);
    vertex(1055-700+kecepatan, 270);
    vertex(1040-700+kecepatan, 270);
    vertex(1040-700+kecepatan, 292);
    vertex(1025-700+kecepatan, 296);
    vertex(1025-700+kecepatan, 267);
    vertex(948-700+kecepatan, 267);
    endShape();
  
    beginShape(); //bagian pintu  
    vertex(712-700+kecepatan, 284);
    vertex(712-700+kecepatan, 264);
    vertex(765-700+kecepatan, 264);
    vertex(765-700+kecepatan, 238);
    vertex(800-700+kecepatan, 238);
    vertex(800-700+kecepatan, 210);
    vertex(912-700+kecepatan, 210);
    vertex(912-700+kecepatan, 185);
    vertex(943-700+kecepatan, 185);
    vertex(943-700+kecepatan, 284);
    endShape();
    
    //bagian belakang kepala truk
    //hint(DISABLE_DEPTH_TEST);
    beginShape();  
    vertex(812-700+kecepatan, 264);
    vertex(812-700+kecepatan, 256);
    vertex(916-700+kecepatan, 256);
    vertex(916-700+kecepatan, 202);
    vertex(926-700+kecepatan, 202);
    vertex(926-700+kecepatan, 183);
    vertex(946-700+kecepatan, 183);
    vertex(946-700+kecepatan, 272);
    vertex(940-700+kecepatan, 272);
    vertex(934-700+kecepatan, 264);
    endShape();
    square(816-700+kecepatan, 206, 50);
    square(866-700+kecepatan, 206, 50);
  
    pushMatrix();
    translate(-500+kecepatan, 308);
    rotate(putaranBan);
    banmobil(0, 0);
    popMatrix();
    pushMatrix();
    translate(-435+kecepatan, 308);
    rotate(putaranBan);
    banmobil(0, 0);
    popMatrix();
  
    pushMatrix();
    translate(-115+kecepatan, 308);
    rotate(putaranBan);
    banmobil(0, 0);
    popMatrix();
  
    pushMatrix();
    translate(-45+kecepatan, 308);
    rotate(putaranBan);
    banmobil(0, 0);
    popMatrix();
  
    pushMatrix();
    translate(200+kecepatan, 308);// untuk mengatur letak titik rotasi pada ban
    rotate(putaranBan);
    banmobil(0, 0);
    popMatrix();
  
    //kotak diatas bentuk pistol  
    rect(566-700+kecepatan, 243, 45, 8);
    rect(576-700+kecepatan, 250, 25, 8);
    rect(570-700+kecepatan, 258, 35, 2);  
    square(646-700+kecepatan, 140, 80);
    //vertex seperti bentuk pistol
    strokeWeight(0);  
    //hint(DISABLE_DEPTH_TEST);
    beginShape(); //kotak penyambung antara container dan kepala truk
    vertex(479-700+kecepatan, 285);
    vertex(479-700+kecepatan, 210);
    vertex(726-700+kecepatan, 210);
    vertex(726-700+kecepatan, 225);
    vertex(668-700+kecepatan, 225);
    vertex(668-700+kecepatan, 235);
    vertex(615-700+kecepatan, 244);
    vertex(526-700+kecepatan, 244);
    vertex(510-700+kecepatan, 285);
    vertex(478-700+kecepatan, 285);
    endShape();
    //hint(ENABLE_DEPTH_TEST);
    //hint(DISABLE_DEPTH_TEST);
    pushMatrix();
    translate(-540+kecepatan, 240);
  
    strokeWeight(1);
    //rotateZ(-rotateroket);
    rotate(-rotateroket);
    cobaroket(529, -240);
    strokeWeight(1);
    rotate(-rotateroket);
    //cobaroket(120, -120);
    
    
    popMatrix();    
    //standar untuk truk  
    rect(488-700+kecepatan, 285, 6, 10);
    strokeWeight(0);
    beginShape();
    vertex(486-700+kecepatan, 295);
    vertex(496-700+kecepatan, 295);
    vertex(496-700+kecepatan, 310);
    vertex(512-700+kecepatan, 320);
    vertex(512-700+kecepatan, 322);//
    vertex(470-700+kecepatan, 322);
    vertex(470-700+kecepatan, 320);
    vertex(486-700+kecepatan, 310);
    vertex(486-700+kecepatan, 295);
    endShape();  
    rect(211-700+kecepatan, 243, 45, 25, 6);
    rect(310-700+kecepatan, 243, 45, 25, 6);
    rect(361-700+kecepatan, 246, 115, 50, 6);
    rect(481-700+kecepatan, 236, 20, 45, 6);
    rect(570-700 +kecepatan, 259, 35, 10);      
   
    popMatrix();  
  }
  
  
  // Display S400
  void display(){
    push();
    translate(Xpos, Ypos);
    scale(radians(12));
    this.s400();
    pop();
  }
  
  // Icon
  void icon(){
    push();
    translate(Xpos, Ypos, 5);
    //rotateY(radians(180));
    scale(radians(5.5));  // Truk Roket size
    fill(0);
    s400();
    pop();
  }
  
  // Movement
  void move(){
    Xpos += kecepatan;
    putaranBan += kecepatan;
    if (putaranBan >= 0) {
      audioTruckDriving.play();
    }
  }
  
  // Controller
  void controlled(){
    if(keyPressed){
      if(rotateroket > 1.5560167){
        println("Batas Rotasi");
      }    
      else{
       if(key == 'w'){
          rotateroket += 0.005;
          if (!audioHydraulic.isPlaying()) {
            audioHydraulic.play();
          }
        }    
      }
      if(rotateroket < 0){     
        
      }
      else{
        if(key == 's'){
          rotateroket -= 0.008;
          if (!audioHydraulic.isPlaying()) {
            audioHydraulic.play();
          }
        }
      }
      
      if (key == 'd'){ //jika tombol arah kanan maka truk bergerak ke depan      
        kecepatan += 10;
        putaranBan += 0.5;
        if (!audioTruckDriving.isPlaying()) {
          audioTruckDriving.play();
        }
      } else if(key == 'a'){ // jika tombol ke kiri ditekan maka truk aka beregerak ke belakang
        kecepatan -= 10;
        putaranBan -= 0.5;
        if (!audioTruckDriving.isPlaying()) {
          audioTruckDriving.play();
        }
      }
    } else {
      soundDown();
    }
  }
  
  // Event suara Ketika key dilepas
  void soundDown(){
    if (audioTruckDriving.isPlaying() || audioHydraulic.isPlaying()) {
      audioTruckDriving.stop();
      audioHydraulic.stop();
    }
  }  
}
