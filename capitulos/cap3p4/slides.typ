#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *


= Neural Networks and Graphs

== Neural Networks and Graphs
#place(top + left, dx: -2.5em)[
  #subbar([Today's Class])
]
#h(1em)

- *From Traditional AI to Graph AI*: We'll explore the bridge between classic neural networks and the exciting world of graph-structured data.
- *Core Concepts*: Understanding these foundations is key to building modern Graph Machine Learning models.
- *Practical Tools*: We'll look at the main frameworks used in both research and industry.

== Artificial Neural Networks (ANNs)
#place(top + left, dx: -2.5em)[
  #subbar([The Building Blocks of Deep Learning])
]
#h(1em)

- At its core, an ANN is a model made of simple, interconnected units called _neurons_.
- These neurons are organized in sequential _layers_: an input layer, one or more hidden layers, and an output layer.
- Each connection has a learnable *weight* ($W_("ij")^(l)$) and each neuron has a *bias* ($b_i^(l)$).
- *Activation functions* ($f_a$) like ReLU or sigmoid introduce non-linearity, allowing the network to learn complex patterns.

== Artificial Neural Networks (ANNs)
#place(top + left, dx: -2.5em)[
  #subbar([The Power of Depth])
]
#h(1em)

- *Universal Approximation Theorem*: A key concept stating that a neural network with just one hidden layer can, in theory, represent any continuous function.
- *Why Go Deep?* While a "wide" network can approximate any function, "deep" networks (with many layers) are far more efficient at learning.
- Stacking many layers allows the model to learn a hierarchy of features, from simple patterns to complex abstract concepts, leading to better generalization.

== Artificial Neural Networks (ANNs)
#place(top + left, dx: -2.5em)[
  #subbar([The Training Process])
]
#h(1em)

- *The Goal*: To find the optimal set of weights ($W$) and biases ($b$) that allows the network to perform a specific task accurately.
- *The Mechanism*: This is an optimization problem.
  - We define a *Loss Function* that measures the error between the network's prediction and the true target.
  - The famous *backpropagation* algorithm efficiently calculates the gradients (the direction of steepest error increase) for all weights.
  - An optimizer (like Adam) then updates the weights in the opposite direction of the gradient to minimize the loss.

== Computational Frameworks
#place(top + left, dx: -2.5em)[
  #subbar([The Engine Under the Hood])
]
#h(1em)

- *The Computational Graph*: All modern frameworks represent neural networks as a graph where nodes are variables (tensors) and edges are operations. This structure is essential for automatic differentiation (backpropagation).
- *Two Main Paradigms*:
  - *Static Graphs (Define-then-Run)*: You define the entire graph structure first, then execute it with data. It's highly optimizable and great for production.
    - _Example_: TensorFlow (classic).
  - *Dynamic Graphs (Define-by-Run)*: The graph is built on-the-fly as operations are executed. It's more flexible, intuitive, and easier to debug.
    - _Example_: PyTorch.

== Computational Frameworks
#place(top + left, dx: -2.5em)[
  #subbar([TensorFlow & Keras])
]
#h(1em)

- *TensorFlow*:
  - The de facto industry standard for production ML, developed by Google.
  - Highly scalable, running on CPUs, GPUs, and custom hardware like TPUs.
- *Keras API*:
  - The standard high-level API for TensorFlow.
  - Provides a simple, scikit-learn-like interface (`.compile()`, `.fit()`, `.predict()`) that abstracts away low-level complexity.

== Computational Frameworks
#place(top + left, dx: -2.5em)[
  #subbar([PyTorch])
]
#h(1em)

- *PyTorch*:
  - Developed by Meta AI, it has become a favorite in the research community due to its flexibility.
  - Its dynamic graph nature feels more "Pythonic" and intuitive for many developers.
- *Building Models*:
  - Models are defined as classes inheriting from `torch.nn.Module`.
  - The training loop is written explicitly, giving the developer full control over every step.

