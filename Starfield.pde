//your code here
Particle[] bob;
int clicked = 6;
void setup()
{
	//your code here
	size(1280,720);
	bob = new Particle[1000];
	for(int i=0;i<bob.length;i++){
		bob[i] = new NormalParticle();
	}
	for(int i=2;i<clicked;i++){
		bob[i] = new JumboParticle();
	}
	bob[0]=new OddballParticle(width/2,height/2,0);
	bob[1]=new OddballParticle(((OddballParticle)bob[0]).myX,((OddballParticle)bob[0]).myY,0);
}
void draw()
{
	//your code here
	background(255,255,255);
	for(int i=0;i<bob.length;i++){
	bob[i].move();
	bob[i].show();
	if(mousePressed){
			bob[i].speed();
			((OddballParticle)bob[0]).myCentX=mouseX;
			((OddballParticle)bob[0]).myCentY=mouseY;

	}else{	
			bob[i].slow();
		}
	}
}

	

class NormalParticle implements Particle
{
	//your code here
	double myX,myY,mySpeed,myAngle;

	int killMe;
	int opacity=30;
	NormalParticle()
	{
		myX=(int)(Math.random()*width);
		myY=(int)(Math.random()*height);
		myAngle=Math.atan2(myY-(height/2),myX-(width/2));
		killMe = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=3;
	}
	public void show(){
		fill(killMe,opacity);
		noStroke();
		ellipse((float)myX,(float)myY,10,10);
	}
	public void move(){
		mySpeed++;
		myX+= Math.cos(myAngle)* mySpeed;
		myY+= Math.sin(myAngle)* mySpeed;
		opacity+=2;
		if(keyPressed)
			myAngle+=Math.PI/128;
		else
			myAngle=Math.atan2(myY-(height/2),myX-(width/2));
		if(myX<0 || myX>width || myY<0 || myY>height){
				opacity=10;
				myX=(Math.random()*80)+((width/2)-40);
				myY=(Math.random()*80)+((height/2)-40);
				myAngle=Math.atan2(myY-(height/2),myX-(width/2));
		}
	}
	public void speed(){
		mySpeed=40;
		opacity+=20;
	}
	public void slow(){
		mySpeed=3;
	}
}
interface Particle
{
	//your code here
	public void show();
	public void move();
	public void speed();
	public void slow();
}
class OddballParticle implements Particle  //uses an interface
{

	//your code here
	double myX,myY,mySpeed, myAngle, myRadius;
	double myCentX,myCentY;
	int greyscale;


	
	OddballParticle(double x, double y, int z){
		myX=(Math.random()*width);
		myY=(Math.random()*height);
		mySpeed=2;
		myCentX=x;
		myCentY=y;
		greyscale = (int)(Math.random()*255);
		myAngle=Math.atan2(myY-(myCentY),myX-(myCentX));
		if(z>0)
				myRadius=z;
			else
				myRadius=Math.sqrt( ((myX-myCentX)*(myX-myCentX)) + ((myY-myCentY)*(myY-myCentY)));
	}
	public void move(){
		myAngle+=Math.PI/72;
		myX=Math.cos(myAngle)*myRadius+myCentX;
		myY=Math.sin(myAngle)*myRadius+myCentY;
	}
	public void show(){
		fill(greyscale);
		rect((float)myX,(float)myY,40,40);
		fill(255,0,0);
		point((float)myCentX,(float)myCentY);
	}
	public void speed(){
	
	}
	public void slow(){

	}

}
class JumboParticle extends NormalParticle  //uses inheritance
{
	//your code here
	public void show(){
		fill(killMe,opacity);
		ellipse((float)myX,(float)myY,30,30);
	}
}


