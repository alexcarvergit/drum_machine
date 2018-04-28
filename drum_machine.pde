import processing.sound.*;

DrumMachine dm;

void setup() 
{
  size(1000, 500);
  background(0);
  
  final int bpm = 100;
  final int numSteps = 8;
  dm = new DrumMachine(bpm, numSteps);
  
  SoundFile kick = new SoundFile(this, "808kick.aif");
  dm.addSample("kick", kick);
  
  SoundFile snare = new SoundFile(this, "808snare1.aif");
  snare.amp(.9);
  dm.addSample("snare", snare);
  
  SoundFile crash = new SoundFile(this, "crash.wav");
  dm.addSample("crash", crash);
  
  SoundFile openhat = new SoundFile(this, "openhat.wav");
  dm.addSample("openhat", openhat);
}

void draw()
{
  background(255);
  
  dm.display();

  dm.playSequencer();
}

// Handle user interaction via the mouse.
void mouseClicked()
{
  dm.handleClick();
}

// Handle user interaction via the keyboard.
void keyPressed()
{
  dm.handleKey(keyCode);
}