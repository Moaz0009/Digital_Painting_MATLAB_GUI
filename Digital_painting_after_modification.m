%*****************code explanation****************************************
%*************************************************************************
%we import the image from the pc
%the program filters colors out from this image(by keeping the wanted color
%only and turning other colors to white ) and saves them (colors)
%in diffrent variables(with the color name) and then transfer each image
%(which is containing a specific color if it exist if not it will be white) 
%into gray and then to a binary matrix
%(with ones for white and zeros for black) and takes
%this matrix to check if there is any zeros inside of it if there is more
%than 5 black pixels(which was originaly the color it self) the robot 
% switch tabs to open the drawing program to be the current tab and then 
%the image enters the drawing loop wich first choose the color by moving
%the mouse to the color position
%(with x&y coordinates already predefined based on my pc) 
%and presses the mouse and then releases it to choose the color
%and then moves the mouse to the starting position (which is also predefiend )
%to start drawing and press the mouse each time there is a black pixel 
%(this will appear in the drawing program as the wanted color)
%after finishing checking and drawing the first color the same sequence
%will happen to each color and if it does exist in the image it will be
%drawn if not the program will skip it and move to the next color
%*************************************************************************

% importing robot library
import java.awt.Robot
import java.awt.event.*
%intializing the robot
robot=Robot();
robot.delay(500);
%colors x&y coordinates 
bl=[938 57];
rd=[828 57];
blk=[760 58];
yelw=[873 59];
gr=[893 59];
pr=[998 57];
%browsing for the image in the pc
[filename,pathname]=uigetfile('*.*','File selector');
name=strcat(pathname,filename);
%reading the image
x=imread(name);
imshow(x)
%resize the image for faster image analysis
x=imresize(x,0.5);
%saving a copy of the picture to filter each color out
red=x;
blue=x;
yellow=x;
black=x;
green=x;
orange=x;
purble=x;
%starting position for drawing
start=[345 157];

% filtering red color
  for a=1:size(x,1)
     for b=1:size(x,2)
            if ( x(a,b,1)<193 || x(a,b,2)>51 || x(a,b,3)> 46)
             gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
          red(a,b,:)=[gris,gris,gris];
            end
     end
  end  

 % filtering yellow color
 for a=1:size(x,1)
      for b=1:size(x,2)
         if ( x(a,b,1)<160|| x(a,b,2)<140 || x(a,b,3)>150 )
            gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
             yellow(a,b,:)=[gris,gris,gris];
         end
      end
 end
 % filtering orange color
for a=1:size(x,1)
for b=1:size(x,2)
         if ( x(a,b,1)<160|| x(a,b,2)<140 || x(a,b,3)>150 )
            gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
            orange(a,b,:)=[gris,gris,gris];
         end
       end
  end
 % filtering black color
 for a=1:size(x,1)
      for b=1:size(x,2)
         if ( x(a,b,1)>0 || x(a,b,2)>0 || x(a,b,3)>0 )
            gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
            black(a,b,:)=[gris,gris,gris];
         end
      end
 end
 % filtering purple color
 for a=1:size(x,1)
     for b=1:size(x,2)
            if ( x(a,b,1)>128 || x(a,b,2)>0|| x(a,b,3)<255)
         gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
purble(a,b,:)=[gris,gris,gris];
           end
end
  end 
 % filtering green color
 for a=1:size(x,1)
     for b=1:size(x,2)
            if ( x(a,b,1)>110 || x(a,b,2)<110|| x(a,b,3)>90)
             gris = 255,299*x(a,b,1) +255,587*x(a,b,2) +0,114*x(a,b,3);
          green(a,b,:)=[gris,gris,gris];
            end
     end
 end  
 % filtering blue color
 for a=1:size(x,1)
     for b=1:size(x,2)
if ( x(a,b,1)>90 || x(a,b,2)<30 || x(a,b,3)>200 )
             gris = 255,299*x(a,b,1) +255,587 * x(a,b,2) +255,114*x(a,b,3);
             blue(a,b,:)=[gris,gris,gris];
         end
      end
 end
