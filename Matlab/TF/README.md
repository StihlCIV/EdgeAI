# Tutorial: Generate C Code from a TensorFlow Model

### Watch the Linked Demo 
- For a visual walkthrough, refer to this official video: [Generate C Code for Deep Learning Networks in Simulink](https://de.mathworks.com/videos/generate-generic-c-c-code-for-deep-learning-networks-in-simulink-1622706081351.html)

## Steps to Follow

### 1. Convert TensorFlow Model to `.mat` File
- Run the script: `tf_to_mat.m`
- This creates a `.mat` file containing your TensorFlow model data
- If enabled, a quantized TensorFlow Lite model is generated and exported to Simulink
  - Ensure that both calibration and validation datasets are properly selected and prepared

### 2. Prepare the Simulink Project
- Open: `tf_to_c_mat.m`
- Update all required variables and configuration parameters
- Run: `tf_to_c_mat.m`
- This sets up the Simulink file: `tf_to_c_sim.slx`

### 3. Integrate the Model in Simulink
- Open `tf_to_c_sim.slx`
- In the `predict` block, specify the file path of the `.mat` file generated in Step 1

### 4. Initialize Variables
- Run `tf_to_c_sim.slx` once to ensure all variables are correctly initialized

### 5. Configure Project Settings
- Configure all model parameters according to the demonstration in the video
- Note: For this tutorial, no hardware board is selected

### 6. Generate C Code
- Right-click on the `predict` block
- Navigate to: `C/C++ Code` → `Build This Subsystem`

### 7. Output Files
- After the build, these files will be generated in your project folder:
  - `Predict0.exe`
  - Model folder: `Predict0_ert_rtw`

### 8. Adapt C Code
- Navigate to `Predict0_ert_rtw/Predict0.h` and `Predict0_ert_rtw/Predict0.c`
- Modify the declaration of the `predict` function: remove the `static` keyword to allow direct usage in Simulink

### 9. Configure Project Settings
- Open the Simulink model: `run_c.slx`
- Follow the steps shown in the tutorial video to locate and access:
  - `Predict0_ert_rtw/Predict0.h`
  - `Predict0_ert_rtw/Predict0.c`

### 10. Run C Code
- In the `C Caller` block, select the `predict` function for execution
  - If needed, specify the correct input dimensions under `Port Specification`
- Run the model and observe the output
- Compare the results to verify correct integration and functionality
- To obtain new input data for inference, run the script `tf_to_c_mat.m` again





