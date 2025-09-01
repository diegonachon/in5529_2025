#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)

= CRISP-DM and other methodologies for Data Science Projects

== Cross Industry Standard Process For Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

#dblock(title: [CRISP-DM])[
  Cross Industry Standard Process For Data Mining (CRISP-DM) is a standard, business-driven process model for data science projects, organizing the lifecycle into six iterative phases: Business Understanding, Data Understanding, Data Preparation, Modeling, Evaluation, and Deployment.
]

The sequence of phases is not rigid. *An adaptive process is always required:*

- If the evaluation reveals a _data leakage_, we should go back to Data Preparation.

-  A quick feasibility pass could skip a heavy Data Preparation phase at first, revisiting it only if evaluation results look promising. 

== Cross Industry Standard Process For Data Mining
#place(top + left, dx: -2.5em)[
  #subbar([Phases])
]

#v(20pt)

#figure(
  image("images/crispdm.jpg", height: 80%),
  caption: [Source: IBM]
)

== Phase 1: Business understanding

Business understanding phase focuses on the definition of the project objectives and requirements *from a business perspective* and design a plan to achieve them. Specifically, we want to determine:

- Business objectives

- Data mining goals

- Schedule, quality and security requirements

- Assumptions about the data and business 

- Constraints of resources availability and technology

== Phase 2: Data understanding

The second phase focuses on activities in order to get familiar with the data and get initial insights from it, such as:

- Collect the data

- Describe the data (format, quantity, fields, check if it satisfies the project requirements and assumptions)

- Explore the data

- Verify the data quality and report problems and possible solutions


== Phase 3: Data preparation

Data preparation phase covers all activities to construct the dataset to be used in the modeling techniques:

- Select the data useful for the project

- Clean the data

- Transform the data

== Phase 4: Modeling

In Modeling, various modeling techniques are applied in order to solve the data mining problem:

- Select an appropriate model

- Define appropriate evaluation methods and criteria

- Build and optimize the model

Stepping back to the Data Preparation phase is often necessary to meet the specific data requirements of the chosen modeling techniques.

== Phase 5: Evaluation

Evaluation phase focuses in understanding if the results meet the business objective before proceeding to final deployment, with activities like:

- Test the model and interpret the results

- Evaluate the results 
  - Does the results meet the business success criteria?

- Review the process and determine next steps 
  - Are there activities that have been missed and/or should be repeated?
  - Are we ready to move on into deployment?

== Phase 6: Deployment

Finally, Deployment phase covers the task to make the model "usable" (e.g. a report with the discovered knowledge or an API to make predictions) for the customer, such as:

- Plan deployment

- Plan maintenance

- Final report and project review

== CRISP-ML(Q)
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]

#dblock(title: [CRISP-ML(Q)])[
  CRoss Industry Standard Process for the development of Machine Learning with Quality assurance methodology (CRISP-ML(Q)) is a process model for machine learning applications that extends CRISP-DM with explicit quality assurance in each phase and task.
]

It spans six phases from scoping to deployment and outgoing monitoring and maintenance: Business and Data Understanding, Data Preparation, Modeling, Evaluation, Deployment, and Monitoring and Maintenance.

== CRISP-ML(Q)
#place(top + left, dx: -2.5em)[
  #subbar([Key differences])
]
#v(30pt)
The following are some key differences between CRISP-ML(Q) and CRISP-DM:
  
1. CRISP-ML(Q) scope and goal is an end-to-end ML application lifecycle with QA, not just a knowledge discovery project

2. CRISP-ML(Q) adds risk-based QA in every phase (metrics, checks, mitigations) to ensure production readiness

3. CRISP-ML(Q) defines business, ML, and economic KPIs, plus legal/ethical constraints (e.g., fairness, explainability) early and tracks them through the lifecycle

4. CRISP-ML(Q) explicitly plans for MLOps features, like data versioning, production data checks, drift monitoring, and model maintenance

== SEMMA

#dblock(title: [SEMMA])[
  SEMMA is a SAS-developed data mining workflow that organizes modeling work into five iterative steps: Sample, Explore, Modify, Model, Assess.
]

