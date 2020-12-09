# ElasticHead
Simscape multibody simulation of a robot crossing an obstacle, with the effect of an elastic neck mass incorporated.

Described in the paper: 
"Compliance, Mass Distribution and Contact Forces in Cursorial and Scansorial Locomotion with Biorobotic Physical Models"
More details at https://bio.is.mpg.de/

Left and right hand sides of the robot are separately driven by electric motors.
The mass at the head of the robot is connected to the body via a torsion spring.

How to run:
Run 'VariableInitialisation.m' to define the constants/geometry for the simulation
When the simulation (Heads.slx) runs, the script 'ProcessOutput.m' is run.
