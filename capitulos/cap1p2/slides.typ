#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

= Other methodologies for Data Science Projects

== Cross Industry Standard Process For Data Mining

#dblock(title: [Cross Industry Standard Process For Data Mining (CRISP-DM)])[
  Standard process for using Data Mining into a problem-solving strategy in a business.
]

== Cross Industry Standard Process For Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([CRISP-DM steps])
]

#v(20pt)

#figure(
  image("images/crispdm.jpg", height: 80%),
  caption: [Source: IBM.]
)

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

#figure(
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

