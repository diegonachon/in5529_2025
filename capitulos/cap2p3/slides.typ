#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)

= Overview of Artificial Neural Networks

== Artificial Neural Networks
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]
#v(1em)

- The most efficient and powerful tool for learning and classification is the *human brain*.
- It consists of billions of *neurons* interconnected in a *sophisticated network*.
- *Neurons #footnote[#link("https://qbi.uq.edu.au/brain/brain-anatomy/what-neuron")]* are the fundamental units of the brain and nervous system, responsible of receiving sensory input from external world, for sending motor commands to our muscles and for transforming and relaying the electrical signals at every step in between. 

== Artificial Neural Networks
#place(top + left, dx: -2.5em)[
  #subbar([Neuron Example])
]
#v(1em)

#figure(
  image("images/neurons.png"),
  caption: [Source: #link("https://www.researchgate.net/figure/Structure-of-a-basic-neuron_fig1_342511210")]
)

== Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Signals and Layers])
]
#v(1em)

#dblock(title: [Signals])[
  - A neuron receives inputs via *dendrites*, processes them in the *cell body*, and sends output via the *axon*.  
  - Inputs may be *excitatory* or *inhibitory*. If excitation dominates, the neuron *activates* and transmits a *signal* through the axon.
]
#dblock(title: [Layers])[ 
  - Neurons are organized into *layers* within a layered network.  
  - Neurons in one layer typically receive input from an *adjacent* layer.  
  - Connections are mostly one-way, from *low-level sensors* (e.g., eyes, ears) to *higher coordination and reasoning layers*.
]

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#v(1em)

- A *neuron* is an unit which receives inputs and generates an output.
- It has three components: *inputs*, an *activation/processing unit*, and an *output*.
- The most simple neuron model that includes the main features of a biological neural network was proposed by McCulloch and Pitts (1943):
  #text(size: 18pt)[
    - *Multiple input signals* coming from the external environment, represented by the set $\{x_1,...,x_n\}$.  
    - A set of *weights* $\{w_1,...,w_n\}$ quantify each $x_i$ input’s relevance.  
    - The output of the artificial cell body (processing unit) is the *weighted sum* of its inputs, $u$.
  ]

== Artificial Neuron
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#v(1em)

#figure(
  image("images/artificial-neuron.png"),
  caption: [Source: Da Silva et al. (2017)]
)

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Components])
]
#v(1em)

An artificial neuron is composed of seven basic elements:
#text(size: 18pt)[
  - *Input signals* $x_1,...,x_n$
  - *Synaptic weights* $w_1,...,w_n$
  - *Linear aggregator* $Sigma$ that gathers all input signals weighted by the synaptic weights to produce an *activation voltage.*
  - *Threshold/bias* $theta$, used to specify the proper threshold that the result produced by the linear aggregator should have to generate a trigger value toward the neuron output.
  - *Activation potential* $u = Sigma - theta$; if $u > theta$ → the neuron produces an *excitatory* potential;  otherwise, it will be *inhibitory.*
  - *Activation function* $g$ that limit the neuron output within a reasonable range of values.
  - *Output* $y$, the final value produced by the neuron.
]

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Mathematical Expression])
]
#v(1em)

The following expression synthetize the previous elements:
  $ u = sum_(i=1)^n w_i x_i - theta = "w" dot "x" - theta $
  $ y = g(u) $
Operation summary:
  1. Present input values $x$.
  2. Multiply each input by its weight.
  3. Compute activation potential $u$ (weighted sum minus threshold).
  4. Apply activation function $g$.
  5. Read the output $y$.

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Activation Functions])
]
#v(1em)

#dblock(title: [Examples of Activation Functions])[
- *Step*:  
  $ g(u) = cases( 1 "if": u >= 0, 0 "if": u < 0 ) $
- *Logistic*:  
  $ g(u) = frac(1, 1 + e^(-beta u)) $
- *ReLU*:  
  $ g(u) = op("max")(0, u) $
]

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Artificial Neuron Example])
]
#v(1em)

Consider the next neuron and it's values:

#figure(
  image("images/example_neuron.png"),
)
#text(size: 18pt)[
- $x_1=3$
- $x_2=5$
- $w_1=1$
- $w_2=2$
- $theta=10$
- $g(u)=op("max")(0,u)$
]

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Artificial Neuron Example])
]
#v(1em)

Consider the next neuron and it's values:

#figure(
  image("images/example_neuron.png"),
)

- Compute: 

  $ (3 x_1 + 5 x_2) - 10 = 3 $  
  $ => g(3) = op("max")(0, 3) = 3 $ 
  
  → The neuron is *activated*!

== Artificial Neurons
#place(top + left, dx: -2.5em)[
  #subbar([Artificial Neuron Example])
]
#v(1em)

- What if $x_2 = 3$ (keeping others the same)?  

#figure(
  image("images/example_neuron.png"),
)

  $ (3 x_1 + 3 x_2) - 10 = -1 $  
  $ => g(-1) = op("max")(0, -1) = 0 $
  → The neuron is *not activated*.

