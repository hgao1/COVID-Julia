using BioSimulator, BioSimulatorPetriNets
using Plots
model = Network("SIER")

model <= Species("S", 300)
model <= Species("I", 1)
model <= Species("IA", 1)
model <= Species("E", 0)
model <= Species("R", 0)

model <= Species("U", 300)
model <= Species("UE", 0)
model <= Species("UA", 0)
model <= Species("UR", 0)

model <= Reaction("Exposure",  .1,  "S + I --> I + E")
model <= Reaction("Asymptomatic Exposure",  .1,  "S + IA --> UE + E")
model <= Reaction("Infection", .49, "E --> I")
model <= Reaction("Asymptomatic Infection", .1, "E --> IA")
model <= Reaction("Recovery",  .99, "I-->R")
model <= Reaction("Asymptomatic Recovery",  .99, "IA-->R")

model <= Reaction("Unknown Exposure",  .1,  "U + I --> I + UE")
model <= Reaction("Unknown Asymptomatic Exposure",  .1,  "U + IA --> UE + E")
model <= Reaction("Unknown Infection", .49, "UE --> I")
model <= Reaction("Unknown Asymptomatic Infection", .49, "UE --> UA")
model <= Reaction("Unknown Recovery",  .99, "UA --> UR")

#petri_net = construct_petri_net(model)
result = simulate(model, Direct(), tfinal=1000.0, save_points=0:10)
#StepAnticipation(), tfinal= 25.0, save_points = 0:10)


#visualize_petri_net(petri_net, options = "scale = 2") # 1. using BioSimPetrinet object
#visualize_petri_net(model, options = "scale = 2") # 2. using Network object directly
#using TikzGraphs
#visualize_petri_net(petri_net, layout = Layouts.Layered(), options = "scale = 2")
plot(result, xlabel="Time", ylabel="Population", label = ["Susceptible" "Infected" "Infected Asymptomatic" "Exposed" "Recovered" "Unknown" "Unknown Exposed" "Unknown Asymptomatic" "Unknown Recovered"], linewidth=3)
