#!/bin/sh

# -----------------------------------
#  PHASE 0 - create initial par file
# -----------------------------------

mfclo64 yft.frq yft.ini 00.par -makepar

# -----------------------
#  PHASE 1 - initial par
# -----------------------

mfclo64 yft.frq 00.par 01.par -file - <<PHASE1
# Use default quasi-Newton minimizer
  1 351 0
  1 192 0
# Allow all growth parameters to be fixed during control phase
  1 32 7
# Catch conditioned flags
# General activation
  1 373 1  # activate CC with Baranov equation
  1 393 0  # estimate kludged_equilib_coffs and implicit_fm_level_regression_pars
  2 92 2   # specify catch-conditioned option with Baranov equation
# Catch equation bounds
  2 116 300  # value for Zmax_fish in catch equations
  2 189 80   # fraction of Zmax_fish above which penalty is calculated
  1 382 300  # weight for Zmax_fish penalty, set to 300 to avoid triggering Zmax_flag=1
# Deactivate any catch errors flags
  -999 1 0
  -999 4 0
  -999 10 0
  -999 15 0
  -999 13 0
# Survey fisheries defined
# CPUE variation  Index CV   Time varying CV
  -32 94 1        -32 92 29  -32 66 1
  -33 94 1        -33 92 25  -33 66 1
  -34 94 1        -34 92 25  -34 66 1
  -35 94 1        -35 92 25  -35 66 1
  -36 94 1        -36 92 26  -36 66 1
# Grouping flags for survey CPUE
   -1 99 1
   -2 99 2
   -3 99 3
   -4 99 4
   -5 99 5
   -6 99 6
   -7 99 7
   -8 99 8
   -9 99 9
  -10 99 10
  -11 99 11
  -12 99 12
  -13 99 13
  -14 99 14
  -15 99 15
  -16 99 16
  -17 99 17
  -18 99 18
  -19 99 19
  -20 99 20
  -21 99 21
  -22 99 22
  -23 99 23
  -24 99 24
  -25 99 25
  -26 99 26
  -27 99 27
  -28 99 28
  -29 99 29
  -30 99 30
  -31 99 31
  -32 99 32
  -33 99 32
  -34 99 32
  -35 99 32
  -36 99 32
# Recruitment and initial population settings
  1 149 100  # recruitment deviation penalty
  1 400 6    # final six recruitment deviates set to zero
# Fixed terminal recruitments are mean of remaining period (not default geomean)
  1 398 1
  2 177 1           # use old totpop scaling method
  2 32 1            # and estimate totpop parameter
  2 93 4            # set no. of recruitments per year to 4
  2 57 4            # set no. of recruitments per year to 4
  2 94 1 2 128 100  # initial Z = 1.0*M, i.e. initial F = 0
# Movement
  2 69 1
# Likelihood component settings
  1 111 4     # set likelihood function for tags to negative binomial
  1 141 3     # set likelihood function for LF data to normal
  1 139 3     # set likelihood function for WF data to normal
  -999 49 20  # divide LL LF sample sizes by 20
# For longline ALL/WEST/EAST and Index fisheries, reduce sample size in half
# so we aren't double counting sample sizes
   -1 49 40   -1 50 40
   -2 49 40   -2 50 40
   -4 49 40   -4 50 40
   -6 49 40   -6 50 40
   -7 49 40   -7 50 40
   -8 49 40   -8 50 40
  -10 49 40  -10 50 40
  -32 49 40  -32 50 40
  -33 49 40  -33 50 40
  -34 49 40  -34 50 40
  -35 49 40  -35 50 40
  -36 49 40  -36 50 40
# Tag dynamics settings (mixing periods are read from tag flags in ini file)
  1 33 99    # maximum tag reporting rate for all fisheries is 0.99
  1 305 1    # set tag negative binomial overdispersion tau=2, as fish_pars(4)=0
  2 96 12    # pool tags after 12 quarters at liberty
  2 198 1    # activate release group reporting rates
  -999 43 0  # estimate tag variance if = 1
  -999 44 0  # group all tags for variance estimation if = 1
# Grouping of fisheries for tag return data
   -1 32 1
   -2 32 2
   -3 32 3
   -4 32 4
   -5 32 5
   -6 32 6
   -7 32 7
   -8 32 8
   -9 32 9
  -10 32 10
  -11 32 11
  -12 32 12
  -13 32 13
  -14 32 14
  -15 32 14
  -16 32 15
  -17 32 14
  -18 32 14
  -19 32 16
  -20 32 16
  -21 32 14
  -22 32 14
  -23 32 17
  -24 32 18
  -25 32 19
  -26 32 19
  -27 32 20
  -28 32 21
  -29 32 22
  -30 32 21
  -31 32 22
  -32 32 23
  -33 32 23
  -34 32 23
  -35 32 23
  -36 32 23