== From Pixels to Nodes
#place(top + left, dx: -2.5em)[
  #subbar([Introducing Graph Neural Networks (GNNs)])
]
#h(1em)

- The core idea of GNNs is a natural extension of *Convolutional Neural Networks (CNNs)*.
- A CNN operates on regular, grid-like (Euclidean) data like images. It works by aggregating information from a pixel's *local neighborhood*.
- A GNN applies the same principle to irregular, non-Euclidean data like graphs. It aggregates information from a node's *local neighborhood* defined by its connections.
// #figure(
//   // NOTE: Replace "path/to/image.png" with the path to Figure 3.3 from the book.
//   image("path/to/euclidean_vs_non_euclidean.png", width: 70%),
//   caption: [Visual difference between Euclidean and non-Euclidean neighborhoods]
// )

== How GNNs Work
#place(top + left, dx: -2.5em)[
  #subbar([Message Passing])
]
#h(1em)

- At each layer, every node updates its state (or "embedding") by aggregating messages from its direct neighbors.
- This process is often called *message passing*. A simple formulation for a node $i$ at layer $t$ is:
  $ h_i^t = sum_(v_j in N(v_i)) sigma(W h_j^(t-1) + b) $
- After several layers, the final node embedding $Z$ captures both its own features ($X$) and the topology of its surrounding neighborhood ($A$).
  $ Z = "GNN"(X, A) $

== The GNN Ecosystem
#place(top + left, dx: -2.5em)[
  #subbar([Key Frameworks])
]
#h(1em)

- Building GNNs from scratch is complex. Specialized libraries simplify this process:
- *PyTorch Geometric (PyG)*:
  - Built on PyTorch, it's a vast library containing implementations of hundreds of GNN papers and models.
- *Deep Graph Library (DGL)*:
  - A framework-agnostic library (works with PyTorch, TensorFlow) focused on providing efficient and scalable GNN building blocks.
- *StellarGraph*:
  - Built on TensorFlow/Keras, known for its user-friendly API but is no longer actively maintained.

== A Practical Application
#place(top + left, dx: -2.5em)[
  #subbar([Link Prediction with a Graph Auto-Encoder])
]
#h(1em)

- A common task is *link prediction*: predicting if an edge should exist between two nodes.
- One way to solve this is with a *Graph Auto-Encoder (GAE)*.
  - The *Encoder* is a GNN that learns a compressed, low-dimensional embedding ($Z$) for each node.
  - The *Decoder* uses these embeddings to reconstruct the graph's structure. A simple decoder calculates the inner product of node embeddings to predict a link.
    $ A' = Z dot Z^T $
- The model learns by trying to make the reconstructed graph as similar as possible to the original one.

== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([What We've Learned])
]
#h(1em)

- ANNs provide a powerful, general framework for learning from data.
- Deep learning frameworks like TensorFlow and PyTorch make building and training these models accessible.
- GNNs extend these concepts to the graph domain by leveraging neighborhood information.
- Specialized libraries like PyG and DGL are the go-to tools for implementing GNNs in practice.


= Unsupervised Graph Learning

== Unsupervised Graph Learning
#place(top + left, dx: -2.5em)[
  #subbar([The Roadmap])
]
#h(1em)

- *The Goal*: To learn meaningful, low-dimensional representations (embeddings) of nodes, edges, or entire graphs *without using any labels*.

- *The Core Idea*: Learn embeddings that preserve the graph's structure. A good embedding should allow us to reconstruct properties of the original graph, like node similarity.

- *Three Main Approaches We'll Cover*:
  - Shallow Embedding Methods
  - Graph Autoencoders
  - Graph Neural Networks (GNNs)

// #figure(
//   // NOTE: This slide would show Figure 4.1 from the book.
//   image("path/to/figure_4.1.png", width: 70%),
//   caption: [The different families of unsupervised embedding algorithms]
// )

== Shallow Embedding Methods
#place(top + left, dx: -2.5em)[
  #subbar([Learning Direct Representations])
]
#h(1em)

