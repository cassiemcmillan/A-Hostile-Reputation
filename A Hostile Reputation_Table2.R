install.packages("statnet")
install.packages("ergm")
library(statnet)
library(ergm)


### Part 1: Read in data ###

# See readme for details about each dataset
T2_conflict_binary <- as.matrix(read.csv(file = "war_mat_weight_2001_2014_update_no_miss_8_2021_bin.csv", header = F))
T1_conflict_count <- as.matrix(read.csv(file = "war_mat_weight_1989_2001_update_no_miss_8_2021.csv", header = F)) 
T1_direct_max_hostility <- as.matrix(read.csv(file = "war_max_host_8_2021.csv", header = F))
T2_ally<- as.matrix(read.csv(file = "ally_mat_bin_2001_2010_update_no_miss_8_2021.csv", header = F))
cinc_ratio <- as.matrix(read.csv(file = "cinc_log_ratios_no_miss_8_2021.csv", header = F))
indirect_adversaries <- as.matrix(read.csv(file = "indirect_T1_adversaries.csv", header = F))
att <- as.data.frame(read.csv(file = "indivvarsnumeric_update_no_miss_8_2021.csv", header = T))


### Part 2: Create network object for T2 MIDs ###

T2_conflict_binary_net<-network(T2_conflict_binary, directed = F)

T2_conflict_binary_net %v% "T1_indirect_max_hostility" <- att$T1MaxHost
T2_conflict_binary_net %v% "T1_indirect_max_hostility_sq" <- att$T1MaxHost^2
T2_conflict_binary_net %v% "avg_population" <- att$Avg.Population/100000000 # in 100s of millions
T2_conflict_binary_net %v% "avg_gdp" <- att$AVGGDP/100000000000 # in 100s of billions
T2_conflict_binary_net %v% "sub_region" <- att$Sub.Region.Code
T2_conflict_binary_net %v% "regime_type" <- att$democracy
T2_conflict_binary_net %v% "number_bordering_states" <- att$bortotalavg
T2_conflict_binary_net %v% "development_level" <- att$Dev
T2_conflict_binary_net %v% "major_power" <- att$maj_pow


#### Part 3: Estimate models ###

model1<- ergm(T2_conflict_binary_net ~ 
           + edgecov(T1_direct_max_hostility)
           + nodecov("major_power")
           + nodecov("avg_population")
           + nodecov("avg_gdp")
           + nodecov("number_bordering_states")
           + edgecov(T1_conflict_count)
           + edgecov(T2_ally)
           + edgecov(indirect_adversaries)
           + edgecov(cinc_ratio)
           + nodematch("sub_region")
           + nodematch("regime_type")
           + nodematch("development_level")
           + edges
           + gwesp(0.5, fixed = T)
           + gwdegree(0.25, fixed = T)
           ,control = control.ergm(MCMLE.maxit = 100, seed = 110291))
summary(model1)


model2<- ergm(T2_conflict_binary_net ~ 
              + edgecov(T1_direct_max_hostility)
              + nodecov("T1_indirect_max_hostility")
              + nodecov("major_power")
              + nodecov("avg_population")
              + nodecov("avg_gdp")
              + nodecov("number_bordering_states")
              + edgecov(T1_conflict_count)
              + edgecov(T2_ally)
              + edgecov(indirect_adversaries)
              + edgecov(cinc_ratio)
              + nodematch("sub_region")
              + nodematch("regime_type")
              + nodematch("development_level")
              + edges
              + gwesp(0.5, fixed = T)
              + gwdegree(0.25, fixed = T)
              ,control = control.ergm(MCMLE.maxit = 100, seed = 110291))
summary(model2)


model3<- ergm(T2_conflict_binary_net ~ 
              + edgecov(T1_direct_max_hostility)
              + nodecov("T1_indirect_max_hostility")
              + nodecov("T1_indirect_max_hostility_sq")
              + nodecov("major_power")
              + nodecov("avg_population")
              + nodecov("avg_gdp")
              + nodecov("number_bordering_states")
              + edgecov(T1_conflict_count)
              + edgecov(T2_ally)
              + edgecov(indirect_adversaries)
              + edgecov(cinc_ratio)
              + nodematch("sub_region")
              + nodematch("regime_type")
              + nodematch("development_level")
              + edges
              + gwesp(0.5, fixed = T)
              + gwdegree(0.25, fixed = T)
              ,control = control.ergm(MCMLE.maxit = 100, seed = 110291))
summary(model3)

