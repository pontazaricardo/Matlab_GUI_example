function Main(action)

if nargin<1, action='start'; end

switch(action)
    case 'start'    
        axis([0 1 0 1]);    % create axes
        title('Click and drag your mouse in this window!');
        % Set the call back function when the mouse is pressed
        set(gcf, 'WindowButtonDownFcn', 'Main down');
        
        h = uicontrol('position',[10,5,80,30]);
        set(h, 'String', 'Clear');
        set(h, 'Callback','Main erase');

        h2 = uicontrol('position',[190,5,80,30]);
        set(h2, 'String', 'Rotate');
        set(h2, 'Callback','Main rotate');
        
        
        popup=uicontrol('style', 'popup', 'position', [100 5 80 30],'string', 'blue|yellow|magenta|cyan|red|green|black','tag', 'colorComboBox'); 
        %set(popup,'callback','Main color');
        
        slider=uicontrol('style', 'slide', 'position', [280 5 100 30],'tag', 'sliderBox');
        set(slider, 'Callback','Main rotate2');
        
    case 'down' % the callback function when button is pressed
        % update the callback function of mouse movement
        set(gcf, 'WindowButtonMotionFcn', 'Main move');
        % update the callback function of mouse button released
        set(gcf, 'WindowButtonUpFcn', 'Main up');
        % debug information
        %fprintf('Mouse down!\n');
   case 'up'   % the callback function when button is released
        % update the callback function of mouse movement <-- don't do anything
        set(gcf, 'WindowButtonMotionFcn', '');
        % update the callback function of mouse button released <-- don't do anything
        set(gcf, 'WindowButtonUpFcn', '');
        % debug information
        %fprintf('Mouse up!\n');
    case 'move' % the callback function when mouse is moved with key pressed
        currPt = get(gca, 'CurrentPoint');
        x = currPt(1,1);
        y = currPt(1,2);
        %line(x, y, 'marker', '*');
        
        popup = findobj(0, 'tag', 'colorComboBox');

		% which colormap to use
        switch get(popup, 'value')
			case 1
                line(x, y, 'marker', '*','color','b');
			case 2
                line(x, y, 'marker', '*','color','y');
			case 3
                line(x, y, 'marker', '*','color','m');
            case 4
                line(x, y, 'marker', '*','color','c');
            case 5
                line(x, y, 'marker', '*','color','r');
            case 6
                line(x, y, 'marker', '*','color','g');
            case 7
                line(x, y, 'marker', '*','color','k');
			otherwise
				disp('Unknown option');
        end
        
        % debug information
        %fprintf('Mouse is moving! Current location = (%g, %g)\n', x, y);
    case 'erase'
        h = findall(gca, 'type', 'line');
        %fprintf('Button Pressed?\n');
        delete(h);
    case 'rotate'
        for i=1:36
            camroll(10)
            drawnow
        end
    case 'rotate2'
        slider = findobj(0, 'tag', 'sliderBox');
        valueSlider=get(slider, 'value');
        valueSlider=floor(valueSlider*100);
        valueSliderTotal=valueSlider*360/100;
        view([valueSliderTotal,90])
        
    otherwise
		error('Unknown action string!');
end

end

