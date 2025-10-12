#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *



= Knowledge-Based Recommendation

== Knowledge-Based Recommendation
#place(top + left, dx: -2.5em)[
  #subbar([Why Another Approach?])
]
#v(1em)

- Collaborative Filtering (CF) and Content-Based (CB) approaches are not always the best choice.
- They struggle with items that are purchased infrequently (like cars, houses, or computers) due to the lack of rating data.
- For these items, user preferences also evolve over time, making old ratings unreliable (e.g., five-year-old ratings for cellphones might be rather inappropriate now).
- Users in complex domains often want to define explicit requirements (e.g., "maximum price is X" or "car must be red"), which is not typical for pure CF or CB systems.



== Knowledge-Based Recommendation
#place(top + left, dx: -2.5em)[
  #subbar([The Core Idea])
]
#v(1em)

- Knowledge-Based (KB) systems tackle these challenges by relying on explicit knowledge about the items and the user's needs.
- *Key Advantage:* They do not suffer from ramp-up or "cold-start" problems because they don't need user rating data to function.
- The recommendation process is highly interactive and often described as "conversational".



== Knowledge-Based Recommendation
#place(top + left, dx: -2.5em)[
  #subbar([Two Basic Types])
]
#v(1em)

- KB systems calculate recommendations based on how items fit a user's requirements, not on community ratings.
- The two main types differ in how they use the provided knowledge:
  - *Constraint-based:* Relies on an explicitly defined set of recommendation rules and constraints to find matching products.
  - *Case-based:* Focuses on retrieving similar items using different types of similarity measures.
- In both approaches, the user specifies their needs, and the system tries to identify a solution.



== Knowledge Representation
#place(top + left, dx: -2.5em)[
  #subbar([Constraints-based])
]
#v(1em)

- This approach models the recommendation problem as a *Constraint Satisfaction Problem (CSP)*.
- A recommendation is a *solution* that satisfies all active constraints.
- A CSP problem can be described by a-tuple $(V, D, C)$ where:
  - $V$ is a set of variables (item attributes).
  - $D$ is a set of domains (possible values for each attribute).
  - $C$ is a set of constraints (rules that define valid combinations of attribute values).



== Knowledge Representation
#place(top + left, dx: -2.5em)[
  #subbar([Constraints-based])
]
#v(1em)

- Each solution to CSP can be described as:

$ "CSP"(V = V_c union V_"PROD", D, C = C_R union C_F union C_"PROD" union "REQ") $

- $V_c :$ Customer properties. Describe the possible customer requirements.
- $V_"PROD" :$ Product properties. Describe the product attributes.
- $C_R :$ compatibility constraints. Define allowed instantiations of customer properties.
- $C_F :$ Filter conditions. Define under which conditions which products should be selected.
- $C_"PROD" :$ Product constraints. Define the currently available product assortment.



== Knowledge Representation
#place(top + left, dx: -2.5em)[
  #subbar([Constraints-based Example])
]
#v(1em)

#figure(
  image("images/constrainRecSYS.png", width: 70%)
)


== Knowledge Representation
#place(top + left, dx: -2.5em)[
  #subbar([Constraints-based Example])
]
#v(1em)
#figure(
  image("images/example_csp.png", width: 55%)
)



== Knowledge Representation
#place(top + left, dx: -2.5em)[
  #subbar([Case-based])
]
#v(1em)

- In this approach, items are treated as "cases" and are retrieved using *similarity measures*.
- The system calculates how well each item's properties match the user's requirements.
- The overall similarity is a *weighted sum* of the similarities of individual attributes, where weights represent the importance of each requirement to the user.



== Similarity Measures in Detail
#place(top + left, dx: -2.5em)[
  #subbar([Case-based])
]
#v(1em)

