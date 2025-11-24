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

- Deep Learning has revolutionized AI and is a frontier for it.

- Wide variety of applications:
  - NLP
  - Speech recognition
  - Medical applications
  - Computer vision
  
- Success is driven by algorithms with hundreds of millions of parameters.

- These models have huge capacity but require massive resources.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Data Bottleneck])
]
#v(1em)

- *Data vs. Parameters:* The growth rate of available labeled data lags far behind the growth of model parameters.

- *Cost:* Labeling massive datasets is labor-intensive and expensive.

- *Speed:* New tasks emerge faster than we can curate datasets for them.

- A group of researchers devise pre-trained models and transfer learning to solve this challenge (Transformer, BERT, GPT, among others). 



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
  image("images/ml_process.png", width: 50%)
)


- *Preprocessing:* Cleaning and organizing raw data.
- *Modeling:* Training and refining algorithms.
- *Optimization:* Tuning for deployment.
- *HITL can intervene at every single stage.*



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([Research Trends])
]
#v(1em)

- The field has exploded in the last decade.
- Publications grew from 191 (2010) to \~6.000 (2021).
- This confirms that automation alone is not enough; human-AI collaboration is the future.

#figure(
  image("images/hitl_publications.png", width: 40%)
)


---



== Data Processing 
#place(top + left, dx: -2.5em)[
  #subbar([The HITL Data Pipeline])
]
#v(1em)


- Three main stages of intervention:
  + *Preprocessing:* Preparing the raw material.
  + *Annotation:* Adding meaning (labels).
  + *Iterative Labeling:* Refining based on model feedback.

#figure(
  image("images/data_processing.png", width: 50%)
)



---



== 1. Data Preprocessing
#place(top + left, dx: -2.5em)[
  #subbar([The Foundation])
]
#v(1em)

- The success of a deep learning largely depends on the quality of data.

- *"Garbage in, garbage out."*

- Data scientists spend \~80% of their time just cleaning data.

- Data analysis plays an irreplaceable role in building a more effective model.

- The greatest challenge in data analysis lies in the complexity of high-dimensional data.

- High-dimensional data is hard to visualize and structure automatically.



---



== Interactive Parameter Tuning
#place(top + left, dx: -2.5em)[
  #subbar([Preprocessing Strategy])
]
#v(1em)

- Humans struggle to understand abstract model parameters.
- *Solution:* Interactive visualization tools (e.g., Multidimensional Scaling).
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



- Data annotation is the process of labeling data so machines can understand and learn from it.

- It is a crucial stage, as label quality directly impacts model performance.

- It is often costly and time-consuming, especially for complex tasks or specific domains.

- Integrating humans to resolve ambiguities and handle difficult cases where automatic models fail.



---



== HITL Annotation Categories
#place(top + left, dx: -2.5em)[
  #subbar([Main Types])
]
#v(1em)

There are three main areas where HITL transforms annotation:

1. *NLP Annotation:* Focused on text, entities, and relationships.

2. *Adversarial Data Generation:* Creating difficult examples to make models more robust.

3. *Computer Vision (CV) Annotation:* Labeling images, videos, and artistic generation.



---



== 1. Annotation in NLP
#place(top + left, dx: -2.5em)[
  #subbar([Information Extraction])
]
#v(1em)

- *Entity Extraction:*
  - Traditional methods (regex) are rigid.
  - *HITL Approach:* The human highlights entities; the system learns patterns and suggests new labels, speeding up the process (e.g., "highlight-clause-predicate").
  - **Result:** Higher Return on Investment (ROI) of human time compared to manual rule coding.

- *Entity Disambiguation:*
  - Resolving what a mention refers to (e.g., "Jaguar" the animal or the car?).
  - HITL filters and discriminates candidates based on human-verified context.



---



== 2. Adversarial Data Generation
#place(top + left, dx: -2.5em)[
  #subbar([Model Robustness])
]
#v(1em)

- Data intentionally designed to "fool" the model and expose its weaknesses.
- *HITL Method:*
  - Humans (sometimes crowd workers or experts) create questions or examples that the current model fails to answer correctly.
  - *Example:* A Quiz Bowl system where the human sees model predictions in real-time and crafts questions that confuse it.
- *Benefit:* Creates more challenging training datasets and improves model interpretability.



