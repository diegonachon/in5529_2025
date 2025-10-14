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



== Hybridization Designs
#place(top + left, dx: -2.5em)[
  #subbar([How to Combine Algorithms])
]
#v(1em)

- The second key dimension of a hybrid system is its **design**—the method used to combine two or more algorithms.
- There are three base designs for combining recommendation components:
  - Monolithic Hybridization
  - Parallelized Hybridization
  - Pipelined Hybridization


---



== Hybridization Designs
#place(top + left, dx: -2.5em)[
  #subbar([Monolithic Design])
]
#v(1em)

- A single recommender component that integrates multiple approaches by preprocessing and combining different knowledge sources _before_ the main algorithm runs.
- The algorithm's behavior is modified to use different types of input data.

#figure(
  image("images/mono_hybrid.png", width: 60%)
)



== Hybridization Designs
#place(top + left, dx: -2.5em)[
  #subbar([Parallelized Design])
]
#v(1em)

- Several different recommenders operate independently (in parallel).
- Each system produces its own list of recommendations, and a final hybridization step combines these separate lists into one.

#figure(
  image("images/para_hybrid.png", width: 60%)
)



== Hybridization Designs
#place(top + left, dx: -2.5em)[
  #subbar([Pipelined Design])
]
#v(1em)

- Several recommenders are joined together in a sequence or "pipeline".
- The output of one recommender becomes the input for the next one in the sequence, which then refines the results.

#figure(
  image("images/pipe_hybrid.png", width: 60%)
)



== Monolithic Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Monolithic Hybridization])
]
#v(1em)

- Unlike other designs that combine the _results_ of separate recommenders, monolithic hybrids consist of a *single, integrated component*.
- This single component is modified to use multiple types of knowledge sources from the start.
- Hybridization is achieved through _preprocessing steps_ that transform different types of input data into a unified representation that one main algorithm can use.
- The two main strategies in this category are:
  - *Feature Combination*
  - *Feature Augmentation*



== Monolithic Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Feature Combination Hybrids])
]
#v(1em)

- It's a single recommender that uses a diverse range of input data types from the beginning.
- It combines features from different sources (e.g., collaborative and content-based) into a new, single set of hybrid features.
  - Example: Instead of just using a user's ratings (collaborative), the system might also look at the genre of the books they bought (content). It could then create a new feature like *"User likes many mystery books"*.
- This allows the system to find more nuanced similarities between users. For instance, two users who seem equally similar based on ratings might look very different once their preferred genres are considered.



== Monolithic Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Feature Augmentation Hybrids])
]
#v(1em)

- A more complex monolithic design where the output of one recommendation approach is used to augment the input data for the main recommendation algorithm.
- The implementation of the contributing recommender is strongly interwoven with the main component.



== Monolithic Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Feature Augmentation Hybrids])
]
#v(1em)

- Example: Content-Boosted Collaborative Filtering
  - _Step 1_: For every item a user *hasn't* rated, a content-based recommender first *predicts* a rating.
  - _Step 2:_ The original user-item matrix is filled in with these predictions, creating a dense "pseudo-ratings" matrix.
  - _Step 3:_ A collaborative filtering algorithm then runs on this new, complete matrix to make the final recommendations.
- This helps to overcome data sparsity, as the system can work with a full set of ratings, even if most are just predictions.



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Parallelized Hybridization])
]
#v(1em)
- Employ several recommenders side by side and aggregate their outputs.
- Some strategies are:
  - Mixed
  - Weighted
  - Switching



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Mixed Strategy])
]
#v(1em)

- A strategy that combines the results of different recommender systems at the user interface level.
- Instead of merging the scores into a single ranked list, the outputs from different techniques are presented together, often side-by-side.
- The recommendation result for user _u_ and item _i_ of a mixed hybrid strategy is the set uo-tuple $angle.l "score", k angle.r$ for each of its n constituting recommenders $"rec"_k$:

$ "rec"_("mixed")(u,i) = union.big_(k=1)^(n) angle.l "rec"_(k)(u,i), k angle.r $



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Mixed Strategy: Examples and Application])
]
#v(1em)

- _Example 1: Separate Lists_
  - A web page might show a list of "Top Rated Items" (from a collaborative filter) next to a list of "Similar Items" (from a content-based filter).
- _Example 2: Bundled Recommendations_
  - In tourism, one recommender might suggest hotels while another suggests activities. A mixed hybrid can bundle these into a consistent travel package (e.g., ensuring the hotel and activities are near each other).
  - This often requires a _conflict resolution_ step (like a Constraint Solver) to ensure the bundled items are compatible.



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Weighted Strategy])
]
#v(1em)

