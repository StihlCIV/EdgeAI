if not(exist('input', 'var'))  
    % Define path
    input = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/X_test_preprocessed.csv');
     % Specify input_values dimensions (model-dependent configuration)
    dim_1 = 1;
    dim_2 = 35;
    temp_min = 19.6;
    temp_max = 184.88;

    index = 1;
end

input_values = single(reshape(input(index,:), [dim_1, dim_2]));
index = index + 1;