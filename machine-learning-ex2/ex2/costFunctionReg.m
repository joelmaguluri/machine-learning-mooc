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

J=(sum((-y).*log(sigmoid(X*theta))-((1-y).*(log(1-sigmoid(X*theta)))))*1/m)+lambda*1/2*1/m*sum(theta(2:end).^2)

theta(1)=sum((sigmoid(X*theta)-y).*(X(:,1)))*1/m

for i=2:length(m)
grad(i)=sum((sigmoid(X*theta)-y).*(X(:,i)))*1/m+(lambda/m)*theta(i)
endfor


% =============================================================

end
