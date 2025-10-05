#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *


= Web Usage Data - Recommendation Systems


== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]
#v(1em)

- Information overload
  - Many choices available
  - “The paradox of choice” (Jam experiment, choice overload)
- Recommender system
  - Provide aid
  - Set of items + user “context” $->$ selection of items (predicted to be “good” for the user)
- What recommender systems do you know?
- What recommender systems would you like to have?



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([The Paradox of Choice])
]
#v(1em)

#figure(
  image("images/paradox_choice.png", width: 70%),
  caption: [Fuente: _Your Marketing Rules_]
)


== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications])
]
#v(1em)

- Movies, online videos, music.
- Books
- Software (apps)
- Products in general
- People (dating, friends)
- Services (restaurants, accommodation, ...)
- Research articles
- Jokes



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Amazon])
]
#v(1em)

It uses item-to-item collaborative filtering recommendations on most pages of their website and e-mail campaigns.

#figure(
  image("images/AmazonRECSYS.png", width: 45%)
)



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Netflix])
]
#v(1em)

- A data-driven company that leverages recommendation systems to boost customer satisfaction.
- The 75% of Netflix viewing is due to recommendations.
- The Netflix Prize (2009): The most accurate movie recommendation algorithm wins a prize worth \$1,000,000.



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Applications - Spotify])
]
#v(1em)

- _"Discover Weekly"_ which is a personalized list of 30 songs based on users unique music taste.
- _"AI Dj"_ a personalized lineup of music recommendations with generative AI.
- Collaborative filtering: Filtering songs by comparing users’ historical listening data with other users’ listening history.
- Natural language processing: Scraping the Web for information about specific artists and songs.
- Audio file analysis: To analyze the audio file’s characteristics (tempo, loudness, key and time signature) to prepare the recommendations.



== Recommendation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Where's the value in recommendations?])
]
#v(1em)

- Netflix: 2/3 of the movies watched
- Amazon: 35% sales
- Google news: recommendations $->$ 38% more clickthrough



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#v(1em)

#dblock(title: [Definition])[
  A recommendation system (or recommender system) is a class of machine learning that uses data to help predict, narrow down, and find what people are looking for among an exponentially growing number of options (NVIDIA).
]



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Types])
]
#v(1em)

- Collaborative filtering: Considers the information of the user and other similar users.
- Content-based: Uses information about the object and the users past experience.
- Knowledge-based: Uses knowledge about how an object meets a need.
- Community-based: Uses information associated with the users "friends".
- Hybrid approaches: A combination of the previously mentioned approaches.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Functions: Provider's point of view])
]
#v(1em)

- Sell more items.
- Sell more diverse items (long tail)
- Increase user satisfaction, fidelity.
- Better understand what users want.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Functions: User's point of view])
]
#v(1em)

- Looking for something:
  - Find some good items.
  - Find all good items (closer to information retrieval) recommend a sequence, a bundle.
- Just browsing.
- Side-effects (collaborative filtering systems):
  - Express self.
  - Help others.
  - Influence others.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([The Usefulness of Recommendations])
]
#v(1em)

- Implementing recommendations is non-trivial.
- Is it worthwhile? It depends $dots$
  - Is there “large” number of items?
  - Do users know exactly what are they looking for?



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([RecSys and Information Retrieval])
]
#v(1em)

#dblock(title: [Information Retrieval])[
  Is the activity of obtaining information resources relevant to an information need from a collection of information resources (Wikipedia).
]

#dblock(title: [Recommender System])[
  The goal of a Recommender System is to generate meaningful recommendations to a collection of users for items or products that might interest them (Melville, Sindhwani).
]



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([RecSys and Information Retrieval])
]
#v(1em)

- RecSys and IR closely connected (many similar or analogical techniques)
- Different goals:
  - IR – “I know what I’m looking for”
  - RecSys – “I’m not sure what I’m looking for”



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Serendipity])
]
#v(1em)

- Unsought finding: unexpected, but useful result.
- Do not recommend items the user already knows or would find anyway, try something more interesting
- Example – books:
  - I like books by Remarque, Potok, Skacel recommending
  - Another book by Remarque not very useful.
  - Recommending Munro = Serendipity.



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Warning: Implementing Personalized Systems is Difficult])
]
#v(1em)

- (Sometimes) complex algorithms.
- (Always) difficult debugging, testing, evaluation.
  - Personalization $->$ different behaviour for each user
  - Hard to distinguish bugs and surprising results



