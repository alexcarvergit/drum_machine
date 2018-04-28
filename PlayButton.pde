class PlayButton extends Button
{
  color controlColor;
  PlayButton(float x, float y)
  {
    super(x, y, 50, 50, color(200));
    enable();
  }
  
  void display()
  {
    super.display();
    
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    fill(this.controlColor);
    triangle(this.x + 10, this.y + 10, this.x + this.w - 10, this.y + (this.h / 2), this.x + 10, this.h + this.y - 10);
  }
  
  void enable()
  {
    this.controlColor = color(0, 255, 0);
  }
  
  void disable()
  {
    this.controlColor = color(0, 75, 0);
  }
}