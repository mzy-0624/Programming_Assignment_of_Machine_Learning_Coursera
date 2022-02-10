%% =============== Part 1: Loading movie ratings dataset ================
fprintf('Loading movie ratings dataset.\n\n');
load ('ex8_movies.mat');        %  Load data
fprintf('Average rating for movie 1 (Toy Story): %f / 5\n\n', mean(Y(1, R(1, :))));
imagesc(Y);     %  We can "visualize" the ratings matrix by plotting it with imagesc
ylabel('Movies');
xlabel('Users');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ============ Part 2: Collaborative Filtering Cost Function ===========
load ('ex8_movieParams.mat');   % Load pre-trained weights (X, Theta, num_users, num_movies, num_features)
%  Reduce the data set size so that this runs faster
num_users = 4; 
num_movies = 5; 
num_features = 3;
X     = X    (1 : num_movies, 1 : num_features);
Theta = Theta(1 : num_users,  1 : num_features);
Y     = Y    (1 : num_movies, 1 : num_users);
R     = R    (1 : num_movies, 1 : num_users);
J = cofiCostFunc([X(:) ; Theta(:)], Y, R, num_users, num_movies, num_features, 0);      %  Evaluate cost function
fprintf(['Cost at loaded parameters: %f\n(this value should be about 22.22)\n'], J);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ============== Part 3: Collaborative Filtering Gradient ==============
fprintf('\nChecking Gradients (without regularization) ... \n');
checkCostFunction;      % Check gradients by running checkNNGradients
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ========= Part 4: Collaborative Filtering Cost Regularization ========
J = cofiCostFunc([X(:) ; Theta(:)], Y, R, num_users, num_movies, num_features, 1.5);    % Evaluate cost function
fprintf(['Cost at loaded parameters (lambda = 1.5): %f\n(this value should be about 31.34)\n'], J);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ======= Part 5: Collaborative Filtering Gradient Regularization ======
fprintf('\nChecking Gradients (with regularization) ... \n');
checkCostFunction(1.5);         %  Check gradients by running checkNNGradients
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ============== Part 6: Entering ratings for a new user ===============
movieList = loadMovieList();
my_ratings = zeros(1682, 1);        %  Initialize my ratings
my_ratings(1)   = 4;
my_ratings(98)  = 2;
my_ratings(7)   = 3;
my_ratings(12)  = 5;
my_ratings(54)  = 4;
my_ratings(64)  = 5;
my_ratings(66)  = 3;
my_ratings(69)  = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355) = 5;

fprintf('\n\nNew user ratings:\n');
for i = 1 : length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('Rated %d for %s\n', my_ratings(i), movieList{i});
    end
end
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ================== Part 7: Learning Movie Ratings ====================
fprintf('\nTraining collaborative filtering...\n');
load('ex8_movies.mat'); %  Load data
Y = [my_ratings Y];
R = [(my_ratings ~= 0) R];
[Ynorm, Ymean] = normalizeRatings(Y, R);        %  Normalize Ratings
%  Useful Values
num_users = size(Y, 2);
num_movies = size(Y, 1);
num_features = 10;
% Set Initial Parameters (Theta, X)
X = randn(num_movies, num_features);
Theta = randn(num_users, num_features);
initial_parameters = [X(:); Theta(:)];
options = optimset('GradObj', 'on', 'MaxIter', 100);    % Set options for fmincg
lambda = 10;    % Set Regularization
theta = fmincg (@(t)(cofiCostFunc(t, Ynorm, R, num_users, num_movies, num_features, lambda)), initial_parameters, options);
% Unfold the returned theta back into U and W
X     = reshape(theta(1 : num_movies * num_features), num_movies, num_features);
Theta = reshape(theta(num_movies * num_features + 1 : end), num_users, num_features);
fprintf('Recommender system learning completed.\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;
%% ================== Part 8: Recommendation for you ====================
p = X * Theta';
my_predictions = p(:, 1) + Ymean;
movieList = loadMovieList();
[r, ix] = sort(my_predictions, 'descend');
fprintf('\nTop recommendations for you:\n');
for i = 1 : 10
    j = ix(i);
    fprintf('Predicting rating %.1f for movie %s\n', my_predictions(j), movieList{j});
end
fprintf('\n\nOriginal ratings provided:\n');
for i = 1 : length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('Rated %d for %s\n', my_ratings(i), movieList{i});
    end
end