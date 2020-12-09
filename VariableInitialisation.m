%% Variable Initialisation for H&T robot

Colors = parula(10);

BodyLength  = 0.2;
BodyWidth   = 0.15;
BodyThick   = 0.05;
BodyMass    = 2;
BodyColor   = Colors(2,:);

WheelRadius = 0.05;
WheelThick  = 0.03;
WheelMass   = 0.125;
WheelColor   = Colors(4,:);

NeckLength  = 0.2;
NeckAngle0  = 30;
NeckMass    = 0.25;
NeckBall    = 0.03;
NeckSpring  = 0.5;
NeckColor   = Colors(6,:);

MotorVoltage = 11.1/5;
MotorTorque  = 1.1;
MotorSpeed   = 240;
MotorI0      = 0.3;

ObstacleHeight   = 0.05;
ObstacleWidth    = 0.5;
ObstacleDistance = 4;
ObstacleShape    = [-0.5*ObstacleHeight ObstacleHeight; -0.5*ObstacleHeight -ObstacleHeight; 0.5*ObstacleHeight 0];
ObstacleColor    = Colors(10,:);
TrackwayColor    = Colors(8,:);
FloorOffset      = 1;

BodyDimensions   = [BodyWidth,BodyLength,BodyThick];
BodyPitchInertia = (BodyMass*BodyLength^2)/12 ...
                 + 4*WheelMass*(BodyLength/2)^2;
TotalBodyMass    = BodyMass + 4*WheelMass;
NeckInertia      = NeckMass*NeckLength^2;