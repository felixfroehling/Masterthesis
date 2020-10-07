classdef Detection
    %CAMERAOBJ Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Class
        SensorCoord
        BoundingBox
        DistX
        DistY
        DistR %Added by Felix
        Yaw %Added by Felix
        Speed %Added by Felix
    end
    
    methods
        function obj = Detection(class, bl_x, bl_y, bl_z, tr_x, tr_y, tr_z, yaw, distR, distX, speed)
            %CAMERAOBJ Construct an instance of this class
            %   Detailed explanation goes here
            obj.Class = class;
            obj.SensorCoord.BL_X = bl_x;
            obj.SensorCoord.BL_Y = bl_y;
            obj.SensorCoord.BL_Z = bl_z;
            obj.SensorCoord.TR_X = tr_x;
            obj.SensorCoord.TR_Y = tr_y;
            obj.SensorCoord.TR_Z = tr_z;
            obj.Yaw  = yaw;
            obj.DistR = distR;
            obj.DistX = distX;
            obj.Speed = speed;
            
        end
        
        function obj = toPixelCoord(obj, cam)
            %CAMERAOBJ Construct an instance of this class
            %   Detailed explanation goes here
            BL = [obj.SensorCoord.BL_X obj.SensorCoord.BL_Y (obj.SensorCoord.BL_Z+1.3)];
            BL_pixel = vehicleToImage(cam, BL);

            TP = [obj.SensorCoord.TR_X obj.SensorCoord.TR_Y (obj.SensorCoord.TR_Z+1.3)];
            TP_pixel = vehicleToImage(cam, TP);

            x = BL_pixel(1)+5;
            y = TP_pixel(2)-10;
            width = (TP_pixel(1) - BL_pixel(1))*1.1;
            height = (BL_pixel(2) - TP_pixel(2))*1.15;
            
            obj.BoundingBox.x      = x;
            obj.BoundingBox.y      = y;
            obj.BoundingBox.width  = width;
            obj.BoundingBox.height = height;
        end
        
        function obj = calcDistances(obj)
            obj.DistX = (obj.SensorCoord.BL_X + obj.SensorCoord.TR_X)/2;
            obj.DistY = (obj.SensorCoord.BL_Y + obj.SensorCoord.TR_Y)/2;
            %obj.DistR =  sqrt(obj.DistX^2 + obj.DistY^2); %Added by Felix
            %obj.Yaw   =  atan(abs(obj.SensorCoord.TR_Y-obj.SensorCoord.BL_Y)/...
            %                  abs(obj.SensorCoord.TR_X-obj.SensorCoord.BL_X)); %Added by Felix
        end
        
    end
end