# Selectivity settings
  -999 3 37  # all selectivities equal for age class 37 and older
  -999 26 2  # let growth variability vary with length
  -999 57 3  # use cubic spline selectivity
  -999 61 4  # with 4 nodes for cubic spline, except for the following fisheries
   -12 61 5  # f12
   -13 61 5  # f13
# Grouping of fisheries with common selectivity
   -1 24 1
   -2 24 2
   -3 24 3
   -4 24 4
   -5 24 5
   -6 24 6
   -7 24 7
   -8 24 8
   -9 24 9
  -10 24 10
  -11 24 11
  -12 24 12
  -13 24 13
  -14 24 14
  -15 24 15
  -16 24 16
  -17 24 17
  -18 24 18
  -19 24 19 # 19 PS ASS 2 has very few samples, link w/fishery 28 PS ASS WEST 4
  -20 24 20 # 20 PS UNA 2 has very few samples, link w/fishery 30 PS UNA WEST 4
  -21 24 21
  -22 24 22
  -23 24 23
  -24 24 24
  -25 24 25
  -26 24 26
  -27 24 27
  -28 24 19 # PS ASS WEST 4
  -29 24 28
  -30 24 20 # PS UNA WEST 4
  -31 24 29
  -32 24 30 # Index fisheries
  -33 24 30
  -34 24 30
  -35 24 30
  -36 24 30
# Non-decreasing selectivity for at least one Index/LL fishery
   -5 16 1
# Make some longline selectivites 0 for first few age classes
   -2 75 2
   -4 75 2
   -5 75 2
   -7 75 2
   -8 75 2
   -9 75 2
  -10 75 2
  -13 16 2  -13 3 24
  -16 16 2  -16 3 12
  -17 16 2  -17 3 12  # PS PH ID weird bump at 110 cm
  -18 16 2  -18 3 12  # PS PH ID weird bump at 110 cm
  -21 16 2  -21 3 12  # force selectivity to 0 for large fish in small DOM fisheries
  -22 16 2  -22 3 12
  -23 16 2  -23 3 12
  -24 16 2  -24 3 24
  -27 16 2  -27 3 24
# Set first age class for PS and PL fisheries to 0 to prevent weird recruitment
  -12 75 1
  -13 75 1
  -14 75 4
  -15 75 4
  -19 75 1
  -20 75 1
  -21 75 1
  -24 75 1
  -25 75 1
  -26 75 1
  -27 75 1
  -28 75 1
  -29 75 1
  -30 75 1
  -31 75 1
  -32 75 4 # Set zero selectivity for first 4 age classes for index disheries
  -33 75 4
  -34 75 4
  -35 75 4
  -36 75 4
# Turn on weighted spline for calculating maturity at age
  2 188 2
# Set Lorenzen M
  2 109 3   # select Lorenzen curve
  1 121 0   # do not estimate Lorenzen scaling parameter
# Truncate tails off size compositions and filter out small samples
  1 311 1   # set tail compression for LF data
  1 301 1   # set tail compression for WF data
  1 313 0   # proportions in compressed tails for LF data
  1 303 0   # proportions in compressed tails for WF data
  1 312 50  # set minimum obs sample size for LF data
  1 302 50  # set minimum obs sample size for WF data
# SD of length at age
  1 34 0    # set to 1 34 1 to run with old variance, as in MFCL 2.1.1.0 and earlier
PHASE1

# ---------
#  PHASE 2
# ---------

mfclo64 yft.frq 01.par 02.par -file - <<PHASE2
  2 113 0  # turn off useless parameter rec_init_diff
  1 1 500  # max evaluations
  1 50 -2  # convergence criterion
PHASE2

# ---------
#  PHASE 3
# ---------

mfclo64 yft.frq 02.par 03.par -file - <<PHASE3
# Orthogonal polynomial recruitment (OPR)
  1 155 72 1 221 72  # set degree for year effect
  1 217 1            # set degree for season effect
  1 216 10           # set degree for region effect
  1 218 10           # set degree for region-season interaction effect
  1 202 2            # do estimate year effect for last year
  1 210 0            # likewise region effect
  1 212 0            # likewise season effect
  1 214 0            # likewise region-season interaction effect
  1 397 1000         # penalise terminal recruitments to the arithmetic mean
