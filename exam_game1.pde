Polygon p0, p1;
int colorIn, colorOut;
float rotAngle;
boolean selected, playerTurn = true, subNSet = false, subMove = false;
Polygon[] Hexagon = new Polygon[253];
myBackup[] mySelects = new myBackup[253];
Boat[] boats = new Boat[0];
int gameState = 0;

float[][] posCoords = {{-857.1578, -466.47113}, {-818.18665, -399.97113}, {-857.1578, -332.47113}, {-818.18665, -265.97116}, {-857.1578, -198.47115}, {-818.18665, -131.97116}, {-857.1578, -64.47116}, {-818.18665, 2.028839}, {-857.1578, 69.52887}, {-818.18665, 136.02887}, {-857.1578, 203.52881}, 
  {-779.21545, -466.47113}, {-740.2443, -399.97113}, {-779.21545, -332.47113}, {-740.2443, -265.97116}, {-779.21545, -198.47115}, {-740.2443, -131.97116}, {-779.21545, -64.47116}, {-740.2443, 2.028839}, {-779.21545, 69.52887}, {-740.2443, 136.02887}, {-779.21545, 203.52881}, 
  {-701.2732, -466.47113}, {-662.30206, -399.97113}, {-701.2732, -332.47113}, {-662.30206, -265.97116}, {-701.2732, -198.47115}, {-662.30206, -131.97116}, {-701.2732, -64.47116}, {-662.30206, 2.028839}, {-701.2732, 69.52887}, {-662.40206, 136.02887}, {-701.2732, 203.52881}, 
  {-623.33093, -466.47113}, {-584.35974, -399.97113}, {-623.33093, -332.47113}, {-584.35974, -265.97116}, {-623.33093, -198.47115}, {-584.35974, -131.97116}, {-623.33093, -64.47116}, {-584.35974, 2.028839}, {-623.33093, 69.52887}, {-584.35974, 136.02887}, {-623.33093, 203.52881}, 
  {-545.3886, -466.47113}, {-506.41748, -399.97113}, {-545.3886, -332.47113}, {-506.41748, -265.97116}, {-545.3886, -198.47115}, {-506.41784, -131.97116}, {-545.3886, -64.47116}, {-506.41784, 2.028839}, {-545.3886, 69.52887}, {-506.41784, 136.02887}, {-545.3886, 203.52881}, 
  {-467.44635, -466.47113}, {-428.47522, -399.97113}, {-467.44635, -332.47113}, {-428.47522, -265.97116}, {-467.44635, -198.47115}, {-428.47522, -131.97116}, {-467.44635, -64.47116}, {-428.47522, 2.028839}, {-467.44635, 69.52887}, {-428.47522, 136.02887}, {-467.44635, 203.52881}, 
  {-389.5041, -466.47113}, {-350.53296, -399.97113}, {-389.5041, -332.47113}, {-350.53296, -265.97116}, {-389.5041, -198.47115}, {-350.53296, -131.97116}, {-389.5041, -64.47116}, {-350.53296, 2.028839}, {-389.5041, 69.52887}, {-350.53296, 136.02887}, {-389.5041, 203.52881}, 
  {-311.56177, -466.47113}, {-272.59064, -399.97113}, {-311.56177, -332.47113}, {-272.59064, -265.97116}, {-311.56177, -198.47115}, {-272.59064, -131.97116}, {-311.56177, -64.47116}, {-272.59064, 2.028839}, {-311.56177, 69.52887}, {-272.59064, 136.02887}, {-311.56177, 203.52881}, 
  {-233.6195, -466.47113}, {-194.64838, -399.97113}, {-233.6195, -332.47113}, {-194.64838, -265.97116}, {-233.6195, -198.47115}, {-194.64838, -131.97116}, {-233.6195, -64.47116}, {-194.64838, 2.028839}, {-233.6195, 69.52887}, {-194.64838, 136.02887}, {-233.6195, 203.52881}, 
  {-155.67719, -466.47113}, {-116.706055, -399.97113}, {-155.67719, -332.47113}, {-116.706055, -265.97116}, {-155.67719, -198.47115}, {-116.706055, -131.97116}, {-155.67719, -64.47116}, {-116.706055, 2.028839}, {-155.67719, 69.52887}, {-116.706055, 136.02887}, {-155.67719, 203.52881}, 
  {-77.734985, -466.47113}, { -38.763855, -399.97113}, { -77.734985, -332.47113}, { -38.763855, -265.97116}, { -77.734985, -198.47115}, { -38.763855, -131.97116}, { -77.734985, -64.47116}, { -38.763855, 2.028839}, { -77.734985, 69.52887}, { -38.763855, 136.02887}, { -77.734985, 203.52881}, 
  {  0.20739746, -466.47113}, {  39.178528, -399.97113}, {   0.20739746, -332.47113}, {  39.178528, -265.97116}, {   0.20739746, -198.47115}, {  39.178528, -131.97116}, {   0.20739746, -64.47116}, {  39.178528, 2.028839}, {   0.20739746, 69.52887}, {  39.178528, 136.02887}, {   0.20739746, 203.52881}, 
  { 78.1496, -466.47113}, { 117.12079, -399.97113}, {  78.1496, -332.47113}, { 117.12079, -265.97116}, {  78.1496, -198.47115}, { 117.12079, -131.97116}, {  78.1496, -64.47116}, { 117.12079, 2.028839}, {  78.1496, 69.52887}, { 117.12079, 136.02887}, {  78.1496, 203.52881}, 
  {156.09198, -466.47113}, { 195.06317, -399.97113}, { 156.09198, -332.47113}, { 195.06317, -265.97116}, { 156.09198, -198.47115}, { 195.06317, -131.97116}, { 156.09198, -64.47116}, { 195.06317, 2.028839}, { 156.09198, 69.52887}, { 195.06317, 136.02887}, { 156.09198, 203.52881}, 
  {234.03424, -466.47113}, { 273.00543, -399.97113}, { 234.03424, -332.47113}, { 273.00543, -265.97116}, { 234.03424, -198.47115}, { 273.00543, -131.97116}, { 234.03424, -64.47116}, { 273.00543, 2.028839}, { 234.03424, 69.52887}, { 273.00543, 136.02887}, { 234.03424, 203.52881}, 
  {311.9765, -466.47113}, { 350.9477, -399.97113}, { 311.9765, -332.47113}, { 350.9477, -265.97116}, { 311.9765, -198.47115}, { 350.9477, -131.97116}, { 311.9765, -64.47116}, { 350.9477, 2.028839}, { 311.9765, 69.52887}, { 350.9477, 136.02887}, { 311.9765, 203.52881}, 
  {389.91876, -466.47113}, { 428.88995, -399.97113}, { 389.91876, -332.47113}, { 428.88995, -265.97116}, { 389.91876, -198.47115}, { 428.88995, -131.97116}, { 389.91876, -64.47116}, { 428.88995, 2.028839}, { 389.91876, 69.52887}, { 428.88995, 136.02887}, { 389.91876, 203.52881}, 
  {467.86102, -466.47113}, { 506.8322, -399.97113}, { 467.86102, -332.47113}, { 506.8322, -265.97116}, { 467.86102, -198.47115}, { 506.8322, -131.97116}, { 467.86102, -64.47116}, { 506.8322, 2.028839}, { 467.86102, 69.52887}, { 506.8322, 136.02887}, { 467.86102, 203.52881}, 
  {545.8034, -466.47113}, { 584.7746, -399.97113}, { 545.8034, -332.47113}, { 584.7746, -265.97116}, { 545.8034, -198.47115}, { 584.7746, -131.97116}, { 545.8034, -64.47116}, { 584.7746, 2.028839}, { 545.8034, 69.52887}, { 584.7746, 136.02887}, { 545.8034, 203.52881}, 
  {623.74567, -466.47113}, { 662.71686, -399.97113}, { 623.74567, -332.47113}, { 662.71686, -265.97116}, { 623.74567, -198.47115}, { 662.71686, -131.97116}, { 623.74567, -64.47116}, { 662.71686, 2.028839}, { 623.74567, 69.52887}, { 662.71686, 136.02887}, { 623.74567, 203.52881}, 
  {701.6878, -466.47113}, { 740.659, -399.97113}, { 701.6878, -332.47113}, { 740.659, -265.97116}, { 701.6878, -198.47115}, { 740.659, -131.97116}, { 701.6878, -64.47116}, { 740.659, 2.028839}, { 701.6878, 69.52887}, { 740.659, 136.02887}, { 701.6878, 203.52881}, 
  {779.6302, -466.47113}, { 818.6014, -399.97113}, { 779.6302, -332.47113}, { 818.6014, -265.97116}, { 779.6302, -198.47115}, { 818.6014, -131.97116}, { 779.6302, -64.47116}, { 818.6014, 2.028839}, { 779.6302, 69.52887}, { 818.6014, 136.02887}, { 779.6302, 203.52881}, 
  {857.5726, -466.47113}, { 896.54376, -399.97113}, { 857.5726, -332.47113}, { 896.54376, -265.97116}, { 857.5726, -198.47115}, { 896.54376, -131.97116}, { 857.5726, -64.47116}, { 896.54376, 2.028839}, { 857.5726, 69.52887}, { 896.54376, 136.02887}, { 857.5726, 203.52881}};

