%% Mandelbrot set generator
function [imageout]=mandelbrot(b,z0,n, niter) 
% % b is exponent,  n is num points in each axis,
% % niter is number of iterations to test for convergance
% % This code is adapted from the code posted by chris taylor on
% % stackexchange: https://stackoverflow.com/questions/20844510/coloring-the-mandelbrot-set-in-matlab
%% setup axis
xmin = -2;   xmax = 1;  % define the range on x and y to be a sensible range
ymin = -1.5; ymax = 1.5;

[x,y] = meshgrid(linspace(xmin, xmax, n), linspace(ymin, ymax, n));
%% initialise z and the output matrix k, and create c 
c = x + 1i * y;
k = zeros(size(c));
z = z0.*ones(size(c));

%% loop to interate the function and find regions of convergance
% % Here is where the magic happens
for ii = 1:niter  
    z   = z.^b + c; %% this is the mandelbrot function
    k(abs(z) > 2 & k == 0) = niter - ii; % check where the absolute value of z is greater than 2 and k is still 0  
                                         % ...as in it has not yet been set. These are the locations where the function 
                                         % ...will diverge. the sooner it
                                         % passes this threshhold, the larger the value
                                         % it gets until the final
                                         % iteration
                                         % where all remaining areas are
                                         % set to 0 and included in the set
                                         
end

imageout=k; 

%% Uncomment the next section if you want to run the mandelbrot function on its own to generate a plot for the arguments used
% % IMPORTANT - Do not leave this uncommented when running the video maker 
% % You will end up freezing your moniter whilst matlab spams plots at you
% % if you have not heeded this warning, you can use >>clear all in the command window to
% % close all the plots at once

%%
%  figure;
%  imagesc(k)
%  colormap hot
%  axis square