== Recommender Systems
#place(top + left, dx: -2.5em)[
  #subbar([Collaborative Filtering (CF)])
]
#v(1em)

- The most prominent approach to generate recommendations
  - Used by large, commercial e-commerce sites
  - Well-understood, various algorithms and variations exist
  - Applicable in many domains (book, movies, DVDs, ..)
- Approach
  - Use the _wisdom of the crowd_ to recommend items
- Basic assumption and idea
  - Users give ratings to catalog items (implicitly or explicitly)
  - Customers who had similar tastes in the past, will have similar tastes in the future



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Pure CF Approaches])
]
#v(1em)

- Input
  - Only a matrix of given user–item ratings
- Output types
  - A (numerical) prediction indicating to what degree the current user will like or dislike a certain item
  - A top-N list of recommended items



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([User-based nearest-neighbor collaborative filtering (1)])
]
#v(1em)

- Main idea
  - Given a ratings database and a user $u$, identify other users that had similar preferences to those of $u$ in the past. We refer to these users as _nearest neighbors._
  - Then, for every $p$ item that $u$ has not seen, a prediction is computed based on the ratings for $p$ made by the nearest neighbors.



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([User-based nearest-neighbor collaborative filtering (2)])
]
#v(1em)

- Example: A database of ratings of the current user, Alice, and some other users is given

#align(center)[
  #image("images/user-based-cf-example.png", width: 70%)
]

- Determine whether Alice will like or dislike Item5, which Alice has not yet seen.



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([User-based nearest-neighbor collaborative filtering (3)])
]
#v(1em)

- Some first questions
  - How do we measure similarity?
  - How many neighbors should we consider?
  - How do we generate a prediction from the neighbors' ratings?

#align(center)[
  #image("images/user-based-cf-example.png", width: 70%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Measuring user similarity (1)])
]
#v(1em)

- A popular similarity measure in user-based CF: Pearson correlation
  - $a$, $b$: users
  - $r_(a, p)$: rating of a user $a$ for a item $p$.
  - $P$: set of items, rated both by users $a$ and $b$.
- Possible similarity values between $-1$ and $1$.

$ "sim"(a,b) = frac(sum_(p in P) (r_(a,p) - overline(r)_a) (r_(b,p) - overline(r)_b) , sqrt(sum_(p in P) (r_(a,p) - overline(r)_a)^2) sqrt(sum_(p in P) (r_(b,p) - overline(r)_b)^2)) $



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Measuring user similarity (2)])
]
#v(1em)

- A popular similarity measure in user-based CF: Pearson correlation
  - $a$, $b$: users
  - $r_(a, p)$: rating of a user $a$ for a item $p$.
  - $P$: set of items, rated both by users $a$ and $b$.
- Possible similarity values between $-1$ and $1$.

#align(center)[
  #image("images/user-based-cf-example-2.png", width: 70%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Pearson correlation])
]
#v(1em)

- Takes differences in rating behavior into account

#align(center)[
  #image("images/user-based-cf-pearson.png", width: 50%)
]

- Works well in usual domains, compared with alternative measures, such as cosine similarity



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Making predictions])
]
#v(1em)

*A common prediction function:*

$ "pred"(a,p) = overline(r)_a + frac(sum_(b in N) ["sim"(a, b) * (r_(b, p) - overline(r)_b)], sum_(b in N) "sim"(a, b)) $

- Calculate, whether the neighbors' ratings for the unseen item $i$ are higher or lower than their average
- Combine the rating differences – use the similarity with $a$ as a weight
- Add/subtract the neighbors' bias from the active user's average and use this as a prediction



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Improving the metrics / prediction function])
]
#v(1em)

- Not all neighbor ratings might be equally "valuable"
  - Agreement on commonly liked items is not so informative as agreement on controversial items
  - *Possible solution:* Give more weight to items that have a higher variance
- Case amplification
  - Intuition: Give more weight to "very similar" neighbors, i.e., where the similarity value is close to 1.
- Neighborhood selection
  - Use similarity threshold or fixed number of neighbors



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Memory-based and model-based approaches])
]
#v(1em)

- User-based CF is said to be "memory-based"
  - the rating matrix is directly used to find neighbors / make predictions
  - does not scale for most real-world scenarios
  - large e-commerce sites have tens of millions of customers and millions of items
