class DrumMachine
{
  final float x = 10;
  final float samplesStartY = 100;
  final float sampleButtonHeight = 50;
  
  int bpm;
  int numSteps;
  int step;
  ArrayList<SampleButton> samples;
  
  DrumMachine(int bpm, int numSteps)
  {
    this.bpm = bpm;
    this.numSteps = numSteps;
    this.samples = new ArrayList<SampleButton>();
    this.step = 0;
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
    
  }
}