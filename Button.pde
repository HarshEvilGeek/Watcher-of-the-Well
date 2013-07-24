
class Button
{ 
  PVector pos;
  PVector extents;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(int x, int y, int w, int h)
  {
    
    pos = new PVector(x, y);
    extents = new PVector (w, h);
  }
  
  void setImage(PImage img)
  {
    currentImage=img;
  }
  
  void display()
  {
    if(currentImage != null)
    {
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(0,0,0,0);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
      noTint();
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (mouseX > pos.x && mouseX < pos.x+extents.x && mouseY > pos.y && mouseY < pos.y+extents.y)
      return true;
    else
      return false;
  }
  
  
}