- Model-based approaches
  - based on an offline pre-processing or "model-learning" phase
  - at run-time, only the learned model is used to make predictions
  - models are updated / re-trained periodically
  - large variety of techniques used
  - model-building and updating can be computationally expensive
  - item-based CF is an example for model-based approaches



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Item-based collaborative filtering])
]
#v(1em)

- Basic idea
  - Use the similarity between items (and not users) to make predictions
- Example:
  - Look for items that are similar to Item5
  - Take Alice's ratings for these items to predict the rating for Item5

#align(center)[
  #image("images/item-based-example.png", width: 60%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Item-based collaborative filtering])
]
#v(1em)

- Produces better results in item-to-item filtering
- Ratings are seen as vector in n-dimensional space
- Similarity is calculated based on the angle between the vectors

  $ "sim"(arrow(a), arrow(b)) = (arrow(a) dot arrow(b)) / (abs(arrow(a)) * abs(arrow(b))) $



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Item-based collaborative filtering])
]
#v(1em)
- Adjusted cosine similarity
  - Take average user ratings into account, transform the original ratings
  - $U$: set of users who have rated both items $a$ and $b$

$ "sim"(a,b) = frac(sum_(u in U) (r_(u,a) - overline(r)_u) (r_(u,b) - overline(r)_u) , sqrt(sum_(u in U) (r_(u,a) - overline(r)_u)^2) sqrt(sum_(u in U) (r_(u,b) - overline(r)_u)^2)) $



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Making predictions])
]
#v(1em)

- A common prediction function:

  $ "pred"(u, p) = frac(sum_(i in "ratedItem"(u)) "sim"(i,p) * r_(u,i), sum_(i in "ratedItem"(u)) "sim"(i,p)) $

- Neighborhood size is typically also limited to a specific size
- Not all neighbors are taken into account for the prediction
- An analysis of the MovieLens dataset indicates that "in most real-world situations, a neighborhood of 20 to 50 neighbors seems reasonable" (Herlocker et al. 2002)



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Pre-processing for item-based filtering])
]
#v(1em)

- Item-based filtering does not solve the scalability problem itself
- Pre-processing approach by Amazon.com (in 2003)
  - Calculate all pair-wise item similarities in advance
  - The neighborhood to be used at run-time is typically rather small, because only items are taken into account which the user has rated
  - Item similarities are supposed to be more stable than user similarities
- Memory requirements
  - Up to $N^2$ pair-wise similarities to be memorized (N = number of items) in theory
  - In practice, this is significantly lower (items with no co-ratings)
  - Further reductions possible
    - Minimum threshold for co-ratings
    - Limit the neighborhood size (might affect recommendation accuracy)



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([More on ratings – Explicit ratings])
]
#v(1em)

- Probably the most precise ratings
- Most commonly used (1 to 5, 1 to 7 Likert response scales)
- Research topics
  - Optimal granularity of scale; indication that 10-point scale is better accepted in movie dom.
  - An even more fine-grained scale was chosen in the joke recommender discussed by Goldberg et al. (2001), where a continuous scale (from −10 to +10) and a graphical input bar were used
    - No precision loss from the discretization
    - User preferences can be captured at a finer granularity
    - Users actually "like" the graphical interaction method
  - Multidimensional ratings (multiple ratings per movie such as ratings for actors and sound)
- Main problems
  - Users not always willing to rate many items $->$ sparse rating matrices
  - How to stimulate users to rate more items?



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([More on ratings – Implicit ratings])
]
#v(1em)

- Typically collected by the web shop or application in which the recommender system is embedded
- When a customer buys an item, for instance, many recommender systems interpret this behavior as a positive rating
- Clicks, page views, time spent on some page, demo downloads …
- Implicit ratings can be collected constantly and do not require additional efforts from the side of the user
- Main problem
  - One cannot be sure whether the user behavior is correctly interpreted
  - For example, a user might not like all the books he or she has bought; the user also might have bought a book for someone else
- Implicit ratings can be used in addition to explicit ones; question of correctness of interpretation



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Data sparsity problems])
]
#v(1em)

- Cold start problem
  - How to recommend new items? What to recommend to new users?
- Straightforward approaches
  - Ask/force users to rate a set of items
  - Use another method (e.g., content-based, demographic or simply non-personalized) in the initial phase
  - Default voting: assign default values to items that only one of the two users to be compared has rated (Breese et al. 1998)
- Alternatives
  - Use better algorithms (beyond nearest-neighbor approaches)
  - Example:
    - In nearest-neighbor approaches, the set of sufficiently similar neighbors might be too small to make good predictions
    - Assume "transitivity" of neighborhoods



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Graph-based methods (1)])
]
#v(1em)