- These are _transductive_ methods: they learn an embedding for each specific node in the input graph.
- They cannot generate embeddings for new nodes without being retrained.
- We will explore two main categories:
  - *Matrix Factorization*: Decompose a matrix representation of the graph (like the adjacency matrix) to find latent features.
  - *Skip-gram*: Use random walks to generate node sequences and learn embeddings by predicting context, inspired by NLP's Word2Vec.

== Shallow Embedding: Matrix Factorization
#place(top + left, dx: -2.5em)[
  #subbar([Decomposing the Graph])
]
#h(1em)

- *Core Idea*: A graph's adjacency matrix $A$ can be approximated by the product of two lower-dimensional matrices: $A "\appx" Y Y^T$. The rows of $Y$ become our node embeddings.
- Different methods use different matrix constructions and loss functions to preserve specific properties:
  - *Graph Factorization (GF)*: A straightforward factorization of the adjacency matrix. Works well for undirected graphs.
  - *HOPE*: Aims to preserve *higher-order proximity* (e.g., 2-hop neighbors). Uses separate source and target embeddings, making it suitable for directed graphs.
  - *GraphRep*: Also captures higher-order proximity by computing and concatenating embeddings for k-step transition probabilities.

== Shallow Embedding: Skip-gram
#place(top + left, dx: -2.5em)[
  #subbar([Learning from Random Walks])
]
#h(1em)

- These methods treat nodes as "words" and random walks as "sentences."
- *The Process*:
  1. Generate many random walks (sequences of nodes) from the graph.
  2. Use a skip-gram model to learn node embeddings by predicting neighboring nodes in the walk.
- *Key Algorithms*:
  - *DeepWalk*: Uses simple, unbiased random walks.
  - *Node2Vec*: Introduces *biased* random walks with parameters `p` (return) and `q` (explore) to balance between capturing local (BFS-like) and global (DFS-like) structure.

== Shallow Embedding: Skip-gram
#place(top + left, dx: -2.5em)[
  #subbar([Extending to Edges and Graphs])
]
#h(1em)

- *Edge2Vec*:
  - Not a new training method, but a way to derive *edge embeddings* from pre-trained node embeddings.
  - Applies a binary operator to the embeddings of the two nodes forming an edge.
  - Common operators: Average, Hadamard (element-wise product), Weighted L1/L2.

- *Graph2Vec*:
  - Learns embeddings for an *entire graph*.
  - It treats a graph as a "document" and its rooted subgraphs as "words."
  - It then uses a Doc2Vec model to learn a vector representation for each graph.

== Graph Autoencoders
#place(top + left, dx: -2.5em)[
  #subbar([Learning to Reconstruct])
]
#h(1em)

- Autoencoders are _inductive_ methods that can learn non-linear transformations.
- *Structure*:
  - An *Encoder* network compresses the input graph (e.g., its adjacency matrix) into a low-dimensional latent vector (the embedding).
  - A *Decoder* network tries to reconstruct the original adjacency matrix from this embedding.
- *The Goal*: The network is trained to minimize the reconstruction error. A good, compact embedding should contain all the necessary information to rebuild the graph.
// #figure(
//   // NOTE: This slide would show Figure 4.14 from the book.
//   image("path/to/figure_4.14.png", width: 70%),
// )

== Graph Autoencoders
#place(top + left, dx: -2.5em)[
  #subbar([Key Considerations])
]
#h(1em)

- *Denoising Autoencoders*: A powerful variation that learns robust representations by training the model to reconstruct the _original_ graph from a _corrupted_ (noisy) input.
- *Challenges for Graphs*:
  - The adjacency matrix is very sparse, so a naive model will just learn to predict zeros.
  - The absence of an edge (a zero) doesn't imply dissimilarity.
- *Solution: Structural Deep Network Embedding (SDNE)*
  - Uses a specialized loss function that penalizes reconstruction errors on existing edges more heavily.
  - Enforces that connected nodes (1st-order proximity) and nodes with similar neighborhoods (2nd-order proximity) have similar embeddings.

