COMPLEX CONVERGANCE ANIMATION
a matlab project

Within this repository you will find code that will render animations of the mandlebrot and julia sets, with variable parameters.

Each folder contains two files, Firstly a function mandlebrot or julia that will render a frame of the mandlebrot or julia set, which may be run on its own in the command window to generate stills if you so desire.
                                Secondly a video maker, which deals with the variable sweep, and the creation of the video. For all video making purposes with the standard sets, only this fille needs to be edited.

In order to generate a video, simply run the relevant vidmaker

If you want the output video files to be saved somewhere specific, change the prefix variable in the vidmaker to the required path, terminated with a /

If you want to change the variable that is swept, you can do this in the vidmaker by editing the max and min values and by editing how the julia/mandlebrot function is called

mandlebrot is called with this syntax: matlab(exponent,initial value of z,number of points on each axis, number of iterations deep to test)
by default the exponent is varied, and z is 0

julia is called with this syntax:      julia(exponent,complexconstant,number of points on each axis, number of iterations deep to test)
by default the exponent is 2 and the complex constant is varied around a circle of radius 0.7885 in the complex plane, centred at the origin


If you want to create a new iteration convergance tester, simply do the following:
    Save the videomaker and either julia or mandlebrot as different filenames, 
    Change the function name within the julia/mandlebrot copy to whatever its new filename is,
    Change the inputs to the function to whatever you want them to be,
    Change the formula (found within the loop) to whichever formula you want to run an iteration test for
    Call the new function within the new videomaker with the inputs that it expects
    Change the variable and sweep
    Rename the output filename in the fname variable - you may also change the dynamic naming - %s for a string, %d for a double, %i for an integer etc. Just be sure to leave %s at the start and prefix as the first variable 

DEPENDS:

Matlab Toolboxes:

image_toolbox - an additional licence may be required, as this is a proprietary toolbox maintained by MathWorks

Public Toolboxes:
SC - A very useful visualisation package made by Oliver Woodford, available here: https://de.mathworks.com/matlabcentral/fileexchange/16233-sc-powerful-image-rendering

Please download this toolbox and add the directory it is in it to the working directory within matlab


 
