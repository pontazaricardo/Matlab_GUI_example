# Matlab_GUI_example

This is an example of how to program a simple GUI for a graph window in Matlab.

## Usage

Run the *Main.m* file in Matlab.

## Commands

This example shows how to create clickable buttons in the main GUI and how to assign a method to this button.

The code for creating a button is 
```matlab
h = uicontrol('position',[10,5,80,30]);
set(h, 'String', 'Clear');
set(h, 'Callback','Main erase');
```