== Unsupervised Learning with GNNs
#place(top + left, dx: -2.5em)[
  #subbar([Aggregating Neighborhoods])
]
#h(1em)

- GNNs are naturally _inductive_ and learn by aggregating information from a node's local neighborhood.
- In an unsupervised setting, the goal is still to learn embeddings that capture the graph's structure without labels.
- Two main approaches to graph convolution:
  - *Spectral Convolution*: Defines convolution in the Fourier domain using the graph's Laplacian matrix. Mathematically elegant but can be computationally intensive.
  - *Spatial Convolution*: Defines convolution directly by aggregating feature information from neighbors. This approach is more scalable and widely used.

== Unsupervised Learning with GNNs
#place(top + left, dx: -2.5em)[
  #subbar([GCNs and GraphSAGE])
]
#h(1em)

- *Graph Convolutional Networks (GCNs)*:
  - A popular spectral-based approach.
  - The core idea is to average the feature representations of a node's neighbors (including itself). Stacking layers allows information to propagate further across the graph.

- *GraphSAGE*:
  - A powerful spatial-based approach.
  - Learns an *aggregator function* (e.g., mean, max-pooling) to gather information from a node's neighbors.
  - For unsupervised tasks, it's often trained with a loss function that ensures nearby nodes (identified via random walks) have similar embeddings, while distant nodes have dissimilar ones.

== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Key Takeaways])
]
#h(1em)

- Unsupervised graph learning is about finding low-dimensional representations of graph data without labels.
- We explored three main families of methods:
  - *Shallow Embedding*: Fast and effective but transductive. Learns direct mappings for existing nodes (e.g., `Node2Vec`).
  - *Graph Autoencoders*: Inductive models that learn by trying to reconstruct the graph's structure from a compressed embedding (e.g., `SDNE`).
  - *Graph Neural Networks*: Inductive models that learn node representations by recursively aggregating information from their local neighborhoods (e.g., `GraphSAGE`).



  = Supervised Graph Learning

== Supervised Graph Learning
#place(top + left, dx: -2.5em)[
  #subbar([The Roadmap])
]
#h(1em)

- *The Goal*: To learn a mapping function from input graph data ($x$) to a known output label ($y$).
- This is the most common practical machine learning task.
- We will cover:
  - *Classification*: When the label $y$ is a discrete category (e.g., "is enzyme" vs. "is not enzyme").
  - *Regression*: When the label $y$ is a continuous value (e.g., predicting the number of posts).
  - *Semi-Supervised Learning*: A hybrid approach using a small set of labeled data and a larger set of unlabeled data.

== Supervised Graph Learning
#place(top + left, dx: -2.5em)[
  #subbar([Main Approaches])
]
#h(1em)

- We will explore four main families of supervised methods for graphs:
  - *Feature-Based Methods*: The simplest approach, using graph metrics as features for traditional ML models.
  - *Shallow Embedding Methods*: Transductive methods that propagate labels from known nodes to unknown ones.
  - *Graph Regularization Methods*: Using the graph's structure to constrain and improve the learning process.
  - *Graph Neural Networks (GNNs)*: End-to-end models that learn representations tailored to the prediction task.

// #figure(
//   // NOTE: This slide would show Figure 5.1 from the book.
//   image("path/to/figure_5.1.png", width: 80%),
//   caption: [Hierarchical structure of supervised embedding algorithms]
// )

== Feature-Based Methods
#place(top + left, dx: -2.5em)[
  #subbar([A Simple, Yet Powerful Approach])
]
#h(1em)

- This method acts in two simple steps:
  1. *Feature Extraction*: For each graph or node, compute a set of descriptive structural properties (e.g., average degree, global efficiency, clustering coefficient).
  2. *Traditional ML*: Use these computed properties as a feature vector to train a standard classifier like an *SVM* or *Random Forest*.
- *Pros*:
  - Straightforward to implement.
  - Highly interpretable features.
- *Cons*:
  - Relies heavily on manual *feature engineering*.
  - May fail to capture complex, latent relationships in the data.

