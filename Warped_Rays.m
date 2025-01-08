% CSC D18 - Computer Graphics - UTSC
% 
% Warped rays
%
% Your task here is to implement a very simple
% parametric simulation of light rays travelling
% through a space gravitationally distorted by
% the presence of a black hole.
%
% The black hole is at location p_0=[p_0x, p_0y]
% and has mass m_0
%
% Light rays are standard parametric rays, however
% here we will take them to represent a photon 
% travelling around a black hole.
%
% What follows is a *very coarse* approximation
% of how gravity at the black hole would change
% the photon's path
%
% First
%
% Radius of the black hole, it is given by
%
% r=2Gm_0 / c^2
%
% Where G is the gravitational constant (defined in
% the script), m_0 is the mass of the black hole,
% and c is the speed of light (also set below)
%
% We'll work with a tiny black hole with a radius
% of about .5m, which means a mass of 3.36e26 Kg
% (these things are hugely heavy!)
%
% Now, here's what we need to do:
%
% * Compute the force acting on the photon at the
%   current location. This depends on the 
%   mass of the black hole, and the distance to
%   the center of the black hole.
%
%   F=G*m_0 / (dist^2)
%
% * From the force, we compute acceleration. 
%   normally we would use F=m*a, which gives
%   a=F/m - but photons have no mass. So this
%   doesn't work. The issue is that photons
%   change path because of space getting 
%   bent around the black hole so F=ma
%   does not apply here. Instead, our
%   approximation makes simply
%
%   a=F/c;
%
%  % With acceleration we can compute velocity
%    by multiplying a by a small time step,
%    however, at the speeds the photon is
%    travelling we won't get to see anything
%    (for fun, see how long it takes a photon
%    to zip by a black hole with a .5m diameter)
%    So, instead, we'll change the *direction*
%    the photon is travelling directly
%
%    d=d+(a*time_step/c)*d_h*k
%
%    Where d_h is a *unit* vector in the direction
%    of the black hole. Note we divide by c
%    again to account for the photon travelling
%    at speed c
%
%    k in the equation above is a 'fudge factor'
%    (set below to 1). It is there so you can
%    exaggerate the effect of the gravitational
%    curving if you want to do so. Leave it
%    at 1 to work with the equations as they 
%    are and also for the plots for your 
%    assignment!
%
%   * Finally, we use this direction vector to
%     find the next position of the photon
%     using out standard ray equation and the
%     specified time_step.
%
% Your task: Implement the above and plot the path
% of a ray given by the specified p and d in a
% space where a black hole is located at p_0 with
% radius d_0
%
% Script by F. Estrada, Aug 2024. 
%
% I did my physics research with help from
% Gemini A.I. - very useful, though it gave
% me code that doesn't work :D - conclusion,
% write your own please!
%

function []=Warped_Rays(p,d,p_0,m_0)

% Set up the gravitational constant G and the speed of light c
G=6.67430e-11;      % m^3*kg^-1*s^-2
c=299792458;        % m*s^-1
k=1;                % Fudge factor
                    % This exists because we can't account
                    % for the real scale of things in space
                    % on this tiny script... so, we'll work
                    % with a tiny, tiny, tiny black hole
                    % which only bends things very little,
                    % Make this larger than 1 to exaggerate
                    % the curvature of the rays

% The radius of the black hole is given by 
r_0=(2*G*m_0)/(c^2);

% Set you up with a figure where you can plot
figure(1);clf;axis equal;grid on;hold on;

% Plot the black hole's boudary so we can see
% what is pulling on the rays

plot(p_0(1),p_0(2),'x','color',[1 0 0],'markersize',14);
for t=0:.01:2*pi
    plot(p_0(1)+(cos(t)*r_0),p_0(2)+(sin(t)*r_0),'.','color',[0 0 0],'markersize',5);
end;

r_prev=p;
d=d/norm(d);

step_size=.01;

for l=0:step_size:10
    
    %%% TO DO
    %%% Implement here the required computations and plot
    %%% the points along the ray - notice that you can't
    %%% use l here as you normally would in a regular ray,
    %%% because the direction is changing. Instead, you are
    %%% computing the next position at a distance of 'step_size'
    %%% from the current one.
    
    %%% IMPORTANT: If the ray hits the black hole, you stop!
    %%% otherwise numerical mayhem will result!
            
    %%% Your updated photon position should be left in a vector
    %%% called 'rn' so it can be plot by the code below!

    dist = norm(p_0 - r_prev);
    if dist < r_0
        break;
    end
    F = G*m_0 / (dist^2);
    a = F/c;
    d_h = (p_0 - r_prev) / norm(p_0 - r_prev);
    d = d + (a*step_size/c)*d_h*k;
    d = d/norm(d);
    rn = r_prev + step_size*d;
    
    plot(rn(1),rn(2),'.','color',[0 0 1],'markersize',5); drawnow;
    r_prev=rn;
end;

