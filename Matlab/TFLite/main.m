if not(exist('workspace_created', 'var'))
    % Define all of these variables: 
    % Don't forget to define 'modelPath' in inf_tfl_mat.m
    temp_min = 19.6;
    temp_max = 184.88;
    input = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/X_test_preprocessed.csv');
    output = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/Y_test_preprocessed.csv');
    % Select either 'manual' or 'loop' for variable 'mode'
    mode = 'manual';
    % Specify input_values dimensions (model-dependent configuration)
    dim_1 = 1;
    dim_2 = 35;
    
    index = 1;
    workspace_created = true;
end

if strcmp(mode, 'manual')
    % Load current input_values
    input_values = reshape(input(index,:), [dim_1, dim_2])';
    % Predict label
    label = inf_tfl_mat(input_values);
    output(index);
    % Print prediction and measurement
    fprintf('Modell: Skalierter Wert: %.4f --- Temperaturwert: %.2f\n', label, label * (temp_max - temp_min) + temp_min);
    fprintf('Messung: Skalierter Wert: %.4f --- Temperaturwert: %.2f\n', output(index), output(index) * (temp_max - temp_min) + temp_min);
    
    index = index + 1; 

elseif strcmp(mode, 'loop')
    for index = 1:length(input)
        % Load current input_values
        input_values = reshape(input(index,:), [dim_1, dim_2])';
        % Predict label
        label = inf_tfl_mat(input_values);
        output(index);
        % Print prediction and measurement
        fprintf('Modell: Skalierter Wert: %.4f --- Temperaturwert: %.2f\n', label, label * (temp_max - temp_min) + temp_min);
        fprintf('Messung: Skalierter Wert: %.4f --- Temperaturwert: %.2f\n', output(index), output(index) * (temp_max - temp_min) + temp_min);
    end
end