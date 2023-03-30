cfgAngle = bleAngleEstimateConfig;  %ble config lib for Matlab 
cfgAngle.ArraySize = 4;             %define number of Antenna
cfgAngle.ElementSpacing=0.45;       %choose antenna distances as lambda
cfgAngle.SlotDuration = 1;
cfgAngle.SwitchingPattern = [1 2 3 4];
clear device                        %close previous port

device = serialport("COM5",115200); %start serial port

flush(device);                      %flush port buffer

numberOfMeasurement=2;
z = zeros(1,numberOfMeasurement);

for c = 1:numberOfMeasurement       %finite loop

myBuffer=readline(device);          %read string from port

str = split(myBuffer);              %split string to string matrix

IQsamples = str2num(myBuffer);      %convert string matrix to 
                                    % complex double matrix
angle = bleAngleEstimate(IQsamples,cfgAngle);    %calculate angle
z(c)=angle;


end

meanOfAngle = mean(z)
%medfilt = mean(medfilt1(z,3));
%medianOfAngle=median(z);
filename = 'angleCalculateMatlabAlgorithm.xlsx';
writematrix(meanOfAngle,filename,'Sheet',1,'Range','B5')

