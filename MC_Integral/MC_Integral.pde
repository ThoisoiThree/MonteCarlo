// f(x) = ax^2 + bx + c
// y = a * pow(x, 2) + b*x + c;

float samples  = 1024 * 500;

// variables def
 float x = 0;
 float y = 0;

 float a = 3;
 float b = 2;
 float c = 5;

// limits def
 float minX = 0;
 float maxX = 2;
 float minY = 0;
 float maxY = 23;

// solving cycle 
 float counter = 0;
 float ok = 0;
 float notOk = 0;
 float sameSp = 0;

 while (counter < samples)
 {   
    counter = counter + 1;
    // value generation
    x = random(minX, maxX);
    y = random(minY, maxY);

    float actY = a * pow(x, 2) + b*x + c;

    // checking
    if (y < actY){
        ok = ok + 1;
    }
    if (y > actY){
        notOk = notOk + 1;
    }
    if (y == actY){
        sameSp = sameSp + 1;
    }
 }

// math part
 float totalSP = ok + notOk + sameSp;

 float integral = (maxX * maxY * ok) / totalSP;

// output
 println("ok samples =", ok);
 println("notOk samples =", notOk);
 println("same samples =", sameSp);
 println("total samples =", totalSP);
 println("integral of f(x) =", integral);
