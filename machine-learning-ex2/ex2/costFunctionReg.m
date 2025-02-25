function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

g = sigmoid(X*theta)

shift_X = X
shift_X(:,1) = []

shift_theta = theta
shift_theta([1],:) = []

J = (1/m)*(-y'*log(g)-(1-y)'*(log(1-g))) + lambda/(2*m)*(shift_theta'*shift_theta)


grad_theta_0 = (1/m)*X(:,1)'*(g - y)
 
grad_theta_rest = (1/m)*shift_X'*(g - y) + lambda/m*shift_theta


grad = [grad_theta_0; grad_theta_rest]




% =============================================================

end
