using BioSimulator, BioSimulatorPetriNets
using Plots
using Interact
m = Network("birth-death process")
m <= Species("X", 5)
m <= Reaction("birth", 1.1, "X --> X + X")
m <= Reaction("death", 1.0, "X --> 0")
#model = Network("SIER")
#model <= Species("S", 10)
#model <= Species("I", 1)
#model <= Species("IA", 1)
#model <= Species("E", 0)
#model <= Species("R", 0)
#model <= Species("U", 10)
#model <= Species("UE", 0)
#model <= Species("UA", 0)
#model <= Species("UR", 0)
#model <=Reaction("exposure", 0.7, "S + I + IA --> E + I + IA" )
#model <= Reaction("lack of tracing", 0.98, "UE + E --> I + IA + UA")
#model <= Reaction("getting over it", 0.98, "I + IA--> R")
#model <= Reaction("unknown exposure", 0.7, "U + IA + I --> UE + I + IA")
#model <= Reaction("undocumented results", 0.98, "UA --> UR")
#result = simulate(model, Direct(), tfinal= 10.0,
                     # save_points = 0:1:100)

p = construct_petri_net(model)
#plot(result, xlabel= "Time", ylabel= "Population", label = ["S" "I" "IA" "E" "R" "U" "UE" "UA" "UR"])
#visualize_petri_net(model, options = "scale = 2")
visualize_petri_net(p, options = "scale = 2")

#using TikzGraphs
