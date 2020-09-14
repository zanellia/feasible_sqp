/*
 *
 * Plain C for FMC.
 *
 */


#include <fmc_h_sys.h>


/*
 *
 * Implements the functions `y2(x1,x2,x3)' ... `y8(x1,x2,x3)' of the
 * Hock & Schittkowski test problem #67, derivatives included.
 * This is a free, more intuitive formulation of #67,
 * without discontinuities, as it would probably be defined
 * by a modeler of our days.
 * The solution is equal to the one obtained with tp067v1,
 * i.e., it is sensible but not exact in the sense of #67.
 *
 */


/* Function prototypes. */
static fmc_type_float tp067v3x (fmc_type_tcb *, fmc_type_float,
  fmc_type_float, fmc_type_float, fmc_type_float, fmc_type_float);
static fmc_type_float tp067v3xf (fmc_type_tcb *, fmc_type_float,
  fmc_type_float, fmc_type_float, fmc_type_float);
static fmc_type_float tp067v3xd (fmc_type_tcb *, fmc_type_float,
  fmc_type_uint, fmc_type_float, fmc_type_float, fmc_type_float);


/*
 *
 * The main entry.
 *
 */


static fmc_type_float
tp067v3x (fmc_type_tcb *tcb, fmc_type_float funcode, fmc_type_float diffcode,
           fmc_type_float x1, fmc_type_float x2, fmc_type_float x3)

{

  fmc_type_float y;


  /* Select. */
  if (diffcode < (-0.5e+0))
      y = fmc_m_notafloat ();
    else if (diffcode < 0.5e+0)
      y = tp067v3xf (tcb, funcode, x1, x2, x3);
    else if (diffcode < 1.5e+0)
      y = tp067v3xd (tcb, funcode, 1, x1, x2, x3);
    else if (diffcode < 2.5e+0)
      y = tp067v3xd (tcb, funcode, 2, x1, x2, x3);
    else if (diffcode < 3.5e+0)
      y = tp067v3xd (tcb, funcode, 3, x1, x2, x3);
    else
      y = fmc_m_notafloat ();


  /* Finished. */
  return (y);

  }


/*
 *
 * The function values.
 *
 */


static fmc_type_float
tp067v3xf (fmc_type_tcb *tcb, fmc_type_float funcode, fmc_type_float x1,
            fmc_type_float x2, fmc_type_float x3)

{

  fmc_type_uint retnanonzero1, retnanonzero2;
  fmc_type_float defect1, y2c, y2, y3, y6, defect1former, comp1, defect2, y4c,
    y4, y5, y8, y7, defect2former, comp2, y;


  /* Assert. */
  if (tcb == FMC_CONST_NULLTCB)
    return (fmc_m_notafloat ());


  /* Perform the first part. */
  retnanonzero1 = 200;
  defect1 = 1.0e+0;
  y2c = 1.6e+0 * x1;
  do {
    y2 = y2c;
    y3 = 1.22e+0 * y2 - x1;
    y6 = (x2 + y3) / x1;
    y2c = 0.01e+0 * x1 * (112.0e+0 + 13.167e+0 * y6 + (-0.6667e+0) * y6 * y6);
    defect1former = defect1;
    defect1 = fmc_m_abs (y2c - y2);
    comp1 = defect1 - 0.001e+0;
    if (fmc_m_isfloat (comp1) == 0)
      (void) fmc_f_fpeflagnan (tcb);
    if (fmc_m_isign3 (comp1) != 1) {
      comp1 = defect1former - defect1;
      if (fmc_m_isfloat (comp1) == 0)
        (void) fmc_f_fpeflagnan (tcb);
      }
    if (fmc_f_fpeerror (tcb) != 0)
      return (fmc_m_notafloat ());
    if (--retnanonzero1 == 0)
      return (fmc_m_notafloat ());
    } while (fmc_m_isign3 (comp1) == 1);


  /* Perform the second part. */
  retnanonzero2 = 200;
  defect2 = 1.0e+0;
  y4c = 93.0e+0;
  do {
    y4 = y4c;
    y5 = 86.35e+0 + 1.098e+0 * y6 + (-0.038e+0) * y6 * y6
       + 0.325e+0 * (y4 - 89.0e+0);
    y8 = 3.0e+0 * y5 - 133.0e+0;
    y7 = 35.82e+0 + (-0.222e+0) * y8;
    y4c = 98000.0e+0 * x3 / (y2 * y7 + 1000.0e+0 * x3);
    defect2former = defect2;
    defect2 = fmc_m_abs (y4c - y4);
    comp2 = defect2 - 0.001e+0;
    if (fmc_m_isfloat (comp2) == 0)
      (void) fmc_f_fpeflagnan (tcb);
    if (fmc_m_isign3 (comp2) != 1) {
      comp2 = defect2former - defect2;
      if (fmc_m_isfloat (comp2) == 0)
        (void) fmc_f_fpeflagnan (tcb);
      }
    if (fmc_f_fpeerror (tcb) != 0)
      return (fmc_m_notafloat ());
    if (--retnanonzero2 == 0)
      return (fmc_m_notafloat ());
    } while (fmc_m_isign3 (comp2) == 1);


  /* Select. */
  if (funcode < 1.5e+0)
      y = fmc_m_notafloat ();
    else if (funcode < 2.5e+0)
      y = y2;
    else if (funcode < 3.5e+0)
      y = y3;
    else if (funcode < 4.5e+0)
      y = y4;
    else if (funcode < 5.5e+0)
      y = y5;
    else if (funcode < 6.5e+0)
      y = y6;
    else if (funcode < 7.5e+0)
      y = y7;
    else if (funcode < 8.5e+0)
      y = y8;
    else
      y = fmc_m_notafloat ();


  /* Finished. */
  return (y);

  }


