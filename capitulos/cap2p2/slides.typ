#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *



= Defining new features

== Summary
#place(top + left, dx: -2.5em)[
  #subbar([Vector Space Model])
]
#h(1em)

- We define a Vector Space Model.

- We learn how to build a Vector Space Model.

- Thus, now we can represent text as a vector.

- We can represent documents across a corpus and give an importance value to all the words ($"TF"*"IDF"$).




== Defining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Vector Space Model and Semantic Information])
]
#h(1em)

- The Vector Space Model assumes that *the coordinates in space are orthogonal*. In other words, that the *terms* are *independent* of each other.
- This is a *strong assumption*, which *ignores* factors such as *word order*, *syntax*, and *semantic information* within the document.


#dblock(title: [Example])[
  
  Compare the following:
  - Pepe is older than Lily
  - Lily is older than Pepe
  
  These two sentences have the *same text representation* in the Vector Space Model, but have an *opposite semantics*!

]



== Defining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Obtaining New Features])
]
#h(1em)

- Thinking of capturing more information, the terms may have *other representations*.
- Keywords or Tokens
- Chunks
- Phrases

#figure(
  image("images/tokenchunkphrase.png", 
  width: 60%)
)



== Defining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Obtaining New Features])
]
#h(1em)

Its purpose is to distinguish tokens that look the same but have a different meaning. There are some tools to capture that information:

- Part-of-Speech Tagging
- Syntactic Chunking
- Syntactic Parsing
- Lexicon Features

*Let's review each one!*


== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Part-of-Speech Tagging])
]
#h(1em)

- Is the process that aims to *mark up each word* based on both its *definition* and its *relationship with adjacent or related words* in a sentence or paragraph.

- This is known as *part-of-speech* (POS).

- Both supervised and unsupervised methods have been proposed, but the first ones are most widely used. There are two main approaches:



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Part-of-Speech Tagging])
]
#h(1em)


#dblock(title: [Stochastic Methods])[
  Taking the work with the Brown Corpus as a basis, many statistical approaches have been developed. These techniques include, for instance, the use of *Hidden Markov Models* (or HMMs), which involve counting cases and making a table of the probabilities of certain sequences, and dynamic programming algorithms, which try to solve the same problem in less time.
]

#dblock(title: [Rule-based Methods])[
  Basically, a technique proposed by Eric Brill in his PhD. thesis in 1993. This technique learns a set of *patterns* and then applies those patterns rather than optimising a statistical quantity.
]



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Part-of-Speech Tagging])
]
#h(1em)

- In POS tagging, a special issue is determining the tag set: the annotation system that will be used to mark each possible part of speech.

- POS tagging work has been done in a variety of languages, and the set of POS tags used varies greatly with each one.

- The number of tags will depend on the purpose at hand. In the case of automatic tagging, it is obviously better to have smaller tag sets.

- There are probably only two tag sets that are the most widely used:
  - Penn Tag Set
  - EAGLES Tag Set



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Penn Tag Set])
]
#h(1em)

#grid(
  columns: (1fr, 1fr),
  rows: (auto),
  dblock(title: [Penn Tag Set])[
  In the case of American English, the Penn tag set, developed in the Penn Treebank project at the University of Pennsylvania is probably the most common choice. It is also frequently preferred by automatic tagging systems, since it is largely similar to the Brown Corpus tag set, but much smaller.
  ],

  figure(
    image("images/penntagset.png", width: 100%)
  )

)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([EAGLES Tag Set])
]
#h(1em)

#grid(
  columns: (1.2fr, 0.8fr, 0.8fr),
  rows: (auto),
  dblock(title: [EAGLES Tag Set])[
  On the other hand, in Europe, tag sets from the EAGLES (Expert Advisory Group on Language Engineering Standards) Guidelines have wide use and include versions for multiple languages.
  ],

  figure(
    image("images/eagletagset1.png", width: 90%)
  ),
  figure(
    image("images/eagletagset2.png", width: 80%)
  )

)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([POS Tagging Example])
]
#h(1em)

#figure(
    image("images/postagexample.png", width: 80%),
    caption: [Adapted from https://www.researchgate.net/figure/Example-of-part-of-speech-POS-tagging-and-lemmatization-for-two-example-sentences-The_fig1_337460636]
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking])
]
#h(1em)

