// The sample button class.
class SampleButton extends Button
{
  String label;
  SoundFile file;
  
  SampleButton(float x, float y, float w, float h, String label, SoundFile file)
  {
    super(x, y, w, h, color(100));
    this.label = label;
    this.file = file;
  }
  
  void display()
  {
    super.display();
    
    if(this.isActive)
    {
      this.c = color(255);
    }
    else if(this.mouseOver)
    {
      this.c = color(0, 122, 153);
    }
    else
    {
      this.c = color(0, 204, 255);
    }
    
    fill(this.c);
    rect(this.x, this.y, this.w, this.h, this.cornerRadius);
    
    fill(240);
    text(this.label, this.x + 5, this.y + 15);
    
    this.isActive = false;
  }
  
  void play()
  {
    this.isActive = true;
    this.file.play();
  }
  
  void handleClick()
  {
    if(this.mouseOver)
    {
      this.play();
    }
  }
}