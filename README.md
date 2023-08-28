# Digital_Painting
This MATLAB project focuses on processing an input image and performing color separation, followed by individual picture conversion into binary format. The project also uses the paint program to allow the users to repaint the image using the coordinates of specific colors on the screen.
%*****************code explanation****************************************
%*************************************************************************
we import the image from the pc
the program filters colors out from this image(by keeping the wanted color
only and turning other colors to white ) and saves them (colors)
in diffrent variables(with the color name) and then transfer each image
(which is containing a specific color if it exist if not it will be white) 
into gray and then to a binary matrix
(with ones for white and zeros for black) and takes
this matrix to check if there is any zeros inside of it if there is more
than 5 black pixels(which was originaly the color it self) the robot 
 switch tabs to open the drawing program to be the current tab and then 
the image enters the drawing loop wich first choose the color by moving
the mouse to the color position
(with x&y coordinates already predefined based on my pc) 
and presses the mouse and then releases it to choose the color
and then moves the mouse to the starting position (which is also predefiend )
to start drawing and press the mouse each time there is a black pixel 
(this will appear in the drawing program as the wanted color)
after finishing checking and drawing the first color the same sequence
will happen to each color and if it does exist in the image it will be
%drawn if not the program will skip it and move to the next color
%*************************************************************************
