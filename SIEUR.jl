using BioSimulator
using Plots
using Interact

model = Network("SIER")
model <= Species("S", 10)
model <= Species("I", 1)
model <= Species("IA", 9)
model <= Species("E", 0)
model <= Species("R", 0)
model <= Species("U", 10)
model <= Species("UE", 0)
model <= Species("UA", 0)
model <= Species("UR", 0)
model <=Reaction("exposure", 0.7, "S + I + IA --> E + I + IA" )
model <= Reaction("lack of tracing", 0.98, "UE + E --> I + IA + UA")
model <= Reaction("getting over it", 0.98, "I + IA--> R")
model <= Reaction("unknown exposure", 0.7, "U + IA + I --> UE + I + IA")
model <= Reaction("undocumented results", 0.98, "UA --> UR")
result = simulate(model, Direct(), tfinal= 100.0,rates_cache = HasRates,
                      save_points = 0:1:1000.0)


#plot(result[1], summary = :trajectory, xlabel= "Time", ylabel= "Population", label = ["S" "I" "IA" "E" "R" "U" "UE" "UA" "UR"])
fig = visualize(model)
