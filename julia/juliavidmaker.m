%% Julia Video maker

% IMPORTANT:
% This script makes use of the SC package by Oliver Woodford, available here: 
% https://de.mathworks.com/matlabcentral/fileexchange/16233-sc-powerful-image-rendering
% download the package and add it to the path
% The matlab toolbox 'image_toolbox' was also used
%
% This script will output a .avi file to the root of the path
% in, if you want the file to go somewhere else, edit the prefix variable
% so that it contains the path to the desired folder
% 
% Thetamin/max will set the minimum and maximum values to sweep across. 
%  
% This may take a long time to execute depending on your hardware and the
% number of steps chosen - you have been warned. 

%% Set variables sweep range and number of frames (steps) and constants
thetamin = 0;   thetamax  = 2*pi;  
radius = 0.7885; 
steps = 100; % Number of steps

n = 800;     % the resolution of the complex plane in each axis
niter = 40;  % The number of iterations deep to test

frameratedivisor = 1; %change to divide the framerate by the inputted integer
prefix = ''; % the full path desired, terminated with a / 
             % E.G. 'C://Users/yourname/Videos/' or
             % '/home/yourname/Videos/'
%% Initialise the video file
format long;% % The fname variable dynamically names the output video

fname = sprintf('%sJulia%d_%d-%d_%isteps_1over%ispeed.avi'...
                ,prefix,thetamin,thetamax,steps,frameratedivisor);

% % For an MP4 output, replace 'Motion JPEG AVI' with 'MPEG-4' and rename 
% % the file extension in the line below
vidfile = VideoWriter(fname,'Motion JPEG AVI'); 

open(vidfile);               
 
%% loop over all variables that you want to and generate a frame for each
 for variable = linspace(thetamin,thetamax,steps)
    z = julia(2,radius*exp(1i*variable),n,niter); % calculate julia set for 2 in the exponent, with c swept around a circle in the complex plane with a radius defined above
    im = sc(z, 'hot');               % create an image from the data in z
    for ii = 1:frameratedivisor      % dirty hack to decrease the framerate
        writeVideo(vidfile, im);     % append the frame to the animation
    end
 end
close(vidfile)