- *Chunks* (of words) can be understood as *textual units of adjacent word tokens which can be mutually linked through unambiguously identified dependency chains with no recourse to idiosyncratic lexical information*. Chunks present a set of properties:



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking])
]
#h(1em)

#dblock(title: [Chunks properties])[
  - Chunks are non-overlapping regions of text
  - (Usually) each chunk contains a head, with the possible addition of some preceding function words and modifiers
  - Chunks are non-recursive, a chunk cannot contain another chunk of the same category
  - Chunks are non-exhaustive, some words in a sentence may not be grouped into a chunk
  - Noun groups and verb groups are chunks
]



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking])
]
#h(1em)

- Categories can be identified when chunking. Most common categories include: Noun Phrases, Verb Phrases, Prepositional Phrases, Adjectival Phrases and Adverbial chunks

- Different notations have been developed so far. One of the most common is the notation used in the Conference on Computational Natural Language Learning in 2000 (or CoNLL-2000)

- The chunk tags contain the name of the chunk type and the special mark B-CHUNK is used for the first word of the chunk, while I-CHUNK is used for each other word in the chunk



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking])
]
#h(1em)

#figure(
  image("images/syntacticchunk.png", width: 25%)
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking: Chunking to Parsing])
]
#h(1em)

- Chunking is the process of dividing a text into syntactically correlated parts of words. From this it follows that chunking is an intermediate step towards full parsing.

- A parser is capable of assigning a syntactic structure (i.e. discovering the structural relationships between words and phrases) to a string on the basis of a grammar, used to describe the syntax of a language.



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking: Chunking to Parsing])
]
#h(1em)

#figure(
  image("images/syntacticchunk2.png", width: 60%)
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Chunking: Chunking to Parsing])
]
#h(1em)

In contrast to parsing, chunking:

- Yields flatter structures than full parsing, generally using fixed tree depth (max depth of 2 vs. arbitrarily deep trees).

- Does not try to deal with all of language nor attempt to resolve all semantically significant decisions.

#figure(
  image("images/part2_slide_37.png", width: 80%)
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Parsing])
]
#h(1em)

- Parsing: resolve (a sentence) into its component parts and describe their syntactic roles.

- *Syntactic parsing* includes the tasks of:
  - Phrase structure parsing
  - Dependency parsing



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Parsing])
]
#h(1em)

#dblock(title: [Phrase structure parsing])[
  Its purpose is to automatically analyze the phrase structure relation in a sentence and to output the *syntactic structure tree* of the parsing sentence.
]

#dblock(title: [Dependency parsing])[
  Its purpose is to automatically analyze the relation of semantic dependency between words in a sentence
]



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Parsing])
]
#h(1em)


#figure(
  image("images/syntactictree.png", width: 80%),
  caption: [Example of phrase structure parsing tree.]
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Syntactic Parsing])
]
#h(1em)

#figure(
  image("images/dependencyparsingtree.png", width: 80%),
  caption: [Example of dependency parsing tree.]
)



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Converting Phrase Structure to Dependency])
]
#h(1em)

The phrase structure tree of a sentence can be converted into a dependency tree:

1. Determine the core predicate of the sentence as only the root node of the sentence.
2. Define the extraction rule of the central word.
3. The central word of each phrase is extracted, and the noncenter word is dominated by the central word.



== Obtaining New Features
#place(top + left, dx: -2.5em)[
  #subbar([Lexicon Features])
]
#h(1em)

There are some common phenomena in natural language terms:

- *Polysemy*: Occurs when a term has more than one meaning, e.g. mouse.

- *Synonymy*: Occurs when two different terms have the same meaning, e.g. big and huge.


  *For Text Representation, it is important to identify whether two terms express the same meaning and to identify the specific meaning of polysemous terms in documents.*



== Obtaining New Feature
#place(top + left, dx: -2.5em)[
  #subbar([Lexicon Features])
]
#h(1em)

To this, we can use *external lexicons*.

#dblock(title: [Lexicon])[
  A lexicon is a collection of information about the words of a language about the lexical categories to which they belong. A lexicon is usually structured as a collection of lexical entries.
]

- Example: (*pig* N V ADJ)
- *pig* is familiar as a N, but also occurs as a verb (V) (*Jane pigged herself on pizza*) and an adjective (ADJ), in the phrase *pig iron*. 
- A lexical entry will include further information about the roles the word plays, such as feature information.



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet])
]
#h(1em)

