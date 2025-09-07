#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)

= Fundamentals of Web Structure Mining

== Motivation
#place(top + left, dx: -2.5em)[
  #subbar([Pre-1998 Web Search])
]
#h(1em)

- Find all documents for a given *query term*
- Use of _information retrieval_ solutions:
  - Boolean model
  - Vector space model
- Ranking based on _on-page factors_
- *Problem:* Poor quality of search results (order)

Larry Page and Sergey Brin proposed to compute the *absolute quality* of a page called *PageRank* #footnote[
Page, L., Brin, S., Motwani, R., & Winograd, T. (1999). The PageRank citation ranking: Bringing order to the web. Stanford InfoLab.
]

- Based on the _number and quality_ of pages linking to a page (votes)
- _Query-independent_

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Mining hyperlinks])
]
#h(1em)

- It deals with the *mining of the Web hyperlink structure* (inter document structure).
- A Website is represented by a graph of its links, within the site or between sites.
- Facts like the popularity of a Web page can be studied, for instance, if a page is referred by a lot of other pages in the Web.
- The Web link structure allows to develop a notion of hyperlinked communities.
- It can be used by *search engines*, like Google or Yahoo!, in order to get the set of pages more cited for a particular subject.

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Possible Ways])
]
#h(1em)

- To *discover the link structure* of the hyperlinks
  - At the inter-document level
  - To generate structural summary about the Website and Web page.

#dblock(title: "Direction 1")[
Based on the hyperlinks, categorizing the Web pages and generated information.
]

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Possible Ways])
]
#h(1em)

#dblock(title: "Direction 2")[
Discovering the structure of Web document itself.
]

#dblock(title: "Direction 3")[
Discovering the nature of the hierarchy or network of hyperlinks in the Website of a particular domain.
]

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([The idea])
]
#h(1em)

#dblock(title: "Finding *authoritative* Web pages")[
Retrieving pages that are not only relevant, but also of high quality, or *authoritative on the topic*.
]

#dblock(title: "Hyperlinks can infer the *notion of authority*")[
- The Web consists not only of pages, but also of *hyperlinks* pointing from one page to another
- These hyperlinks contain an enormous amount of *latent human annotation*
- A hyperlink pointing to another Web page can be considered as the author's *endorsement* of the other page
]

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Some references])
]
#h(1em)

- Web pages categorization (Chakrabarti, et al. 1998)
- Discovering _micro communities_ on the Web
  - Clever system (Chakrabarti, et al. 1999)
  - PageRank (Brin and Page, 1998)
- Web structure mining: an introduction. DA COSTA, Miguel Gomes; GONG, Zhiguo. In 2005 IEEE International Conference on Information Acquisition. IEEE, 2005. p. 6 pp.
- Web mining overview, techniques, tools and applications: A survey. Kumar, A., & Singh, R. K. (2016). International Research Journal of Engineering and Technology (IRJET), 3(12), 1543–1547.

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([The Mathematical Framework])
]
#h(1em)

- Graph theory
- We define the Web as a *directed graph*

#grid(
  columns: 2,
  gutter: 6em,
  [
    - $P = {p_i}$: Set of pages  
    - $L = P times P$: Set of links  
    - $M_{i,k}$: Adjacency matrix  
    - $H_{i,k}$: Stochastic matrices
      - $sum_{k} H_{i,k} = 1$
  ],
  [
    #figure(
      image("images/dg_example.png", height: 70%),
    )
  ]
)


== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Preparing the mining])
]
#h(1em)

#dblock(title: "Assumptions")[
- Credible sources will mostly point to credible sources
- Names of hyperlinks suggest meaning
- Ranking is a function of the query terms and of the hyperlink structure
]

#dblock(title: "Why this makes sense?")[
- The official Lord of the Rings site will be linked to by most high-quality sites about movies, Lord of the Rings, etc.
- The biggest LoTR fan clubs probably are also frequently linked
- A spammer who adds _Lord of the Rings_ to his/her web site probably won’t have many links to it
]

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#h(1em)

#figure(
  image("images/community.png", height: 80%),
  caption: [Web Community Centers: many web pages go there.]
)

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([An example for a little web community])
]
#h(1em)

#figure(
  image("images/graph1.png"),
)

Let $P = {p_1, ..., p_n}$ be the *set of pages in the Web community*. In this example, $n = 4$.


= Graph Theory

== Graph

#grid(
  columns: 2,
  gutter: 1em,
  [
    - A *graph* is an object that consists of a non-empty set of _vertices_ (or _nodes_) and another set of _edges_ (or _links_).
    - Usually, when building graphs from real-world applications, we refer to them as _networks_.
  ],
  [
    #figure(
      image("images/graph.png"),
      caption: [Source: https://www.geeksforgeeks.org/observations-on-graph/]
    )
  ]
)

