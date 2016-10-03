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
	bob[0]=new OddballParticle(width/2, height/2);
	bob[1]=new OddballParticle(width/2,height/2);
}
void draw()
{
	//your code here
	background(255,255,255);
	for(int i=0;i<bob.length;i++){
	bob[i].move();
	bob[i].show();
	if(mousePressed)
			bob[i].speed();
	else
			bob[i].slow();
	}
}

	

class NormalParticle implements Particle
{
	//your code here
	double myX,myY,mySpeed,myAngle;

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
			myX=(int)(Math.random()*80)+((width/2)-40);
			myY=(int)(Math.random()*80)+((height/2)-40);
			myAngle=Math.atan2(myY-(height/2),myX-(width/2));
		
		}

	}
	public void speed(){
		mySpeed=30;
		mySpeed+=3;
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
	int myCentX,myCentY;


	
	OddballParticle(int x, int y){
		myX=(Math.random()*width);
		myY=(Math.random()*height);
		mySpeed=2;
		myCentX=x;
		myCentY=y;
		myAngle=Math.atan2(myY-(myCentY),myX-(myCentX));
		myRadius=Math.sqrt( ((myX-myCentX)*(myX-myCentX)) + ((myY-myCentY)*(myY-myCentY)));
	}
	public void move(){
		myAngle-=Math.PI/36;
		myX=Math.cos(myAngle)*myRadius+myCentX;
		myY=Math.sin(myAngle)*myRadius+myCentY;
	}
	public void show(){
		fill(0,0,0);
		rect((float)myX,(float)myY,40,40);
	}
	public void speed(){
		myCentX=mouseX;
		myCentY=mouseY;
	}
	public void slow(){

	}

}
class JumboParticle extends NormalParticle  //uses inheritance
{
	//your code here
	public void show(){
		fill(killMe);
		ellipse((float)myX,(float)myY,30,30);
	}
}