/*
 *
 * The partial derivatives.
 *
 */


static fmc_type_float
tp067v3xd (fmc_type_tcb *tcb, fmc_type_float funcode, fmc_type_uint diffcode,
            fmc_type_float x1, fmc_type_float x2, fmc_type_float x3)

{

  fmc_type_float dx [4];
  fmc_type_uint dimdx, retnanonzero1, retnanonzero2;
  fmc_type_float defect1, y2c, dy2c, y2, dy2, y3, dy3, y6, dy6, defect1former,
    comp1, defect2, y4c, dy4c, y4, dy4, y5, dy5, y8, dy8, y7, dy7,
    defect2former, comp2, dy;


  /* Assert. */
  if (tcb == FMC_CONST_NULLTCB)
    return (fmc_m_notafloat ());


  /* Initialize the differentials. */
  dimdx = (fmc_type_uint) (sizeof (dx) / sizeof (dx[0]));
  (void) fmc_b_x0init1 (tcb, dimdx, 0.0e+0, &dx[0]);
  if (diffcode < 1 || diffcode > dimdx - 1)
    return (fmc_m_notafloat ());
  dx[diffcode] = 1.0e+0;


  /* Perform the first part. */
  retnanonzero1 = 200;
  defect1 = 1.0e+0;
  y2c = 1.6e+0 * x1;
  dy2c = 1.6e+0 * dx[1];
  do {
    y2 = y2c;
    dy2 = dy2c;
    y3 = 1.22e+0 * y2 - x1;
    dy3 = 1.22e+0 * dy2 - dx[1];
    y6 = (x2 + y3) / x1;
    dy6 = (dx[2] + dy3 - y6 * dx[1]) / x1;
    y2c = 0.01e+0 * x1 * (112.0e+0 + 13.167e+0 * y6 + (-0.6667e+0) * y6 * y6);
    dy2c = 0.01e+0 * dx[1] * (112.0e+0 + 13.167e+0 * y6
                                       + (-0.6667e+0) * y6 * y6)
         + 0.01e+0 * x1 * (13.167e+0 * dy6 + (-1.3334e+0) * y6 * dy6);
    defect1former = defect1;
    defect1 = fmc_m_abs (y2c - y2);
    comp1 = defect1 - 0.001e+0;
    if (fmc_m_isfloat (comp1) == 0)
      (void) fmc_f_fpeflagnan (tcb);
    if (fmc_m_isign3 (comp1) != 1) {
      comp1 = defect1former - defect1;
      if (fmc_m_isfloat (comp1) == 0)
        (void) fmc_f_fpeflagnan (tcb);
      }
    if (fmc_f_fpeerror (tcb) != 0)
      return (fmc_m_notafloat ());
    if (--retnanonzero1 == 0)
      return (fmc_m_notafloat ());
    } while (fmc_m_isign3 (comp1) == 1);


  /* Perform the second part. */
  retnanonzero2 = 200;
  defect2 = 1.0e+0;
  y4c = 93.0e+0;
  dy4c = 0.0e+0;
  do {
    y4 = y4c;
    dy4 = dy4c;
    y5 = 86.35e+0 + 1.098e+0 * y6 + (-0.038e+0) * y6 * y6
       + 0.325e+0 * (y4 - 89.0e+0);
    dy5 = 1.098e+0 * dy6 + (-0.076e+0) * y6 * dy6 + 0.325e+0 * dy4;
    y8 = 3.0e+0 * y5 - 133.0e+0;
    dy8 = 3.0e+0 * dy5;
    y7 = 35.82e+0 + (-0.222e+0) * y8;
    dy7 = (-0.222e+0) * dy8;
    y4c = 98000.0e+0 * x3 / (y2 * y7 + 1000.0e+0 * x3);
    dy4c = (98000.0e+0 * dx[3] -
            y4c * (y2 * dy7 + y7 * dy2 + 1000.0e+0 * dx[3]))
         / (y2 * y7 + 1000.0e+0 * x3);
    defect2former = defect2;
    defect2 = fmc_m_abs (y4c - y4);
    comp2 = defect2 - 0.001e+0;
    if (fmc_m_isfloat (comp2) == 0)
      (void) fmc_f_fpeflagnan (tcb);
    if (fmc_m_isign3 (comp2) != 1) {
      comp2 = defect2former - defect2;
      if (fmc_m_isfloat (comp2) == 0)
        (void) fmc_f_fpeflagnan (tcb);
      }
    if (fmc_f_fpeerror (tcb) != 0)
      return (fmc_m_notafloat ());
    if (--retnanonzero2 == 0)
      return (fmc_m_notafloat ());
    } while (fmc_m_isign3 (comp2) == 1);


  /* Select. */
  if (funcode < 1.5e+0)
      dy = fmc_m_notafloat ();
    else if (funcode < 2.5e+0)
      dy = dy2;
    else if (funcode < 3.5e+0)
      dy = dy3;
    else if (funcode < 4.5e+0)
      dy = dy4;
    else if (funcode < 5.5e+0)
      dy = dy5;
    else if (funcode < 6.5e+0)
      dy = dy6;
    else if (funcode < 7.5e+0)
      dy = dy7;
    else if (funcode < 8.5e+0)
      dy = dy8;
    else
      dy = fmc_m_notafloat ();


  /* Finished. */
  return (dy);

  }

