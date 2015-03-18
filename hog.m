% Based on the "Trainable Classifier-Fusion Schemes: An Application
% To Pedestrian Detection" paper
function descriptor = get_hog_descriptor(image)

% Adjustable parameters
num_bins = 9;
use_grayscale = true;
num_block_x = 3;
num_block_y = 3;

num_rows = size(image,1);
num_cols = size(image,2);

if use_grayscale && size(image,3) == 3
    image = rgb2gray(image);
end
image = double(image);

descriptor = zeros(num_block_x * num_block_y * num_bins, 1);

img_dx = filter2([-1 0 1], image, 'same'); 
img_dy = filter2([-1; 0; 1], image, 'same');

grad_theta = atan2(img_dy, img_dx);
grad_mag = sqrt((img_dy.^2 + img_dx.^2));

step_x = floor(num_cols / (num_block_x+1));
step_y = floor(num_rows / (num_block_y+1));
cont = 0;
for n = 0:num_block_y-1
    for m = 0:num_block_x-1
        cont = cont+1;
        angles2 = grad_theta(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x); 
        magnit2 = grad_mag(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x);
        v_angles = angles2(:);    
        v_magnit = magnit2(:);
        K = max(size(v_angles));
        bin = 0;
        H2 = zeros(num_bins,1);
        for ang_lim = -pi+2*pi/num_bins:2*pi/num_bins:pi
            bin = bin+1;
            idx = find(v_angles < ang_lim); 
            v_angles(idx) = 100;
            H2(bin) = H2(bin) + sum(v_magnit(idx));
        end
                
        H2 = H2/(norm(H2)+0.01);        
        descriptor((cont-1)*num_bins+1:cont*num_bins,1) = H2;
    end
end