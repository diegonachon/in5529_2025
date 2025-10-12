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

