#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)

= Page Rank


== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Idea])
]

#v(1em)

- An Hyperlink that point to me works like a _recommendation_ from other page.

- With more recommendation, more *important* is my page.

- The more important are my recommenders, the more *important* is my page.

#dblock(title: [Rank])[
  A *numeric value* to represent the importance of a page.
]

*We aren't inspecting the content.* We are looking for recommendations



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Probabilistic point of view.])
]

#v(1em)

- We can view the importance of a web page $i$ as the probability that a random surfer on the Internet opens a browser to any page and starts following *hyperlinks* visits $i$.
- Weights on edges in a transition matrix could be assigned in a _probabilistic way_.
- We can model the process as a *random walk* on graphs. Each page has equal probability $frac(1, n)$ to be chosen as a starting point.
- Then, probability that page $i$ is visited after one step is equal to $A x$ and so on.
- The probability that page $i$ will be visited after $k$ steps is equal to $A^k x$.
- That sequence converges to a *unique probabilistic vector* $v^*$ called the _stationary distribution_.
- *This will be our PageRank*.



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical foundation])
]

#v(1em)

- $Pi = (r_i)$ The vector of Rank number, the rank $r_i$ for page $p_i$

- *Each page that point to me, add a fraction of its own rank for my total rank*

- That's means it is a *linear combination*: $r_i = sum_k T_(i k) r_(i k)$

- $T = (t_(i k))$ The transition matrix; and it is stochastic: $sum_k t_(i k) = 1$ (the total rank is conserved).

- *What can we do with this?*



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical foundation])
]

#v(1em)


#dblock(title: [Perron-Frobenius Theorem])[
  - Is about the *eigenvectors* and *eigenvalues* of _non-negative and irreducible matrices_.
  - A matrix is called _non-negative_ if all of its entries are $>= 0$.
  - A matrix is called _irreducible_ if for any of its entries $(i, j)$ there is $k$ such that the $(i, j)$ entry of $A^k$ is *positive*.
  - It says that for $A$ a non-negative and irreducible matrix, it is an _eigenvalue_ $lambda_("max")$ and for all other eigenvalues $lambda$ we have $abs(lambda) <= lambda_("max")$.
  - Moreover, if the sum of all entries of each column of $A$ is $1$, then $lambda_("max") = 1$.
]

But, there is a little problem: *the matrices we obtain from the Web are not always irreducible*



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical foundation - Issue 1])
]

#v(1em)

There could be: *nodes with no outgoing edges*, also called *dangling nodes*.

#align(center)[
  #figure(
    image("images/pagerank-issue-1.png", width: 60%),
  )
]



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical foundation - Issue 2])
]

#v(1em)

There could be: *disconnected components*.

#align(center)[
  #figure(
    image("images/pagerank-issue-2.png", width: 60%),
  )
]



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical foundation - The solution of Page and Brin])
]

#v(1em)

- They propose a fix positive constant $d$ between $0$ and $1$ called the *dampling factor* (with a typical value $d=0.85$).
- This models the random surfer behaviour!
- Now, the _transition matrix_ used to compute PageRank will be a new matrix $M$ such that:

  $ M = d T + frac((1-d), n) E $
  
  with $E$ as a matrix of ones.
- $M$ is called the *Google matrix*.



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

The assumption is the *importance of a page* is given for the *importance of the pages that pointed it*.

$ r_p^((k+1)) = (1-d) frac(1, n) r_p^((k)) + d sum_(forall q, p in P bar q -> p) frac(1, N_q) r_q^((k)) $



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)



$ r_p^((k+1)) = (1-d) frac(1, n) r_p^((k)) + d sum_(forall q, p in P bar q -> p) frac(1, N_q) r_q^((k)) $

Where:
- $r_p$: Importance of page $p$
- $n$: Number of pages in the web graph
- $d$: Probability that the surfer follows some out-links of $q$ when visit that page
- $N_q$: Number of out-links from page $q$
- $r_q$: Importance of page $q$
- $frac(1, N_q)$: Conditional probability of going to another page

*The PageRank is the fixed point value of this recurrence!*



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

In matrix form:
$ Pi^((k+1)) = (d T + (frac(1-d, n)) E) Pi^((k)) $



- $d$: The probability of going out the $n$ node
- $T$: An transition matrix (stochastic) that is interpreted as the transition probability. But in the Google way they consider *equiprobability* $frac(1, N_q)$
- $E$: Is the _1 matrix_. A matrix filled with 1.

*Basically, replace the usual transition matrix with the Google matrix and compute the eigenvector with eigenvalue equal to 1*



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

