// The drum machine contains many buttons.
// This is the button base class that describes functionality
// that is common to all buttons.
// We never create an instance of this class. 
abstract class Button
{
  final float cornerRadius = 8.0;
  float x;
  float y;
  float w;
  float h;
  color c;
  
  boolean mouseOver;
  boolean isActive;
  
  Button(float x, float y, float w, float h, color c)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.isActive = false;
    this.mouseOver = false;
  }
  
  void display()
  {
    this.isMouseOver();
  }
  
  void isMouseOver()
  {
    if(mouseX >= this.x && mouseX <= this.x + this.w &&
      mouseY >= this.y && mouseY <= this.y + this.h)
      {
        this.mouseOver = true;
      }
      else
      {
        this.mouseOver = false;
      }
  }
}