%converting each image to gray first and then to binary
img1= im2bw (rgb2gray(red),0.5);
img2= im2bw (rgb2gray(yellow),0.73119895);
img3= im2bw (rgb2gray(black),0.5);
img4= im2bw(rgb2gray(green),0.5);
img5= im2bw(rgb2gray(blue),0.5);
img6= im2bw(rgb2gray(purble),0.5);
%switch tabs to open the paint program tab
robot.keyPress(KeyEvent.VK_ALT);
robot.keyPress(KeyEvent.VK_TAB);
robot.keyRelease(KeyEvent.VK_ALT);
robot.keyRelease(KeyEvent.VK_TAB);

% check & paint (red)
r=0;
%check if there is any black pixels to draw
for i=1:size(img1,1)
for j=1:size(img1,2)
if (img1(i,j)==0)
   r=r+1;
end
end
end
%if r>5 (5 and not 0 to reduce any analytic error) the robot will choose
%the red color and start drawing 
if r>5
%move the mouse to the red color position(used more than one for acuuracy)
robot.mouseMove(rd(1),rd(2));
robot.mouseMove(rd(1),rd(2));
robot.mouseMove(rd(1),rd(2));
robot.delay(200);
%press mouse left button to choose the color
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
%release the left mouse button
robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(200);
%move to the starting position to begin drawing
    robot.mouseMove(start(1),start(2));
 %checks for any black pixels ( a zero for binary which is we are using
 %here) to draw
for i=1:size(img1,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img1,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img1(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end
% check & paint (yellow)
%exactly the same steps are repeated here but for yellow color
y=0;
for i=1:size(img2,1)
for j=1:size(img2,2)
if (img2(i,j)==0)
   y=y+1;
end
end
end
%if the upove loop found 5 or less black pixels only the robot wont draw
%that color wich saves time and increse efficency
if y>5
    robot.mouseMove(yelw(1),yelw(2));
 robot.mouseMove(yelw(1),yelw(2));
  robot.mouseMove(yelw(1),yelw(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);
    robot.mouseMove(start(1),start(2));
for i=1:size(img2,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img2,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img2(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end
% check & paint (black)
b=0;
for i=1:size(img3,1)
for j=1:size(img3,2)
if (img3(i,j)==0)
   b=b+1;
end
end
end
if b>5
    robot.mouseMove(blk(1),blk(2));
  robot.mouseMove(blk(1),blk(2));
   robot.mouseMove(blk(1),blk(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);
    robot.mouseMove(start(1),start(2));
for i=1:size(img3,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img3,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img3(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end
% check & paint (green)
g=0;
for i=1:size(img4,1)
for j=1:size(img4,2)
if (img4(i,j)==0)
   g=g+1;
end
end
end
if g>5
    robot.mouseMove(gr(1),gr(2));
  robot.mouseMove(gr(1),gr(2));
   robot.mouseMove(gr(1),gr(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);
    robot.mouseMove(start(1),start(2));
for i=1:size(img4,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img4,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img4(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end
% check & paint (blue)
bu=0;
for i=1:size(img5,1)
for j=1:size(img5,2)
if (img5(i,j)==0)
   bu=bu+1;
end
end
end
if bu>5
    robot.mouseMove(bl(1),bl(2));
  robot.mouseMove(bl(1),bl(2));
   robot.mouseMove(bl(1),bl(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(200);
    robot.mouseMove(start(1),start(2));
for i=1:size(img5,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img5,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img5(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end
% check & paint (purple)
p=0;
for i=1:size(img6,1)
for j=1:size(img6,2)
if (img6(i,j)==0)
   p=p+1;
end
end
end
if p>5
    robot.mouseMove(pr(1),pr(2));
   robot.mouseMove(pr(1),pr(2));
     robot.mouseMove(pr(1),pr(2));
robot.delay(200);
robot.mousePress(InputEvent.BUTTON1_MASK);
robot.delay(300);
robot.mouseRelease(InputEvent.BUTTON1_MASK);

robot.delay(200);
    robot.mouseMove(start(1),start(2));
for i=1:size(img6,1)
    robot.mouseMove(start(1),start(2)+i);
for j=1:size(img6,2)
        robot.mouseMove(start(1)+j,start(2)+i);
if (img6(i,j)==0)
    robot.mousePress(InputEvent.BUTTON1_MASK);
    robot.delay(1);
else
      robot.mouseRelease(InputEvent.BUTTON1_MASK);
robot.delay(1);
end
end
   robot.mouseRelease(InputEvent.BUTTON1_MASK);
end
end