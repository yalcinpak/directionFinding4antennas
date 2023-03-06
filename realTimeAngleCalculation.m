cfgAngle = bleAngleEstimateConfig;
cfgAngle.ArraySize = 4;
cfgAngle.ElementSpacing=0.45;

clear device

device = serialport("COM5",115200);



flush(device);
while(1) 

myBuffer=readline(device);

str = split(myBuffer);

IQsamples = str2num(myBuffer);
angle = bleAngleEstimate(IQsamples,cfgAngle)



end
