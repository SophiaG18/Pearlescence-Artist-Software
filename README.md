# Pearlescence-Artist-Software

Group Name: Pearlescence

Group Members: Anna Fang, Sophia Gao

Prototype: https://docs.google.com/document/d/1wQ_F--UWB9xtafvUVpv_5qi4pqOymIEEmPG7aE3nx1g/edit?usp=sharing

### Brief Project Summary:
Our project will be processing based and will emulate a digital art software. The product will be an interactive interface resembling programs like MSPaint, with the top of the screen being an interactive “toolbar” with the rest of the screen available for the user to draw in. It will contain various brushes that allow the user to create different size lines, special tools such as a “fill-bucket” and “shape creators”, a color selector, eraser, and a way for the user to save their drawing via screenshot. Building on from this, we would like our project to include aspects of more advanced programs like procreate such as brush weight (based on the user’s selection of transparency and brush), layers, and layer manipulation (ex: multiply, color dodge, etc).

### Compile/Run Instructions:
First open up the Pearlescence processing file. Press the run button.

To begin drawing, press, hold, and drag your mouse. The characteristics of the line drawn can be changed using pressed keys and clicking on specific areas in the menu, all listed below.

##### Key Pressed and their impact on the line drawn
- r will cycle up R value (unless R = 255, in which case it will stop cycling up)
- g will cycle up G value (unless G = 255, in which case it will stop cycling up)
- b will cycle up B value (unless B = 255, in which case it will stop cycling up)
- DELETE acts as a clear button; resets the bottom rectangle to default white by drawing a white rectangle above the drawing
- UP will increment Size (of the brush) unless Size = [max size]
- DOWN will decrement Size (of the brush) unless Size = 1
- 1 will decrement brushMode (which type of drawing utensil used) or cycle back to the highest value if brushMode = 0
- 2 will increment brushMode or cycle back to lowest value if brushMode = [max mode]
- LEFT acts as a undo button; displays the stored image of Prev
- RIGHT acts as a redo button; displays the stored image of Next
- ENTER acts as a save button; saves a png file of the screen
- f will change Filter boolean
  - If Filter is turned on, saves current drawing as Prev then calls for Kernel method Apply using the kernel respective to Index value (then saves new drawing as Next)
- w will turn the Weight boolean on and off (pressure/velocity based weight or static line when drawing)
- 3 will decrement Transparency (of the stroke) or cycle back to highest value if Transparency = 0
- 4 will increment Transparency (of the stroke) or cycle back to the lowest value if Transparency = 100
- 5 will decrement (filter) Index or cycle back to highest value if Index = 0
- 6 will increment (filter) Index or cycle back to lowest value if Index = 7
- l will turn the Layer boolean on and off (allows the user to draw on the main canvas or on a separate layer)
- BACKSPACE clears the screen by setting the background color to white, or calls clear() on the layer when LAYER is true.

##### Mouse actions
- Clicking on the color palette will change R,G,B values to appropriate values and changes the color of the lines the user draws to the color selected.


### Document Log:
##### 5/23:
Sophia Gao:
Created the processing folder with tabs then streamlined Anna's code. Draw method now includes text for all variables except brushMode, which had unexpected complications in calling respective Brush method.

Anna Fang:
Finished writing keypressed method in main file and both pen() and eraser() according to outlined requirements in Brush tab. Accidentally forgot to use —no-ff, but will make sure to use it in the future.

##### 5/24:
Sophia Gao: Finished Pearlescence phase 1. Currently in phase 2 of Pearlescence with the RGB section finished.

Anna Fang:
Updated Pearlescence by moving mousePressed into the draw method and implemented pmouseX/pmouseY in order to shift from using mouse coords. to make a trail of circles to a series of lines. Also fixed up coordinates in Pen() and Eraser().

##### 5/25:
Sophia Gao: Coded a modified version of imageProcessing lab as Kernel tab. Continued Pearlescence phase 2.

Anna Fang: Reformatted interface (moved around text controls and color selector) and fixed pixel coordinates& aesthetics for user instructions; Made a new UML for changes to prototype.


##### 5/26:
Sophia Gao: Coded a non-recursive Bucket2 that is decently fast.

Anna Fang: Added all variables and coded cases for calling them. Researched how to apply PGraphics and attempted to implent some code using it. Currently added in code creating the layer and edited brush methods to draw on the layer.

##### 5/27-5/30:
Sophia Gao: Coded the ability for the user to make circles and rectangles in the drawing area. Created method headers for future brush methods to be coded.

Anna Fang: Researched how to apply removal of PGraphic Layer (still not working) and changed around formatting for menu bar.

##### 5/31:
Sophia Gao: Coded for the use of transparency in Brush methods. Miscellaneous changes to the text displayed.

Anna Fang: Finished KeyPressed and logic for clearing the layer: had to experiment on a separate Processing sketch and moved working code over to main file. Shifted some interface elements and started updating UML.

##### 6/1:
Sophia Gao: Created the classes Pix and PixList, which is similar to the orbChain lab's classes, to replace the use of the instance variables Prev and Next. Modified Pearlescence and Kernel code to accommodate for the change.

Anna Fang: Updated UML (again) and researching how to implement brushweights and issues on layers. Wrote up instructions and added it to ReadMe.

##### 6/2:

Sophia Gao: Attempted to code a method that would be similar to airbrush/spray. Very pixelated, WIP.

Anna Fang: updated files with InkBrush() and implemented code in main file to apply brushweight to InkBrush(). Edited layers to fix issue with bottom canvas reappearing when layers are turned on and off. Researching how to transition code lines to curves.

##### 6/3:

Sophia Gao: Fixed the issue regarding layers with circle and rectangle.

Anna Fang: Worked with Sophia on fixing issue with layers ^^. 

##### 6/3:

Sophia Gao: 

Anna Fang: Researched how to best implent layer merging between PImages and PLayers; implemented a new "merge method", added new case for layer merge, and edited the interface to include new instructions. 
