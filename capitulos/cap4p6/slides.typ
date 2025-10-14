#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *


= Hybrid Recommendation Approaches

== Hybrid Recommendation Approaches
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#v(1em)

- The three main approaches (Collaborative, Content-Based, Knowledge-Based) all have varying degrees of success depending on the domain.
- Each has its own strengths and weaknesses, such as:
  - Data sparsity and cold-start problems.
  - Significant effort required for knowledge acquisition.
- A *hybrid system* combines the strengths of different algorithms to overcome these shortcomings and improve recommendations.



== Hybrid Recommendation Approaches
#place(top + left, dx: -2.5em)[
  #subbar([The Recommender "Black Box"])
]
#v(1em)

- A recommender system can be seen as a black box that transforms various inputs into a ranked list of recommended items.
- Potential inputs include:
  - User profiles and contextual parameters.
  - Community data (ratings).
  - Product features (content).
  - Knowledge models (rules, constraints).
- *None of the basic approaches can fully exploit all of these potential inputs on their own.*



== Hybrid Recommendation Approaches
#place(top + left, dx: -2.5em)[
  #subbar([The Recommender "Black Box"])
]
#v(1em)

#figure(
  image("images/hybrid_rec.png", width: 65%)
)



== Recommendation Paradigms
#place(top + left, dx: -2.5em)[
  #subbar([The Formal Problem])
]
#v(1em)

- A recommendation problem can be formalized as a utility function $"rec"(u, i)$, that predicts the usefulness of an item $i$ for a specific user $u$.
- The system's task is to identify the top $n$ items from a catalog that achieve the highest utility scores for that user.
- How this utility score is calculated depends on the underlying recommendation paradigm.



== Recommendation Paradigms
#place(top + left, dx: -2.5em)[
  #subbar([The Three Base Paradigms])
]
#v(1em)

- *Collaborative Filtering*:
  - Assumes users with similar past behaviors will have similar future preferences.
  - _Tell me what's popular among my peers._
- *Content-Based*:
  - Follows a "more of the same" approach.
  - _Show me more of the same what I've liked._
- *Knowledge-Based*:
  - Uses an additional source of explicit personalization knowledge.
  - _Tell me what fits based on my need._



== Recommendation Paradigms
#place(top + left, dx: -2.5em)[
  #subbar([Input Data Requirements])
]
#v(1em)

- The choice of paradigm determines the type of input data required.
- All paradigms require access to a *user model*, which can contain:
  - Items the user has rated.
  - Demographic information.
  - Contextual parameters (time of day, location, companions).
- Not all hybridization variants are possible in every application, as parts of the user model may not be available.



== Recommendation Paradigms
#place(top + left, dx: -2.5em)[
  #subbar([Data Needs at a Glance])
]
#v(1em)

- Each paradigm selectively requires different data sources beyond the user profile:

#{
  // show table.cell: set text(size: 15pt)

  align(center)[
    #table(
    columns: 5,
    stroke: 0pt,
    align: center,
    table.hline(stroke: 1.5pt),
    [*Paradigm*], [*User profile and \ contextual parameters*], [*Community \ Data*], [*Product \ Features*], [*Knowledge \ Models*],
    table.hline(stroke: 1pt),
    "Collaborative", "Yes", "Yes", "No", "No",
    "Content-Based", "Yes", "No", "Yes", "No",
    "Knowledge-Based", "Yes", "No", "Yes", "Yes",
    table.hline(stroke: 1.5pt),
  )
]
}




== Hybrid Recommendation Approaches
#place(top + left, dx: -2.5em)[
  #subbar([The Recommender "Black Box"])
]
#v(1em)


// == Hybrid Recommendation Approaches
// #place(top + left, dx: -2.5em)[
//   #subbar([The Recommender "Black Box"])
// ]
// #v(1em)

// - Combines different types of recommenders:

// - Different hybridization designs:
//   - Monolithic Hybridization
//   - Parallelized Hybridization
//   - Pipelined Hybridization