#dblock(title: [Intuitive Justification])[
  - Thought as a *model of user behavior*.
  - *Random surfer* that keep clicking on links *starting from one random page*, and *some time get bored* and *continue* from other random page.
  - *PageRank* value correspond to the *probability that the random surfer visit the page*.
    - The *stationary probability.*
  - Then the *d parameter* correspond to the *probability to start again from another page*.
]



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

+ Initialize: $Pi^((0)) = (frac(1, n), ..., frac(1, n))$

+ Set $d$, usually $d = 0.85$

+ Calculate: $Pi^((k+1)) = (d T + frac((1-d), n) E) Pi^((k))$

+ If $norm(Pi^((k+1)) - Pi^((k))) < xi$ stop and return.
  Else, $Pi^((k)) = Pi^((k+1))$ and go to the point 3.



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm - Example])
]

#v(1em)

#align(center)[
  #image("images/pagerank-example.png", width: 40%)
]

*Considering the graph above, get its PageRank*



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

#dblock(title: [Disadvantages])[
  - If a page is pointed by another one, it means that the page receives a vote for the PageRank calculus.
  - If a page is pointed by a lot of pages, it means that the page is important.
  - *Only the good pages are pointed by others one*, but:
    - *Reciprocal link*: If the page A links page B, then page B will link page A.
    - *Link Requirements*: Some web pages give electronic gifts, like programs, documents etc., if another page points it.
    - *Near persons community*: For instance, friends and relatives that from their pages point another friend or relative only because of the human relationship between them.
]



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank Algorithm])
]

#v(1em)

- *Not the real Google algorithm.* It is a very carefully hidden secret.
- The original PageRank doesn't consider text content (keywords) on the page. But the real one *does*. The real algorithm also considers *n-grams*
- The real algorithm also considers user behavior. They capture it with:
  - Click on links
  - Google toolbar
  - Google web-accelerator (a Google proxy)
  - Gmail and Youtube



== PageRank
#place(top + left, dx: -2.5em)[
  #subbar([PageRank sensibility and Link spammers])
]

#v(1em)

- Could a group of people artificially reference pages between them in order to increase the rank?
- A *parallel algorithm search for spammer* and lowers its rank.
- The sensibility from a spamming update is:
  
  $ norm(Pi - tilde(Pi))_1 < frac(2d, 1-d) sum_(i in U) r_i $
  
  - $U$: A community of spammers
  - $Pi$: Change on each $i in U$, $r_i$ are the original rank
  - The rank is bound nevertheless any action of a group $U$ of spammers



= HITS

== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([HITS Algorithm Introduction])
]
#v(1em)

- Proposed by John Kleinberg in 1998.
- Stands for Hypertext Induced Topic Search.
- Expand the list of relevant pages returned by a search engine.
- Produce two rankings: Authority ranking and Hub ranking.

#dblock(title: [Assumptions])[
  - A credible page will point to credible pages.
  - Credible pages are pointed by others.
]


*The page ranking depends on the user query and the hyperlink structure that follows from paths of the most credible pages*



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([Authority and Hubs Pages])
]
#v(1em)

#dblock(title: [Definitions])[
  - Authority: A page with many in-links.
  - Hub: A page with many out-links.
]

The idea is that:

- A page may have authoritative content on some topic and thus many people trust it and thus link to it.
- When a user comes to a hub page, he/she will find many useful links wich take him/her to good content pages on the topic.



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([Authority and Hubs Pages])
]
#v(1em)

- If $q$ it is good hub, then $q$ point to many good authority pages $p$.
- If $p$ it is a good authority, then $p$ is pointed by many good hub pages $q$.
- Authorities and Hubs have a *mutual reinforcement* relationship.
- #text(red)[We can give a measure of the quality of _goodness_ for authority and hubs]. We call it: Authority and Hub weight $(a_p, h_q)$

#align(center)[
  #image("images/HubAuthPages.png", width: 45%)
]



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

#dblock(title: [Assumptions])[
  - The authority level (or rank) came from in-edges.
  - A #text(red)[good authority come from good hubs] and #text(blue)[a good hub contains links that point to good authorities].
]

A *simple method* to differentiate the page's relevance is:

- First *assigning non-negative weights*, depending if the page is hub or authoritative. Well, finally the page have both of them.
- Next, the weights are *adjusted by an iterative process* and the *relative page's importance* in the community is calculated.



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

Given a query _q_, HITS collects a set of pages as follows:

+ It send the query _q_ to a search engine system and collects _t_ highest ranked pages, which assume to be highly relevant to the search query. This is called the *root* set _W_.

