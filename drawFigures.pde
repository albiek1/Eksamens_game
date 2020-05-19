public class Polygon {
  float rad, rot, x, y;
  int verts, id;
  float[] vx, vy;
  boolean selected = false;
  boolean Neighbor = false;
  boolean SubSelected = false;
  boolean SubNeighbor = false;
  boolean revealed = false;

  Polygon(float inRad, float inX, float inY, int inVe, float inRo, int id) {
    rad = inRad;
    rot = inRo;
    x = inX;
    y = inY;
    this.id = id;
    verts = inVe;
    vx = new float[verts];
    vy = new float[verts];
    float deltaAngle = TWO_PI/verts;
    for (int i = 0; i < verts; i++) {
      vx[i] = rad * cos(deltaAngle * i);
      vy[i] = rad * sin(deltaAngle * i);
    }
  }

  public void changeRotAngle(float deltaAngle) {
    rot += deltaAngle;
  }

  public void draw(PApplet app) {
    app.pushStyle();
    app.pushMatrix();
    app.translate(x, y);
    app.rotate(rot);
    
    // paint selected
    if(selected){
      app.fill(colorIn);
    }
    else if(Neighbor && !selected && !SubNeighbor){
       // paint neighbor
       fill(255, 255, 0);
    } else if(SubNeighbor && !selected){
      fill(0, 155, 180);
    } else if(SubSelected && (turn < turnsEnemyVisible || revealed == true)){
      fill(255, 0, 0);
    }
    else{
      // paint other hexagons
      fill(colorOut);
    }
    //app.fill(fillCol);
    
    
    app.noStroke();       
    app.beginShape(TRIANGLE_FAN);
    app.vertex(0, 0);
    for (int i = 0; i < verts; i++)
      app.vertex(vx[i], vy[i]);
    app.vertex(vx[0], vy[0]);
    app.endShape();
    stroke(5);
    beginShape();
    for(int i = 0; i < verts; i++){
      vertex(vx[i], vy[i]);
    }
    endShape(CLOSE);
    app.popStyle();
    app.popMatrix();
    fill(0);
    //text(id, x, y);
    sel();
  }
  
  void sel(){
    if(isInside(mouseX, mouseY)){
      // hexagon is clicked
      if(mousePressed && mouseButton == LEFT){
        
      //println("i am here");
        if(!selected && Neighbor   && currMove < maxMove ){
          // non selected hexagon is clicked
          selected = true;
          currMove++;
          invalidMove = false;
          //println("move is good!");
          }
          else if(!Neighbor || currMove >= maxMove)
          {
            // invalid move
            //println("invalidMove!");
            invalidMove = true;
          }
        }
      
      // right click
        if( selected &&  mousePressed && mouseButton == RIGHT) 
          {
            // selected hexagon is right clicked
            selected = false;
          }
        }
  }

  public boolean isInside(float px, float py) {
    px -= x;
    py -= y;
    float sinA = sin(-rot);
    float cosA = cos(-rot);
    float cpx = px * cosA - py * sinA;
    float cpy = px * sinA + py * cosA;
    for (int i = 0; i < verts -1; i++) {
      if (linesIntersect(cpx, cpy, 0, 0, vx[i], vy[i], vx[i+1], vy[i+1]))
        return false;
    }
    if (linesIntersect(cpx, cpy, 0, 0, vx[verts-1], vy[verts-1], vx[0], vy[0]))
      return false;
    return true;
  }

  // See if the lines ab and cd intersect
  private boolean linesIntersect(float aX, float aY, float bX, float bY,
                                 float cX, float cY, float dX, float dY)  {
    float rTop = (aY-cY)*(dX-cX)-(aX-cX)*(dY-cY);
    float sTop = (aY-cY)*(bX-aX)-(aX-cX)*(bY-aY);
    float bot = (bX-aX)*(dY-cY)-(bY-aY)*(dX-cX);
    if (bot == 0) // parallel therefor do not intersect
      return false;
    float invBot = 1.0f/bot;
    float r = rTop * invBot;
    float s = sTop * invBot;
    if ( (r > 0) && (r < 1) && (s > 0) && (s < 1) )
      return true;
    return false;
  }
}