int[] CVSkill;
int[] NeighborArray;
int[] SubNeighborArray;
int[] SubArray;
int[] SubStartArray;
PImage menu, select, gameOver, ship1, ship2, ship3, victory, title;
PFont text;
PShape boat, HexS;
float boatX = posCoords[0][0]+width/2;
float boatY = posCoords[0][1]+height/2;
boolean boatSel;
boolean invalidMove = false;
int id, boatId = 23;
int rowL = 11;
int startPos;
int randSubN;
int move = 0;
int maxMove = 6;
int currMove = 0;
int EMove = 4;
int turn = 0;
int maxEnemyNeighborsVisible = 3;
int turnsEnemyVisible = 2;
int shipSelect;

enum Player {
  White, Black
};

enum Type {
  Destroyer, Minelayer, Battleship, Cruiser
};

void setup() {
  fullScreen();
  frameRate(10);
  set_Hex(true);
  text = loadFont("Courant-Bold-40.vlw");
  menu = loadImage("1.jpg");
  select = loadImage("dreamstime_16639697.jpg");
  gameOver = loadImage("sinking-ship.jpg");
  ship1 = loadImage("Light_fleet.png");
  ship2 = loadImage("Heavy_fleet.png");
  ship3 = loadImage("Carrier_fleet.png");
  victory = loadImage("1017709.jpg");
  title = loadImage("Title.png");
  cursor(CROSS);
  colorOut = color(0, 53, 255);
  colorIn = color(0, 0, 83);
  gameState = 0;

  for (int i = 0; i < Hexagon.length; i++)
  {
    Hexagon[i] = new Polygon(45f, posCoords[i][0]+width/2, posCoords[i][1]+height/2, 6, 1.5708f, i);
  }
  startPos = int(random(141, 253));
  HexS = createShape();
  HexS.beginShape();
  HexS.vertex(0, -45);
  HexS.vertex((sqrt(3)*45)/2, -22.5);
  HexS.vertex((sqrt(3)*45)/2, 22.5);
  HexS.vertex(0, 45);
  HexS.vertex(-((sqrt(3)*45)/2), -22.5);
  HexS.vertex(-((sqrt(3)*45)/2), 22.5);
  HexS.endShape(CLOSE);

  boat = createShape();
  boat.beginShape();
  boat.vertex(-20, 10);
  boat.vertex(10, 10);
  boat.vertex(20, 0);
  boat.vertex(10, -10);
  boat.vertex(-20, -10);
  boat.endShape(CLOSE);
  boatX = posCoords[0][0]+width/2;
  boatY = posCoords[0][1]+height/2;
  boatSel = false;
  Hexagon[5].selected = true;
  Hexagon[startPos].SubSelected = true;
  println(startPos);
  //translate(boatX, boatY);
  //shape(boat);
}