== Graph
#place(top + left, dx: -2.5em)[
  #subbar([Real-world examples])
]
#h(1em)

#figure(
      image("images/graph-real-life.png", width: 90%)
)


== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Core idea])
]
#h(1em)

- We say that two vertices $i$ and $j$ of a directed graph are _joined_ or _adjacent_ if there is an edge from $i$ to $j$ or from $j$ to $i$.
- If such an edge exists, then $i$ and $j$ are its _endpoints_.
- If there is an edge from $i$ to $j$, then $i$ is often called _tail_, while $j$ is called _head_.

#figure(
      image("images/directed-graph.png", width: 40%),
      caption: [Source: https://www.researchgate.net/figure/A-directed-graph-with-7-nodes-and-9-edges_fig4_265428782]
)


== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Adjacency matrix])
]
#h(1em)

#grid(
  columns: 2,
  gutter: 1em,
  [
    - There is a strong relation between graphs and matrices.
    - If we have a _directed graph_ with $n$ vertices, then we construct an $n times n$ *adjacency matrix* $A$ associated to it as follows: if there is an edge from node $i$ to node $j$, then we put $1$ as the entry on row $i$, column $j$ of the matrix $A$.
  ],
  [
    #figure(
      image("images/adjacency-example.png"),
    )
  ]
)

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Adjacency matrix (2)])
]
#h(1em)

#grid(
  columns: 2,
  gutter: 1em,
  [
    - If we can walk from node $i$ to node $j$ along the edges of the graph, then we say that there is a *path* from $i$ to $j$.
    - If we walked on $k$ edges, then the path has length $k$.
    - We can denote $A^k$ the matrix obtained by multiplying $A$ with itself $k$ times.
    - Now, given $A^2$ as the square of the adjacency matrix, the entry on row $i$ and column $j$ corresponds to the number of paths of length $2$ from node $i$ to node $j$ in the graph.
  ],
  [
    #figure(
      image("images/adjacency2-example.png"),
    )
  ]
)

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Connected and Strongly Connected])
]
#h(1em)

- A matrix is called *primitive* if there is a positive integer $k$ such that $A^k$ is a positive matrix.
- A graph is called *connected* if for any two different nodes $i$ and $j$ there is a directed path either from $i$ to $j$ or from $j$ to $i$.
- On the other hand, a graph is called *strongly connected* if starting at any node $i$ we can reach any other different node $j$ by walking on its edges.
- This means that if there is a positive integer $k$ such that the matrix $B = I + A + A^2 + ... + A^k$ is positive, then the graph is *strongly connected* (we consider $I$ to deal with edges from a vertex to itself).

#bblock[
    In other words, if there is at least one path from node $i$ to node $j$ of length at most $k$, then we can travel from node $i$ to $j$.
  ]

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Connected and Strongly Connected (2)])
]
#h(1em)

- If matrix $B$ has a positive entry on row $i$ and column $j$ then it's possible to reach node $j$ starting from $i$.
- If this happens for all nodes, then the graph is strongly connected.

#figure(
  image("images/all-ways-example.png"),
)

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Indegree and Outdegree])
]
#h(1em)

- The *indegree* of a vertex $i$ is the number of edges for which $i$ is a _head_.
- The *outdegree* of $i$ is the number of edges for which $i$ is a tail.

#figure(
  image("images/indegree-outdegree-example.png", width: 45%),
)

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Transition Matrix])
]
#h(1em)

The *transition matrix* $T$ of a directed graph is defined as:
- If there is an edge from $i$ to $j$ and the outdegree of vertex $i$ is $d_i$, then on column $i$ and row $j$ we put $frac{1}{d_i}$.
- Otherwise, we mark column $i$ and row $j$ with zero.
- Notice that we first look at the column, then at the row.
- We usually write $frac{1}{d_i}$ on the edge going from vertex $i$ to an adjacent vertex $j$, thus obtaining a *weighted graph*.

#bblock[
For a strongly connected graph, the transition matrix is _column-stochastic_.
]

== Directed Graph
#place(top + left, dx: -2.5em)[
  #subbar([Transition Matrix: Weighted graph example])
]
#h(1em)

#figure(
  image("images/weighted-graph-example.png", width: 80%),
)


== About the Transition Matrix