- "Spreading activation" (Huang et al. 2004)
  - Exploit the supposed "transitivity" of customer tastes and thereby augment the matrix with additional information
  - Assume that we are looking for a recommendation for User1
  - When using a standard CF approach, User2 will be considered a peer for User1 because they both bought Item2 and Item4
  - Thus Item3 will be recommended to User1 because the nearest neighbor, User2, also bought or liked it



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Graph-based methods (2)])
]
#v(1em)

- "Spreading activation" (Huang et al. 2004)
  - In a standard user-based or item-based CF approach, paths of length 3 will be considered – that is, Item3 is relevant for User1 because there exists a three-step path (User1–Item2–User2–Item3) between them
  - Because the number of such paths of length 3 is small in sparse rating databases, the idea is to also consider longer paths (indirect associations) to compute recommendations
  - Using path length 5, for instance



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Graph-based methods (2)])
]
#v(1em)
#align(center)[
  #image("images/graph-cf-example.png", width:25%)
]



== Collaborative Filtering 
#place(top + left, dx: -2.5em)[
  #subbar([Graph-based methods (3)])
]
#v(1em)

- "Spreading activation" (Huang et al. 2004)
  - Idea: Use paths of lengths $> 3$ to recommend items
  - Length 3: Recommend Item3 to User1
  - Length 5: Item1 also recommendable

#align(center)[
  #image("images/graph-cf-example-2.png", width: 30%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([More model-based approaches])
]
#v(1em)

- Plethora of different techniques proposed in the last years, e.g.,
  - Matrix factorization techniques, statistics
    - Singular Value Decomposition (SVD), Principal Component Analysis (PCA)
  - Association rule mining
    - Compare: shopping basket analysis
  - Probabilistic models
    - Clustering models, Bayesian networks, probabilistic Latent Semantic Analysis (pLSA)
  - Various other machine learning approaches
- Costs of pre-processing
  - Usually not discussed
  - Incremental updates possible?



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([2000: Application of Dimensionality Reduction in Recommender System, B. Sarwar et al., WebKDD Workshop])
]
#v(1em)

- Basic idea: Trade more complex offline model building for faster online prediction generation
- Singular Value Decomposition for dimensionality reduction of rating matrices
  - Captures important factors/aspects and their weights in the data
  - factors can be genre, actors but also non-understandable ones
  - Assumption that k dimensions capture the signals and filter out noise (K = 20 to 100)
- Constant time to make recommendations
- Approach also popular in IR (Latent Semantic Indexing), data compression,…



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Matrix factorization])
]
#v(1em)

- Informally, the SVD theorem (Golub and Kahan 1965) states that a given matrix $M$ can be decomposed into a product of three matrices as follows

  $ M = U times Sigma times V^T $

- where $U$ and $V$ are called _left_ and _right_ singular vectors and the values of the diagonal of $Sigma$ are called the singular values
- We can approximate the full matrix by observing only the most important features – those with the largest singular values
- In the example, we calculate $U$, $V$ and $Sigma$ (with the help of some linear algebra software) but retain only the two most important features by taking only the first two columns of $U$ and $V^T$



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Example for SVD-based recommendation])
]
#v(1em)

SVD: $M_k = U_k times Sigma_k times V_k^T$

#align(center)[
  #image("images/matrix-cf-example.png", width: 60%)
]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Prediction: $hat(r)_(u i) = overline(r)_u + U_k("Alice") times Sigma_k times V_k^T("EPL")$],
  align(center)[
    #image("images/matrix-cf-example-2.png", width:40%)
  ]
)



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([The projection of $U$ and $V^T$ in the 2 dimensional space ($U_2$, $V_2^T$)])
]
#v(1em)

#align(center)[
  #image("images/matrix-cf-example-3.png", width: 70%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Discussion about dimensionality reduction (Sarwar et al. 2000a)])
]
#v(1em)

- Matrix factorization
  - Generate low-rank approximation of matrix
  - Detection of latent factors
  - Projecting items and users in the same n-dimensional space
- Prediction quality can decrease because…
  - the original ratings are not taken into account
- Prediction quality can increase as a consequence of…
  - filtering out some "noise" in the data and
  - detecting nontrivial correlations in the data
