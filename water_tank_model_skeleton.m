classdef water_tank_model < handle
    % WATER_TANK_MODEL Simple single water tank module
    %   Simulates a single water tank module 
    
    properties (Access = private)
        A % Cylinder area
        a % Drain hole area
        gamma % Control input to flow parameter
        
        y % current measurement
        y_old % previous measurement
        dt % time diff between previous and current
        
        u % current control value
    end
    
    methods
        function obj = water_tank_model()
            %WATER_TANK_MODEL Construct an instance of this class
            %   Default parameters
            obj.A = 0.005;
            obj.a = 0.001;
            obj.gamma = 0.001;
            
            obj.y = 0;
            obj.y_old = 0;
            obj.dt = 0.1;
            obj.u = 0;
        end
        
        function setNewWaterLevel(obj, y)
            %SETNEWWATERLEVEL Set a new waterlevel, this is only supposed
            %to be used to set the system to different state and not to be
            %used withing any control loops.
            obj.y = y;
            obj.y_old = y;
        end
        
        
        function dy = changeInWaterLevel(obj, y, u)
            %CHANGEINWATERLEVEL The derivative of y.
            % The derivative is based on the flow through the drainage (the height of water -> water
            % pressure -> a*sqrt(2*g*y)) and amount of pumped water (u*gamma)
            
            % Check - can't have negative height
            if (y < 0)
                dy = 0;
                return;
            end
            
            % Check - if the height > 100 then the water will go through
            % the "overflow pipes".
            if (y > 100)
                dy = 0;
                return;
            end
            
% Add your code here ... the expression for dy

        end
        
        function y = getWaterLevel(obj)
            y = obj.y;
        end

        function dy = getWaterLevelChange(obj)
           dy = (obj.y - obj.y_old)/obj.dt         
        end
        
        function y = tankLevelLimits(obj, y)
            if (y > 100)
                y = 100;
            end
            if (y < 0)
                y = 0;
            end
        end
        
        function u = controlLimits(obj, u)
            if (u < 0)
                u = 0;
            end
            if (u > 100)
                u = 100;
            end
        end
        
        function y_new = integrateControlRK4(obj, u, dt)
            %INTEGRATECONTROL Integrate control action u for time dt using
            %RK4 (Runge-Kutta order 4).

% Add your code here...

        end
        
        function y_new = integrateControlEuler(obj, u, dt)
            %INTEGRATECONTROLEULER Integrate contol action u for time dt
            %using euler's integration.

% Add your code here...

	  end
    end
    
end

