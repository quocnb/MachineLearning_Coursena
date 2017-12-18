function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
min_error = 1;
c_min_index = 1;
sigma_min_index = 1;
for c_index = 1:length(C)
	c_element = C(c_index, 1);
	for sigma_index = 1:length(sigma)
		sigma_element = sigma(sigma_index, 1);
		% Calculator xxx
		model= svmTrain(X, y, c_element, @(x1, x2) gaussianKernel(x1, x2, sigma_element)); 		
		% Predictions
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		if error < min_error
			min_error = error;
			c_min_index = c_index;
			sigma_min_index = sigma_index;
		end	
	end
end
C = C(c_min_index, 1);
sigma = sigma(sigma_min_index, 1);





% =========================================================================

end