void draw() {
  if (gameState == 0) {
    menuScreen();
  } else if (gameState==1) {
    tutorialScreen();
  } else if (gameState == 2) {
    selectScreen();
  } else if (gameState == 3) {
    gameScreen();
  } else if (gameState == 4) {
    gameOverScreen();
  } else if (gameState == 5) {
    winScreen();
  }
}

void menuScreen() {
  gameState = 0;
  menu.resize(width, height);
  background(menu);
  title.resize(350, 0);
  image(title, width/2-150, height/2-50);
  rectMode(CENTER);
  fill(255);
  rect(width/2, height/2+200, 140, 30);
  textFont(text, 20);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("New Game", width/2, height/2+207);
  if (mouseX > width/2-60 && mouseX < width/2+60 && mouseY > height/2-215 && mouseY < height/2+215 && mousePressed) {
    gameState = 2;
  }
  if (mouseX > width/2-60 && mouseX < width/2+60 && mouseY > height/2+250 && mouseY < height/2+280 && mousePressed) {
    gameState = 1;
  }
  fill(255);
  rect(width/2, height/2+265, 140, 30);
  fill(0);
  text("How To Play", width/2, height/2+270);
}

void tutorialScreen() {
  gameState = 1;
  background(0);
  fill(255);
  rect(width/2, 900, 140, 30);
  fill(0);
  textAlign(CENTER);
  text("Return", width/2, 905);
  fill(255);
  textAlign(LEFT);
  text("How To Play:" + "\n" + "*Choose your ship carefully, each has different characteristics" + "\n" + "*Once spotted, the enemy sub will dive and only be visible by a tile close by" + "\n" + "*you can only move to a tile next to you. Once you finish moving, the enemy sub will move" + "\n" + "*click on the yellow neighbor tiles to move" + "\n" + "*the fewer turns you take, the higher you score" + "\n" + "*if you take more than 40 turns you lose, 40 is a lot so don't worry" + "\n" + "*the light blue tiles are the enemys signature, they give an aproximate location" + "\n" + "*neighbor tiles wrap around the map for both you and the enemy, this is a bug concernig how the board is generated" + "\n" + "*once you can't move any further, press 'ENTER' to end the turn" + "\n" + "*the eneny will move four tiles, in no particular direction" + "\n" + "*sometimes you move less tiles per turn, this is also a bug and it only happens sometimes" + "\n" + "\n" + "*lastly, thanks for playing this game made in approximately 4 days :)", width/20, height/10);
  if (mouseX >= width/2-60 && mouseX <= width/2+60 && mouseY >=900-15 && mouseY <= 900+15 && mousePressed) {
    delay(200);
    gameState = 0;
  }
}

