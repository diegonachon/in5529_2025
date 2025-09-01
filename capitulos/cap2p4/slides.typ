#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)
#set par(justify: true)

= Neural Language Models

== Neural Language Model
#place(top + left, dx: -2.5em)[
  #subbar([An issue])
]
#v(1em)

- The goal of this models is to accurately estimate the conditional probability $p(w_(i)|w_(1), …, w_(i−1))$.

- This implies that is necessary to *calculate the probability distribution of the whole vocabulary* by using the matrix operation from the hidden layer to the output layer using the softmax function at every time step.

- This could be *computationally expensive*.



== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([What it is?])
]
#v(1em)

- Collobert and Weston (2008) proposed this model where they argued that *it's not necessary to learn a language model if the goal is only to learn Word Embeddings*.

- Instead of predicting the next word in a sequence, their approach focuses on distinguishing between real n-grams and randomly generated n-grams to optimize embeddings.



== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

- In other words, the model and objective function can be designed directly from the perspective of the distributed hypothesis:

  - Given an $n$-gram $(w_(i), C) = w_(i−C) … w_(i−1) w_(i) w_(i+1) … w_(i+C)$ in the training corpus (named positive example).
  
  - Randomly replace the *central word* $w_(i)$ with other words $w_(i)^′$ in the vocabulary (named negative example).
  
  - Thus, obtain a new $n$-gram $(w_(i)^′, C) = w_(i−C) … w_(i−1) w_(i)^′ w_(i+1) … w_(i+C)$ where $(w_(i), C)$ is no doubt more reasonable than $(w_(i)^′, C)$.
  
  - Then, when scoring each $n$-gram, the score $s(w_(i), C)$ must be *higher* than $s(w_(i)^′, C)$.



== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)


#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),
  text()[
    
  - A simple feedforward neural network model only needs to calculate the score of the $n$-gram, which distinguishes the real $n$-gram input from randomly generated text.

  - To calculate a score, we first acquire the corresponding *word embeddings* from the word embedding matrix *L*. These are then concatenated and we obtain the representation of the first layer:

  $ h_(0) = [e(w_(i-C), ..., e(w_(i)), ..., e(w_(i+C))] $
  
  ],

  figure(
  image("images/candw.png", width: 95%),
 )
)




== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - $h_0$ is passed through the hidden layer, resulting in:

    $ h_1 = f(W_0 × h_0 + b_0) $

    where $f(.)$ is a nonlinear activation function.

  - After linear transformation, the score of $n$-gram $(w_(i), C)$ becomes:

    $ s(w_(i), C) = W_1 × h_1 + b_1 $
  ],

  figure(
    image("images/candw.png", width: 95%),
  )
)



== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),
  text()[
     - In the optimization process, this model expects that the score of each positive sample will be larger than that of the corresponding negative sample by a constant margin:

    $ s(w_(i), C) > s(w_(i)^′, C) + 1 $
  ],
  figure(
    image("images/candw.png", width: 95%),
  )
)



== C&W Model
#place(top + left, dx: -2.5em)[
  #subbar([])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - For the entire training corpus, this model needs to traverse every $n$-gram on it and minimize this function:

    $ sum_((w_(i), C) in D) sum_((w_(i)^′, C) in N_(w_(i))) max(0, 1 + s(w_(i)^′, C) - s(w_(i), C)) $

    where $N_(w_(i))$ is the negative sample set form the positive sample $(w_(i), C)$.

  - The embedding matrix *L* is updated on each iteration.
  ],

  figure(
    image("images/candw.png", width: 95%),
  )
)



== Word2Vec
#place(top + left, dx: -2.5em)[
  #subbar([What is it?])
]
#v(1em)

- The most popular word embedding model.

- Proposed by Mikolov et al. 2013.

- It aims for efficiently learning a standalone word embedding from a text corpus.

- Two different learning models were introduced that can be used as part of this approach:
  
  - Continuous Bag-of-Words (CBOW) Model
  - Skipgram Model


== CBOW Model
#place(top + left, dx: -2.5em)[
  #subbar([What it is?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - The idea is to predict a *central word* given different *contextual words*.
  
  - Unlike C&W, this model still takes the probability of target words as the optimization goal.
  ],

  figure(
    image("images/cbow.png", width: 95%),
  )
)



== CBOW Model
#place(top + left, dx: -2.5em)[
  #subbar([What it is?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - However, it simplifies the network structure by focusing on two aspects:
  
    - The input layer is no longer a _concatenation_ of the corresponding contextual word embeddings, but the *average* of these word embeddings, ignoring the word order information.
    
    - It omits the hidden layer, instead connecting the input layer and the output layer directly and calculating the probability of the central word by a logistic regression (softmax).
  ],

  figure(
    image("images/cbow.png", width: 95%),
  )
)



