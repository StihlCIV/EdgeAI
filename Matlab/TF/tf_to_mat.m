% Set the directory path where the trained model is stored
modelDir = 'C:/Users/dx5entre/Documents/Spang/edge-ai/Jupyter/models/Model_113_FCNN';
% Specify the filename of the trained model located in the defined path
modelName = 'Model_113_FCNN_tf_sm';
% Define the .mat filename for the non-quantized model
modelNameMat = 'Model_113_FCNN.mat';
% Define the .mat filename for the quantized model
modelNameMatQuant = 'Model_113_FCNN_Quant.mat';
% Decide whether to apply model quantization
quantizeModel = true;

% Load the trained TensorFlow model from the specified path
modelPath = strcat(modelDir, '/', modelName);
model = importNetworkFromTensorFlow(modelPath);

% Display a summary of the imported model
disp("Display model:");
disp(model);
% Uncomment the following lines to inspect detailed model properties:
disp(model.Layers)
% disp(model.Connections)
% disp(model.Learnables)
% disp(model.State)
% disp(model.InputNames)
% disp(model.OutputNames)

% Run 'deepNetworkDesigner' in Command Window for further model details

% Save model as .mat file
modelPathMat = strcat(modelDir, '/', modelNameMat);
save(modelPathMat, 'model');

if(quantizeModel == true)
    % Quantize model
    % https://de.mathworks.com/help/deeplearning/ref/dlquantizer.html#mw_f5f8dece-ab92-42d3-bd53-61190e7a2af8
    modelQuant = dlquantizer(model, 'ExecutionEnvironment', 'MATLAB');

    % Export the model with quantization details to Simulink
    % https://de.mathworks.com/help/deeplearning/ug/export-quantized-network-to-simulink.html
    prepareNetwork(modelQuant)
    % Load train and test data
    if not(exist('input', 'var'))  
        input_train = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/X_train_preprocessed.csv');
        input_test = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/X_test_preprocessed.csv');
        output_train = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/Y_train_preprocessed.csv');
        output_test = readmatrix('C:/Users/dx5entre/Documents/Spang/edge-ai/data/data_preprocessed/Y_test_preprocessed.csv');
    end
    % https://medium.com/better-ml/quantization-aware-training-qat-vs-post-training-quantization-ptq-cd3244f43d9a
    % Extract a randomized calibration subset from the training dataset
    calibration_size = 100000;
    calibration_indices = randperm(size(input_train, 1), calibration_size);
    calibration = single(input_train(calibration_indices, :));
    calibration_temp = single(output_train(calibration_indices,:));
    % Display the temperature distribution in the calibration dataset
    figure;
    subplot(1,2,1);
    histogram(calibration_temp, 20)
    title('Distribution: Calibration');
    % Extract a randomized validation subset from the test dataset
    validation_size = 10000;
    validation_indices = randperm(size(input_test, 1), validation_size);
    validation_input = single(input_test(validation_indices,:));
    validation_output = single(output_test(validation_indices,:));
    % Display the temperature distribution in the validation dataset
    subplot(1,2,2);
    histogram(validation_output, 20)
    title('Distribution: Validation');
    % Perform quantization
    calResults = calibrate(modelQuant,calibration);
    qMod = quantize(modelQuant);
    qDetails = quantizationDetails(qMod) %#ok<NOPTS>
    % Compare accuracy
    MSE = @(pred, target) mean(abs(pred - target));
    accuracyQuantized = testnet(qMod,validation_input,validation_output, MSE) %#ok<NOPTS>
    accuracyOriginal  = testnet(model,validation_input,validation_output, MSE) %#ok<NOPTS>
    % Export quantized model to simulink
    exportNetworkToSimulink(qMod,ModelName="quantizedModel");
end