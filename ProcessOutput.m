%% Process Output

%% Extract Sim Variables

Time     = simout.time;
Pitch    = simout.signals.values(:,4)*180/pi;
Neck     = simout.signals.values(:,7)*180/pi;
YDistance = simout.signals.values(:,2);
ZDistance = simout.signals.values(:,3);

%% Process output

% Velocities
PitchVelocity = [0; diff(Pitch)./diff(Time)]*pi/180;
NeckVelocity  = [0; diff(Pitch)./diff(Time)]*pi/180;
YVelocity     = [0; diff(YDistance)./diff(Time)];
ZVelocity     = [0; diff(ZDistance)./diff(Time)];

% Energetics
BodyPitchEnergy  = 0.5*BodyPitchInertia*(PitchVelocity).^2;
BodyYEnergy      = 0.5*TotalBodyMass*(YVelocity).^2;
BodyZEnergy      = 0.5*TotalBodyMass*(ZVelocity).^2;
BodyGPE          = 9.81*TotalBodyMass*ZDistance;
NeckEnergy       = 0.5*NeckInertia*(NeckVelocity).^2 ...
                 + 0.5*(NeckSpring*180/pi)*(Neck*pi/180-pi/4).^2 ...
                 + 9.81*NeckMass*(ZDistance+0.5*BodyLength*sind(Pitch)+NeckLength*sind(Pitch+Neck));
BodyLinearEnergy = BodyYEnergy+BodyZEnergy;
TotalBodyEnergy  = BodyPitchEnergy+BodyLinearEnergy+BodyGPE;

% Peak Values
MaxNeckEnergy = max(NeckEnergy);
[MaxHeight,I] = max(ZDistance);
MaxHeight     = [MaxHeight,I];
[MaxPitch,I]  = max(Pitch);
MaxPitch      = [MaxPitch,I];
[MaxNeck,I]   = max(Neck);
MaxNeck       = [MaxNeck,I];
PitchAtNeckMax  = Pitch(I);
HeightAtNeckMax = Pitch(I);
Survived      = Pitch(end)>90;

%% Save data
save lastrun.mat

    
