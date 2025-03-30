import numpy as np
import matplotlib.pyplot as plt

def re_deby(x_array,eps_0,eps_inf,tau):
    return eps_inf+(eps_0-eps_inf)/(1+tau*tau+x_array*x_array)

def im_deby(x_array,eps_0,eps_inf,tau):
    return (eps_0-eps_inf)*tau*x_array/(1+tau*tau+x_array*x_array)





