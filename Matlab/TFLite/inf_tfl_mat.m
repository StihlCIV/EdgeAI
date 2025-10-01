function label = inf_tfl_mat(input_values)
    persistent net
    if isempty(net)
        % Define path to .tflite model
        modelPath = 'C:/Users/dx5entre/Documents/Spang/edge-ai/Jupyter/models/Model_113_FCNN/Model_113_FCNN.tflite';
        % Load model
        net = loadTFLiteModel(modelPath);
        % Configure model
        net.Mean = 0;
        net.StandardDeviation = 1;
    end
    % Predict label
    label = double(predict(net, input_values));
end