- Combines recommendations from two or more systems by calculating a weighted sum of their individual scores.
- The final score for a user $u$ and the item $i$ is determined by:
$ "rec"_("weighted")(u,i) = sum_(k=1)^(n) beta_(k) times "rec"_(k)(u,i) $
- Where:
  - $beta_k$ is the associated weight of recommender $"rec"_k$.
  - All items scores must be on the same scale, and the sum of all weights must equal 1.



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Weighted Strategy: Examples and Application])
]
#v(1em)

- Assuming $beta_1 = beta_2 = 0.5$

#{
  // show table.cell: set text(size: 15pt)

  align(center)[
    #table(
    columns: 7,
    stroke: 0pt,
    align: center,
    table.hline(stroke: 1.5pt),
    [*Item*], [*$"rec"_(1)$ \ score*], [*$"rec"_(2)$ \ rank*], [*$"rec"_(2)$ \ score*], [*$"rec"_(2)$ \ rank*], [*$"rec"_(w)$ \ score*], [*$"rec"_(w)$ \ rank*],
    table.hline(stroke: 1pt),
    "Item1", "0.5", "1", "0.8", "2", "0.65", "1",
    "Item2", "0", "", "0.9", "1", "0.45", "2",
    "Item3", "0.3", "2", "0.4", "3", "0.35", "3",
    "Item4", "0.1", "3", "0", "", "0.05", "",
    "Item5", "0", "", "0", "", "0", "",
    table.hline(stroke: 1.5pt),
    )
  ]
}



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Dynamic Weighted Strategy])
]
#v(1em)

- A *static* weighting scheme is not always optimal, as different algorithms may perform better for different users or items.

- A *dynamic weighting* approach addresses this by adjusting the weights for each user.

- The goal is to find the weights that *minimize the prediction error* for that specific user.

$ "MAE" = frac(sum_(r_i in R) sum_(k=1)^(n) beta_k times |"rec"_k (u,i) - r_i|, |R|) $



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Dynamic Weighted Strategy])
]
#v(1em)


#figure(
  image("images/weight_ex.png", width: 60%)
)



== Parallelized Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Switching Strategy])
]
#v(1em)

- A hybrid design that uses an "oracle" or switching mechanism to decide which single recommender should be used in a specific situation.
- Instead of combining scores, the system selects *one* of its available algorithms based on a predefined *switching condition*.
- Only the output of the selected recommender is shown to the user.
$ exists_1 k: 1 ... n quad "rec"_"switching" (u,i) = "rec"_k (u,i) $



== Switching Hybrids
#place(top + left, dx: -2.5em)[
  #subbar([Examples of Switching Conditions])
]
#v(1em)

- The switching condition can be based on various factors:
  - *Cold-Start Problem:* The system could use a Knowledge-Based recommender for new users and then "switch" to Collaborative Filtering once enough rating data is available.
  - *Optimizing Results:* A system might try different algorithms in a specific order. For example, first tries a content-based kNN; if that fails, it switches to collaborative filtering, and finally falls back to a long-term interest model.
  - *Handling Insufficient Results:* A system could use a primary algorithm and then switch secondary strategy if the primary one doesn't produce enough recommendations.



== Pipelined Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Pipelined Hybridization])
]
#v(1em)

- Implement a staged process in which several techniques sequentially build on each other before the final one produces recommendations.
- Variants differentiate themselves mainly according to the type of output they produce.
  - Cascade hybrids
  - Meta-level hybrids



== Pipelined Hybridization Design
#place(top + left, dx: -2.5em)[
  #subbar([Cascade Hybrids])
]
#v(1em)

- A hybrid design where recommenders are arranged in a sequence or "pipeline."
- Each recommender in the sequence *refines* the list of recommendations from the one before it.
- The output of one stage serves as the input for the next.
- Formally, we define it as:
$ "rec"_"cascade" (u,i) = "rec"_n (u,i) $
where $forall k >= 2$:
$ "rec"_k (u,i) = cases(
      "rec"_k (u,i) quad &: "rec"_(k-1) (u,i) != 0, 
      0 &: "else") $


---



== Cascade Hybrids
#place(top + left, dx: -2.5em)[
  #subbar([The Key Rule])
]
#v(1em)

- The core principle is that a recommender in the sequence can only **re-rank or remove** items from its predecessor's list.
- **It cannot introduce new items.** If an item was filtered out in an early stage, it cannot be brought back in a later stage.
- This creates a multi-stage filtering and refining process.



---



== Cascade Hybrids
#place(top + left, dx: -2.5em)[
  #subbar([Advantages and Disadvantages])
]
#v(1em)

- **Main Use Case:** They are a natural choice when one recommender produces a large, unsorted list of candidates.
  - *Example:* A Knowledge-Based system finds all products that meet a user's requirements, and a second, cascaded algorithm (like Collaborative Filtering) then ranks those products for personalization.

- **Potential Disadvantage:** The final recommendation list can sometimes be very small (or even empty) if each stage filters out too many items.
  - A common solution is to combine it with a *switching hybrid* as a fallback strategy.