void selectScreen() {
  gameState = 2;
  select.resize(width, height);
  ship1.resize(100, 100);
  ship2.resize(100, 100);
  ship3.resize(100, 100);
  imageMode(CENTER);
  background(select);
  rectMode(CENTER);
  fill(255);
  rect(width/2-400, 300, 100, 100);
  text("The fastest of the three, the destroyer can move more than twice the distance of the enemy but only has basic sonar", width/2-400, 550, 200, 300);
  image(ship1, width/2-400, 300);
  if (mouseX > width/2-450 && mouseX < width/2-350 && mouseY > 250 && mouseY < 350 && mousePressed) {
    delay(100);
    maxMove = 9;
    maxEnemyNeighborsVisible = 1;
    turnsEnemyVisible = 1;
    shipSelect = 1;
    gameState = 3;
  }
  rect(width/2, 300, 100, 100);
  image(ship2, width/2, 300);
  text("This cruiser is by far the most well rounded, boasting decent speed and an advanced sonar. This alows it to much more accurately detect the enemys position", width/2, 550, 200, 300);
  if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > 250 && mouseY < 350 && mousePressed) {
    delay(100);
    maxMove = 7;
    turnsEnemyVisible = 3;
    maxEnemyNeighborsVisible = 2;
    shipSelect = 2;
    gameState = 3;
  }
  rect(width/2+400, 300, 100, 100);
  image(ship3, width/2+400, 300);
  text("Carriers are slow, but they have access to scout planes. This proves far more effective at detecting opponents at the cost of reduced speed", width/2+400, 550, 200, 300);
  if (mouseX > width/2+350 && mouseX < width/2+450 && mouseY > 250 && mouseY < 350) {
    delay(100);
    maxMove = 5;
    turnsEnemyVisible = 2;
    maxEnemyNeighborsVisible = 3;
    shipSelect = 3;
    gameState = 3;
  }
}