+ It then grows W by including any page pointed to by a page in W and any page that points to a page in W. It restrict its size by allowing each page in W to bring at most _k_ pages. This set is called  the *base set* _S_.



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

Assuming we have a set $S$ of pages connected where:

- $V$ is the set of pages (or nodes).
- $E$ is the set of directed edges (or links).
- Then $G=(V,E)$
- We use $L$ to denote the adjacency matrix of the graph, where:

#align(center)[
  $
  L = cases(
    1 " if " (i,j) in E,
    0 " otherwise"
  )
  $
]



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

- Let the authority score of the page $i$ be $a(i)$, and the hub score of the page $i$ be $h(i)$.
- The mutual reinforcing relationship of the two scores is represented as:

  #v(2mm)

  #grid(
    columns: (3fr, 7fr),
    gutter: 1em,
    align(center + horizon)[$ a(i) = sum_((j,i) in E) h(j) $],
    align(left + horizon)[The authority score of the page $i$ correspond to the sum of all the hubs that are point to it.]
  )

  #grid(
    columns: (3fr, 7fr),
    gutter: 1em,
    align(center + horizon)[$ h(i) = sum_((i,j) in E) a(j) $],
    align(left + horizon)[The hub score of the page $i$ correspond to the sum of all the authorities it points to.]
  )



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

- Then, we use _*a*_ to denote the column vector with all the authority scores and _*h*_ to denote the column vector with all the hub scores.
- This is equivalent to say:

  $ a = L^T h $
  $ h = L a $

- If we use $a_k$ and $h_k$ to denote authority and hub scores at the _k_-th iteration, the iterative processes are:

  $ a_k = L^T L a_(k-1) <==> a_(k+1) = L^T L a_k $
  $ h_k = L L^T h_(k-a) <==> h_(k+1) = L L^T h_k $



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([HITS Algorithm Steps])
]
#v(1em)

+ Initialize $a=(1,...,1)$ and $h=(1,...,1)$
+ Calculate:
  
  $ a_(k+1) = L^T L a_k $
  $ h_(k+1) = L L^T h_k $
  
+ Normalize $a_k$ and $h_k$
+ Repeat until: $norm(a_(k+1) - a_k)_1 < epsilon_a and norm(h_(k+1) - h_k)_1 < epsilon_h$
  
+ Get the most auth pages and the most hub pages.



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#v(1em)

#align(center)[
  #image("images/HitsAlg1.png", width: 40%)
]



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#v(1em)

#align(center)[
  #image("images/HitsAlg2.png", width: 40%)
]



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([How it works])
]
#v(1em)

By construction of HITS:

- After using the query to extract the pages related with the query's terms, the page's text content is ignored in the page's rank task.
- Being the algorithm purely *hyperlink-based computation*.

#v(2mm)

CLEVER Project (Chakrabarti S.)

- Addresses the problem by considering query's terms in the calculus of the above equations.
- A non-negative weight, whose initial value is basis on the text that surround the hyperlink expression (a tag in HTML)



== HITS Algorithm
#place(top + left, dx: -2.5em)[
  #subbar([Advantages and Disadvantages])
]
#v(1em)

#dblock(title: [Advantages])[
  - Double ranking (by Authority and by Hub).
  - Rank pages according to a query topic.
]

#dblock(title: [Disadvantages])[
  - Doesn't have the anti-spam capability of PageRank.
  - Topic drift.
  - Query-dependence.
  - Query time evaluation.
]



= SALSA

== SALSA
#place(top + left, dx: -2.5em)[
  #subbar([What is it?])
]
#v(1em)

#dblock(title: [Source])[
  "Google's PageRank and Beyond: The Science of Search Engine Rankings". Amy N. Langville and Carl D. Meyer
]

- Proposed by R. Lempel and S. Moran in 2001.
- SALSA stands for Stochastic Approach to Link Structure Analysis.
- Like HITS, SALSA create both Authority and Hub scores for webpages.
- SALSA creates a neighborhood graph showing the closeness between Authority pages and Hub pages.



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([SALSA])
]
#v(1em)

- Rather than forming and adjacency matrix $L$ for the neighborhood graph $N$, a bipartite unidirected graph, denoted $G$, is built.
- G is defined by the sets:
  - $V_h$: Set of Hub nodes (all nodes in $N$ with outdegree > 0).
  - $V_a$: Set of Authority nodes (all nodes in $N$ with indegree > 0).
  - $E$: Set of directed edges in $N$.
- Note that a node in $N$ may be in both $V_h$ and $V_a$.



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([SALSA Example])
]
#v(1em)

#figure(
  image("images/Ngraph.png", width: 60%),
)



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([SALSA Example])
]
#v(1em)