== CBOW Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - Formally, given any $n$-gram $(w_i, C) = w_(i-C) ... w_(i-1) w_i w_(i+1) ... w_(i+C)$ in the training corpus as input, the *average word embedding* of contextual words can be calculated as ($n = 2C + 1$):

    $ h = frac(1, 2C) sum_(i-C <= k <= i+C, k != i) e(w_k) $
  ],

  figure(
    image("images/cbow.png", width: 95%),
  )
)



== CBOW Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
    
  - $h$ is directly taken as the semantic representation of the context to predict the probability of the middle word $w_i$:

    $ P(w_i | C_(w_i)) = frac(exp{h dot e(w_i)}, sum_(k=1)^(|V|) exp{h dot e(w_k)}) $

    where $C_(w_i)$ denotes word context for the word $w_i$ in a $C$-sized window.
  ],

  figure(
    image("images/cbow.png", width: 95%),
  )
)




== CBOW Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - In this model, word embedding matrix $bold(L)$ is the only parameter in the neural network.
  
  - For the whole training corpus, this model optimizes $bold(L)$ to maximize the log-likelihood of all words:

    $ bold(L)^* = "argmax"_(bold(L)) sum_(w_i in V) log P(w_i | C_(w_i)) $
  ],

  figure(
    image("images/cbow.png", width: 95%),
  )
)



== Skipgram Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - This model has the *opposite* process than CBOW.
  
  - It aims to predict all the contextual words given only the central word.
  ],

  figure(
    image("images/skipgram-model.png", width: 95%),
  )
)



== Skipgram Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
   
  - Given any $n$-gram in the training corpus $(w_i, C) = w_(i-C)...w_(i-1) w_i w_(i+1)...w_(i+C)$, this model predicts the probability of every word $w_c$ in the context $C_(w_i) = w_(i-C)...w_(i-1) w_(i+1)...w_(i+C)$ by using the word embedding $e(w_i)$ of the central word $w_i$:

    $ P(w_c | w_i) = frac(exp{e(w_i) dot e(w_c)}, sum_(k=1)^(|V|) exp{e(w_i) dot e(w_k)}) $
  ],

  figure(
    image("images/skipgram-model.png", width: 95%),
  )
)



== Skipgram Model
#place(top + left, dx: -2.5em)[
  #subbar([How it works?])
]
#v(1em)

#grid(
  columns: (1.2fr, 0.8fr),
  rows: (auto),

  text()[
  - The objective function of the skipgram model is similar to that of CBOW.
  
  - It optimizes the word embedding matrix $bold(L)$ to maximize the log-likelihood of all contextual words for each $n$-gram in the training data:

    $ bold(L)^* = "argmax"_(bold(L)) sum_(w_i in V) sum_(w_c in C_(w_i)) log P(w_c | w_i) $
  ],

  figure(
    image("images/skipgram-model.png", width: 95%),
  )
)



== Word2Vec
#place(top + left, dx: -2.5em)[
  #subbar([Summary])
]
#v(1em)

The goal of the word2vec task is to predict the
*context* of a word (the words surrounding it) based
on its vector representation.

#figure(
  image("images/Word2Vec-Training-Models.png", width: 50%),
  caption: [Source: Mikolov, T., Chen, K., Corrado, G., & Dean, J. (2013). Efficient estimation of word representations in vector space.]
)



== Word2Vec
#place(top + left, dx: -2.5em)[
  #subbar([Limitations of Word2Vec])
]
#v(1em)

- Word2Vec generates *static embeddings*: one vector per word, regardless of context.

- Cannot differentiate polysemous words: e.g. "bank" (money) vs "bank" (bench).

- Limited context window $->$ fails to capture *long-range dependencies*.


= Large Language Models


== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Need for Contextual Embeddings])
]
#v(1em)

- Problem: Words can have different meaning depending on context.

- Solution: Embeddings that *adapt to the surrounding words*.

- "The same word can have multiple embeddings depending on its usage."

#dblock(title: [Contextual Embeddings])[
  Are *dynamic vector representations* of words, where the same word can have *different vectors depending on its context* in a sentence.
]



== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Need for Contextual Embeddings])
]
#v(1em)

#figure(
  image("images/static_vs_contextual.png", width: 70%),
  caption: [Source: #link("https://manikanthgoud123.medium.com/understanding-contextualized-word-embeddings-the-evolution-of-language-understanding-in-ai-8bf79a98eb51")[Understanding Contextualized Word Embeddings: The Evolution of Language Understanding in AI. Medium.]]
)




== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Early Contextual Embedding Models])
]
#v(1em)

- Representations are *computed dynamically* depending on the sentence.