# Disable devs parameters (for neatness)
  1 149 0
  1 398 0
  1 400 0
  2 30 1
  2 32 0
  2 70 0
  2 71 0
  2 177 0
  2 178 0
  2 113 0
PHASE3

# ---------
#  PHASE 4
# ---------

mfclo64 yft.frq 03.par 04.par -file - <<PHASE4
  2 68 1   # estimate movement coefficients
  2 27 -1  # penalty wt 0.1 computed against prior
PHASE4

# ---------
#  PHASE 5
# ---------

mfclo64 yft.frq 04.par 05.par -file - <<PHASE5
# Regional-scaling MVN prior
# Phases 1-4 retain CPUE_scaling, phase 5 switches to prior_reg_biomass
# Ungroup index CPUE likelihood and remove grouped-sigma override
  -32 99 32  -32 94 0  # index 1
  -33 99 33  -33 94 0  # index 2
  -34 99 34  -34 94 0  # index 3
  -35 99 35  -35 94 0  # index 4
  -36 99 36  -36 94 0  # index 5
# Ungroup index selectivity for the regional-scaling prior
  -32 24 30  # index 1
  -33 24 31  # index 2
  -34 24 32  # index 3
  -35 24 33  # index 4
  -36 24 34  # index 5
# MFCL reads reg_scaling file when parest flag 77 is > 0
  1 77 50   # mvn regional-scaling penalty weight, cv about 0.1
  1 78 1    # use mean regional-scaling target
  1 79 284  # start reg-scaling prior at period 9, 1954-2024 CPUE covar window
  1 80 0    # end reg-scaling prior at period 292, 1954-2024 CPUE covar window
  1 81 1    # use multivariate-normal reg-scaling penalty
PHASE5

# ---------
#  PHASE 6
# ---------

mfclo64 yft.frq 05.par 06.par -file - <<PHASE6
  1 240 1  # activate model fit to observed age-length data
  1 12 0   # do not estimate L1 growth parameter
  1 13 0   # do not estimate L2 growth parameter
  1 14 0   # do not estimate K growth parameter
PHASE6

# ---------
#  PHASE 7
# ---------

mfclo64 yft.frq 06.par 07.par -file - <<PHASE7
  1 15 1  # estimate overall SD
  1 16 1  # estimate length dependent SD
PHASE7

# ---------
#  PHASE 8
# ---------

mfclo64 yft.frq 07.par 08.par -file - <<PHASE8
  1 173 0  # number of initial age classes that vary from von Bertalanffy
  1 182 0  # penalty on variations from von Bertalanffy
  1 184 0  # do not use variations from von Bertalanffy
PHASE8

# ---------
#  PHASE 9
# ---------

mfclo64 yft.frq 08.par 09.par -file - <<PHASE9
  2 145 1    # penalty on stock-recruit pars
  1 149 0    # penalty for recruitment devs
  2 146 1    # activate estimation of SRR parameter
  2 182 1    # annual SRR
  2 163 0    # alternate parameters for SRR, turn off
  2 147 1    # lag b/w spawning and recruitment
  2 148 20   # years from last year to get average F
  2 155 4    # years from last year to omit from average F
  -999 55 1  # turn on fishery impact analysis
  2 161 1    # activate SRR log-normal bias correction
  2 199 212  # start time period for yield calculation
  2 200 4    # end time for yield calculation/SRR estimation
  2 171 1    # include SRR-based equilibrium recruitment to compute unfished biomass
# Output flags
  1 190 1  # write plot.rep
  1 186 1  # write fishmort and plotq0.rep
  1 187 1  # write temporary_tag_report
  1 188 1  # write ests.rep
  1 189 1  # write .fit files
PHASE9

# ----------
#  PHASE 10
# ----------

mfclo64 yft.frq 09.par 10.par -file - <<PHASE10
  2 145 -1   # use SRR parameters, low penalty for deviation
PHASE10

# ----------
#  PHASE 11
# ----------

mfclo64 yft.frq 10.par 11.par -file - <<PHASE11
  1 12 1    # estimate L1 growth parameter
  1 13 1    # estimate L2 growth parameter
  1 14 1    # estimate K growth parameter
  1 246 1   # produce indepvar.rpt
  1 1 5000  # max evaluations
  1 50 -4   # convergence criterion
PHASE11

# ----------
#  PHASE 12
# ----------

mfclo64 yft.frq 11.par 12.par -file - <<PHASE12
  1 1 30000  # max evaluations
  1 50 -5    # convergence criterion
PHASE12

mfclo64 yft.frq 12.par hessian -switch 2 1 1 1 1 145 1
mfclo64 yft.frq 12.par hessian -switch 2 1 1 1 1 145 5