== Shallow Embedding Methods
#place(top + left, dx: -2.5em)[
  #subbar([Propagating Information])
]
#h(1em)

- These are _transductive_, semi-supervised algorithms designed for *node classification*.
- The core idea is simple: labels from a few known nodes are "propagated" to their unlabeled neighbors through the graph structure.
- Two key algorithms demonstrate this principle:
  - *Label Propagation*
  - *Label Spreading*

== Shallow Embedding: Label Propagation
#place(top + left, dx: -2.5em)[
  #subbar([Spreading the Truth])
]
#h(1em)

- An iterative algorithm where each node adopts the label that is most common among its neighbors.
- This process repeats until a consensus is reached, and no node changes its label.
- *Key Constraint*: The labels of the initially known nodes are considered "ground truth" and are *fixed*—they cannot be changed during the propagation process.
- *Limitation*: This makes the algorithm very sensitive to noise or errors in the initial labels. An incorrect initial label will propagate its error to its neighbors.

== Shallow Embedding: Label Spreading
#place(top + left, dx: -2.5em)[
  #subbar([A More Flexible Approach])
]
#h(1em)

- An evolution of Label Propagation that addresses its main limitation.
- It *relaxes* the constraint on the initial labels, allowing them to change during the iterative process.
- Introduces a regularization parameter ($alpha$) that balances the influence of two forces:
  - Adhering to the graph structure (information from neighbors).
  - Sticking to the initial label assignment.
- This makes the algorithm more *robust to noisy initial labels*.

== Graph Regularization Methods
#place(top + left, dx: -2.5em)[
  #subbar([Using the Graph as a Constraint])
]
#h(1em)

- This approach integrates the graph structure directly into the model's *loss function*.
- *Core Assumption (Manifold Hypothesis)*: Connected nodes in the graph should have similar predictions or embeddings.
- The total loss function combines two terms:
  $ "Loss" = "Loss"_("supervised") + "Loss"_("graph") $
  - The *supervised loss* ensures the model fits the labeled data.
  - The *graph loss* penalizes the model if connected nodes have dissimilar predictions, enforcing "smoothness."

== Graph Regularization Methods
#place(top + left, dx: -2.5em)[
  #subbar([Manifold Learning & Deeper Architectures])
]
#h(1em)

- *Manifold Regularization*: A classic approach where the graph regularization term is based on the *Laplacian matrix* ($f^T L f$). This is the foundation for models like *LapSVM*.
- *Semi-Supervised Embedding*: Extends this idea to deep learning. Instead of regularizing just the final output, it applies the graph-based constraint to the outputs of *intermediate hidden layers* of a neural network.
- This forces the network to learn embeddings that respect the graph's topology.

== Graph Regularization Methods
#place(top + left, dx: -2.5em)[
  #subbar([Modern Frameworks])
]
#h(1em)

- *Neural Structured Learning (NSL)*: A powerful TensorFlow framework that makes it easy to add graph regularization to _any_ standard neural network with just a few lines of code.
- *Planetoid*: A model that extends skip-gram approaches (like Node2Vec) to a semi-supervised setting. It is trained with a combined loss function:
  - An *unsupervised loss* to preserve graph structure (predicting context in random walks).
  - A *supervised loss* to correctly classify the labeled nodes.

== Supervised Learning with GNNs
#place(top + left, dx: -2.5em)[
  #subbar([End-to-End Learning])
]
#h(1em)

- GNNs provide the most powerful and integrated approach for supervised graph learning.
- The GNN acts as an *encoder*, learning rich feature representations of nodes or graphs that are specifically tailored to the supervised task.
- The final embeddings from the GNN are then passed to a standard classification or regression head (e.g., a Dense layer) to make the final prediction.
- The entire model, from the graph structure to the final prediction, is trained *end-to-end*.

== Supervised Learning with GNNs
#place(top + left, dx: -2.5em)[
  #subbar([Practical Examples])
]
#h(1em)

