function [ xPos2, yPos2 ] = reflect( xPos0, yPos0, xPos1,yPos1,blobCenter, blobRadius, blobX, blobY )
% reflect
% Function to reflect particles against boundary of blob
% Returns reflected position
% Assumes xPos1 and yPos1 are inside blob

% Compute distance to boundary
dist = blobRadius - pdist([xPos1, yPos1;blobCenter]);

% Create line betweeen particle positions
function fun = makelinefun(x1,y1,x2,y2)
    fun  = @(N) [linspace(x1,x2,N) ; linspace(y1,y2,N)];
end
f = makelinefun(xPos0, yPos0, xPos1, yPos1);
xy = f(1000);
[k,d]  = dsearchn([blobX,blobY],xy);
k_min = k(find(min(d)));
poe = [blobX(k_min), blobY(k_min)]; % Coordinates for point of entry in blob

% Compute angle of entrance
u = poe + [xPos1,yPos1];
v = poe + blobCenter;
aoe = atan2(norm(cross(u,v)),dot(u,v)); % aoe = angle of entrance

poe_pos1_dist = pdist(poe,[xPos1,yPos1]); 

end

