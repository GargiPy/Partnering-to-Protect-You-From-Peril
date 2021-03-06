# Partnering-to-Protect-You-From-Peril
To understand the partnerships underlying the public health response to emergencies, 
let's examine the network of local health departments and 
identify key health departments and gaps in the network at the national, regional, and state levels.

1. Ebola, hurricanes, and forest fires, oh my
Have you ever wondered who keeps an eye on your favorite restaurants to make sure your food is safe? 
Or removes old tires filled with standing water that could attract mosquitos? 
In the US, these tasks are among the services provided by over 2,500 local health departments serving all 
communities across the country. In addition to basic services that keep us safe on a daily basis, 
local health departments also prepare for and respond to large-scale national, regional, and local emergencies.

Health department size and service provision vary widely depending on the needs and size of its 
constituent population, which can range from a few hundred to a few million people. Every few years, 
the National Association of County and City Health Officials (NACCHO) surveys health departments 
about their resources and the services they provide to constituents.

In 2016, the survey asked each health department to identify five health departments 
they connected to the most. Connections among health departments facilitate information 
sharing and coordination of services and are especially important during public health emergencies. 
The Ebola outbreak in 2014, Hurricane Harvey in 2017, and the California wildfires in 2018 are 
examples of national, regional, and state emergencies requiring coordination of public health services.

To understand the partnerships underlying the public health response to emergencies, let's examine 
the network of local health departments and identify key health departments and gaps in the network 
at the national, regional, and state levels.

With more than 2,500 health departments in the US, the national network of partnerships may be large and 
complex. The first step in any analysis is to clean up the data. The health department network shows partnerships, 
which would logically be represented by a single link between any two health departments that partner. 
Local health departments do not typically partner with themselves, so there would be no loops in the network.
After cleaning up the network object, the next step is some exploratory analysis to get to know the network.

In 2014-2016 there was an outbreak of Ebola in West Africa. In late 2014, a case of Ebola was identified in Texas 
and health departments nationwide worked to prepare for the potential of a widespread outbreak. 
While this potential was never realized (there were just 4 cases eventually diagnosed in the US), it isn't 
difficult to imagine a large-scale infectious disease outbreak that requires coordination across the 
country to protect the uninfected and treat the infected.

Central network members can facilitate or control the spread of information and other resources and are 
often considered key or important network members. There are several different types of centrality. 
Two of the more commonly used are degree centrality and betweenness centrality. Degree centrality is a 
count of the number of connections a node has. Betweenness centrality quantifies the extent to which a 
node lies in the shortest path between any two other nodes in the network, often playing a bridging role.

The nodes with the highest degree and betweenness centrality may be key to spreading information and 
coordinating efforts nationwide. Nodes that have both high degree and high betweenness may be especially important.

Some disasters are more regional than national and would not require all health departments across the country to 
be involved. For example, in 2017, Hurricane Harvey poured between 10 and 50 inches of rain in a short period of 
time across parts of southeastern Texas and southwestern Louisiana. This resulted in widespread flooding across 
the region and tested the emergency preparedness of health departments and others. Let's use network methods to 
identify key players.

While collaboration between the states will be challenging with no existing connections, the health departments 
in each state are well connected to each other. We can use degree centrality 
and betweenness centrality to find the key health departments in each state should another disaster occur.
gaps in the network across Texas and Louisiana that might suggest new connections to prepare for future events.

We just found several central health departments that were either highly connected (degree centrality) or were 
forming bridges between other health departments (betweenness centrality). 
Visualize these central health departments to get a better idea of their importance and place in the network.

There are national and regional emergencies like Ebola and Hurricane Harvey. There are also state and local 
emergencies like the wildfires in California in 2018. 
We can understand the network and its key players using the same approaches but with a single state network.

In addition to the state attribute, the network object includes several other health department characteristics 
that may be useful in understanding what makes two health departments partner with each other. One of the 
characteristics is rurality, which classifies each health department as rural or urban. Two other characteristics 
are fte, or full-time employees, and leader.tenure, which measures the years the leader has been at the health 
department.

Urban health departments are likely to be in more populated areas and to serve more people. It would make sense 
that urban health departments are more central to the network since they have more resources to use in forming 
and maintaining partnerships. However, rural health departments might have more incentive to partner to fill gaps 
in service provision. Having more full-time employees and stable leadership could also influence the ability of 
health departments to partner.

The health departments with the most connections were a mix of urban and rural for the region.net and cali.net. 
Let's examine urban health departments to determine whether they are more likely to have high betweenness and 
therefore be important to statewide collaboration.
