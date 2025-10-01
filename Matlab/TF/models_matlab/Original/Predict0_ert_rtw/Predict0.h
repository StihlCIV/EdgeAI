/*
 * File: Predict0.h
 *
 * Code generated for Simulink model 'Predict0'.
 *
 * Model version                  : 1.16
 * Simulink Coder version         : 24.2 (R2024b) 21-Jun-2024
 * C/C++ source code generated on : Wed Jul 16 10:28:13 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex-M
 * Code generation objectives:
 *    1. Execution efficiency
 *    2. RAM efficiency
 * Validation result: Not run
 */

#ifndef Predict0_h_
#define Predict0_h_
#ifndef Predict0_COMMON_INCLUDES_
#define Predict0_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "math.h"
#endif                                 /* Predict0_COMMON_INCLUDES_ */

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM RT_MODEL;

/* External inputs (root inport signals with default storage) */
typedef struct {
  real32_T features[35];               /* '<Root>/features' */
} ExtU;

/* External outputs (root outports fed by signals with default storage) */
typedef struct {
  real32_T dense_4;                    /* '<Root>/dense_4' */
} ExtY;

/* Real-time Model Data Structure */
struct tag_RTM {
  const char_T * volatile errorStatus;
};

/* External inputs (root inport signals with default storage) */
extern ExtU rtU;

/* External outputs (root outports fed by signals with default storage) */
extern ExtY rtY;

/* Model entry point functions */
extern void Predict0_initialize(void);
extern void Predict0_step(void);
// Spang
real32_T predict(const real32_T inputsT_0_f1[35]);

/* Real-time Model object */
extern RT_MODEL *const rtM;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('tf_to_c_sim/Predict')    - opens subsystem tf_to_c_sim/Predict
 * hilite_system('tf_to_c_sim/Predict/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'tf_to_c_sim'
 * '<S1>'   : 'tf_to_c_sim/Predict'
 * '<S2>'   : 'tf_to_c_sim/Predict/MLFB'
 */
#endif                                 /* Predict0_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