== ANNs Architectures
#place(top + left, dx: -2.5em)[
  #subbar([Core Idea])
]
#v(1em)

Generally, ANNs are organized in *layers*:
  - *Input layer*: Responsible for receiving information (data) from the external environment. These are usually _normalized_ within the limit values produced by activation functions.
  - *Hidden/intermediate layers*: Composed of neurons which are responsible for extracting patterns associated with the process or system being analyzed. These layers perform most of the internal processing from a network.
  - *Output layer*: Also composed of neurons, and thus is responsible for producing and presenting the final network outputs, which result from the processing performed by the neurons in the previous layers.

== ANNs Architectures
#place(top + left, dx: -2.5em)[
  #subbar([Main Architectures])
]
#v(1em)

There are many common ANN architectures:
  - Multi-layer feedforward networks (also known as Multi-layer Perceptron, a technical misnomer)
  - Recurrent neural networks
  - Convolutional neural networks
  - Graph neural networks
  - Transformers (underlies all of modern NLP)

These vary depending on the arrangement of the neurons, how they interconnect with each other, and how their layers are composed.

== Single-Layer Feedforward Network
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)

#figure(
  image("images/single-layer.png"),
)

- One input layer and a *single* neural layer (which is the output).
- Information flows one way: input → output.
- Number of outputs equals number of neurons in the output layer.
- Commonly used for pattern classification.

== Multilayer Feedforward Network
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)

#figure(
  image("images/multi-layer.png", width: 40%),
)

- Includes one or more *hidden* layers.
- Number of hidden layers/neurons depends on problem complexity and data.
- Output dimensionality equals the number of output-layer neurons.

= Neural Language Models

== Distributed Representation of Words
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]
#v(1em)

- *Words* are the smallest linguistic unit with independent meaning.
- Traditional *one-hot* encodings can’t capture grammatical/semantic info by themselves.
- *How can we encode grammatical and semantic information in word representations?*
- Distributional hypothesis (Harris, 1954; Firth, 1957): A word’s semantic (meaning) *is determined by its context* → similar contexts imply similar meanings.
- With large corpora and better methods, *distributed word representations* gained traction.

== Distributed Representation of Words
#place(top + left, dx: -2.5em)[
  #subbar([Vector Semantics])
]
#v(1em)

#dblock(title: [Core concept])[
  Represent each word with a _low-dimensional real vector_ so semantically similar words are close in space. This representation is called *embedding.*
]
But how?
- In vector space models, the most commonly used context is a _collection of words in a fixed window_, but richer contexts such as _n-grams_ are difficult to use and scale.
- If an n-gram is used as the context, the number of n-gram will increase _exponentially_ as $n$ grows.
- This could result in a *data sparsity *problem and the *curse of dimensionality.*

== Distributed Representation of Words
#place(top + left, dx: -2.5em)[
  #subbar([Model complex contexts])
]
#v(1em)

*How could complex contexts be modeled?*
  - Neural Network models are composed of a series of simple operations, such as linear transformation and nonlinear activation, which in theory can approximate *arbitrary functions* (Universal Approximation Theorem).  
    - We can use ANNs to *model complex contexts!*

== Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#v(1em)

#dblock(title: [Neural Language Modeling])[
  Neural Language Modeling is the task of predicting upcoming words from prior words (or context) using Artificial Neural Networks.
]

- Instead of representing words in the prior context by their word identity like n-gram language models, Neural Language Models use *word embeddings.*
    
== Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Training data])
]
#v(1em)

Training data for Neural Language Models are formalized as:

- A collection of sentences: 
  $ D = { w_(i_1)^(m_i) }_(i=1)^M $  
  - $m_i$ is the length of sentence $i$
  - $w_(i_1)^(m_i)$ represents the sequence $w_(i_1), …, w_(i_(m_i))$
- How to represent $w_i$ words? → *Word embeddings*.

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#v(1em)

#dblock(title: [Word Embedding])[
  A *learned representation* of text in the form of a vector where words with similar meaning have similar representation.
]

- Considered one of the key breakthroughs of deep learning on challenging NLP problems.
- It consists on a class of techniques where individual words are represented as real-valued vectors in a predefined vector space.
- These vectors can have tens or hundreds of dimensions, that is contrasted to the thousands or millions of dimensions required for sparse word representations such as a one-hot encoding (e.g. bag-of-words).

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#v(1em)

#figure(
  image("images/word_embeddings_1.png", width: 50%),
  caption: [Source: #link("https://medium.com/@hari4om/word-embedding-d816f643140/")]
)

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Semantic vectors])
]
#v(1em)

#figure(
  image("images/word_embeddings_2.png", width: 70%),
  caption: [We associate to each word of the vocabulary a vector which represents its *meaning.*]
)

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Links between concepts])
]
#v(1em)

#figure(
  image("images/word_embeddings_3.png", width: 60%),
  caption: [When word embeddings are created using a large enough dataset, a lot of information is encoded in *differences between vectors.*]
)

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Vector geometry])
]
#v(1em)

#figure(
  image("images/word_embeddings_4.png", width: 50%),
)

