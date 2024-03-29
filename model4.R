# Title: Modelo with cell death
# Author: Juan Manuel Guti�rrez Garc�a
# Affiliation: Instituto Tecnol�gico de Morelia
# Date: 21/06/20
######################################################################

# establish model
model <-function(time, parms, state) {
        with(as.list(c(parms,state)),{
                
                # specific growth rate
                mu = mu_max*s/(ks + s)
                
                # growth rate
                rx = mu*x
                
                # substrate consumption rate
                rs = (1/Yxs)*rx
                
                # product generation rate
                rp = Ypx*rx
                
                # mass balance for biomass
                dxdt = rx - kd*x
                
                # mass balance for substrate
                dsdt = - rs
                
                # mass balance for product
                dpdt = rp
                
                return(list(c(dxdt,dpdt,dsdt)))
        })
}
