class DrumMachine
{
  final float x = 10;
  final float samplesStartY = 100;
  final float sampleButtonHeight = 50;
  final float tempoWidth = 75;
  
  int bpm;
  int bpmLowerLimit = 40;
  int bpmUpperLimit = 250;
  int numSteps;
  int step;
  ArrayList<SampleButton> samples;
  PlayButton playButton;
  StopButton stopButton;
  boolean isPlaying;
  
  DrumMachine(int bpm, int numSteps)
  {
    this.bpm = bpm;
    this.numSteps = numSteps;
    this.samples = new ArrayList<SampleButton>();
    this.step = 0;
    this.playButton = new PlayButton(this.x + this.tempoWidth, 10);
    this.stopButton = new StopButton(this.x + this.tempoWidth + this.playButton.w + 10, 10);
    this.setTempo();
  }
  
  void setTempo()
  {
    float sixteenthNotesPerSecond = (float)this.bpm / 60 * 4;
    frameRate(sixteenthNotesPerSecond);
  }
  
  void addSample(String name, SoundFile sf)
  {
    int numSamples = this.samples.size();
    float yPos = this.samplesStartY + (this.sampleButtonHeight * numSamples);
    SampleButton sample = new SampleButton(this.x, yPos, 95, 45, name, sf);
    this.samples.add(sample);
  }
  
  void display()
  {
    fill(0);
    text(this.bpm + " bpm", x + 10, 40);
    
    this.playButton.display();
    this.stopButton.display();
    
    for (SampleButton sb : this.samples)
    {
      sb.display();
    }
  }
  
  void playSequencer()
  {
    if(this.isPlaying)
    {
      int currentStep = this.step % this.numSteps;
      if(currentStep == 0)
      {
        this.samples.get(0).play();
      }
      else if(currentStep == 2)
      {
        this.samples.get(1).play();
      }
      else if(currentStep == 3)
      {
        this.samples.get(1).play();
      }
      else if(currentStep == 4)
      {
        this.samples.get(0).play();
      }
      else if(currentStep == 6)
      {
        this.samples.get(2).play();
      }
      
      step++;
    }
  }
  
  void start()
  {
    this.isPlaying = true;
    this.playButton.disable();
    this.stopButton.enable();
    this.setTempo();
  }
  
  void stop()
  {
    this.isPlaying = false;
    this.step = 0;
    this.stopButton.disable();
    this.playButton.enable();
    frameRate(20);
  }
  
  void handleClick()
  {
    if(this.playButton.mouseOver)
    {
      this.start();
    }
    else if(this.stopButton.mouseOver)
    {
      this.stop();
    }
    else
    {
      for(SampleButton sb : this.samples)
      {
        sb.handleClick();
      }
    }
  }
  
  void handleKey(int keyCode)
  {
    switch(keyCode) {
      case UP:
        if(bpm < bpmUpperLimit)
        {
          this.bpm++;
          this.setTempo();
        }
        break;
      case DOWN:
        if(bpm > bpmLowerLimit)
        {
          this.bpm--;
          this.setTempo();
        }
        break;
      case ' ':
        if(!this.isPlaying)
        {
          this.start();
        }
        else
        {
          this.stop();
        }
        break;
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        int sampleNumber = keyCode - 49;
        if(this.samples.size() > sampleNumber)
        {
          SampleButton sb = this.samples.get(sampleNumber);
          sb.play();
        }
        break;
    }
  }
}