- Developed by the _SAS Institute_ as a tool set for their product _SAS Enterprise Miner_.

- Unlike CRISP-DM, SEMMA focuses on technical mining steps; business understanding and deployment aren't explicit.

== Which methodology to use?

*It depends:*

- KDD and CRISP-DM may be better suited for knowledge discovery projects.

- CRISP-ML(Q) is better suited for ML applications that will run in production.

- CRISP-DM and CRISP-ML(Q) have explicit business understanding and deployment phases.

- SEMMA it's particularly useful when the data is already prepared and the focus is on the technical aspects of model development.

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
  Extract useful information or knowledge from the contents of web pages (e.g., text, images, structured data shown on pages).
]

- The goal: find useful information from the web content *(similar to _Information Retrieval_).*

- Web content is not only free text, other objects like pictures, sound, movies, metadata and hyperlinks belong also to the content.

== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([The two historical views])
]

There are two main views in Web Content Mining (Kosala & Blockeel, 2000):

- Information Retrieval (Unestructured + Semi-Structured Documents): Finding and filtering information in web data.
  - Today's practice: Dense retrieval and Retrieval Augmented Generation (RAG).
- Database View: Modeling and querying semi-structured web data.
  - Today's practice: Connect linked data into Knowledge Graphs and query them.

== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([Web Content in the GUI])
]
#v(20pt)
#figure(
  image("images/page.png", width: 70%),
  caption: [Source: Amazon]
)

== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([Web Content in the HTML])
]
#v(20pt)
#figure(
  image("images/source.png", width: 70%),
  caption: [Source: Amazon]
)
  
== Web Content Mining
#place(top + left, dx: -2.5em)[
  #subbar([Applications])
]

- Improve search engine rankings using extracted keywords, synonyms, topic models, etc.

- Classify social media web content (text and multimedia) with sentiment and opinions 

- Entity extraction from Wikipedia to build Knowledge Graphs

- Answer questions generating text based on an academic paper

== Web Structure Mining

#dblock(title: [Web Structure Mining])[
  Mine user activity patterns from usage data such as server logs, clickstreams, and other interaction logs recorded by web systems.
]

- The goal is to discover patterns in usage data applying different kinds of Data Mining techniques.

- Web Usage Mining usually requires a _sessionization_ process to correct problems in the data.

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Approaches])
]

To discover the link structure of the hyperlinks at the inter-document level to generate an structural summary about the website, there are *three common directions:*

1. Based on the hyperlinks, *categorizing* the web pages and generated information.
2. Discovering the *structure of the web document itself* (intra-document structure).
3. Discovering the *nature of the hierarchy* of hyperlinks in the website.

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Graph model of a website])
]
#v(30pt)
#figure(
  image("images/graph.png", width: 40%),
  caption: [Source: Zhang et al. (2004)]
)

== Web Structure Mining
#place(top + left, dx: -2.5em)[
  #subbar([Applications])
]

- Web pages categorization
- Discovering micro communities on the web
- Ranking the reputation/quality of a web page within a domain for a web search query

== Web Usage Mining

#dblock(title: [Web Usage Mining])[
  Mine user activity patterns from usage data such as server logs, clickstreams, and other interaction logs recorded by web systems.
]

- The goal is to discover patterns in usage data applying different kinds of Data Mining techniques.

- Web Usage Mining usually requires a _sessionization_ process to correct problems in the data.

== Web Usage Mining
#place(top + left, dx: -2.5em)[
  #subbar([Web logs])
]

#figure(
  image("images/logs.png", width: 80%),
  caption: [Source: Vakali et al. (2004)]
)

== Web Usage Mining
#place(top + left, dx: -2.5em)[
  #subbar([Applications])
]

- Target potential customers for an e-commerce (Recommendation System)

- Improve site design, like identifying potential prime advertisement locations

- Facilitates customization for adaptive interfaces

- Fraud/intrusion detection

- Predict user's actions 
  - Predicting next web page to be visited in a session path for pre-fetching

- Segment groups of web users

= Overview of Foundation Models

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]

