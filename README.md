# Matlab_GUI_example

This is an example of how to program a simple GUI for a graph window in Matlab.

## Usage

Run the *Main.m* file in Matlab.

![image1](/images/matlab.gif?raw=true)

## Code

### Buttons

This example shows how to create clickable buttons in the main GUI and how to assign a method to this button.

The code for creating a button is 
```matlab
h = uicontrol('position',[10,5,80,30]);
set(h, 'String', 'Button text');
set(h, 'Callback','Main method');
```
and you implement it as

```matlab
if nargin<1, action='start'; end

switch(action)
	case 'start'    
		h = uicontrol('position',[10,5,80,30]);
		set(h, 'String', 'Button text');
		set(h, 'Callback','Main method');
	case 'method'
		fprintf('Button Pressed\n');
	otherwise
		error('Unknown action string!');
end
```
and if you want to add a new button, just do it in the *start* section as
```matlab
if nargin<1, action='start'; end

switch(action)
	case 'start'    
		h = uicontrol('position',[10,5,80,30]);
		set(h, 'String', 'Button text');
		set(h, 'Callback','Main method');
		
		h2 = uicontrol('position',[190,5,80,30]);
		set(h2, 'String', 'Rotate');
		set(h2, 'Callback','Main rotate');

	case 'method'
		fprintf('Button Pressed\n');
	case 'rotate'
		%your code here.
	otherwise
		error('Unknown action string!');
end
```
### Mouse pointer

This file allows the user to use the mouse as a pointer and paint all over the window. The code related to this is
```matlab
switch(action)
	case 'start'    
		set(gcf, 'WindowButtonDownFcn', 'Main down');
	case 'down' % the callback function when button is pressed
		
		% update the callback function of mouse movement
		set(gcf, 'WindowButtonMotionFcn', 'Main move');
		
		% update the callback function of mouse button released
		set(gcf, 'WindowButtonUpFcn', 'Main up');

	case 'up'   % the callback function when button is released

		% update the callback function of mouse movement
		set(gcf, 'WindowButtonMotionFcn', '');
		
		% update the callback function of mouse button released
		set(gcf, 'WindowButtonUpFcn', '');
		
	case 'move' % the callback function when mouse is moved with key pressed

		currPt = get(gca, 'CurrentPoint');
		x = currPt(1,1);
		y = currPt(1,2);

		line(x, y, 'marker', '*','color','b');
		
	otherwise
		error('Unknown action string!');
end
```
