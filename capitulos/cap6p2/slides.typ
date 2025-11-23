#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *



= Human-in-the-Loop


== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Era of Deep Learning])
]
#v(1em)

- Deep Learning has revolutionized AI (AlphaGo, ImageNet, BERT).
- Success is driven by algorithms with hundreds of millions of parameters.
- These models have huge capacity but require massive resources.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Data Bottleneck])
]
#v(1em)

- **Data vs. Parameters:** The growth rate of available labeled data lags far behind the growth of model parameters.
- **Cost:** Labeling massive datasets is labor-intensive and expensive.
- **Speed:** New tasks emerge faster than we can curate datasets for them.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Quality Issue])
]
#v(1em)

- Unlabeled data is abundant but "noisy."
- Flawed or incorrect samples can be fatal to model training.
- Purely automated methods struggle to distinguish subtle errors without context.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([Defining Human-in-the-Loop (HITL)])
]
#v(1em)

- Definition:
  - *Concept:* A paradigm where humans play an active role in the machine learning cycle.

  - *Role:* Humans act as "special agents" providing rich prior knowledge.

  - *Goal:* Achieve high accuracy with minimum cost by combining human wisdom with computing power.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Model Development Cycle])
]
#v(1em)


#figure(
  image("images/image.png", width: 50%)
)


- **Preprocessing:** Cleaning and organizing raw data.
- **Modeling:** Training and refining algorithms.
- **Optimization:** Tuning for deployment.
- *HITL can intervene at every single stage.*



---



== Research Trends
#place(top + left, dx: -2.5em)[
  #subbar([Growth])
]
#v(1em)

- The field has exploded in the last decade.
- Publications grew from ~191 (2010) to ~6,000 (2021).
- This confirms that automation alone is not enough; human-AI collaboration is the future.



---



== Module 2: Data Processing
#align(center)[
  #text(1.5em)[Preprocessing, Annotation, and Iteration]
]



---



== The HITL Data Pipeline
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)



- Three main stages of intervention:
  1. **Preprocessing:** Preparing the raw material.
  2. **Annotation:** Adding meaning (labels).
  3. **Iterative Labeling:** Refining based on model feedback.



---



== 1. Data Preprocessing
#place(top + left, dx: -2.5em)[
  #subbar([The Foundation])
]
#v(1em)

- "Garbage in, garbage out."
- Data scientists spend ~80% of their time just cleaning data.
- High-dimensional data is hard to visualize and structure automatically.



---



== Interactive Parameter Tuning
#place(top + left, dx: -2.5em)[
  #subbar([Preprocessing Strategy])
]
#v(1em)

- Humans struggle to understand abstract model parameters.
- **Solution:** Interactive visualization tools (e.g., Multidimensional Scaling).
- Users manipulate visual clusters, and the system adjusts the underlying parameters to match.



---



== Adaptive Data Cleaning (AutoML)
#place(top + left, dx: -2.5em)[
  #subbar([Preprocessing Strategy])
]
#v(1em)

- Systems like *Learn2Clean*.
- The system suggests a cleaning operation.
- The human approves or modifies it.
- The system *learns* from this choice to automate future cleaning steps.



---



== Dictionary Expansion
#place(top + left, dx: -2.5em)[
  #subbar([Preprocessing Strategy])
]
#v(1em)

- Critical for Natural Language Processing (NLP).
- Building seed dictionaries for new domains.
- Neural networks suggest related terms; humans verify them to rapidly expand the vocabulary.



---



== 2. Data Annotation
#place(top + left, dx: -2.5em)[
  #subbar([Adding Value])
]
#v(1em)

- The most common HITL task.
- **Entity Extraction:** Humans highlight entities; system learns patterns (Regex/Rules) faster than manual coding.
- **Disambiguation:** Humans resolve confusing cases (e.g., "Apple" the fruit vs. "Apple" the company).



---



== Adversarial Data Generation
#place(top + left, dx: -2.5em)[
  #subbar([Advanced Annotation])
]
#v(1em)

- Models are often brittle.
- **Idea:** Use humans to intentionally create "trick" questions or data points ("adversarial examples").
- **Result:** Exposes model weaknesses and creates robust training datasets.



---



== Visual Annotation (CV)
#place(top + left, dx: -2.5em)[
  #subbar([Challenges])
]
#v(1em)

- Labeling images (bounding boxes, segmentation) is tedious.
- **Video:** Humans label keyframes; system propagates labels to other frames.
- **Person Re-ID:** Humans verify matches across different cameras to train the system on identifying individuals in varying lighting/poses.



---



== Artistic Annotation
#place(top + left, dx: -2.5em)[
  #subbar([Creative Domain])
]
#v(1em)

- **Manga/Comics:** Generating comics from photos.
- Some aspects (style, emotion) are hard to quantify.
- HITL allows artists to guide the style transfer process, injecting "unquantifiable" artistic intuition.