$ "king" - "man" + "woman" = "queen" $

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Learning Words Embeddings with Neural Networks])
]
#v(1em)

- Map each word to a $d$-dimensional vector distributed vector or embedding and stack them into the *embedding matrix* $bold(E) in bb("R")^(|V| × d)$.
- Goal of the neural network: *optimize* $bold(E)$ to learn accurate representations for each word.

#figure(
  image("images/embedding_matrix.png", width: 80%),
  caption: [Source: Jurafsky and Martin (2025)]
)

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Issues on Language Modeling])
]
#v(1em)

Consider a classical *statistical approach* to build a *Language Model*:

  - Given a sentence $w_1, w_2, …, w_m$, its *ocurrence probability* can be calculated as:

$
  P(w_1 w_2 … w_m)
  = P(w_1)\, P(w_2 | w_1)\, …\, P(w_i | w_1, …, w_(i-1))\, …\, P(w_m | w_1, …, w_(m-1))
$

i.e. using the _probability chain rule_.

- This approach has *issues*.
- $m$ could be very large. Hundreds of thousands or even millions!
- *Assumptions need to be made*.


== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([The Markov Property Assumption])
]
#v(1em)

- The most widely-made assumption in this approach holds the *Markov property* of $(n-1)$ order, where:

$
  P(w_i \mid w_1, …, w_(i-1)) ≈ P(w_i \mid w_(i-n+1), …, w_(i-1))
$

This is, that the probability of the current word only depends on the preceding $(n-1)$ words.

- This assumption makes it possible to calculate the Language Model probability of any word sequence (for $n$ small enough).

- However, *it still have issues!*

== Word Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Issues on the Markov Property Assumption])
]
#v(1em)

- This approach still faces serious #strong[data sparcity] problems and isn't able to model #emph[long-range influence] of one word over the others because it depends on the #emph[considered Markov chain order] to model it.

- In other words, the windows of past consecutive $n$ words may not be enough to capture the context.

- e.g. Consider a book talking about #emph[War of the Pacific]. Somewhere in the text it could read #emph[The countries went on a battle]. Clearly, the information presented in this sentence alone is not enough to identify which are the countries in conflict.

#box[
  #strong[Neural Language Models address this issue!]
]


== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#v(1em)

- First introduced by Bengio et al. (2003).
- Uses a feedforward network that takes some number of previous words $(w_(t-1), w_(t-2), ...)$ and outputs a *probability distribution* over possible next words $w_t$.
- Similarly to an n-gram LM, approximates the probability of the next word based on the $N-1$ previous words.

- Represents each of the $N - 1$ prior context words mapping them to embeddings and *concatenate*.

== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Inference example])
]
#v(1em)

The algorithm for inference or *decoding*, i.e. given an input produce a probability distribution over possible next words, consists of four steps. Given a 3-words context window:

1. *Embed context:* Look up indices for $w_(t-3), w_(t-2), w_(t-1)$, make one-hots $x_{t-k}$, and multiply by the embedding matrix $E$ to get $e_(t-k) = E x_(t-k)$. Then, concatenate each vector $e_(t-k)$ to obtain the embedding layer $e = [e_(t-3);e_(t-2) e_(t-1)]$.
2. *Hidden layer:* Using $e$, $h = tanh(W e + b)$
3. *Output logits:* Obtain the logits $z = U h$.
4. *Softmax prediction:* Compute the probability distribution using *softmax*.

$ hat(y)_i = P(w_t = i | w_(t-1), w_(t-2), w_(t-3)) = "softmax"(z)_i = exp(z_i) / (sum_(j=1)^V exp(z_j)) $

== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Inference example])
]
#v(1em)

#figure(
  image("images/inference.png", width: 55%),
  caption: [Source: Jurafsky and Martin (2025)]
)

== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Training])
]
#v(1em)

- *Self-training:* Use a corpus of text for training without any label and use the *natural sequence of words as its own supervision.*
- *Parameters* $theta = W, U, b$ and the embedding matrix $bold(E)$. Sometimes we can use *pretrained embeddings*, like word2vec.
- Trainable set $theta$ is optimized to minimize the loss *negative log-likelihood* (or cross-entropy) over the corpus:  
  $L = -log p(w_t | w_(t-1), ..., w_(t-n+1))$.
- After training, $bold(E)^*$ is a new set of embeddings that can be used for language modeling, but also as *word representations for other tasks.*

== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Training])
]
#v(1em)

#figure(
  image("images/training.png", width: 55%),
  caption: [Source: Jurafsky and Martin (2025)]
)

== Feedforward Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([NLM — Why $tanh$ and softmax])
]
#v(1em)

- These are widely used for multi-layer neural networks.
- $tanh$ is similar to a logistic function. Is zero-centered and have a range between -1 to 1. This supports the _backpropagation_ process.
- _softmax_ function is used to compute *probability distributions* from a vector of real numbers. It generates an output that ranges between 0 and 1 and with the sum of probabilities being 1. Is mainly used in multi-class models where it returns probabilities of each class. Because of this, is *widely* used in the output layers.

