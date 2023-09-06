

%find the label associated to a point in a specific partition
% function index = label(varargin)
% if size(varargin) < 3
%     [pointId, pi] = varargin{1:2};
% else
%     [pointId,piId, PI] = varargin{1:3};
%     pi = PI{piId};
% end

function index = label(pointId, pi)
pi_row = pi(pointId,:);
[~,index] = max(pi_row); 
end
