function [Y] = ft2 (X)
% Author: Matthew Jennings , Date: 09/12/2019
% Fourier transform function for 2?dimensional signal.
% Input:
% ? X: a matrix of 2D signal with size (2M+1 x 2N+1).
%
% Output:
% ? Y: the Fourier transformed signal in the form of a (2M+1 x 2N+1) matrix with complex
% elements.
%
% Constraints:
% ? X is a two?dimensional matrix.
% ? Do not use the built?in Fourier transform functions from MATLAB.
%
% Example use:
% >> [t0, t1] = meshgrid(linspace(?1, 1, 1000));
% >> x = exp(?(t0.?t0+t1.?t1)/(2?0.2^2));
% >> y = ft2(x);
% >> imagesc(abs(y));

%Define variables
[N,M] = size(X); %Extract input array dimensions
N = (N-1)/2;
M = (M-1)/2;
Y = zeros(2*N+1,2*M+1); %Initialise empty output array

%Compute Discrete 2D Fourier Transform
for a = 1:2*N+1 %Iterate over output array rows, index a 
    v = a-(N+1); %Convert output array row index to coordinates in v space
    for b = 1:2*M+1 %Iterate over output array cols, index b 
        u = b-(M+1); %Convert output array col index to coordinates in u space
        for c = 1:2*N+1 %Iterate over input array row elements, index b
            y = c-(N+1); %Convert input array index to coordinates in y space
            for d = 1:2*M+1 %Iterate over input vector col elements, index b
                x = d-(M+1); %Convert input array index to coordinates in x space
                Y(a,b)= Y(a,b) + X(c,d)*exp(-i*pi*((u*x/M) +(v*y/N))); %Compute double summation for output vector elements
            end
        end
    end
end

Y = Y ./ (4*N*M); %Normalise output (division by 4NM)

return
end