- We use the *transition matrix* to model the behavior of a *random surfer* on a web graph.
- The surfer chooses a page at random, then follows its links to other web pages for as long as he/she wishes.
- At each step, the probability that the surfer moves from $i$ to $j$ is zero if there is no link from $i$ to $j$ and otherwise is $frac{1}{d_i}$, with $d_i$ being the _outdegree_ of vertex $i$.

== About the Transition Matrix (2)

Initially, the probability of each page to be chosen as a starting point is:

$ v = 1 /n mat(1; 1; ⋮; 1) $

At the first step, the probability of each node to be visited after one click is $T v$. Then, at the second step, the probability of each node to be visited after two clicks is $T^2 v$.  
The probability of a page to be visited at step $k$ is thus $T^k v$.

== About the Transition Matrix (3)

If the matrix is _primitive_, _column-stochastic_, then this process converges to a unique _stationary probability distribution_ vector $p$, where:

$ p = 1/n mat(p_1; p_2; ⋮; p_n) $

The meaning of the $i$-th entry of $p$ is that the surfer visits page $i$ at any given time with probability $p_i$.

== Application: Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#h(1em)
- Social networks can be represented as graphs where each node represents a user and each edge represents a connection between users (e.g., friendship, following).
- By analyzing these graphs, we can gain insights into the structure and dynamics of social networks.

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#h(1em)
- Nodes: Users A, B, C, D, E.
- Edges: A-B, A-C, B-C, B-D, C-E.

- *Adjacency Matrix:*

#align(center)[
  #table(
    columns: 6,
    align: center,
    [], [A], [B], [C], [D], [E],
    [A], [0], [1], [1], [0], [0],
    [B], [1], [0], [1], [1], [0],
    [C], [1], [1], [0], [0], [1],
    [D], [0], [1], [0], [0], [0],
    [E], [0], [0], [1], [0], [0],
  )
]

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Community Detection])
]
#h(1em)

*What is Community Detection?*
- Community detection involves identifying groups of users within a network who are more densely connected to each other than to the rest of the network.

*Louvain Algorithm*
- The Louvain algorithm is a popular method for detecting communities. It optimizes modularity to find communities in large networks.

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Community Detection])
]
#h(1em)
#grid(
  columns: 2,
  gutter: 1em,
  [
    *Example*
    - In our graph, A, B, and C might form a community because they are strongly connected.
    - Community detection can be used to segment audiences for targeted content or advertisements.
  ],
  [
    #figure(
      image("images/community_detection_example.png", width: 80%),
    )
  ]
)

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Influence Analysis])
]
#h(1em)

*What is Influence Analysis?*
- Influence analysis identifies key users who play a significant role in spreading information or shaping opinions within the network.

*PageRank and Betweenness Centrality:*
- *PageRank:* Ranks users based on the number and quality of links to their profiles.
- *Betweenness Centrality:* Measures how often a user appears on the shortest path between other users in the network.

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Influence Analysis])
]
#h(1em)


#grid(
  columns: 2,
  gutter: 1em,
  [
    *Example:*
    - In our network, B might have high betweenness centrality, acting as a bridge between multiple users.
    - PageRank can identify influential users who are central to information dissemination.
  ],
  [
    #figure(
      image("images/influence_analysis_example.png", width: 100%),
    )
  ]
)

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Recommendations])
]
#h(1em)


*What are Recommendations?*
- Graph-based recommendations suggest new connections (e.g., friends or followers) based on existing relationships.

*Common Friends:*
- A common approach is to recommend users who share mutual friends with the user.

== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Recommendations])
]
#h(1em)
#grid(
  columns: 2,
  gutter: 1em,
  [
    *Example:*
    - If A and C are friends with B, the system might recommend A and C to become friends.
    - Such recommendations can enhance user engagement and connectivity within the network.
  ],
  [
    #figure(
      image("images/recommendations_example.png", width: 100%),
    )
  ]
)


== Social Networks as Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Recommendations])
]
#h(1em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  align(center)[
    $ L = mat(
      0, 0, 1, 0, 1, 0;
      1, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 1, 1, 0, 0;
      0, 0, 0, 0, 1, 0;
    ) $
  ],
  align(center)[
    $ L_r = mat(
      0, 0, 1/2, 0, 1/2, 0;
      1, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 1, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 1/2, 1/2, 0, 0;
      0, 0, 0, 0, 1, 0;
    ) $
  ],
  align(center)[
    $ L_c = mat(
      0, 0, 1/2, 0, 1/3, 0;
      1, 0, 0, 0, 0, 0;
      0, 0, 0, 0, 1/3, 0;
      0, 0, 0, 0, 0, 0;
      0, 0, 1/2, 1, 0, 0;
      0, 0, 0, 0, 1/3, 0;
    ) $
  ],
)