---



== 3. Iterative Labeling
#place(top + left, dx: -2.5em)[
  #subbar([Efficiency])
]
#v(1em)

- Labeling *everything* is inefficient.
- **Key Samples:** Identify the specific data points that confuse the model.
- **The Loop:**
  1. Model predicts.
  2. Model flags low-confidence items.
  3. Human labels only those items.
  4. Repeat.



---



== Module 3: HITL in NLP Models
#align(center)[
  #text(1.5em)[Training & Inference in Text]
]



---



== NLP Workflow
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)



- Humans can intervene in:
  - Feature selection.
  - Confidence scoring.
  - Logic verification.



---



== Text Classification
#place(top + left, dx: -2.5em)[
  #subbar([Application])
]
#v(1em)

- **Example:** Rumor detection in journalism.
- Models classify news as "rumor" or "fact."
- Journalists review "uncertain" classifications.
- The model retrains based on expert feedback, improving reliability over time.



---



== Explainability in NLP
#place(top + left, dx: -2.5em)[
  #subbar([Trust])
]
#v(1em)

- "Black box" models are risky.
- **MARTA Framework:** Combines Bayesian logic (human-readable) with Deep Learning.
- Humans can inspect the logic rules the model derived and correct them if they are nonsensical.



---



== Semantic Parsing
#place(top + left, dx: -2.5em)[
  #subbar([Understanding])
]
#v(1em)

- Converting natural language to SQL or Code.
- **Clarification:** If the model is unsure of the user's intent, it asks a clarifying question.
- The user's answer acts as a label for that specific training example.



---



== Question Answering (QA)
#place(top + left, dx: -2.5em)[
  #subbar([Chatbots])
]
#v(1em)

- **Online Loop:** Continuous learning from live conversation logs.
- **Offline Loop:** Batch processing of failed conversations.
- **Adversarial QA:** Humans write questions specifically designed to break the current version of the bot to make the next version tougher.



---



== Sentiment Analysis
#place(top + left, dx: -2.5em)[
  #subbar([Nuance])
]
#v(1em)

- Metrics like "Accuracy" don't tell the whole story.
- **Explainable Sentiment:** Humans evaluate *why* the model classified a review as negative.
- Did it focus on the word "slow"? Was "slow" actually good (e.g., "slow cooking")?
- Human feedback corrects the feature attention map.



---



== Module 4: HITL in CV Models
#align(center)[
  #text(1.5em)[Computer Vision & Imaging]
]



---



== CV Workflow
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)



- Handling complex visual noise (blur, occlusion, lighting).
- Integrating human visual perception into the loss function.



---



== Object Detection
#place(top + left, dx: -2.5em)[
  #subbar([Finding Things])
]
#v(1em)

- **Cost Sensitive:** Detectors propose thousands of bounding boxes.
- The system calculates the "cost" (risk) of being wrong.
- Humans only verify the high-risk predictions.
- **Tracking:** Helping algorithms like Deep SORT re-acquire targets lost behind obstacles.



---



== Image Restoration
#place(top + left, dx: -2.5em)[
  #subbar([Quality Control])
]
#v(1em)

- Removing noise, blur, or artifacts.
- **Deep Image Prior:** An iterative process.
- The model cleans the image; the user checks it.
- If unsatisfied, the user highlights problematic areas, and the model tries again with different parameters.



---



== Semantic Segmentation
#place(top + left, dx: -2.5em)[
  #subbar([Precision])
]
#v(1em)

- Assigning a class to every pixel (e.g., medical imaging).
- **Hard Negative Mining:** The system shows the human images where it is "confused."
- The human creates a "counter-example" annotation.
- This is vastly more efficient than annotating random easy images.



---



== Image Enhancement
#place(top + left, dx: -2.5em)[
  #subbar([Personalization])
]
#v(1em)

- "Good" contrast or brightness is subjective.
- **Preference Learning:**
  - The system shows options (A vs B).
  - User picks preference.
  - A RankNet model learns the user's personal taste function to automate future editing.



---



== Module 5: Applications
#align(center)[
  #text(1.5em)[HITL Systems in the Real World]
]



---



== Application Categories
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#v(1em)

1. **Security Systems:** Safety-critical operations.
2. **Code Production:** Software engineering tools.
3. **Simulation:** Training and forecasting.
4. **Search Engines:** Information retrieval.



---



== 1. Security Systems
#place(top + left, dx: -2.5em)[
  #subbar([High Stakes])
]
#v(1em)



- **Concept:** Humans are flexible but prone to fatigue; Machines are consistent but rigid.
- **Cyber-Physical Systems:** Predicting human error precursors in nuclear plants or cockpits.
- The system monitors the human; the human monitors the system.



---



== Information Security
#place(top + left, dx: -2.5em)[
  #subbar([Misinformation])
]
#v(1em)



