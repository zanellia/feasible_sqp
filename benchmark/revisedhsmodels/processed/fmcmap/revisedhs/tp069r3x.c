/*
 *
 * Plain C for FMC.
 *
 */


#include <fmc_h_sys.h>


/*
 *
 * Implements the function `erfc(x)' for the
 * Hock & Schittkowski test problem #69, the derivative included.
 *
 */


/* Function prototypes. */
static fmc_type_float *myerfccoeffs (void);
static fmc_type_float myerfc (fmc_type_tcb *, fmc_type_float);
static fmc_type_float myerfcd (fmc_type_tcb *, fmc_type_float);


/*
 *
 * Wraps the coefficients.
 *
 */


static fmc_type_float *
myerfccoeffs (void)

{

  static fmc_type_float chebyshevcoeffs [78] = {
    1.0e+0, -1.2643020882448196e+00, 0.0e+0, 3.9835571737125333e-01,
    0.0e+0, -2.1359330922567541e-01, 0.0e+0, 1.2894694377099892e-01,
    0.0e+0, -8.0212324799525646e-02, 0.0e+0, 4.9704218472698147e-02,
    0.0e+0, -3.0188171158601639e-02, 0.0e+0, 1.7815143115341888e-02,
    0.0e+0, -1.0164671957976465e-02, 0.0e+0, 5.5911152039523402e-03,
    0.0e+0, -2.9600590223807404e-03, 0.0e+0, 1.5071015467173341e-03,
    0.0e+0, -7.3773072596169888e-04, 0.0e+0, 3.4721228313591845e-04,
    0.0e+0, -1.5717006856687888e-04, 0.0e+0, 6.8459208029230664e-05,
    0.0e+0, -2.8710567801942696e-05, 0.0e+0, 1.1600977868100481e-05,
    0.0e+0, -4.5196810587136284e-06, 0.0e+0, 1.6990748070698774e-06,
    0.0e+0, -6.1680387291051985e-07, 0.0e+0, 2.1639755585128332e-07,
    0.0e+0, -7.3429058392893473e-08, 0.0e+0, 2.4117366900598175e-08,
    0.0e+0, -7.6730587115106464e-09, 0.0e+0, 2.3665041724434005e-09,
    0.0e+0, -7.0804632742396867e-10, 0.0e+0, 2.0565473603524951e-10,
    0.0e+0, -5.8027848559054955e-11, 0.0e+0, 1.5916364458456465e-11,
    0.0e+0, -4.2465933136345151e-12, 0.0e+0, 1.1028017021720276e-12,
    0.0e+0, -2.7891743460082767e-13, 0.0e+0, 6.8742937899811376e-14,
    0.0e+0, -1.6519635328083837e-14, 0.0e+0, 3.8731693038259927e-15,
    0.0e+0, -8.8811690071657826e-16, 0.0e+0, 2.0725831005950576e-16,
    0.0e+0, -4.3236488015163786e-17 };


  /* Finished. */
  return (&chebyshevcoeffs[0]);

  }


/*
 *
 * The function value.
 *
 */


static fmc_type_float
myerfc (fmc_type_tcb *tcb, fmc_type_float x)

{

  fmc_type_float y;


  /* Assert. */
  if (tcb == FMC_CONST_NULLTCB)
    return (fmc_m_notafloat ());


  /* Clamp, as done in `tp069r2'. */
  if (x < (-6.0e+0))
      x = (-6.0e+0) + fmc_m_nanorzero (tcb, x);
    else if (x > 6.0e+0)
      x = 6.0e+0 + fmc_m_nanorzero (tcb, x);


  /* Sum the Chebyshev series. */
  y = fmc_b_chsum0 (tcb, 78, myerfccoeffs (), x / 6.0e+0);


  /* Finished. */
  return (y);

  }


/*
 *
 * The derivative.
 *
 */


static fmc_type_float
myerfcd (fmc_type_tcb *tcb, fmc_type_float x)

{

  fmc_type_float dy;


  /* Assert. */
  if (tcb == FMC_CONST_NULLTCB)
    return (fmc_m_notafloat ());


  /* Clamp, as done in `tp069r2'. */
  if (x < (-6.0e+0))
      x = (-6.0e+0) + fmc_m_nanorzero (tcb, x);
    else if (x > 6.0e+0)
      x = 6.0e+0 + fmc_m_nanorzero (tcb, x);


  /* Sum the 1-st order derivative of a Chebyshev series. */
  dy = fmc_b_chsum1 (tcb, 78, myerfccoeffs (), x / 6.0e+0) / 6.0e+0;


  /* Finished. */
  return (dy);

  }

