#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)


= Initial Concepts

== The World Wide Web
#place(top + left, dx: -2.5em)[
  #subbar([What is the Web?])
]

#dblock(title: [World Wide Web])[
  The World Wide Web (W3) is the universe of network-accessible information, an embodiment of human knowledge. It is an initiative started at CERN, now with many participants. It has a body of software, and a set of protocols and conventions. W3 uses hypertext and multimedia techniques to make the web easy for anyone to roam, browse, and contribute to *(Tim Berners-Lee, 1993)*.
]

== The World Wide Web
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

The _World Wide Web_ (or simply Web) is an information space in which the items of interest, refered to as *resources*, are identified by global identifiers called *Uniform Resource Identifiers (URI)* #footnote[Source: https://www.w3.org/TR/webarch].

- The items are interlinked by hypertext links.

- It can be accessed via the Internet.

== The World Wide Web
#place(top + left, dx: -2.5em)[
  #subbar([Internet])
]

The Internet is the global system of interconnected computer networks that use the Internet Protocol Suite (TCP/IP) to link devices worldwide.

- Who is the owner of the Internet?
- 

== Internet adoption over time

#figure(
  image("images/internet_growth.png"),
)


== E-Business

#dblock(title: [E-Business])[
  Business activity and organizational management practices that involves using IT and Internet to promote collaboration between the business main stakeholders and carry out different operations, both within and outside the organization.
]

== E-Commerce

#dblock(title: [E-Commerce])[
  Usage of internet in commercial activities, like the sale of productos, services, information and communication. It's inclusion requires an E-Business strategy to adapt the organizational environment, such as the adoption of a Web Site and ERP.
]

== E-Commerce
#place(top + left, dx: -2.5em)[
  #subbar([Different types of interactions (and some examples)])
]

There are different types of E-Commerce interactions:

1. Business-to-Business (B2B): Between stakeholders
  - Intcomex
2. Business-to-Consumer (B2C): Directly with the consumer
  - Amazon
  - Falabella
  - Lider (Walmart)
3. Consumer-to-Consumer (C2C): Private interaction between the consumers
  - MercadoLibre
  - eBay
  - Facebook Marketplace

== Adaptive Website
#place(top + left, dx: -2.5em)[
  #subbar([Motivation: Web site as the point of sale])
]

What is the *ideal structure and content* of a web site?
- *Different users* have *different goals.*
- The *behaviour* of users changes over time.
- *Sites must be restructured* as the grow to meet current needs, typically bu accumulating pages and links.

== Adaptive Website
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

#dblock(title: [Adaptive Website])[
  Web site that automatically improve their organization, content and presentation by learning from user activity.
]

- We can use Web Intelligence to automatically modify the web site structure and contents based on *individual user behaviour*.

- This includes the usage of Web Usage Mining to understand user preferences and make recommendations.

== Data, Information and Knowledge
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

- Data:
  - Values without context

- Information:
  - Processed data: Context, categorization, calculation or aggregation
  - *Meaningful:* It changes the behavior, helps to take decisions

- Knowledge:
  - Information plus experience
  - It helps to incorporate new information and new experiences
  - Useful for action and prediction

== Data, Information and Knowledge
#place(top + left, dx: -2.5em)[
  #subbar([Example])

  #figure(
    image("images/data_ex.png", height: 90%),
  )
]

= Knowledge Discovery in Databases

== KDD: Extracting knowledge from data
#place(top + left, dx: -2.5em)[
  #subbar([Motivation])
]

- The data resume for decision making is a *traditional report of statistics.*
- Today information is a valuable resource that have important implication in the productivity of organizations. It's administration is called *knowledge discovery.*
- This process usually imply a *large amount of data.*

== KDD: Extracting knowledge from data
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

#dblock(title: [Knowledge Discovery in Databases])[
  Systematic, multi-step process to extract valuable and actionable knowledge from datasets.
]

The goal: Find *knowledge valid, useful, relevant and new* over a phenomena or activity.

- A visual representation of the result in order for an easier interpretation.
- The usability must allow a flexible, dynamic and collaborative process.
- Scalability and efficiency are important requirements.

== The Knowledge Pyramid

#figure(
  image("images/knowledge_pyramid.png"),
)

== The KDD Process

The Knowledge Discovery in Databases (KDD) process is commonly defined with the following steps:

1. Selection
2. Pre-processing
3. Transformation
4. Data Mining
5. Evaluation

== The KDD Process

#figure(
  image("images/kdd.png", height: 90%),
  caption: [Source: Geeks for Geeks]
)

== Step 1: Data Selection

#figure(
  image("images/step1.png"),
)


== Step 1: Data Selection
- The identification of real data sources is an important step in the KDD process.
- Irrelevant data (noise) often leads to analytic errors.
- Different data formats introduce a cost of interpretation/transformation.
  - Metadata allows us to standardize the data.

== Step 2: Pre-processing and Cleaning

#figure(
  image("images/step2.png"),
)  

== Step 2: Pre-processing and Cleaning

- Common issues with the data
  - Missing Values
  - Dynamical data
  - Distributed and big data bases
  - Noise
- *Data consistency:* Operational system are constructed on base of the direct business requirements. That means any other requirement on them (like KDD) have been never implemented and tested
- *Data Manipulation errors:* Usually occurs when testing is avoided. Example: Client with name “Batman” that remains from the development process.
- *Irrelevant Data:* Some data need to be filtered because is not part of the analysis.

== Step 3: Data Transformation

#figure(
  image("images/step3.png"),
)

== Step 3: Data Transformation

- Once the data is pre-processed and cleaned, it needs to be transformed to a format suitable and more efficient for pattern discovery:
  - Normalization
  - Aggregations
  - Construction of new attributes (Feature Engineering) 
  - Dimensionality Reduction
  - Discretization
  - Encoding
  - Noise Reduction

== Step 4: Data Mining

#figure(
  image("images/step4.png"),
)

== Step 4: Data Mining

#figure(
  image("images/step4-3.png"),
)

== Step 4: Data Mining

#figure(
  image("images/step4-2.png"),
)

== Step 4: Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([Using Data Mining to Extract Knowledge])
]

- How to use the prediction for knowledge?
- How to find the *rules* implied by the generated models?
- How to model *human behavior*?

== Step 4: Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([Rules: Knowledge for humans])
]

- Humans usually understand better knowledge expressed in the form of *Rules*.
- EEUU legislation doesn't allow credit assignations based in _black box predictors_.

- There are highly-explainable models that throw directly a set of rules, like *Decision Trees* and *Bayesian Networks*.

- Other models are *black box predictors*, like ANNs, but there's research about making them explainable.

== Step 5: Interpreting and verifying results

- Summarized critical factors: Observing it's impact on the business and try to explain them.

- *The expert can (must) identify the knowledge.*

- Store the knowledge generated and reuse it on a future KDD process.


== Conclusion

- Tactical value of large amounts of data.

- Analysis capacities and finding useful knowledge v/s Cost and time.

- The new knowledge *must be* validated by new data in order to plan the business.

- The expert must validate each step in the process.

- The correct interpretation of the result will generate the knowledge.

- The new discovery must be stored in a structure that allows reuse in others KDD.