---



== 3. Annotation in Computer Vision (CV)
#place(top + left, dx: -2.5em)[
  #subbar([Visual Challenges])
]
#v(1em)



- *Person Re-Identification (Re-ID):*
  - Problem: Models fail to track people across different cameras and lighting conditions.
  - Solution: *Human-in-the-loop Reinforcement Learning*. The human verifies doubtful matches, refining the agent's policy to minimize future manual work.

- *The Cost Problem:* Labeling every frame in a video is prohibitive.
  - *Interactive Self-Annotation:* The human labels objects in the first frame.
  - A tracking model propagates those labels to subsequent frames.
  - The human only intervenes to correct errors (e.g., occlusions or lost tracking).



---



== 3. Iterative Labeling
#place(top + left, dx: -2.5em)[
  #subbar([Efficiency])
]
#v(1em)

- Labeling *everything* is inefficient, requires a lot of labor, cost, and takes a long time.
- *Key Samples:* Identify the specific data points that confuse the model.
- *The Loop:*
  1. Model predicts.
  2. Model flags low-confidence items.
  3. Human labels only those items.
  4. Repeat.



---



== Model Training & Inference in Text 
#place(top + left, dx: -2.5em)[
  #subbar([How is it done?])
]
#v(1em)

- In many fields of AI, such as NLP and CV, there are a variety of approaches tat levearge human intelligence to train and infer experimental results.

- For both NLP and CV, related research spans deep learning techniques and human-machine hybird methods.

- These heuristic methods have taken the diverse quality of human creativity into account to achieve high-quality results.



---



== Text Classification
#place(top + left, dx: -2.5em)[
  #subbar([Application])
]
#v(1em)

- *Example:* Rumor detection in journalism.
- Models classify news as "rumor" or "fact."
- Journalists review "uncertain" classifications.
- The model retrains based on expert feedback, improving reliability over time.



---



== Semantic Parsing
#place(top + left, dx: -2.5em)[
  #subbar([Understanding])
]
#v(1em)

- Converting natural language to SQL or Code.
- *Clarification:* If the model is unsure of the user's intent, it asks a clarifying question.
- The user's answer acts as a label for that specific training example.



---



== Question Answering (QA)
#place(top + left, dx: -2.5em)[
  #subbar([Chatbots])
]
#v(1em)

- *Online Loop:* Continuous learning from live conversation logs.
- *Offline Loop:* Batch processing of failed conversations.
- *Adversarial QA:* Humans write questions specifically designed to break the current version of the bot to make the next version tougher.



---



== Sentiment Analysis
#place(top + left, dx: -2.5em)[
  #subbar([Nuance])
]
#v(1em)

- Metrics like "Accuracy" don't tell the whole story.
- *Explainable Sentiment:* Humans evaluate *why* the model classified a review as negative.
- Did it focus on the word "slow"? Was "slow" actually good (e.g., "slow cooking")?
- Human feedback corrects the feature attention map.



---



== HITL in CV Models
#place(top + left, dx: -2.5em)[
  #subbar([CV Workflow])
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

- *Cost Sensitive:* Detectors propose thousands of bounding boxes.
- The system calculates the "cost" (risk) of being wrong.
- Humans only verify the high-risk predictions.
- *Tracking:* Helping algorithms re-acquire targets lost behind obstacles.



---



== Image Restoration
#place(top + left, dx: -2.5em)[
  #subbar([Quality Control])
]
#v(1em)

- Removing noise, blur, or artifacts.
- *Deep Image Prior:* An iterative process.
- The model cleans the image; the user checks it.
- If unsatisfied, the user highlights problematic areas, and the model tries again with different parameters.



---



== Image Segmentation
#place(top + left, dx: -2.5em)[
  #subbar([Precision])
]
#v(1em)

- Assigning a class to every pixel (e.g., medical imaging).
- *Hard Negative Mining:* The system shows the human images where it is "confused."
- The human creates a "counter-example" annotation.
- This is vastly more efficient than annotating random easy images.



---



== Application
#place(top + left, dx: -2.5em)[
  #subbar([Applications Categories])
]
#v(1em)


1. *Security Systems:* Safety-critical operations.
2. *Code Production:* Software engineering tools.
3. *Simulation:* Training and forecasting.
4. *Search Engines:* Information retrieval.