- WordNet#footnote[
  The following slides are based on: Fellbaum, C. (2010). WordNet. In Theory and applications of ontology: computer applications (pp. 231-243). Springer, Dordrecht.] is a *large electronic lexical database for English*

- Created at Princeton University in 1986 and developed and maintained since then.

- It tries to reflect the way we humans remember semantics.

- Humans know tens of thousands of concepts expressed through words, so it is reasonable to assume that *the way in which this knowledge is stored must be efficient for its access*.



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet])
]
#h(1em)

- WordNet comprises a *large semantic network* made up from a graph.

- Here, words are interconnected by means of *labeled arcs* that represent *meaning relations*:

  - *Lexical relations* connect single words.
  
  - *Semantic-conceptual relations* links concepts that may be expressed by more than one word.



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Relations])
]
#h(1em)

#dblock(title: [Synonymy])[
  - Is the *many-to-one* mapping of word forms to concepts or meaning.
  - e.g. The strings *big* and *huge* can refer to the same concept (being large) so, the two word forms are *synonyms*.
  - WordNet groups them into *unordered sets* called *synsets*.
  - A *synset* lexically expresses a *concept*.
  - Using one member of a synset instead of another does not change the *truth value* of the context.
  - Synsets contain a brief definition, paraphrasing the meaning of the synset. Most synsets include one or more.
  - A *domain label* marks many synsets. e.g. *sports*, *medicine*, *physics*, etc.
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Relations])
]
#h(1em)


#dblock(title: [Polysemy])[
  - Is the *many-to-one* mapping of meanings to word forms.
  - e.g. the string *mouse* may refer to the animal or to the handheld pointing device for personal computers.
  - The membership of a word in *multiple synsets* reflects that word's polysemy.
  - Synsets are the nodes or *building blocks* of WordNet. As a result of the interconnection of synsets via *meaning-based* relations, a *network* structure arises.
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Relations])
]
#h(1em)


#dblock(title: [Antonymy])[
  - A lexical relation *one-to-one* or *word-word*.
  - It represents a semantic contrast or *opposition*.
  - e.g. *wet-dry*, *come-go*, etc.
]

#dblock(title: [Morphosemantic])[
  - Links words from all four part-of-speech, that are both *morphologically and semantically related*.
  - e.g. *interrogation*, *interrogator*, *interrogate*, *interrogative*
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Relations])
]
#h(1em)

#figure(
  image("images/wordnet.png", width: 55%),
  caption: [ Speech and Language Processing. Daniel Jurafsky & James H. Martin (2021).]
)



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Coverage])
]
#h(1em)

WordNet consists of *four separate parts*, each containing synsets with words from the *mayor syntactic categories*:

#dblock(title: [Nouns])[
  - Primarily interconnected by *hyponymy relation*, which links specific concepts to more general ones.
  - e.g. color is a *hypernym* of *blue*, *red*, etc.
  - This relation builds *hierarchical trees* with specific *leaf* concepts.
  - There are two types of hyponyms: *types* and *instances*.
  - *types* are *common nouns*. e.g. *city* is a type of *location*.
  - *instances* are *proper names*. These are always leaf nodes without hyponyms. e.g. *Santiago* is an instance of *city*.
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Coverage])
]
#h(1em)

#dblock(title: [Verbs])[
- They encode *events* and *states* that involve *participants* (expressed by nouns).
- Have *temporal extensions*.
- These are organized by several *lexical entailment relations*:
  - *Troponomy:* Relates synset pairs such that one expresses a particular manner of the other. e.g. *whisper*, *talk*.
  - *Backward entailment:* Relation where the event encoded in one synset necessarily entails a *prior event* expressed by the second synset. e.g. *buy*, *pay* or *untie*, *tie*.
  - *Cause relation*. e.g. *show*, *see*.
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Coverage])
]
#h(1em)

#dblock(title: [Adjectives])[
  - *Antonymy* is the prevailing relation among adjectives.
  - Most adjectives are organized into *direct* antonym pairs.
  - Each member of a pair is associated with a number of *semantically similar* adjectives.
  - e.g. Considering the pair *wet-dry*, *drenched* is similar to *wet* and *arid* is similar to *dry*.
]



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Other Languages])
]
#h(1em)