- Different attributes require different similarity calculations:
  - *More-is-Better (MIB):* For properties the user wants to maximize (e.g., camera resolution). Higher values are better.
  - *Less-is-Better (LIB):* For properties the user wants to minimize (e.g., price). Lower values are better.
  - *Distance-Based:* For when the user has a specific target value in mind (e.g., a specific monitor size), and closeness to that value is what matters most.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([The General Interaction Flow])
]
#v(1em)

- The user interaction in a conversational, knowledge-based system typically follows these steps:
  - *1. Specify Preferences:* The user provides their initial requirements, often through a form or an interactive, wizard-style dialog.
  - *2. Get Recommendations:* Once enough information is gathered, the system presents a set of matching items.
  - *3. Revise Requirements:* The user can then change their requirements to see alternative solutions or to narrow down the number of matching items.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Defaults: Proposing Values])
]
#v(1em)

- Pre-filled or suggested values that support the user during the requirements process.
- Why are they useful?
  - They help customers who are unsure or lack technical knowledge by proposing a reasonable starting point.
  - They can reduce the effort needed to specify requirements.
- The main coin is that Defaults can also be used to bias or manipulate users into choosing certain options the seller wants to promote.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Defaults: Proposing Values])
]
#v(1em)

- Defaults can be specified in various ways:
  - *Static Defaults:* One fixed default is specified for each property (e.g., the default `usage` is `large-print`).
  - *Dependent Defaults:* The default value for one property depends on the user's choices for other properties (e.g., if `usage` is `small-print`, the default `max-price` becomes `300`).
  - *Derived Defaults:* The system automatically learns and proposes defaults by analyzing the interaction logs of previous users.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Defaults: Calculating Derived Defaults])
]
#v(1em)

- Derived defaults are often calculated using methods like:
  - *1-Nearest Neighbor:* The system finds the *single most similar past user* based on the current user's requirements and proposes their choice as the default.
  - *Weighted Majority Voter:* The system finds a set of similar past users (neighbors) and proposes the value that was *most frequently chosen* among them.
- The main problem is that these methods don't guarantee that a product will actually exist that matches the proposed default along with the user's other requirements.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Defaults: Selecting next question])
]
#v(1em)

- The same principles can be used to help the user decide which requirement to specify next.
- Instead of just waiting for input, the system can proactively suggest properties that might be interesting to the user.
- How it works:
  - The system can propose the most *popular* next question based on how frequently other users specified that property.
  - Alternatively, it can use the *weighted majority voter* to find what similar users specified next in their sessions.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([The "No Solution Found" Dilemma])
]
#v(1em)

- This simple interaction flow is often not enough for practical applications.
- A common problem is when *no items in the catalog satisfy all of the user's requirements*.
- In these "no solution" situations, a good conversational recommender should intelligently support the user.
- The system should proactively help the user resolve the problem, for example, by proposing alternative actions to take.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Unsatisfied requirements])
]
#v(1em)

- "No solution could be found"
- Constraint relaxation
  - The goal is to identify relaxations to the original set of constraints.
  - Relax constraints of a recommendation problem until a corresponding solution has been found.
- Users could also be interested in repair proposals.
  - Recommender can calculate a solution by adapting the proposed requirements.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Deal with unsatisfied requirements])
]
#v(1em)

- Calculate diagnoses for unsatisfied requirements.

#figure(
  image("images/caldiag.png", width: 40%)
)

- The diagnoses derived from the conflict sets ${"CS"_1, "CS"_2, "CS"_3}$ are ${d_1:{r_1, r_2}, d_2:{r_1, r_4}, d_3:{r_2, r_3}}$



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Deal with unsatisfied requirements - QuickXPlain])
]
#v(1em)

#figure(
  image("images/algquick.png", width: 60%)
)



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Deal with unsatisfied requirements - QuickXPlain])
]
#v(1em)

#figure(
  image("images/qp1.png", width: 80%)
)

$ "REQ" = \{ r_1:"price" <= 150, r_2:"opt-zoom"=5x, r_3:"sound"="yes", r_4:"waterproof"="yes" \} $



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Deal with unsatisfied requirements - QuickXPlain])
]
#v(1em)