- *Graph Classification with GCNs*:
  - *Task*: Classify entire graphs (e.g., is a protein an enzyme?).
  - *Example*: On the PROTEINS dataset, a GCN backbone learns graph-level embeddings, which are then processed by 1D convolutional layers to produce a final classification.

- *Node Classification with GraphSAGE*:
  - *Task*: Classify individual nodes within a larger graph (e.g., what is the research topic of a paper in a citation network?).
  - *Example*: On the Cora dataset, a GraphSAGE model learns embeddings for each paper, which are then fed to a Dense layer with a softmax activation for topic classification.

== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Key Takeaways])
]
#h(1em)

- Supervised graph learning leverages known labels to train predictive models.
- We've seen a progression of methods with increasing complexity and power:
  - *Feature-Based*: Simple and interpretable but requires manual effort.
  - *Shallow Embedding*: Effective for semi-supervised node classification by propagating labels.
  - *Graph Regularization*: Improves standard ML models by using the graph as a powerful constraint.
  - *GNNs*: Offer a flexible, end-to-end approach that learns the best features directly from the data for the task at hand.



  = Solving Common Graph ML Problems

== Solving Common Graph ML Problems
#place(top + left, dx: -2.5em)[
  #subbar([Today's Class])
]
#h(1em)

- In this class, we'll move from theory to practice, applying the models we've learned to solve some of the most common and important tasks in the world of graphs.
- We will cover three core problems:
  - *Predicting Missing Links*: Completing a partially known graph.
  - *Detecting Communities*: Finding meaningful clusters and structures.
  - *Measuring Graph Similarity*: Quantifying how alike two graphs are.

== Predicting Missing Links
#place(top + left, dx: -2.5em)[
  #subbar([The Graph Completion Problem])
]
#h(1em)

- *The Goal*: Given a partially observed graph, we want to predict whether a link exists between any two nodes that are not currently connected.
- *Formal Definition*: For a graph $G=(V, E)$, where $E = E_o "\union" E_u$, we use the known links ($E_o$) to predict the unknown ones ($E_u$).
- *Why is this useful?*
  - *Recommender Systems*: Suggesting friends on social media or products on e-commerce sites.
  - *Bioinformatics*: Identifying undiscovered protein-protein interactions.
  - *Criminal Investigations*: Uncovering hidden connections between individuals.

== Predicting Missing Links
#place(top + left, dx: -2.5em)[
  #subbar([Similarity-Based Heuristics])
]
#h(1em)

- The simplest approach is to calculate a *similarity score* for a pair of nodes. A higher score implies a higher probability of a link.
- These methods are fast and intuitive, relying on local neighborhood information.
- *Key Index-Based Methods*:
  - *Resource Allocation Index*: Common neighbors are weighted by their degree. A common neighbor with few connections is more significant.
    $ "RAI"(u,v) = sum_(w in N(u) sect N(v)) 1/|N(w)| $
  - *Jaccard Coefficient*: The ratio of common neighbors to the total number of unique neighbors.
    $ "Jaccard"(u,v) = (|N(u) sect N(v)|) / (|N(u) union N(v)|) $
  - *Community-Based Methods*: These extend the above indices by adding a bonus if the common neighbors belong to the same community.

== Predicting Missing Links
#place(top + left, dx: -2.5em)[
  #subbar([An Embedding-Based Approach])
]
#h(1em)

- We can frame link prediction as a *supervised binary classification task*.
- *The Pipeline*:
  1. *Split Data*: Divide known edges into a training set and a test set. Create negative examples (pairs of nodes with no link).
  2. *Learn Node Embeddings*: Train a node embedding model (like `Node2Vec`) *only on the training graph* to avoid data leakage.
  3. *Create Edge Features*: For each positive and negative edge pair, create an edge embedding (e.g., using a Hadamard operator on the node embeddings).
  4. *Train a Classifier*: Use these edge embeddings as features to train a standard ML model (like a `RandomForest`) to predict the label (0 or 1).
  5. *Evaluate*: Test the classifier's performance on the hold-out test set.