- **Fact Checking:** Using crowd-sourcing to verify claims flagged by AI.
- **Fraud Detection:** Analysts review transactions flagged as "suspicious."
- The analyst's decision (Fraud/Safe) becomes a new training label instantly.



---



== 2. Code Production
#place(top + left, dx: -2.5em)[
  #subbar([Dev Tools])
]
#v(1em)



- **Testing (Dynodroid):** AI generates thousands of random inputs (taps, swipes) to crash an app. Humans intervene only to guide the AI past login screens or complex logic.
- **Bug Repair:** Automated systems propose patches; developers accept/reject them.



---



== ML Model Optimization
#place(top + left, dx: -2.5em)[
  #subbar([Meta-Learning])
]
#v(1em)



- Tools for Data Scientists (e.g., *Helix*).
- Optimizing the workflow of training models.
- Caching intermediate results and asking the human for guidance on which hyperparameters to tune next.



---



== 3. Simulation Systems
#place(top + left, dx: -2.5em)[
  #subbar([Virtual Worlds])
]
#v(1em)

- **Manufacturing:** VR simulations where humans work alongside robots.
- Allows testing safety protocols and ergonomics before building physical assembly lines.
- **Military:** Simulating soldier decision-making to design better equipment interfaces.



---



== 4. Search Engines
#place(top + left, dx: -2.5em)[
  #subbar([Information Retrieval])
]
#v(1em)

- **Recommender Systems:** The classic HITL loop. User clicks/buys -> Model updates -> New recommendations.
- **Review Summarization:** Systems generate summaries; users rate readability and accuracy.



---



== Interactive Image Search
#place(top + left, dx: -2.5em)[
  #subbar([Refining Intent])
]
#v(1em)



- **MindFinder:** User sketches a layout + keyword.
- System returns images.
- User drags/drops to refine the layout.
- System updates results.
- *Closing the semantic gap between user intent and pixel data.*



---



== Module 6: Challenges & Future
#align(center)[
  #text(1.5em)[What lies ahead?]
]



---



== Challenge 1: Interaction in CV
#place(top + left, dx: -2.5em)[
  #subbar([User Interface])
]
#v(1em)

- In NLP, humans can easily edit text to provide feedback.
- In CV, how does a human "edit" a feature map?
- **Need:** Better tools for humans to provide visual feedback beyond simple bounding boxes (e.g., scribbles, gestures).



---



== Challenge 2: High-Level Learning
#place(top + left, dx: -2.5em)[
  #subbar([Teaching Wisdom])
]
#v(1em)

- Current HITL is often just "providing data points."
- **Goal:** Teach the model *how* to reason, not just *what* the answer is.
- Moving from data annotation to rule/logic annotation.
- "Teach the agent to fish, don't just give it the fish."



---



== Challenge 3: Key Sample Selection
#place(top + left, dx: -2.5em)[
  #subbar([Efficiency])
]
#v(1em)

- How do we know *exactly* which sample needs human review?
- **Confidence** is often a poor proxy in complex tasks.
- A model might be "confident" but completely wrong (e.g., out-of-distribution errors).
- Need for better "uncertainty quantification."



---



== Challenge 4: Evaluation
#place(top + left, dx: -2.5em)[
  #subbar([Benchmarks])
]
#v(1em)

- Hard to reproduce HITL research because it depends on *humans*.
- Variability in human annotator skill affects results.
- **Need:** Standardized datasets that include "simulated human feedback" or standard protocols for user studies to compare algorithms fairly.



---



== Future: NLP Directions
#place(top + left, dx: -2.5em)[
  #subbar([Sparse Feedback])
]
#v(1em)

- **Problem:** In translation or dialogue, users rarely correct specific words; they just disconnect or retry.
- **Opportunity:** Learning from implicit, sparse signals.
- **Safety:** HITL for preventing AI from generating hate speech or fake news (Red Teaming).



---



== Future: CV Directions
#place(top + left, dx: -2.5em)[
  #subbar([Robustness])
]
#v(1em)

- **User Credibility:** Not all humans are experts. Models must weigh feedback based on the annotator's track record.
- **Visualization:** Better "debugger" tools for vision models so humans can see *what* features the model is looking at.



---



== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Summary])
]
#v(1em)

- **Necessity:** Automated Deep Learning has hit a data wall. HITL is the ladder over that wall.
- **Impact:** Proven gains in accuracy and efficiency across NLP, CV, and Security.
- **Evolution:** Moving from simple labeling to complex human-machine collaboration.
- **The Future:** Hybrid systems where human intuition and machine scale work in harmony.



---



== References
#place(top + left, dx: -2.5em)[
  #subbar([Source Material])
]
#v(1em)

- Wu, X., Xiao, L., Sun, Y., Zhang, J., Ma, T., & He, L. (2022). *A survey of human-in-the-loop for machine learning*. Future Generation Computer Systems, 135, 364-381.