#figure(
  image("images/qp2.png", width: 70%)
)



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Repairs for unsatisfied requirements])
]
#v(1em)

- Identify possible adaptations.
- Or query the product table P with $pi ["attributes"(d)] sigma ["REQ" - d](P)$
  - $pi["attributes"(d_1)]sigma["REQ" - d_1](P) = \{"price"=278, "opt-zoom"=10x\}$
  - $pi["attributes"(d_2)]sigma["REQ"-d_2](P) = \{"price"=182, "waterproof"="no"\}$
  - $pi["attributes"(d_3)]sigma["REQ"-d_3](P) = \{"opt-zoom"=4x, "sound"="no"\}$

#figure(
  image("images/unsatisfy.png", width: 70%)
)



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Ranking the items])
]
#v(1em)

- Multi-attribute utility theory
  - Each item is evaluated according to a predefined set of dimensions that provide an aggregated view on the basic item properties.
- E.g. quality and economy are dimensions in the domain of digital cameras.

#figure(
  image("images/unsatisfy.png", width: 70%)
)



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Item utility for customers])
]
#v(1em)

- Ranking recommended items by their *utility* to the customer is crucial.
- This leverages the *primacy effect:* customers pay more attention to items at the top of a list.
- A good ranking, therefore, can significantly increase a user's *trust* and their *willingness to buy*.
- In KB systems, this is often done using *Multi-Attribute Utility Theory (MAUT)*, which evaluates the specific utility of each item for the customer.



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Item utility for customers])
]
#v(1em)

- Example:

#figure(
  image("images/example_utily.png", width: 35%)
)



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Item utility for customers])
]
#v(1em)

- Customer specific interest.

#align(center)[
  #figure(
    image("images/utility1.png", width: 40%)
  )
]



== Interacting with Constraint-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Item utility for customers])
]
#v(1em)


- Calculation of Utility

#figure(
  image("images/utility2.png", width: 75%)
)



== Interacting with Case-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Case-based recommender systems])
]
#v(1em)

- Items are retrieved using similarity measures
- Distance similarity
  $ "similarity"(p, "REQ") = frac(sum_(r in "REQ") w_r times "sim"(p,r), sum_(r in "REQ") w_r) $
- Where
  - $"sim"(p, r)$ expresses for each item attribute value $phi.alt(p)$ its distance to the customer requirement $r in "REQ"$.
  - $w_r$ is the importance weight for requirement $r$



== Interacting with Case-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Interacting with case-based recommenders])
]
#v(1em)

- Customers maybe not know what they are seeking.
- Critiquing is an effective way to support such navigations.
- Customers specify their change requests (price or mpix) that are not satisfied by the current item (entry item).

#figure(
  image("images/interact.png", width: 80%)
)



== Interacting with Case-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Compound critiques])
]
#v(1em)

- Operate over multiple properties can improve the efficiency of recommendation dialogs

#figure(
  image("images/compound.png", width: 50%)
)



== Interacting with Case-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Dynamic critiques])
]
#v(1em)

- Exploits patterns, which are generic descriptions of differences between the recommended (entry) and the candidate items.
- Denoted as dynamic because they are derived on the fly in each critiquing cycle.
- Are calculated using the concept of association rule mining.
- Example:
  - "42.9% of the remaining digital cameras have a higher zoom and a lower price" (more zoom and lower price).



== Interacting with Case-Based Recommenders
#place(top + left, dx: -2.5em)[
  #subbar([Example: Sales dialogue financial services])
]
#v(1em)

#grid(
  columns: (3fr, 7fr),
  gutter: 1em,
  image("images/ex1.png", width: 90%),
  [
    - In the financial services domain
      - Sales representatives do not know which services should be recommended
      - Improve the overall productivity of sales representatives
    - Resembles call-center scripting
      - Best-practice sales dialogues
      - States, transitions with predicates
    - Research results
      - Support for KA and validation
      - Node properties (reachable, extensible, deterministic)
  ]
)