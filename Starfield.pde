//your code here
Particle[] bob;
int clicked = 5;
void setup()
{
	//your code here
	size(1280,720);
	bob = new Particle[1000];
	for(int i=0;i<bob.length;i++){
		bob[i] = new NormalParticle();
	}
	for(int i=1;i<clicked;i++){
		bob[i] = new JumboParticle();
	}
	bob[0]=new OddballParticle();
}
void draw()
{
	//your code here
	background(255,255,255);
	for(int i=0;i<bob.length;i++){
	bob[i].move();
	bob[i].show();
	}

	
}
class NormalParticle implements Particle
{
	//your code here
	double myX,myY,mySpeed, myAngle;

	int killMe;
	NormalParticle()
	{
		myX=(int)(Math.random()*width);
		myY=(int)(Math.random()*height);
		myAngle=Math.atan2(myY-(height/2),myX-(width/2));
		killMe = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=3;
	}
	public void show(){
		fill(killMe);
		ellipse((float)myX,(float)myY,10,10);
	}
	public void move(){
		myX+= Math.cos(myAngle)* mySpeed;
		myY+= Math.sin(myAngle)* mySpeed;
		if(myX<0 || myX>width || myY<0 || myY>height){
			myX=(Math.random()*20)+((width/2)-10);
			myY=(Math.random()*20)+((height/2)-10);
		}
	}
}
interface Particle
{
	//your code here
	public void show();
	public void move();
}
class OddballParticle implements Particle //uses an interface
{

	//your code here
	double theX,theY,theSpeed, theAngle;

	
	OddballParticle(){
		theX=(Math.random()*width);
		theY=(Math.random()*height);
		theSpeed=0;
		theAngle=0;
	}
	public void move(){

	}
	public void show(){
		fill(0,0,0);
		rect((float)theX,(float)theY,40,40);
	}

}
class JumboParticle extends NormalParticle  //uses inheritance
{
	//your code here
	public void show(){
		ellipse((float)myX,(float)myY,30,30);
	}
}


