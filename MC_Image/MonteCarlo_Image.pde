/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */

PImage img;  // Declare variable "a" of type PImage


size(1132, 1200);
colorMode(RGB, 1.0);
  
img = loadImage("processed.jpg");    



image(img, 0, 0);
loadPixels();
float iterations = 1024;
float count_true = 0;
float count_false = 0;
float count_miss = 0;

for (int iter_count = 0; iter_count < iterations; iter_count++) {
  
int rand = int(random(0, 1132*1200));

if ((pixels[rand] != color(0,0,0)) && (pixels[rand] != color(0,0,1))){

if ((pixels[rand] < color(0.9,1,1)) || (pixels[rand] < color(1,0.9,1)) || (pixels[rand] < color(1,1,0.9))){
pixels[rand] = color(0,0,0);
count_true = count_true + 1;}else{
   pixels[rand] = color(0,0,1);
   count_false = count_false+1;
   }
 }else{
  pixels[rand] =pixels[rand];
  count_miss = count_miss +1;
  }
}

println("false samples:", count_false);
println("true samples:", count_true);
println("missed samples:", count_miss);
println("missed samples ratio:", (count_miss/iterations)*100, "%");

float S1 = 11.32*12.00*4;
float S2;
float Pix1 = count_false + count_true;
float Pix2 = count_true;

S2 = (Pix2*S1)/Pix1;
println("S = ",S2);

updatePixels();
