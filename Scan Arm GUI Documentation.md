							       Scan Arm GUI User Guide

The following user interface is designed to control the 3-axis scan arm without using a command line. Follow the numbered panels to ensure all the required inputs are set properly. 
![GUI](Images/GUI.PNG)

**First Steps:** Open Matlab and navigate to the directory where the folder **"scanarmgui1"** is saved. Right click the folder and click "Add to path" then "Folders and sub-folders." Left click on the folder twice and open  **"ScannerStage4__.m."** 

1. **Connect Panel**

   **a) Motors:** Make sure to physically switch the motors on, first the right then the left. Look at the two light indicators on the front panels of the motors. You should see an open green light beneath a closed yellow light. Press "Connect" to turn the Velmex Motors on.  You should then see an open yellow light indicating the motors are on. Press "Disconnect" to turn off the Velmex Motors. To physically close the motors, turn off the left motor, then the right motor. The current status of the motors is indicated above the Connect/Disconnect buttons. 


![Motors](Images/Motors.png)

  

 **b)** **Channel & Record Length (pts):** Make sure you do this before pressing **"Connect"** on the Oscilloscope panel.  Check that oscilloscope channels 1 and 2 are on, indicated by a glowing button. Then select either **"Channel 1"** or **"Channel 2"**  on the GUI. Select one of the "Record Length" options to specify the number of points per reading. Ensure the selected record length matches the oscilloscope record length.



![Channel and RL](Images/Channel%20and%20RL.png)



   **c) Oscilloscope:** "Connect" establishes a connection"between the computer and the Tektronix Oscilloscope, using the Channel and Record Length specified in **1.b).** ''Disconnect" turns this connection off. Current status is indicated to the right of the Connect/Disconnect buttons.



![Oscilloscope](Images/Oscilloscope.png)



2. **Oscilloscope** **Settings**



 ![Oscilloscope Settings](Images/Oscilloscope%20Settings.png)



   **Record Time [s]:******** Enter the amount of time for which you wish to read the current waveform; used as an input for the **Scope Readout** function. If using **Scope Readout,** ensure that record time is the same as pause time.

   **Pause Time [s]:******** Enter the amount of time for which you wish to pause the scan arm between scans.

   **Scans to Average:******** Self-explanatory

   **Read Scope:** Carries out the **Scope Readout** function, recording the structures **Data** and **ScopeSettings**  from a single point.

   **Current Waveform:** Plots the current waveform; should match with oscilloscope display and function generator. (Show image)

   ****** Only real number inputs are acceptable

   3. **Movement**


![Movement](Images/Movement.png)



The three axes of movement are specified on the left side of the tank. Use the jog buttons to manually 		move the scan arm to the desired position. Motors can also be moved by pressing the jog buttons on the external motor controllers.

**Jog X-** Moves motor in negative x-direction

**Jog X+** Moves motor in positive x-direction

**Jog Y-** Moves motor in negative y-direction

**Jog Y+** Moves motor in positive x-direction

**Jog Z-** Moves motor in negative z-direction 

**Jog Z+** Moves motor in positive z-direction

**Jog Distance (Steps):** Specify the step size per jog movement (1 mm = 157.48 steps)

To check the current position of the scan arm, refer to the X, Y, and Z indicators in the **Current Position** panel. 

4. **Current Position**


![Current Position](Images/Current%20Position.png)



**Set as Zero Buttons:** The three buttons set the x, y, and z positions to 0.00, respectively, so that position can be measured from a particular point. 

**Set All to Zero:** Same as above, but sets all three axes positions as 0.00.

**ENSURE THAT A HOME POSITION IS SPECIFIED BEFORE CONDUCTING A RASTER SCAN**

**Set Home:** Specifies current scan arm position as the center of a raster scan.

**Return Home:** If a home position is specified, returns scan arm to that position.

**Go Home?** A checked box tells the scan arm to return home following a raster scan. An unchecked box commands the scan arm to remain at its final scan position.



5. **Raster Scanning**


![Raster Scan](Images/Raster%20Scan.PNG)



**a) Scan Axes:** First select the desired scan dimensions.

- **1D Scanning:** Select the ''X", ''Y'', or "Z" options to scan along **one** of the indicated axes.

- **2D Scanning:** Select ''XY'', ''XZ", or ''YZ" to scan along **one** of the indicated 2D planes. 

- **3D Scanning:** Select ''XYZ" to perform a scan along **all three axes.** 


![Axes](Images/Axes.PNG)



**Units:** Standard units for raster scanning are [mm]. The conversion from [mm] to steps is shown to the right and in panel **b) Scan Settings** (~157.48 steps/mm).



![Units](Images/Units.PNG)



**b) Scan Settings:** Use this panel to specify the starting position, end position, and increments of movement. **Units must be entered in [mm]**, but are shown in steps on the left. Depending on which scan axes are chosen, the applicable boxes will be shown in white. 

- **Start:** Enter the scan start position relative to the scan arm's current location.

- **Stop:** Enter the scan end position. 

- **Increment:** Set the scan arm's step size for movement.


![Scan Settings](Images/Scan%20Settings.PNG)



**Before clicking 'Raster Scan', ensure that the following inputs are set:**

- Pause Time **(2.)**
- Average **(2.)**
- Set Home **(4.)**
- Return Home? **(4.)**
- Scan Axes **(5.)**
- Scan Settings **(5.)**

**Raster Scan:** Conducts a raster scan according to the previous parameters.  Once the status bar reads 'Raster Scan Complete', two plots are generated. The first shows the scan arm's path of movement along 1D/2D/3D space. The second generates a pressure gradient for the completed scan. **Pressure gradient plots are not yet supported for 3D scans**.

**Go to Plane Max:** After a raster scan is complete, press this button to move the scan arm to the location of the maximum recorded pressure within a 2D plane scan.

![Scan buttons](Images/Scan%20buttons.PNG)

**c) Save Oscilloscope Data:** 

- **Edit Folder:** Specify the folder name (normally **'ScanResults'**) in which to save scan results. Folders are saved in the same path as the Scan Arm GUI files. 

- **Edit Filename:** Name the .mat file as desired. 

- **Save**: Saves the raster scan structures '**Data', 'Position'**, and **'ScopeSettings'** to a .mat file using the folder and file names specified above. 


![Save](Images/Save.PNG)



**Placing Additional Functions**

	Open Matlab and enter 'guide' in the command prompt. A window should appear asking you to open a .fig file. Navigate to the file called ScannerStage4__.fig and open it. To refer to the specific callbacks for each function, right click a button, edit box, or button group and select "callbacks." Rearrange or delete elements of the GUI as desired. Refer to README.md for documentation of the source code implemented into this GUI.

**Troubleshooting**

- If "Connect" on the Motors panel leads to an error, restart Matlab, add the folder "scanarmgui1" to the path, and run ScannerStage4__.m again. 
- After pressing "Raster Scan" or "Scope Readout", the Matlab command prompt may continuously print "=10 000" without actually reading data from the oscilloscope. This error means that the record length on the GUI does not match with that of the oscilloscope. Change the record length on the GUI or on the oscilloscope itself to ensure they match. To change the record length on the oscilloscope, press "Acquire", press the button below the screen that corresponds to "Record Length", then turn the top multipurpose dial until the correct record length is selected. If this fix does not work, restart Matlab and the oscilloscope, then match the record lengths.