- Use *deep language models* (based on RNNs or LSTMs) that process sequences.

- Capture *context from surrounding words* (left, right, or both).

- How they works:
  + Input sentence is processed sequentially.
  + Hidden states in the RNN/LSTM capture contextual information.
  + Final word embedding is derived from these hidden states.
  + Same word can have *different embeddings in different context*.



== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Early Contextual Embedding Models])
]
#v(1em)

Example:

- Sentence A: _"The bank approved my loan."_ $->$ "bank" = finance.

- Sentence B: _"The boat is near the river bank."_ $->$ "bank" = river side.



== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([ELMo])
]
#v(1em)

- Embeddings from Language Models (ELMo)

- First to introduce the idea of contextual embeddings.

- Uses a 2-layer bidirectional LSTM language model.

  - Generates embeddings *depending on word context*.
  - Produces *different embeddings for the same word* in different sentences.

- Marked the shift from *static* to *dynamic* embeddings.

  

== Contextual Embeddings
#place(top + left, dx: -2.5em)[
  #subbar([Contextual Embedding Models Limitations])
]
#v(1em)

- Words are read one by one $->$ slow training, hard to parallelize (*Sequential processing*).

- RNN struggle to capture relationships between distant words (*Long-range dependencies*).

- *High computational cost* for long text.



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Why Transformers?])
]
#v(1em)

- Transformers introduces *self-attention* mechanism: model can focus on *all words in the sentence at once*
  
  - Each token can "attend" to all other tokens in the sentence

- This enable *parallel computation*, making training much faster.

- Better at capturing *dynamic global context*, not only nearby words.



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Probabilistic Models vs Transformers])
]
#v(1em)

- Probabilistic models:
  - Work with local windows of words.
  - Embeddings are static once trained.
  - Cannot fully capture sente-level meaning.

- Transformers:
  - Use self-attention for global context.
  - Generate dynamic embeddings per sentence.
  - Scale better to large datasets and long sequences.




== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Transformers Architecture])
]
#v(1em)

- Introduced in _"Attention is All You need"_ (2017).

- Main components:
  - *Selft-Attention*: captures relationships between tokens.
  - *Multi-Head Attention*: multiple "views" of context simultaneously.
  - *Feedforward layers*: refine embeddings after attention.
  - *Positional Encoding*: adds order information.

- Encoder/Decoder framework: Modern LLMs often use Decoder-only (GPT) or Encoder-only (BERT).



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Transformers Architecture])
]
#v(1em)

#figure(
  image("images/transformers_architecture.png", width: 40%),
)


== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Self-Attention Mechanism])
]
#v(1em)

- Each token is represented as *Query*, *Key*, *Value* vectors.
- Computes *attention scores* for each token pair $->$ determines how much focus to give each other word.
- Multi-Head Attention allows the model to *capture different types of relationships simultaneously*.
- Intuition: _"Each word looks at all words to understand its meaning in context"_.



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Self-Attention Mechanism])
]
#v(1em)

#figure(
  image("images/query_key_value.png", width: 70%),
)



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Positional Encoding])
]
#v(1em)

- Transformers lack recurrence $->$ cannot know *word order* by default.

- Positional encoding *adds information about token positions*.

- Ensures that sequences like _"dog bites man"_ vs _"man bites dog"_ are distinguished.



== Transformers
#place(top + left, dx: -2.5em)[
  #subbar([Embeddings in Transformers])
]
#v(1em)

- Input token $->$ initial embedding vector (like Word2Vec).

- Add *positional encoding* to incorporate order.

- Layer of *self-attention* + *feedforward* refine embeddings.

- Output: *contextualized embedding*, specific to the sentence.


== Large Language Models
#place(top + left, dx: -2.5em)[
  #subbar([Example of Contextual Embeddings])
]
#v(1em)

- Sentence 1: _"I went to the bank to deposit money"_ $->$ embedding A.

- Sentence 2: _"I sat on the bank of the river"_ $->$ embedding B.

- Same word $->$ different vectors depending on sentence-level meaning.



== Large Language Models
#place(top + left, dx: -2.5em)[
  #subbar([Bridge to LLMs])
]
#v(1em)

- Transformers + massive datasets $->$ *Large Language Models* (LLMs).

- Pretraining strategies:
  
  - Casual LM: predict next word (GPT).
  - Masked LM: predict missing words (BERT).

- Fine-tuning or instruction-tuning enables *task-specific abilities* (translation, summarization, QA).



== Large Language Models
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Modern LLMs])
]
#v(1em)

- Encoder-only: BERT, BETO $->$ embeddings for understanding tasks.

- Decoder-only: GPT, LLaMA $->$ generate text, complete sequences.

- Endocer-Decoder: T5 $->$ flexible for translation, summarization.