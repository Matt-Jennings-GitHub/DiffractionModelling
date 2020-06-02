%CO32 - Fourier Optics
% Author: Matthew Jennings , Date: 09/12/2019

%3.1 - DFT - Problem B:

%Define Slit Parameters
N = 250; %Number of position elements
slit_height = 1; %Height of slit
slit_width = 20; %Width of slit
slit_pos = 15; %+/- position of slits

%Compute functional form of double slit
X = zeros(N,1); %Initialise empty vector
X([slit_pos-(slit_width/2):slit_pos+(slit_width/2)]) = slit_height; %Insert left-hand slit
X = [flip(X);0;X]; %Use symetry to insert second slit

%Find Fourier Transform of double slit function
Y = ft1(X); %Call discrete fourier transform function
Y = abs(Y); %Extract complex magnitude of output
figure(1) %Display results
plot([-250:250],Y)
title('DFT of double slit (height:0.5 , width: 20 , position: +/-15)')
xlabel('x')
ylabel('Relative Amplitude')

%3.2 - Convolution:

%Define Slit Parameters
N = 250; %Number of position elements
slit_height = 1; %Height of slit
slit_width = 20; %Width of slit

%Compute functional form of central single slit
X = zeros(N,1); %Initialise empty vector
X([1:slit_width/2]) = slit_height; %Insert half of slit
X = [flip(X);slit_height;X]; %Use symetry to complete slit

%Find Convolution of single slit function
w = convolution1(X,X);
w = abs(w); %Extract complex magnitude of output
figure(2); %Display results
plot([-250:250],w);
title('Convolution of two single slits')
xlabel('x')
ylabel('Relative amplitude')

%Verify Convolution theorum
w = ft1(convolution1(X,X)); %LHS of convolution theorum
w = abs(w); %Extract complex magnitude of output
figure(3); %Display results
plot([-250:250],w);
title('Fourier Transform of Convolution of two single slits')
xlabel('x')
ylabel('Relative amplitude')

w = ft1(X).* ft1(X); %RHS of convolution theorum
w = abs(w);
figure(4);%Display results
plot([-250:250],w);
title('Fourier Transform of single slit, squared')
xlabel('x')
ylabel('Relative amplitude')

%4 - Two Dimensional DFT - Problem A

%Define cross-shaped source array
N = 25; %Initialise empty array
M = 25;
X = zeros(2*N+1,2*M+1);
X(25,25) = 1; %Insert cross pattern
X(26,25) = 1;
X(25,26) = 1;
X(24,25) = 1;
X(25,24) = 1;
%Display corss-shaped source
figure(5)
imagesc(X) %Use image scaled-colours for visual display               
axis image
title('Cross-shaped source')

%Compute 2D DFT of corss-shaped source
Y = ft2(X); %Call 2D DFT function
Y = abs(Y); %Extract complex magnitude of output
%Display diffraction pattern
figure(6)
imagesc(Y)
axis image
title('Cross-shaped source diffraction pattern')

%4 - Two Dimensional DFT - Problem D

%Define two slits source array
N = 25; %Initialise empty array
M = 25;
X = zeros(2*N+1,2*M+1);
X(16:36,15:17) = 1; %Insert slits length 20, wdith 3, positions +/- 10
X(16:36,35:37) = 1;
%Display source
figure(7)
imagesc(X) %Use image scaled-colours for visual display                 
axis image
title('Double-slit source')

%Compute 2D DFT of source
Y = ft2(X);
Y = abs(Y); %Extract complex magnitude of output
%Display diffraction pattern
figure(8);
imagesc(Y);
axis image
title('Double-slit source diffraction pattern')







