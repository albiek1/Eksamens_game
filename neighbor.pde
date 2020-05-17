int[] Neighbors(int index){
  int n1, n2, n3, n4, n5, n6;
  
  if(isOdd(index) == true){
    n1 = index-1;
    n2 = index+rowL+1;
    n3 = index-rowL;
    n4 = index+rowL;
    n5 = index+1;
    n6 = index+rowL-1;
  }else{
  n1 = index-1;
  n2 = index-rowL-1;
  n3 = index-rowL;
  n4 = index+rowL;
  n5 = index+1;
  n6 = index-rowL+1;
  }
  int[] NeighborsArray = {n1, n2, n3, n4, n5, n6};
  return NeighborsArray;
}

int[] SubNeighbors(int SubIndex){
  int s1, s2, s3, s4, s5, s6, s7;
  if(isOdd(SubIndex) == true){
    s1 = SubIndex-1;
    s2 = SubIndex+rowL+1;
    s3 = SubIndex-rowL;
    s4 = SubIndex+rowL;
    s5 = SubIndex+1;
    s6 = SubIndex+rowL-1;
    s7 = SubIndex;
  }else{
    s1 = SubIndex-1;
    s2 = SubIndex-rowL-1;
    s3 = SubIndex-rowL;
    s4 = SubIndex+rowL;
    s5 = SubIndex+1;
    s6 = SubIndex-rowL+1;
    s7 = SubIndex;
  }
  int[] SubNeighborArray = {s1, s2, s3, s4, s5, s6, s7};
  return SubNeighborArray;
}

int[] CVreveal(int index){
  int c1, c2, c3, c4, c5, c6, c7, c8, c9;
  if(isOdd(index)==true){
    c1 = index+rowL;
    c2 = index+rowL-1;
    c3 = index+rowL+1;
    c4 = index+(2*rowL)-1;
    c5 = index+(2*rowL);
    c6 = index+(2*rowL)+1;
    c7 = index+(3*rowL);
    c8 = index+(3*rowL)-1;
    c9 = index+(3*rowL)+1;
  }
  c1 = index+rowL;
  c2 = index+rowL-1;
  c3 = index+rowL+1;
  c4 = index+(2*rowL)-1;
  c5 = index+(2*rowL);
  c6 = index+(2*rowL)+1;
  c7 = index+(3*rowL);
  c8 = index+(3*rowL)-1;
  c9 = index+(3*rowL)+1;
  int[] CVSkill = {c1, c2, c3, c4, c5, c6, c7, c8, c9};
  return CVSkill;
}

void PaintNeighborLoop(int[] Neighbor, boolean invalidMove, int[] reveal){
  for(int i = 0; i < 253; i++){

    //  loop through all hexagons and find a match with neighbor
    for(int k = 0; k < Neighbor.length; k++){
      if(i == k && Neighbor[k] < 253 && Neighbor[k] >= 0){
       Hexagon[Neighbor[k]].Neighbor = true;
       //println(Neighbor[k]);
      }
    }
    
    if(keyPressed && key == ' '){
      if(Hexagon[i].selected == true){
        CVSkill = CVreveal(i);
        Hexagon[CVSkill[i]].revealed = true;
      }
    }
    
    // selected hexagon
      if (Hexagon[i].selected == true){
        Hexagon[i].draw(this);
        NeighborArray = Neighbors(i);
      }
    
    // call draw neighbor
    if (Hexagon[i].Neighbor == true){
      Hexagon[i].draw(this);
    }
    
    // deselect neighbor
    if(Hexagon[i].Neighbor == true && Hexagon[i].selected == false && mousePressed && !invalidMove){
      Hexagon[i].Neighbor = false;
    }
  }
}

void SubNeighborLoop(int[] SubNeighbor){
  int[] visibleSubNeighbors = new int[maxEnemyNeighborsVisible];
  for(int i = 0; i < 253; i++){
    for(int k = 0; k < SubNeighbor.length; k++){
      if(i == k && SubNeighbor[k] < 252 && SubNeighbor[k] >= 0){
        if(subNSet == false){
          for(int o = 0; o < 253; o++){
            Hexagon[o].SubNeighbor = false;
          }
          for(int j = 0; j < maxEnemyNeighborsVisible; j++){
            randSubN = int(random(SubNeighbor.length));
            for(int l = 0; l < visibleSubNeighbors.length; l++){
              visibleSubNeighbors[j] = SubNeighbor[randSubN];
              if(visibleSubNeighbors[j] == SubNeighbor[randSubN] || visibleSubNeighbors[j] < 0){
                visibleSubNeighbors[j] = SubNeighbor[randSubN];
              }
            }
            //println(visibleSubNeighbors);
            Hexagon[constrain(visibleSubNeighbors[j], 0, 252)].SubNeighbor = true;
            }
            subNSet = true;
           //Hexagon[constrain(SubNeighbor[randSubN], 0, 253)].SubNeighbor = true;
         }
        }
      }
      //for(int j = 0; j < visibleSubNeighbors.length; j++){
      //if(Hexagon[i].SubNeighbor == true && i != visibleSubNeighbors[j]){
      //  Hexagon[i].SubNeighbor = false;
      //}
      //}
    if(subMove == true){
       int temp = constrain(SubNeighbor[int(random(SubNeighbor.length))], 0, 252);
       if(i != temp && Hexagon[i].SubSelected == true){
          Hexagon[temp].SubSelected = true;
          Hexagon[i].SubSelected = false;
          println(i);
          //Hexagon[i].SubNeighbor = false;
          move++;
          if(move == EMove){
         subMove = false;
          }
      }
    }
  }
}