- Depends on the right choice of the amount of data reduction
  - number of singular values in the SVD approach
  - Parameters can be determined and fine-tuned only based on experiments in a certain domain
  - Koren et al. 2009 talk about 20 to 100 factors that are derived from the rating patterns



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Association rule mining])
]
#v(1em)

- Commonly used for shopping behavior analysis
  - aims at detection of rules such as
  - "If a customer purchases beer then he also buys diapers in 70% of the cases"
- Association rule mining algorithms
  - can detect rules of the form $X -> Y$ (e.g. beers $->$ diapers) from a set of sales transactions $D = \{t_1, t_2, ..., t_n\}$
  - measure of quality: support, confidence
    - used e.g. as a threshold to cut off unimportant rules
- let $"freq"(X) = \{x | x subset.eq t_i, t_i in D\}$
- $"support" = ("freq"(X union Y))/(abs(D))$, $"confidence" = ("freq"(X union Y))/("freq"(X))$



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Recommendation based on Association Rule Mining])
]
#v(1em)

#grid(
  columns: (7fr, 3fr),
  gutter: 1em,
  [
    - Simplest approach
      - transform 5-point ratings into binary ratings (1 = above user average)
    - Mine rules such as
      - Item1 $->$ Item5
        - support (2/4), confidence (2/2) (without Alice)
    - Make recommendations for Alice (basic method)
      - Determine "relevant" rules based on Alice's transactions (the above rule will be relevant as Alice bought Item1)
      - Determine items not already bought by Alice
      - Sort the items based on the rules' confidence values
    - Different variations possible
      - dislike statements, user associations ...
  ],
  align(center)[
    #image("images/association-rule-cf-example.png", width: 100%)
  ]
)



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Probabilistic methods])
]
#v(1em)

- Basic idea (simplistic version for illustration):
  - given the user/item rating matrix
  - determine the probability that user Alice will like an item $i$
  - base the recommendation on such these probabilities
- Calculation of rating probabilities based on Bayes Theorem
  - How probable is rating value "1" for Item5 given Alice's previous ratings?
  - Corresponds to conditional probability $P("Item5"=1 | X)$, where
    - X = Alice's previous ratings = (Item1 =1, Item2=3, Item3= … )
  - Can be estimated based on Bayes' Theorem

    $ P(Y|X) = (P(X|Y) times P(Y))/(P(X)) $, $ P(Y|X) = (product_(i=1)^d P(X_i|Y) times P(Y))/(P(X)) $

  - Assumption: Ratings are independent (?)



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Probabilistic methods (2)])
]
#v(1em)

#align(center)[
  #image("images/probabilistic-cf-example.png", width: 80%)
]



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Probabilistic methods (3)])
]
#v(1em)

- More to consider
  - Zeros (smoothing required)
  - like/dislike simplification possible



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Practical probabilistic approaches])
]
#v(1em)

- Use a cluster-based approach (Breese et al. 1998)
  - assume users fall into a small number of subgroups (clusters)
  - Make predictions based on estimates
    - probability of Alice falling into cluster $c$
    - probability of Alice liking item $i$ given a certain cluster and her previous ratings
    - $P(C = c, v_1, ..., v_n) = P(C = c) product_(i=1)^n P(v_i|C = c)$
  - Based on model-based clustering (mixture model)
    - Number of classes and model parameters have to be learned from data in advance (EM algorithm)
- Others:
  - Bayesian Networks, Probabilistic Latent, ….
- Empirical analysis shows:
  - Probabilistic methods lead to relatively good results (movie domain)
  - No consistent winner; small memory-footprint of network model



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([RF-Rec predictors (Gedikli et al. 2011)])
]
#v(1em)

- Idea: Take rating frequencies into account for computing a prediction
- Basic scheme: $hat(r)_(u, i) = "argmax"_(v in R) f_"user"(u, v) * f_"item"(i, v)$
  - $R$: Set of all rating values, e.g., $R = \{1,2,3,4,5\}$ on a 5-point rating scale
  - $f_"user"(u,v)$ and $f_"item"$ basically describe how often a rating $v$ was assigned by user $u$ and to item $i$ respectively.
- Example:

  #image("images/rf-rec-cf-example.png", width: 40%)

- $p("Alice", "Item3") = 1$



== Collaborative Filtering
#place(top + left, dx: -2.5em)[
  #subbar([Collaborative Filtering Issues])
]
#v(1em)

- Pros:
  - Well-understood, works well in some domains, no knowledge engineering required
- Cons:
  - Requires user community, sparsity problems, no integration of other knowledge sources, no explanation of results
