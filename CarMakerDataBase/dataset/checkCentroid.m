% DETECTOR        = vehicleDetectorACF('front-rear-view');

file = 'test2-00000001';
folder = "/home/reway/06_cmprojects/dataset/prepared/1/";

img = strcat(fullfile(folder,file),'.jpg');
figure; 
imshow(img);
hold on;

fid = fopen(strcat(fullfile(folder,file),'.txt'));
while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    
    tline = sscanf(tline,'%f');

    x_center = tline(2)*1920;
    y_center = tline(3)*1080;

    plot(x_center,y_center,'r*');
end
