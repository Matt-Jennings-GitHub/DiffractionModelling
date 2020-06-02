function [w] = convolution1 (u , v)
% Author: Matthew Jennings , Date: 09/12/2019
% Perform convolution of two 1?dimensional signals, u and v
% Input:
% ? u, v: column vectors of signal with 2N+1 elements each (2N+1 x 1).
%
% Output:
% ? w: the convolved signal of u and v with the same size as the input vector, 2N+1 x 1
%
% Constraints:
% ? u and v are one?dimensional vectors of the same size.
% ? Do not use the built?in functions from MATLAB that perform convolution.
%
% Example use:
% >> t = linspace(?1, 1, 1000);
% >> x = exp(?t.?t/(2?0.2^2));
% >> y = ft1(x);
% >> plot(abs(y));

%Find the fourier transform of w from the convultion theorum:
%F.T(convolution(u,v))= F.T(u) x F.T(w)
Fw = ft1(u) .* ft1(v); %Call discrete fourier transform function to find F.T of u and v

%Perform a reverse discrete fourier transform to find w
w = zeros(length(Fw),1); %Initialise empty output vector 
N = (length(w)-1)/2; %Define number of position elements
for a = 1:2*N+1 %Iterate over output vector elements, index a 
    x = a-(N+1); %Convert output array index to coordinates in x space
    for b=1:2*N+1 %Iterate over input vector elements, index b
        u = b-(N+1); %Convert input array index to coordinates in u space
        w(a)= w(a) + Fw(b)*exp(-i*pi*x*u/N); %Compute summation for output vector elements
    end
end

w = w .* (2*N); %Normalise results (division by 2N)

return
end
