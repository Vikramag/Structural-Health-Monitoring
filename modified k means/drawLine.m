function drawLine(p1, p2, varargin)
%DRAWLINE Draws a line from point p1 to point p2
%   DRAWLINE(p1, p2) Draws a line from point p1 to point p2 and holds the
%   current figure
hold on
plot3([p1(1) p2(1)], [p1(2) p2(2)],[p1(3) p2(3)] ,varargin{:});

end