void gameOverScreen() {
  gameState = 4;
  gameOver.resize(width, height);
  background(gameOver);
  fill(255);
  rectMode(CENTER);
  rect(width/2, 800, 120, 30);
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text("Main Menu", width/2, 805);
  if (mouseX >= width/2-60 && mouseX <= width/2+60 && mouseY >= 800-15 && mouseY <= 800+15 && mousePressed) {
    gameState = 0;
  }
}

void winScreen() {
  gameState = 5;
  victory.resize(width, height);
  background(victory);
  fill(255);
  rect(width/2-100, height/2-20, 140, 30);
  fill(0);
  textSize(20);
  text("Score :" + (40-turn)*100, width/2-90, height/2);
  fill(255);
  rect(width/2-100, 800, 120, 30);
  fill(0);
  text("Main Menu", width/2-95, 823);
  if (mouseX >= width/2-160 && mouseX <= width/2+160 && mouseY >= 800-15 && mouseY <= 800+15 && mousePressed) {
    gameState = 0;
  }
}

void gameScreen() {
  gameState = 3;
  background(255);
  textAlign(CENTER);
  fill(0);
  text("Turns: " + turn, width/2, 800);
  if (!invalidMove) {
    //println("removing array");

    NeighborArray = new int[0];
  }
  for (int i = 0; i < 253; i++)
  {
    // remove previous hexagon
    if (Hexagon[i].selected == true && mousePressed && mouseButton == LEFT && !invalidMove) {
      Hexagon[i].selected = false;
      Hexagon[i].draw(this);
      //println("has been removed");
    }

    // selected hexagon
    if (Hexagon[i].selected == true) {
      Hexagon[i].draw(this);
      NeighborArray = Neighbors(i);
    }

    if (Hexagon[i].SubSelected == true) {
      Hexagon[i].draw(this);
      SubNeighborArray = SubNeighbors(i);
    }

    // draw normal field
    if (Hexagon[i].selected == false) {
      Hexagon[i].draw(this);
    }

    // counter
    text(currMove, width/10, height/10);
    if (Hexagon[i].selected && Hexagon[i].SubSelected) {
      gameState = 5;
    }
  }
  PaintNeighborLoop(NeighborArray, invalidMove, CVSkill);
  SubNeighborLoop(SubNeighborArray);
  nextTurn();
  SubPos();

  if (turn >= 40) {
    gameState = 4;
  }
}

void SubPos() {
  for (int i = 0; i < 253; i++) {
    Hexagon[i].draw(this);
    SubArray = SubNeighbors(startPos);
    //println(SubArray);
  }
}

void nextTurn() {
  if (keyPressed && key == ENTER) {
    currMove = 0;
    playerTurn = false;
    subNSet = false;
    subMove = true;
    turn++;
    move = 0;
    for (int i = 0; i < 253; i++) {
      Hexagon[i].SubNeighbor = false;
    }
  }
}



class myBackup {
  boolean selected = false;
}

void set_Hex(boolean init) {
  if (init)
  {
    for (int i = 0; i < 253; i++) {
      mySelects[i] = new myBackup();
    }
  } else for (int i = 0; i < 253; i++) {
    mySelects[i].selected = Hexagon[i].selected;
  }
  if (!init) {
    for (int i = 0; i < 253; i++) {
      Hexagon[i].selected = mySelects[i].selected;
    }
  }
}

void keyPressed() {
  set_Hex(false);
  if (key == '1') {
    boatSel = !boatSel;
  }
}
