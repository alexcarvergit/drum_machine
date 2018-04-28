class StopButton extends Button
{
  color controlColor;
  StopButton(float x, float y)
  {
    super(x, y, 50, 50, color(200));
    disable();
  }
  
  void display()
  {
    super.display();
    
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    fill(this.controlColor);
    rect(this.x + 10, this.y + 10, this.w - 20, this.h - 20);
  }
  
  void enable()
  {
    this.controlColor = color(255, 0, 0);
  }
  
  void disable()
  {
    this.controlColor = color(100, 0, 0);
  }
}