#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *



= Text Mining process applied to Web Pages



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([The Web Text])
]
#h(1em)

- In order to analyze the text, we need to *process* it before using it:
  - Document free text (without tags)
  - Stopwords filtering (to explain later)
  - Stemming algorithm (to explain later)

- All these procedures are performed to obtain a *clean list of words* that represent web pages.

- We want to transform this list of words into objects we can manipulate using mathematics.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([The Vector Space Model])
]
#h(1em)

#dblock(title: [Vector Space Model or Term Vector Model])[
  Is an algebraic model for representing text documents (and any objectos, in general) as vectors of identifiers, such as, for example, index terms. It is used in information filtering, information retrieval, relevance rankings, among others.
]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([The Word Page Vector (wp)])
]
#h(1em)

- Each Web page can be considered as a *document text* with tags.
- Applying filters, the Web page is transformed into a *feature vector*.
- We will call it the *word page vector* (wp) representative of that particular Web page.

#dblock(title: [Word page vector representation])[
  - Let $P = {p_1, ..., p_Q}$ be the *set of Q pages* in a Web site.
  - The $i$-th page is represented by:
  $ "wp"^i = {"wp"^i_1, ..., "wp"^i_R} in "WP" $
  
  with R as the number of words after a _stopwords removal_ and _stemming process_ and WP the set of _feature vectors_.
]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([The Word Page Vector (wp)])
]
#h(1em)

- Meaning of the _k_-component ($"wp"^i_k$) of the feature vector: *The importance of the word _k_ on the page _i_*.

- With this model, we have transformed the _bags of words_ into _vectors_ and _matrices_, so we now:
  - Have a *numeric representation* of text.
  - Can compare two pages (documents).
  - Can use a more complex battery of mathematical tools for text analysis and mining.
  - It is a firs approach to *representing the meaning of a page by list of words*.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

- From different Web page content, special attention receive the free text.

- For the moment, a searching is performed by using *keywords*.
- It is necessary to represent the text information in a feature vectore before to apply a mining process.

- The representation mus consider that the *words in the Web don't have the same importance*.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

Stages of the process:

+ Parsing the Web page content.

+ Deleting unnecessary content.

+ Identifying the text semantic: Stemming and Lemmatization.

+ Calculating the word page vector.

+ Data mining algorithm application:
  - Clustering and Similarity measure.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

1. Parsing the Web page content

#dblock(title: [Tokenizing])[

  - Individualizing each word contained in the document.

  - A Web document is based on *HTML tags*.

  - The usual procedure is to extract all the free text word *avoiding all the HTML tag*.

  - Result: A raw list of words for each page.
]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

2. Deleting unnecessary content

#dblock(title: [Stopwords removal])[
  
  - Example: _the, a, by, he, she, behind_.

  - We need to identify the importance of a word a text, from the point of view of the semantic#footnote[The study of the meaning in a communication process.].

  - Our first approximation: Stopwords doesn't contribute to the semantic of a text.

]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic

- There are words that have *similar meaning*: connect, connected, connecting, ...

- It is necessary to associate a *unique identifier* of the semantic content for them.

- Two ways to do that: Stemming and Lemmatization.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic

#dblock(title: [Stemming])[

  - The process for removing the commoner morphological and inflexional endings from word.

  - This process has the intention to *extract the semantic root* of the words in a document, in order to have a *more simpler description of the semantic of the text content*.

  - {connect, connected, connecting} $->$ connect

]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic

#dblock(title: [The Porter Algorithm])[

  + Take the next word of the text.
  + Determine if it has a suffix, like: -ED, -ING, -ION, -ION, among others.
  + Look up in the exception rule list if the word is present and then apply the rule. Example: ran $->$ run.
  + If not, then cut the suffix and return the remaining part. Example: connections $->$ connect.
  + Insert the new word on a list and return to step 1 if another word remain on the text; if not then finish and return the list processed. 

]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic

#dblock(title: [Lemmatization])[

  - Usually refers to doing thing properly with the use of a vocabulary and morphologial analysis of words, normally aiming to remove inflectional ending only and to reurn the base or dictionary form of a word, which is know as *lemma*#footnote[https://nlp.stanford.edu/IR-book/html/htmledition/stemming-and-lemmatization-1.html].

  - In other words, reduces words to their base or dictionary form (_lemma_), considering the word's meaning and part of speech. Example: better $->$ good.
]


== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic: Stemming vs Lemmatization

#figure(
  image("images/stemmingvslemmatization.png", width: 60%),
  caption:[Source: https://towardsdatascience.com/introduction-to-stemming-vs-lemmatization-nlp-8c69eb43ecfe]
)



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic

#dblock(title: [Zipf's law])[

  - How are the words distributed in a document?

  - It states that the _frequency_ of the $i$-th most frequent word in a collection of documents is proportional to $frac(1, i)$.

  - It follows a _power law_.

 - Usually, the _most frequent words_ on a colletion of documents are the _least informative_.

]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