- *EuroWordNet:* encompasses eight languages. For each language, networks were constructed using one of two strategies:
  - *Expand:* Translate the synsets of the Princeton WordNet into the target language, making adjustments as needed.
  - *Merge:* Develop a semantic network in the target language from scratch and subsequently link it to the Princeton WordNet.

It contains several innovations, such as *cross-POS links* (e.g. associated nouns and verbs) and *conjunctive/disjunctive* relations, which allow a synset to have multiple superordinates/subordinates.  

Example: *knife* can be an *eating utensil* and a *weapon*.



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Uses])
]
#h(1em)

- *Ontology:* Thanks to its rigid structure, WordNet is often referred to as an ontology, but its creators prefer to call it a *lexical ontology*, because most of its contents are concepts that are *linguistically encoded* and its structure is largely driven by the lexicon.

- *Thesaurus:* A *thesaurus* is *a type of dictionary in which words with similar meanings are arranged in groups*. Generally, a traditional dictionary doesn't enable semantically related words look-up, but WordNet with its semantics-based structure allows targeted look-up for meaning-related words.



== Lexicon Features
#place(top + left, dx: -2.5em)[
  #subbar([WordNet - Uses])
]
#h(1em)

- *Tool for Natural Language Processing:* its design and format have proved useful for a wide range of tasks that face the challenge of *word sense identification*, including *mono and cross linguistic information retrieval*, *question-answering systems* and *machine translation*.


= Statistical Language Models

== Statistical Language Models
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]
#h(1em)

- What we want? To compute the probability of a sentence or sequence of words $P(w_(1), …, w_(n))$.
- Why? Probability of an upcoming word $P(w_(4) | w_(1), w_(2), w_(3))$.
- A language model (LM) can compute these probabilities.
- Then, how to compute $P(W)$ with $W=(w_(1), …, w_(n))$.



== Probabilities in Action
#place(top + left, dx: -2.5em)[
  #subbar([Chain Rule])
]
#h(1em)

- How to compute this joint probability _P(imagine, there's, no, heaven)_.

- Intuition: let’s rely on the Chain Rule of Probability.

- Conditional probabilities: $P(B|A) = frac(P(A,B),P(A))$ or $P(A,B) = P(A)P(B|A)$.

- More variables: $P(A,B,C,D) = P(A)P(B | A)P(C | A,B)P(D | A,B,C)$.

- The Chain Rule in general:  
  $P(x_(1), …, x_(n)) = P(x_(1)) P(x_(2) | x_(1)) … P(x_(n) | x_(1), …, x_(n-1))$.



== Chain Rule and Probability of Words
#place(top + left, dx: -2.5em)[
  #subbar([Application])
]
#h(1em)

- $P(w_(1) … w_(n)) = product_(i) P(w_(i) | w_(1), …, w_(i−1))$

- Example:  

  _P("Imagine there's no heaven"})_ = _P("Imagine")_ $times$ _P("there's|"Imagine")_ $times$ _P("no"|"Imagine there's")_ $times$ _P("heaven"|"Imagine there's no")_

  - How to estimate these probabilities:  
  
  _P("heaven"|"Imagine there's no")_= $frac("Count (''Imagine there's no heaven'')", "Count (''Imagine there's no'')")$
  
- Problem: Too many possible sentences → never enough data.



== Markov Assumption
#place(top + left, dx: -2.5em)[
  #subbar([Simplification])
]
#h(1em)

- Simplifying assumption: _P("heaven"|"Imagine there's no") $approx$ P("heaven"|"no")_

- Or _P("heaven"|"Imagine there's no") $approx$ P("heaven"|"there's no")_

- Then:  
    
  $P(w_(1) … w_(n)) = product_(i) P(w_(i) | w_(1), …, w_(i−1))$  
  
  can be replaced by  
    
  $P(w_(i) | w_(1) … w_(i−1)) approx P(w_(i) | w_(i−k) … w_(i−1))$.



== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#h(1em)

*N-gram* is a traditional and simple _statistical language model_. It models probabilities of sequences of characters or words.

- In a character string (phrase, sentence or fragment) $s = w_1 w_2 … w_l$ composed of $l$ basic statistical units (words) (with $l >= 2$), its probability can be calculated as:

  $P(s) = product_(i=1)^l p(w_(i) | w_(1) … w_(i-1))$
  
- This means that the probability of generating the $i$-th word is determined by the previously generated $i-1$ words.




== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Unigram & Bigram])
]
#h(1em)

- With increasing sentence length, the historical number of conditional probabilities increases exponentially.

- To simplify, assume that the probability of the current word depends only on the previous $n-1$ words ($1 <= n <= l$): 

  1. $n=1$: word probability independent of previous → *unigram*.  
  
  2. $n=2$: word depends only on previous → *bigram*.  

#dblock(title: [Bigram example])[
  For the sentence *This year will be better*, the following are bigrams:  
  *This year*, *year will*, *will be*, *be better*.
]



== Theory Behind N-grams
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#h(1em)

- N-grams are contiguous sequences of *n items* (words, letters, or symbols) from a given text or speech corpus.

- They are widely used in Natural Language Processing (NLP) and computational linguistics for tasks such as *language modeling*, *text generation*, and *information retrieval*.



== Types of N-grams
#place(top + left, dx: -2.5em)[
  #subbar([Examples])
]
#h(1em)

- *Unigrams (1-grams):* Single words occurring in the text.

- *Bigrams (2-grams):* Sequences of two adjacent words.

- *Trigrams (3-grams):* Sequences of three adjacent words.

- *N-grams:* Sequences of n adjacent words.




== Calculating Probabilities
#place(top + left, dx: -2.5em)[
  #subbar([Formula])
]
#h(1em)

- To calculate the probability of a word given its context (bigram probability), we use:  

  $ P("word"|"context") = frac("Count(word, context)", "Count(context)") $

  where:  
  - Count(word, context) = number of times the word occurs after the context.
  - Count(context) = total number of occurrences of the context.



== Applications
#place(top + left, dx: -2.5em)[
  #subbar([Usage])
]
#h(1em)

It could be useful to, given a sequence of previous words, the model can help us predict a word.

- N-grams can be used as *Document Features*.

- Word-based features are useful for *information extraction problems* where *semantic information* is expected as output:

  - Multiword phrases prediction
  - Sentiment analysis
  - Machine translation
  - Spelling correction
  - Speech recognition



== Limitations
#place(top + left, dx: -2.5em)[
  #subbar([Challenges])
]
#h(1em)

- *Data sparsity:* Higher-order N-grams may have limited occurrences in the corpus → unreliable estimates.

- *Computational complexity:* Computing probabilities for large N-grams can be computationally expensive.



== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#h(1em)

#figure(
  image("images/ngramexample.png", width: 90%),
  caption: [https://devopedia.org/n-gram-model]
)



== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Imagine - Example])
]
#h(1em)

- Suppose we have the song *Imagine* by John Lennon.
- Let's calculate probabilities of word occurrences using *bigrams*.

#grid(
  columns: (1fr, 1fr),
  rows: (auto),
  text()[
  Imagine there's no heaven,\
  It's easy if you try,\
  No hell below us,\
  Above us only sky.\  
  Imagine all the people\  
  Living for today...
  ],

  text()[Bigrams:\
  (Imagine, there's), (there's, no), (no, heaven), (heaven, It's),  
  (It's, easy), (easy, if), (if, you), (you, try), (try, No),  
  (No, hell), (hell, below), (below, us), (us, Above), (Above, us),  
  (us, only), (only, sky), (sky, Imagine), (Imagine, all),  
  (all, the), (the, people), (people, Living), (Living, for), (for, today)
  ]

)



== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Frequencies])
]
#h(1em)

+ Frequency of It's easy: 3 
+ Frequency of It's: 6 
+ Frequency of all the people: 2 
+ Frequency of all the: 5 
+ Frequency of Living for today: 1
+ Frequency of Living for: 3 
+ Frequency of Above us only: 1 
+ Frequency of Above us: 2 



== N-gram Language Model
#place(top + left, dx: -2.5em)[
  #subbar([Probabilities])
]
#h(1em)


$ "P(''easy'' | ''It's'')" = frac("frequency(''It's easy''))","frequency(''It's'')") = 3/6 = 0.5 $

$ "P(''people'' | ''all the'')" = frac("frequency(''all the people''))","frequency(''all the'')") = 2/5 = 0.4 $

$ "P(''for'' | ''Living for'')" = frac("frequency(''Living for''))","frequency(''for'')") = 1/3 approx 0.33 $

$ "P(''only'' | ''Above us'')" = frac("frequency(''Above us only''))","frequency(''only'')") = 1/2 = 0.5 $