== Detecting Communities
#place(top + left, dx: -2.5em)[
  #subbar([Finding Meaningful Structures])
]
#h(1em)

- *The Goal*: Partition a graph's nodes into groups (communities) that are densely connected internally but only sparsely connected to other groups.
- This is a fundamental task for understanding the macro-structure of a network.
- *Two Main Types of Detection*:
  - *Non-overlapping*: Each node belongs to exactly one community.
  - *Overlapping*: A node can belong to multiple communities, which often reflects real-world scenarios (e.g., a person can be part of a family, a work team, and a sports club).

== Detecting Communities
#place(top + left, dx: -2.5em)[
  #subbar([Key Algorithmic Approaches])
]
#h(1em)

- *Embedding-Based*:
  - The simplest modern approach.
  - First, compute node embeddings (e.g., using `HOPE`, `Node2Vec`).
  - Then, apply a standard clustering algorithm (like `K-Means` or `GaussianMixture`) on the resulting embedding vectors.
- *Cost Function Minimization*:
  - Define a quality metric for a given partition and try to optimize it.
  - The most famous metric is *modularity*, which measures how much denser the connections are within communities compared to a random network.
  - The *Louvain method* is a fast and highly effective greedy algorithm for maximizing modularity.

== Graph Similarity & Matching
#place(top + left, dx: -2.5em)[
  #subbar([Quantifying How Alike Graphs Are])
]
#h(1em)

- *The Goal*: To learn a quantitative measure of similarity between two graphs (or nodes, or subgraphs).
- *Why is this useful?*
  - *Classification & Clustering*: Grouping similar graphs (e.g., molecules with similar properties).
  - *Knowledge Transfer*: Applying a solution from one network to a similar one.
- *The Challenge*: Traditional distance metrics (like Euclidean) don't work on non-Euclidean graph structures. Exact methods like graph isomorphism are often computationally intractable (NP-complete).

== Graph Similarity & Matching
#place(top + left, dx: -2.5em)[
  #subbar([Learning Similarity Metrics])
]
#h(1em)

- *Graph Embedding-Based Methods*:
  - Learn a vector representation for each graph (e.g., using `Graph2Vec`).
  - The similarity can then be computed as the distance (e.g., cosine similarity) between these embedding vectors in the latent space.
- *Graph Kernel-Based Methods*:
  - Define similarity based on counting common substructures (like random walks, shortest paths, or small subgraphs called graphlets).
  - *Deep Graph Kernels (DGK)* is a notable example that treats substructures as "words" and uses NLP techniques to learn representations.
- *GNN-Based Methods*:
  - The most powerful and flexible approach.
  - They *jointly learn* the graph representation and the similarity function in an end-to-end manner, often using a "Siamese" (two-branch) network architecture.

== Graph Similarity & Matching
#place(top + left, dx: -2.5em)[
  #subbar([Real-World Applications])
]
#h(1em)

- Graph similarity learning is being applied in many cutting-edge domains:
  - *Chemistry & Bioinformatics*: Finding chemical compounds with similar structures or functions.
  - *Neuroscience*: Comparing brain connectivity networks between individuals to study diseases.
  - *Computer Vision*: Recognizing human actions by comparing skeletal pose graphs over time.
  - *Computer Security*: Detecting vulnerabilities by matching patterns in code dependency graphs.

// #figure(
//   // NOTE: This slide would show Figure 6.4 from the book.
//   image("path/to/figure_6.4.png", width: 80%),
//   caption: [Graphs can represent diverse objects for similarity comparison]
// )

== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Key Takeaways])
]
#h(1em)

- We've explored how to apply graph ML to three fundamental problems.
- *Link Prediction*: Can be solved with fast heuristics or more powerful supervised embedding-based models.
- *Community Detection*: Algorithms exist to partition graphs based on embeddings or by optimizing a quality score like modularity.
- *Graph Similarity*: While challenging, ML provides powerful tools to learn meaningful similarity metrics, with GNNs being the state-of-the-art.
- These tasks form the basis for many real-world, high-impact applications of graph machine learning.