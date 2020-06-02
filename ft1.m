function [Y] = ft1 (X)
% Author: Matthew Jennings , Date: 09/12/2019
% Fourier transform function for a 1?dimensional signal.
% Input:
% ? X: a column vector of signal with 2N+1 elements (2N+1 x 1).
%
% Output:
% ? Y: the Fourier transformed signal in the form of a column vector of 2N+1 complex
% elements.
%
% Constraints:
% ? X is a one?dimensional column vector
% ? Do not use the built?in Fourier transform functions from MATLAB
%
% Example use:
% >> t = linspace(?1, 1, 1000);
% >> x = exp(?t.?t/(2?0.2^2));
% >> y = ft1(x);
% >> plot(abs(y));

%Define variables
N = (length(X)-1)/2; %Number of position elements to consider
R_X = real(X); %Split real and imag componants of input vector for speed of computation
I_X = imag(X);

R_Y = zeros(2*N+1,1); %Initialise empty real and imag output vectors
I_Y = zeros(2*N+1,1);

%Compute Discrete Fourier Transform
for a = 1:2*N+1 %Iterate over output vector elements, index a 
    u = a-(N+1); %Convert output array index to coordinates in u space
    for b=1:2*N+1 %Iterate over input vector elements, index b
        x = b-(N+1); %Convert input array index to coordinates in x space
        R_Y(a)= R_Y(a) + R_X(b)*cos(-pi*u*x/N) - I_X(b)*sin(-pi*u*x/N); %Compute summation for output vector elements
        I_Y(a)= R_Y(a) + R_X(b)*sin(-pi*u*x/N) - I_X(b)*cos(-pi*u*x/N);
    end
end

Y = R_Y + I_Y; %Combine real and imag vectors into single complex vector
Y = Y ./ (2*N); % Normalise results (division by 2N)
return
end