#grid(
  columns: (6fr, 4fr),
  gutter: 1em,
  [
    - From the previous graph, we have that:

      #h(2em) $V_h = \{1, 2, 3, 6, 10\}$
      #h(2em) $V_a = \{1, 3, 5, 6\}$

    - Then, we can create the bipartite undirected graph $G$, as shown.

    - Every directed edge in $E$ is represented by an unidirectedted edge in $G$.
  ],
  figure(
    image("images/Bgraph.png", width: 100%),
  )
)



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([Where does SALSA fit in?])
]
#v(1em)

- Matrices $H$ and $A$ can be derived from the adjacency matrix L used in the HITS and PageRank methods.
- HITS used unweighted matrix $L$.
- PageRank uses a row weighted version of matrix $L$.
- SALSA uses both row and column weighting.



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([How are A and H computed in SALSA?])
]
#v(1em)

To get A and H matrices, we have to calculate normalize versions of $L$:

- Let $L_r$ be $L$ with each nonzero row divided by its row sum.
- Let $L_c$ be $L$ with each nonzero column divided by its column sum.

In the previous example, it will be:

#figure(
    image("images/salsa1.PNG", width: 90%),
  )




== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([How are A and H computed in SALSA?])
]
#v(1em)

- $H$: SALSA’s hub matrix, consists of the nonzero rows and columns of $L_r L_c^T$
- $A$: SALSA’s authority matrix, consists of the nonzero rows and columns of $L_c^T L_r$

#figure(
    image("images/salsa2.PNG", width: 90%),
  )



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([How are A and H computed in SALSA?])
]
#figure(
    image("images/salsa3.PNG", width: 90%),
  )



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method])
]
#v(1em)

- If the bipartite graph $G$ is _connected_, then $A$ and $H$ are both irreductible Markov chains and $pi_h^T$, the stationary vector of $H$, gives the hub scores for the query with neighborhood graph $N$, and $pi_a^T$ gives the authority scores.
- If $G$ is not _connected_, then $A$ and $H$ contain multiple irreducible components. In this case, the global authority and hub scores must be pasted together from the stationary vectors for each individual irreducible component.



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method Example])
]
#v(1em)

#grid(
  columns: (4fr, 6fr),
  gutter: 1em,
  figure(
    image("images/Bgraph.png", width: 100%),
  ),
  [
    - Because $G$ is *not connected*, $A$ and $H$ contain multiple connected components.
    - $H$ contains two connected components:

      #h(2em) $C = \{2\}$
      #h(2em) $D = \{1, 3, 6, 10\}$

    - $A$ contains two connected components:

      #h(2em) $E = \{1\}$
      #h(2em) $F = \{3, 5, 6\}$
  ]
)



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method Example])
]
#v(1em)

#grid(
  columns: (4fr, 6fr),
  gutter: 1em,
  figure(
    image("images/Bgraph.png", width: 100%),
  ),
  [
    - The stationary vectors for the two irreducible components of $H$ are:
      
      #h(2em) $pi_h^T(C) = mat(1)$
      #h(2em) $pi_h^T(D) = mat(1/3, 1/6, 1/3, 1/6)$

    #v(1mm)

    - The stationary vectors for the two irreducible components of $H$ are:
      
      #h(2em) $pi_a^T(E) = mat(1)$
      #h(2em) $pi_a^T(F) = mat(1/3, 1/6, 1/2)$
  ]
)



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method Example])
]
#v(1em)

- Now, we can join the two components together for each matrix.
- We must multiply each entry in the vector by its appropiate weight.



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method Example])
]
#v(1em)

- Thus the global Hub vector is:

  $ pi_h^T = mat(4/5 times 1/3, 1/5 times 1, 4/5 times 1/6, 4/5 times 1/3, 4/5 times 1/6) $

  $ pi_h^T = mat(0.2667, 0.2, 0.1333, 0.2667, 0.1333) $



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([The Power Method Example])
]
#v(1em)

- And the global Authority vector is:

  $ pi_a^T = mat(1/4 times 1, 3/4 times 1/3, 3/4 times 1/6, 3/4 times 1/2) $

  $ pi_a^T = mat(0.25, 0.25, 0.125, 0.375) $



== Other Algorithms
#place(top + left, dx: -2.5em)[
  #subbar([Advantages and Disadvantages of SALSA])
]
#v(1em)

#dblock(title: [Advantages])[
  - Not affected as much my topic drift like HITS.
  - Less affected susceptible to spamming.
  - Dual rank (Authority and Hubs).
]

#dblock(title: [Disadvantages])[
  - Query-dependence.
  - Query time evaluation.
]