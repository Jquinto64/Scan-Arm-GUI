# README	

This folder contains various pieces of code for running the M7-302 scan tank. There are two main scripts at the moment, `ScanArm.m` and `ScanArmMove2Max.m`. 

The first script, `ScanArm.m` contains the various commands required to initialize the positioning system, connect to the oscilloscope, and then run a raster scan starting from the current position. 

The second script, `ScanArmMove2Max.m` contains much of the same as `ScanArm.m`, but removes the raster scan portion of the code. Better for testing the method I've implemented for moving the Scan arm to the focus.

The bulk of the code is contained in the folders (`Scan`, `Plotting`, `Initiation`, `Movement`, and `Status`). Results should be placed in a folder outside of the ScanArm folder named `ScanResults`, and ordered by date.

# `Scan` 

Contains  the function `RasterScan` which calls `LineScan` or `RasterScan` or `VolumeScan` based on whether the scan to be run is a 1D, 2D, or 3D scan.

# `Plotting`

Contains the functions `plot1Dtrace`, `plot2Dtrace`, and `plot3Dtrace` which plots the scan results from the previous raster scans.

# `Initiation`

 Contains the functions `OpenMotor`, `OpenScope`, and `OpenMotorandScope`, the three of which are used to connect to the VelMex motor controllers and the TekTronix Oscilloscope.

# `Movement`

 Contains various functions for moving the positioning system

`FindLocalMax` implements a method of Gradient descent to find the maximum pressure in an area

`GoToPlaneMax` moves the motors to the maximum of the plane using data from a raster scan

`MoveMotor` moves one of three motors a distance in mm

`MoveMotorTurns` moves one of three motors a distance given in motor turns

`ReturnHome` moves the three motors from current position back to home 

`FirstOrderGrad` gets the gradient along a single axis based on a first order numerical derivative

`StencilGrad` gets the gradient along a single axis based on a second order stencil method

# `Status`

 Contains various functions for checking the status of the positioning system and reading from the TekTronix Oscilloscope

`IsReady` checks whether the motor controllers are ready for use using the 'V' command

`ReadPosition` reads x,y,z position from the motor controllers

`ReadScope` reads the signal from the oscilloscope readout

`ResetMotorCOM` resets the motor communication, often needed if it won't connect to COM4

`KillProcess` stops the current process running using the 'K' command

`SetHome` sets the current position as the home position

`GetGrad` gets the 3D pressure gradient at the current location using either `FirstOrderGrad` or `StencilGrad`