3. Identifying the text semmantic: Zipf's law


#figure(
  image("images/zipf.png", width: 60%)
)



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

4. Calculating the word page vector

- We have a clean list of stemmed / lemmatized words for each page.

- How can we calculate the numeric importance of a word on the page?

#dblock(title: [Binary measure])[
  
  - 1 if the is present on page _i_, 0 if not.

]

#dblock(title: [Frequency measure])[
  
  - The relative frequency of the word _k_ on the page _i_ vs all the pages.

]



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

#grid(
  columns: (1fr, 1fr),
  rows: (auto),
  text()[
  4. Calculating the word page vector

  - It's *vector representation* would be a matrix of $R times Q$.

- _Q_ is the number of pages in the Web site and _R_ is the number of different words in _P_.],

figure(
  image("images/wordpagevector.png", width: 50%)
)

)



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

4. Calculating the word page vector

- We want to know how much informative are words across documents (Web pages).

- Let's consider the *Term Frequency* (TF) of a word _i_ in a document _d_ as $"tf"_(i,d)$.

$ "tf"_(i,d) = frac(f_(i,d), sum_k f_(k,d)) $

- We could assume that a word that has a higher TF than another is more informative.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

4. Calculating the word page vector

- But what happens when we have documents with more words in total than others?

- We could consider a *Normalized Term Frequency* as:

$ "ntf"_(i,j) = a + (1-a)frac("tf"_(i,j), "tf"_(max(d))) $

- Where _a_ is a smoothing term between 0 and 1, generally set to 0.4.



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

4. Calculating the word page vector

- Now, how we could consider the frequency across documents (Web pages)?

- The model associates a *weight to each word* in the page, based on its frequency in the whole Web site.

- Let $n_i$ the number of pages with the word _i_ and _Q_ the total amount of pages, a simple estimation of the relevance of a word will be:

$ "wp"_j^i = frac(n_i, Q) $



== Initial Concepts
#place(top + left, dx: -2.5em)[
  #subbar([Building a Vector Space Model])
]
#h(1em)

4. Calculating the word page vector

- The *Inverse Document Frequency* (IDF) can be used like a weight:

$ "IDF" = log(frac(Q, n_i)) $

- A variation of the last expression is know as TF - IDF:

$ "wp"_j^i = "TF-IDF" = "tf"_(i,d) * log(frac(Q, n_i)) $













































== Cross Industry Standard Process For Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([CRISP-DM steps])
]

#v(20pt)



== Step 1: Business understanding

Placeholder

== Step 2: Data understanding

Placeholder

== Step 3: Data preparation

Placeholder

== Step 4: Modeling

Placeholder

== Step 5: Evaluation

Placeholder

== Step 6: Deployment

Placeholder

== CRISP-ML (Q)

Placeholder

= Web Mining

== Web Data
#place(top + left, dx: -2.5em)[
  #subbar([The problem])
]

#dblock(title: [The problem])[
  Garbage-in, Garbage-out.
]

Web Data is highly variable in *type* and *format:*

- Text, tags and multimedia in different structured data formats, like *HTML*, *JSON*, *XML* and *CSV*.
- *Web Logs* have an standard, but *sessions* are not necessarily explicit them.
- Web sites *change over time*, so does data.

== Web Data
#place(top + left, dx: -2.5em)[
  #subbar([In practice])
]

We require to treat the Data to achieve better results (as we will see in the following chapters of the course):

- Transform pages into *feature vectors* or *embeddings* (Chapter 2).
- Obtain the *Web site graph* (Chapter 3). 
- Clean and reconstruct *individual sessions* from users (Chapter 4).

This process of Web Data *cleaning and transforming* should store it's outputs for further Data Mining steps.

== Mining the Web: Web Mining

#dblock(title: [Web Mining])[
  Web Mining techniques are the application of Data Mining theory in order to discover patters from Web Data.
]

There are three main categories of Web Mining: 

- Web Content Mining
- Web Structure Mining
- Web Usage Mining

== Web Mining Taxonomy

\#figure(
  image("images/wm.png"),
  caption: [Web Mining Taxonomy]
)

== Web Content Mining

#dblock(title: [Web Content Mining])[
  Definition
]

- The goal: find useful information from the web content *(similar to _Information Retrieval_).*

- Web content is not only free text, other objects like pictures, sound, movies, metadata and hyperlinks belong also to the content.

== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([The two views])
]

There are two main areas in Web Content Mining (WCM).

- Mining of document contents: WCM 
- Improving content search tools: 

== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([Examples])
]



== Web Structure Mining

#dblock(title: [Web Structure Mining])[
  Web Structure Mining deals with the mining of *Web hyperlink structure*.
]

- A Web site is represented by a graph of its links, within the site or between sites.

== Web Usage Mining

= Overview of Foundational Models

