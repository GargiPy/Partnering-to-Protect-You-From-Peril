# load the libraries
library(readr)
library(dplyr)
library(igraph)
library(ggraph)

# Import the edgelist from the naccho2016clean.csv file
health.dep.edges <- read_csv(file = "datasets/naccho2016clean.csv")

# Import the attributes from the naccho2016att.csv file
health.dep.nodes <- read_csv(file = "datasets/naccho2016att.csv")

# Merge the edgelist and attributes into a network object
health.dep.net <- graph_from_data_frame(d = health.dep.edges, 
                                        vertices = health.dep.nodes, 
                                        directed = FALSE)

# Show the network object
health.dep.net

# Check for loops and multiples
is_simple(health.dep.net)

# Remove loops and multiples
health.dep.net <- simplify(health.dep.net, 
                           remove.multiple = TRUE, 
                           remove.loops = TRUE)

# Check for loops and multiples again
is_simple(health.dep.net)

# Count the number of vertices in the network
( num.health.dep <- vcount(graph = health.dep.net) )

# Count the number of edges in the network
( num.connections <- ecount(graph = health.dep.net) )

# Compute network density 
( net.density <- edge_density(graph = health.dep.net, loops = FALSE) )

# Identify highly connected nodes using degree
health.dep.nodes$health.dep.degree <- degree(health.dep.net)

# List the health departments with the highest degree
arrange(health.dep.nodes, -health.dep.degree)

# Identify bridges nodes using betweenness
health.dep.nodes$health.dep.between <- betweenness(health.dep.net)

# List the health departments with the highest betweenness
arrange(health.dep.nodes, -health.dep.between)

# Subset the network so it includes TX, LA 
region.net <- induced_subgraph(graph = health.dep.net, 
                               vids = which(V(health.dep.net)$state %in% c('LA', 'TX')))

# Find the number of vertices (i.e., network size) using vcount()
( num.health.dep <- vcount(graph = health.dep.net) )

# Use edge_density() to find the density of region.net
( net.density <- edge_density(graph = region.net, loops = FALSE) )

# Plot the network with theme_graph
lhd.net.theme <- ggraph(graph = region.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(color = state)) +
  theme_graph()
lhd.net.theme

# Identify important nodes in each state using degree
region.net$degree <- degree(region.net)

# Get the top degree health depts for each state
( top.degree.LA <- head(sort(region.net$degree[V(region.net)$state == "LA"], 
                             decreasing = TRUE)) )

( top.degree.TX <- head(sort(region.net$degree[V(region.net)$state == "TX"], 
                             decreasing = TRUE)) )


#Iidentify important nodes in each state using betweenness
region.net$between <- betweenness(region.net)

# Get the top betweenness health depts for each state
( top.bet.LA <- head(sort(region.net$between[V(region.net)$state == "LA"], 
                          decreasing = TRUE)) )
( top.bet.TX <- head(sort(region.net$between[V(region.net)$state == "TX"], 
                          decreasing = TRUE)) )

# Add degree to the node attributes
V(region.net)$degree <- degree(region.net)

# plot with node size by degree, color by state, theme graph, Kamada Kawai layout
region.plot.degree <- ggraph(graph = region.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = state, size = degree)) +
  geom_node_text(aes(label = name, size = 1), nudge_y = .25) +
  theme_graph()
region.plot.degree

# Add betweenness to the node attributes
V(region.net)$between <- betweenness(region.net)

# Plot with node size by betweenness, color by state, theme graph, Kamada Kawai layout
region.plot.between <- ggraph(graph = region.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = state, size = between)) +
  geom_node_text(aes(label = name, size = 1), nudge_y = .25) +
  theme_graph()
region.plot.between

# Subset the network so it includes only CA
cali.net <- induced_subgraph(graph = health.dep.net, vids = which(V(health.dep.net)$state %in% "CA"))

# Find the number of vertices (i.e., network size) using vcount()
( num.health.dep <- vcount(graph = cali.net) )

# Use edge_density() to find the density 
( net.density <- edge_density(graph = cali.net, loops = FALSE) )

# Find and sort degree centrality for each health department
( top.cali.degree <- head(sort(degree(cali.net), decreasing = TRUE)) )

# Find and sort betweenness centrality for each health department
( top.cali.between <- head(sort(betweenness(cali.net), decreasing = TRUE)) )

# Fill in the `colour` parameter with the rurality attribute 
# and the `size` parameter with degree to visualize rurality in cali.net
cali.net.rural.deg <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = rurality, size = degree(cali.net))) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.rural.deg

# Fill in the `colour` parameter with the population attribute 
# and the `size` parameter with degree to visualize population in cali.net
cali.net.pop.deg <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = population, size = degree(cali.net))) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.pop.deg

# Fill in the `colour` parameter with the fte attribute and 
# the `size` parameter with degree to visualize fte in cali.net
cali.net.fte.deg <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = fte, size = degree(cali.net))) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.fte.deg

# Compute betweenness for the cali network
V(cali.net)$between <- betweenness(cali.net)

# Plot cali.net with rurality color nodes sized by betweenness
cali.net.rural.bet <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = rurality, size = between)) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.rural.bet

# Plot cali.net with population color nodes sized by betweenness
cali.net.pop.bet <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = population, size = between)) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.pop.bet

# Plot cali.net with fte color nodes sized by betweenness
cali.net.fte.bet <- ggraph(graph = cali.net, layout = "with_kk") +
  geom_edge_link() +
  geom_node_point(aes(colour = fte, size = between)) +
  geom_node_text(aes(label = name, size = 3), nudge_y = .2) +
  theme_graph()
cali.net.fte.bet
?ggraph