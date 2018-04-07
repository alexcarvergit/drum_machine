import processing.sound.*;

SampleButton sb1;
SampleButton sb2;
SampleButton sb3;
SampleButton sb4;

DrumMachine dm;

void setup() 
{
  size(1000, 500);
  background(0);
  
  final int bpm = 100;
  final int numSteps = 4;
  dm = new DrumMachine(bpm, numSteps);
  
  SoundFile kick = new SoundFile(this, "808kick.aif");
  //sb1 = new SampleButton(10, 10, 90, 45, "kick", kick);
  dm.addSample("kick", kick);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  //sb2 = new SampleButton(10, 50 + sb1.y, 90, 45, "snare", snare);
  dm.addSample("snare", snare);
  
  SoundFile crash = new SoundFile(this, "crash.wav");
  //sb3 = new SampleButton(10, 50 + sb2.y, 90, 45, "crash", crash);
  dm.addSample("crash", crash);
  
  SoundFile openhat = new SoundFile(this, "openhat.wav");
  //sb4 = new SampleButton(10, 50 + sb3.y, 90, 45, "openhat", openhat);
  dm.addSample("openhat", openhat);
}

void draw()
{
  background(255);
  sb1.display();
  sb2.display();
  sb3.display();
  sb4.display();
}

// Handle user interaction via the mouse.
void mouseClicked()
{
  if(sb1.mouseOver)
  {
    sb1.play();
  }
  else if(sb2.mouseOver)
  {
    sb2.play();
  }
  else if(sb3.mouseOver)
  {
    sb3.play();
  }
}

// Handle user interaction via the keyboard.
void keyPressed()
{
  switch(keyCode)
  {
    case '1':
      sb1.play();
      break;
    case '2':
      sb2.play();
      break;
    case '3':
      sb3.play();
      break;
    case '4':
      sb4.play();
      break;
  }
}