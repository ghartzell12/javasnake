// Initalizes Array Lists: x = x coordinates, y = y coordinates, scores = all scores
ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();
ScoreList<Integer> scores = new ArrayList<Integer>();

// Initalizing variables
// w = frame width, h = frame height, blocks = size of cell
int w = 30;
int h = 30;
int blocks = 20;

// foodx = food x coordinate, foody = food y coordinate, r, g, b, are food colors
foodx = 15;
foody = 15;
int r = 0;
int g = 0;
int b = 255;

// direction = initial direction (right) and speed = initial speed (0.125 blocks per frame)
int direction = 2;
float speed = 8;

// Array for directions for keys
int[] x_direction = {0,0,1,-1};
int[] y_direction = {1,-1,0,0};

// Boolean for end of game
boolean die = false;

// Frame set with size, snake starts at (0,15)
void setup(){
size(600,600);
x.add(0);
y.add(15);
}

void draw(){
// Creates background color and snake
background(0);
fill(255,223,0);
for(int i = 0; i <x.size(); i++){
rect(x.get(i)*blocks,y.get(i)*blocks,blocks,blocks);
}

// While the snake is alive
if(die == false){

// Creates food
fill(r,g,b);
ellipse(foodx*blocks+10,foody*blocks+10,blocks,blocks);

// Creates Scoreboard
textAlign(LEFT);
textSize(25);
fill(255,223,0);
text("Score: " + (x.size()-1), 10, 10, width-20, 50);

// For every 'speed' frames,
if(frameCount%speed == 0){

// Move x and y in cell in the right direction
x.add(0, x.get(0) + x_direction[direction]);
y.add(0, y.get(0) + y_direction[direction]);

// If snake overlaps, it dies
for(int i = 1; i < x.size(); i++){
if(x.get(0) == x.get(i) && y.get(0) == y.get(i)){
die = true;
}
}

// If snake hits border, it dies
if(x.get(0)>=w || x.get(0) < 0 || y.get(0) < 0 || y.get(0) >= h){
die = true;
}

// If the snake eats food
if(x.get(0) == foodx && y.get(0) == foody){

// Make new food with random color
foodx = (int)random(0,w);
foody = (int)random(0,h);
r = (int)random(0,255);
g = (int)random(0,255);
b = (int)random(0,255);
}

// Keep the snake moving
else{
x.remove(x.size()-1);
y.remove(y.size()-1);
}

// Increment speed
if(x.size() % 4 == 0 && speed >= 2){
speed-= 0.25;
}
}
}

// After the snake dies
if(die == true){

// Add score to scores, find high score
scores.add(x.size()-1);
max = scores.get(0);
for(int a : scores){
if(a > max){
max = a;
}
}

// Create end of game text
fill(255,223,0);
textSize(25);
textAlign(CENTER);
text("Game Over \n Score: " + (x.size()-1) + " \nHigh Score: " + max + " \nPress ENTER to play again!",width/2,height/4);

// If they ant to play again, reset the game
if(keyCode == ENTER){
x.clear();
y.clear();
x.add(0);
y.add(15);
die = false;
speed = 8;
direction =2;
}
}
}

// Key Pressed: Changes direction based on key pressed
void keyPressed(){
if( keyCode == DOWN){
direction = 0;
}
else if(keyCode == UP){
direction = 1;
}
else if(keyCode == RIGHT){
direction = 2;
}
else if(keyCode == LEFT){
direction = 3;
}
}



	