---



== 1. Security Systems
#place(top + left, dx: -2.5em)[
  #subbar([High Stakes])
]
#v(1em)



- *Concept:* Humans are flexible but prone to fatigue; Machines are consistent but rigid.
- *Cyber-Physical Systems:* Predicting human error precursors in nuclear plants or cockpits.
- The system monitors the human; the human monitors the system.



---



== Information Security
#place(top + left, dx: -2.5em)[
  #subbar([Misinformation])
]
#v(1em)



- *Fact Checking:* Using crowd-sourcing to verify claims flagged by AI.
- *Fraud Detection:* Analysts review transactions flagged as "suspicious."
- The analyst's decision (Fraud/Safe) becomes a new training label instantly.



---



== 2. Code Production
#place(top + left, dx: -2.5em)[
  #subbar([Dev Tools])
]
#v(1em)



- *Testing (Dynodroid):* AI generates thousands of random inputs (taps, swipes) to crash an app. Humans intervene only to guide the AI past login screens or complex logic.
- *Bug Repair:* Automated systems propose patches; developers accept/reject them.



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

- *Manufacturing:* VR simulations where humans work alongside robots.
- Allows testing safety protocols and ergonomics before building physical assembly lines.
- *Military:* Simulating soldier decision-making to design better equipment interfaces.



---



== 4. Search Engines
#place(top + left, dx: -2.5em)[
  #subbar([Information Retrieval])
]
#v(1em)

- *Recommender Systems:* The classic HITL loop. User clicks/buys -> Model updates -> New recommendations.
- *Review Summarization:* Systems generate summaries; users rate readability and accuracy.



---



== Challenges & Future
#place(top + left, dx: -2.5em)[
  #subbar([Challenge 1: Interaction in CV])
]
#v(1em)

- In NLP, humans can easily edit text to provide feedback.
- In CV, how does a human "edit" a feature map?
- *Need:* Better tools for humans to provide visual feedback beyond simple bounding boxes (e.g., scribbles, gestures).



---



== Challenges & Future
#place(top + left, dx: -2.5em)[
  #subbar([Challenge 2: High-Level Learning])
]
#v(1em)

- Current HITL is often just "providing data points."
- *Goal:* Teach the model *how* to reason, not just *what* the answer is.
- Moving from data annotation to rule/logic annotation.
- "Teach the agent to fish, don't just give it the fish."



---



== Challenges & Future
#place(top + left, dx: -2.5em)[
  #subbar([Challenge 3: Key Sample Selection])
]
#v(1em)

- How do we know *exactly* which sample needs human review?
- *Confidence* is often a poor proxy in complex tasks.
- A model might be "confident" but completely wrong (e.g., out-of-distribution errors).
- Need for better "uncertainty quantification."



---



== Challenges & Future
#place(top + left, dx: -2.5em)[
  #subbar([Challenge 4: Evaluation])
]
#v(1em)

- Hard to reproduce HITL research because it depends on *humans*.
- Variability in human annotator skill affects results.
- *Need:* Standardized datasets that include "simulated human feedback" or standard protocols for user studies to compare algorithms fairly.



---



== Future: NLP Directions
#place(top + left, dx: -2.5em)[
  #subbar([Sparse Feedback])
]
#v(1em)

- *Problem:* In translation or dialogue, users rarely correct specific words; they just disconnect or retry.

- *Opportunity:* Learning from implicit, sparse signals.

- *Safety:* HITL for preventing AI from generating hallucination, hate speech or fake news.



---



== Future: CV Directions
#place(top + left, dx: -2.5em)[
  #subbar([Robustness])
]
#v(1em)

- *User Credibility:* Not all humans are experts. Models must weigh feedback based on the annotator's track record.
- *Visualization:* Better "debugger" tools for vision models so humans can see *what* features the model is looking at.



---



== Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Summary])
]
#v(1em)

- *Necessity:* Automated Deep Learning has hit a data wall. HITL is the ladder over that wall.
- *Impact:* Proven gains in accuracy and efficiency across NLP, CV, and Security.
- *Evolution:* Moving from simple labeling to complex human-machine collaboration.
- *The Future:* Hybrid systems where human intuition and machine scale work in harmony.