#dblock(title: [Foundation Model])[
  Foundation models (FM) are large models trained on broad data at scale and adaptable to a wide range of downstream tasks. They’re typically *pretrained (often self-supervised) and then adapted (fine-tuning, prompting, adapters) to many applications* serving as powerful but central yet incomplete bases for AI systems.
]

- The term was coined in 2021 by the Stanford Institute for Human-Centered Artificial Intelligence (HAI) Center for Research on Foundation Models (CRFM).
- BERT, GPT-3, DALL-E are examples of foundation models. 

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([The paradigm shift])
]

Why foundation models are relevant nowadays?

- A genuine *paradigm shift* from task-specific models to pretrain on broad data and adapt to many tasks.
  - Fine-tuning
  - Prompting
  - Adapters (e.g. LoRA)

- *Emergent capabilities* that didn't appear at smaller scale models.

- *Reusable core:* the same model can be adapted to several tasks, lowering data/engineering cost.

== Foundation Models

#figure(
  image("images/access.png", width: 80%),
)

== Foundation Models

#figure(
  image("images/sector.png", width: 80%),
)

== Foundation Models

#figure(
  image("images/org.png", width: 80%),
)

== Foundation Models

#figure(
  image("images/geo.png", width: 80%),
)

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Capabilities])
]

Foundation models present capabilities over a broad spectrum of areas:

- *Language:* FM’s dominate NLP benchmarks but there is still a gap with real human communication; need to cover linguistic variation (styles, dialects, low-resource languages).

- *Vision:* Shift from pretraining with curated labels to web-scale raw data; FM's show strong results on classification/detection; training on multimodal & embodied data could unlock 3D/physical understanding and commonsense reasoning.

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Capabilities])
]

- *Robotics:* A longstanding goal is to develop generalist robots; main blocker is the right data at scale in the physical world; cross-modal sources (e.g., human videos + language) may bridge the gap.

- *Reasoning & Search:* Hard problems (theorem proving, code synthesis) suffer from combinatorial explosion; FM’s generative + multimodal skills can guide search and transfer knowledge across tasks.

- *Human interaction:* FM’s lower prototyping barrier between developers and user experience of AI-infused applications and enable richer, multimodal UX.


== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Applications])
]

Some disciplines where Foundation Models can be applied:

- *Healthcare & biomedicine:* Patient care and biomedical research using multimodal data (images, text, molecules); efficiency gains in adaptation; improved clinician/patient interfaces; potential for drug discovery (with privacy/bias risks).

- *Law:* Identified as a core application area, where foundation models can help, for example, in civil cases.

- *Education:* Another focal domain for FM deployment, with potential to reshape learning tools and interactions (again with domain-specific risks).

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Technology pillars])
]

- *Modeling and Training:* Transformer-style architectures pretrained on broad data with objectives like masked-token or contrastive learning.

- *Adaptation:* Reuse the same base model across tasks via fine-tuning, prompting, or lightweight adapters.

- *Data:* Web-scale, multimodal corpora (text, images, video, code); composition matters for what the model learns. 

- *Systems and compute:* Software–hardware co-design (parallelism, retrieval, Mixture-of-Experts) for efficient training and inference.

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Risks and societal impact])
]
#v(20pt)
- *Inequity and fairness:* FM biases can extend to downstream apps; consider intrinsic vs. application-specific harms.

- *Misuse:* Same generative power enables scaled disinformation, deepfakes, and targeted scams.

- *Privacy:* Models may memorize sensitive data; provenance and responsibility are complex.

- *Environment:* Training consumes substantial energy; impacts should be measured and considered.

- *Law and policy:* Liability, regulation, and rights around data/model outputs are unsettled.

== Foundation Models
#place(top + left, dx: -2.5em)[
  #subbar([Future of Foundation Models research])
]

- *Treat FMs as sociotechnical:* CS + social science + law/policy working together.

- *Take care of the data:* Curate, document, and share training data better.

- *Measure clearly, explain better:* Build shared evaluations and theory connecting pretraining to adaptation.

- *Stay reliable when things change:* Improve robustness under distribution shifts.

- *Build in security & privacy:* Defend the model “artifact” and reduce data leakage.

- *Align & govern:* Match behavior to human goals and coordinate across sectors on releases and oversight.





