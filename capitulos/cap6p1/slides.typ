#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *



= Adaptive Interfaces


== Adaptive Interfaces
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#v(1em)

- Generative AI technologies have an inflection point in consumer adoption and enterprise value.

- Models such as GPT and BERT have demonstrated that powerful generative models can produce works at a human-like level or fidelity.

- Consumer applications such as ChatGPT, Gemini and DALL-E are making these technologies widely available and setting the bar for people's expectations of what AI can do.

- Enterprises such as Microsoft and Google are creating platforms for businesses to infuse generative technologies into their products and services.



---



== Adaptive Interfaces
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#v(1em)

- This commercialization of generative AI technologies is fueled by the utltra-rapid development of large-scale foundation models that reduce the time and costs for developing generative.

- ML research communities has focused on developing advancements to the technology:
  - Scaling model parameter counts
  - Evaluating model performance
  - Aligining models to reduce theur propensity to produce hateful and/or toxic speech

- But what about the human side of this "human-AI assemblage"?



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([A New UI Paradigm])
]
#v(1em)

- Generative AI enables a radically new interaction model: 
  
  - *Intent-Based Outcome Specification*

- People are now able to craft scpecifications for the kinds of outputs they desire, such as via natural language promts, and generative models are able to produce outputs that conform to those specifications.

- _Users specify *what* they want, but not *how* to produce it, and generative models do it._

- This is the first new UI paradigm in over 60 years.



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([The Core Design Challenge])
]
#v(1em)

- This form of interaction is fundamentally different from previous interaction paradigms, such as punchcards, command line interfaces or graphical user interfaces.

- It shifts control *away* from the user and *toward* the AI model.

- The main question is: _How do we design user experiences that are effective and safe when the user is no longer in full control?_



---



== Introduction
#place(top + left, dx: -2.5em)[
  #subbar([Main Challenges])
]
#v(1em)

- Main challenges that face generative models:

  - Generative Variability: An output may vary in character or quality, even when a user's input does not change.

  - New skills development: To handle Generative Variability, users needs to learn how to create specifications that result in outputs that match their desired intent ("prompt engineering").

  - New Risks: Copyright issues, production of hateful/toxic language, lack of representation of minority groups due to underrepresentation in the training data, hallucinations.



---



== Overview
#place(top + left, dx: -2.5em)[
  #subbar([The Six Design Principles])
]
#v(1em)

#align(center)[
  #image("images/paper_1.png", width: 70%)
]



---



== Overview
#place(top + left, dx: -2.5em)[
  #subbar([Two Categories of Principles])
]
#v(1em)

- The six principles are grouped into two categories:

  - *New Interpretations of Existing AI Issues:*
    - 1. Design Responsibly
    - 2. Design for Mental Models
    - 3. Design for Appropriate Trust & Reliance

  - *New Characteristics Unique to Generative AI:*
    - 4. Design for Generative Variability
    - 5. Design for Co-Creation
    - 6. Design for Imperfection



---



== Overview
#place(top + left, dx: -2.5em)[
  #subbar([Supporting Two User Goals])
]
#v(1em)

- These principles are designed to support two primary user goals:

  1. *Optimization*:
    - The user seeks to produce a *single best output* that satisfies specific, task-oriented criteria (e.g., "Translate this code," "Write a marketing email").

  2. *Exploration*:
    - The user wants to use the generative process to explore possibilities, seek inspiration, and discover new ideas (e.g., "Brainstorm logos," "What are some ideas for a vacation?").



---



== Overview
#place(top + left, dx: -2.5em)[
  #subbar([How These Principles Were Developed])
]
#v(1em)

- The principles were created through a rigorous, 4-iteration process:

  + *Literature Review*: Identify relevant research and examples of generative AI application design.

  + *Feedback*: Collect feedback from conference workshop and designers.

  + *Modified Heuristic* Evaluation: Test principles for clarity, relevance, and coverage by having designers evaluate commercial generative AI applications.

  + *Application*: Demonstrate real world applicability and utility by havign two prodict teams adopt the principles in their own design work.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design Responsibly])
]
#v(1em)

- The most important principle for designing generative AI systems is to *design responsibly*.

- The use of all AI, including generative AI, can unfortunately lead to *diverse forms of harm*, especially for people in vulnerable situations.

- It is imperative for designers to adopt a *socio-technical perspective*.

- This means we must always question _how_ new technical mechanisms will actually *improve the user's experience*, provide them with new capabilities, or address their real pain points


---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design Responsibly])
]
#v(1em)

1. _Use a human-centered approach_: Focus on the user's real needs and pain points, not just the technology's capabilities.

  - Example: Use participatory design to co-design prototypes with users, ensuring the AI is solving a real problem.

2. _Identify and resolve value tensions_: Balance the different values of all stakeholders (end-users, designers, business decision-makers, developers)

  - Example: Methods like Value Sensitive Design (VSD) map stakeholders and their competing values.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design Responsibly])
]
#v(1em)

3. _Expose or limit emergent behaviors_: Decide if unexpected capabilities are a *delightful feature* or a *harmful risk*.

  - Example: ChatGPT allows open-ended chat, letting users discover emergent tasks (like sentiment analysis) (expose), or AIVA (music generation) uses a GUI to restrict the model to only its intended musical tasks (limit).

 
4. _Test & monitor for user harms_: Actively check for bias, toxicity, and misinformation. Assume harms *will* occur and plan a reporting mechanism.

  - Benchmark models against known hate-speech or bias datasets.

  - Implement a "Report" or "Flag" button for users to flag problematic outputs.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Mental Models])
]
#v(1em)

- A *mental model* is a user's simplified, internal understanding of how a system works and how their actions will affect its output.

- Generative AI creates new challenges for users in forming these mental models.

- Designers must carefully _teach_ users how to work effectively with the AI system.

- This includes considering the user's unique background and goals.

- Conversely, designers must also help the AI form its _own_ "mental model" _of the user_ to personalize the interaction.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Mental Models])
]
#v(1em)

1. _Orient the user to generative variability_: Help users understand that outputs may be varied and *not reproducible*, even with the same input.

  - Example: ChatGPT provides answers in multiple "drafts", showing that it found several varied answers to the same question.

2. _Teach effective use_: Use tutorials, examples, and documentation to help users form an effective mental model.

  - Example: DALL-E provides a "Surprise Me" button and curated examples of prompts to teach users how to write them.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Mental Models])
]
#v(1em)

3. _Understand the user's mental model:_ Conduct research (e.g., interviews) to see how users *think* the system works. Leverage their existing models.

  - Example: GitHub Copilot builds on a developer's existing mental model of code completion, easing the learning curve.

4. _Teach the AI system about the user:_ Capture user preferences, behaviors, and expectations to personalize the AI's interactions with them.

  - Example: ChatGPT's "Custom Instructions" feature lets users provide background information about themselves to get more personalized responses.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Appropriate Trust & Reliance])
]
#v(1em)

- A *trustworthy* generative AI application produces high-quality, useful, and factual outputs that are faithful to a source of truth.

- The most crucial design goal is to *calibrate user* trust to establish *appropriate reliance*.

- This means teaching users to *scrutinize* a model's outputs for potential flaws.

- Users must be encouraged to check for quality issues, inaccuracies, biases, and under-representation.

- The ultimate goal is for the user to learn when an output is acceptable, or when it must be *modified or rejected*.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Appropriate Trust & Reliance])
]
#v(1em)

1. _Calibrate trust using explanations:_ Be clear and upfront about the system's capabilites and, more importantly, its *limitations*.

  - Example: ChatGPT's home screen explicittly states its limitation: _"ChatGPT may give you inaccurate information. It's not intended to give advice."_

2. _Provide rationales for outputs:_ Show the user *why* an output was generated, often by identifying the source materials used.

  - Example: Gemini provides a list of sources it used to generate an answer.

---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Appropriate Trust & Reliance])
]
#v(1em)

3. _Use friction to avoid overreliance:_ Use "cognitive forcing functions" to slow the user down at key decision points, encouraging them to review and think critically.

  - Example: Some AI email assistant drafts a reply. Instead of an "Auto-Send" button, the user must *always* manually review the text and click the final "Send" button themselves.

4. _Signify the role of the AI:_ Clearly communicate the AI's role (e.g., tool, partner, coach) to set user expectations about its agency and initiative.

  - Example: GitHub Copilot's tagline, "Your AI pair programmer," clearly signifies its role as a partner, not just a tool.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Generative Variability])
]
#v(1em)

- A *distinguishing characteristic* of generative AI is its ability to produce multiple outputs that vary in character or quality.

- This happens even when the user's *input does not change*.

- This "generative variability" raises two important design questions:

  - To what extent should these multiple outputs be visible to users?

  - How can we help users organize and select from these varied outputs?



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Generative Variability])
]
#v(1em)

1. _Leverage multiple outputs:_ Take advantage of this capability. Generate multiple distinct outputs (visibly or hidden) to increase the chance of one fitting the user's need.

  - Example: DALL-E generate a grid of four images by default for a single prompt.

2. _Visualize the user's journey:_ Show the user a history of their generated outputs and the inputs that created them. Guide them to new possibilities.

  - Example: Midjourney (in Discord) and DALL-E both show a persistent history of the user's past prompts and generated images.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Generative Variability])
]
#v(1em)

3. _Enable curation & annotation:_ Provide mechanisms for users to organize, filter, sort, or label the outputs (e.g., "save to favorites").

  - Example: DALL-E allows users to mark images as "Favorites" and organize them into named "Collections."

4. _Draw attention to differences or variations_: When outputs are very similar, provide tools to help users identify the subtle differences between them.

  - Example: Prototypes for code translation visualize the differences between multiple generated code snippets using granular highlighting.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Co-Creation])
]
#v(1em)


- Generative AI offers new co-creative capabilities.

- The goal is to help the user create outputs that meet their needs.

- This is achieved by providing controls that enable the user to influence the generative process.

- These controls allow the user to work collaboratively with the AI, much like a partner.



---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Co-Creation])
]
#v(1em)


1. _Help the user craft effective outcome specifications:_ Assist the user in "prompt engineering" to help them get the outputs they actually want.

  - Example: DALL-E show a gallery of high-quality images, when a user hovers over an image, it reveals the exact prompt that was used to create it, teaching the user the structure of a good prompt.

2. _Provide generic input parameters:_ Let the user control generic aspects of the generative process, like the number of outputs or the "random seed."

  - Example: DreamStudio provides a slider for "Number of Images" and an input field for "Seed."




---



== Design Principles
#place(top + left, dx: -2.5em)[
  #subbar([Design for Co-Creation])
]
#v(1em)

3. _Provide controls relevant to the use case & technology:_ Let the user control domain-specific parameters (e.g., musical key) or model-specific parameters (e.g., "temperature").

  - Example: AIVA (music AI) allows users to specify the *emotion* and *ensemble* (e.g., "Orchestral," "Pop") for a composition.

4. _Support co-editing of generated outputs:_ Allow both the user and the AI to make changes and improvements to a generated artifact.

  - Example: Adobe Photoshop's Generative Fill feature exists within the main design canvas, allowing the user and AI to edit the same image.


---



---



== Principle 6: Design for Imperfection
#place(top + left, dx: -2.5em)[
  #subbar([New Characteristics])
]
#v(1em)

#align(center)[
  #text(2em)[
    "Help the user understand and work with outputs that may not align with their expectations."
  ]
]
- Outputs can be "imperfect" in two ways:
  - **Objectively:** The output is factually wrong (a "hallucination") or has bugs.
  - **Subjectively:** The user simply doesn't like the output.



---



== Principle 6: Strategies
#place(top + left, dx: -2.5em)[
  #subbar([Design for Imperfection])
]
#v(1em)

- **Make uncertainty visible:**
  - Caution the user that outputs may be flawed. Show the model's confidence level where possible.
- **Evaluate outputs using domain-specific metrics:**
  - When quality is measurable, help the user identify outputs that meet those criteria (e.g., "adheres to style guide").
- **Offer ways to improve outputs:**
  - Provide tools for users to fix flaws, such as editing tools, a "regenerate" button, or alternative suggestions.
- **Provide feedback mechanisms:**
  - Collect explicit user feedback (e.g., thumbs up/down) to help improve the AI model over time.



---



== Principle 6: Examples
#place(top + left, dx: -2.5em)[
  #subbar([Design for Imperfection])
]
#v(1em)

- **Make Uncertainty Visible:**
  - Google Bard's interface states: "Bard may display inaccurate info... so double-check its responses."
- **Domain-Specific Metrics:**
  - A prototype for drug design (CogMol) evaluates generated molecules with a simulator to compute toxicity and water solubility.
- **Offer Ways to Improve:**
  - DALL-E offers "inpainting" (regenerating part of an image) and "outpainting" (extending an image).
  - Google Bard offers one-click buttons to make a response "shorter," "longer," "simpler," or "more professional."
- **Provide Feedback:**
  - ChatGPT includes a "thumbs up / thumbs down" button on every response, along with a field for open-ended feedback.



---



== Discussion: User Goals
#place(top + left, dx: -2.5em)[
  #subbar([Optimization vs. Exploration])
]
#v(1em)

- In the design process, the authors found that *Optimization* and *Exploration* were not principles themselves, but rather **User Goals**.
- Many applications support both goals, and users may switch between them in a single session.
- The 6 Principles are a "toolbox" that designers can use to support either goal.



---



== Discussion: Principles & Goals
#place(top + left, dx: -2.5em)[
  #subbar([Optimization])
]
#v(1em)

- **Optimization** is when the user wants to produce a single, satisfactory artifact.
- This goal is strongly supported by:
  - **Design for Imperfection:** The user needs to fix flaws to reach their goal.
  - **Design for Appropriate Trust & Reliance:** The user must be able to trust the output, especially in high-stakes domains (code, medical info).
  - **Design for Co-Creation:** The user needs tools to *refine* and *edit* the output until it is perfect.



---



== Discussion: Principles & Goals
#place(top + left, dx: -2.5em)[
  #subbar([Exploration])
]
#v(1em)

- **Exploration** is when the user uses generation as a *means to an end*—to learn, brainstorm, or be inspired.
- This goal is strongly supported by:
  - **Design for Generative Variability:** This is the *key enabler* of exploration. Seeing many different possibilities is the entire point.
  - **Design for Mental Models:** The user needs to understand *how* to explore the "space of possibilities."
- Trust and Imperfection are often less of a concern in pure exploration.



---



== Discussion: Adopting Principles
#place(top + left, dx: -2.5em)[
  #subbar([Bridging Theory and Practice])
]
#v(1em)

- The HCI community struggles to get design guidelines used in real-world practice.
- To bridge this gap, the authors promoted adoption within their organization using four key strategies.



---



== Adoption Strategy 1
#place(top + left, dx: -2.5em)[
  #subbar([Actionable Activities])
]
#v(1em)

- **Create tools, not just rules.**
- The authors created a "heuristic evaluation" template based on the principles.
- This gives designers a concrete activity to apply the principles to their own work and find new design ideas.



---



== Adoption Strategy 2
#place(top + left, dx: -2.5em)[
  #subbar([Progressive Detail])
]
#v(1em)

- **Provide different levels of detail.**
- A comprehensive guide (too long for most designers).
- Paragraph-length descriptions (for templates and workshops).
- One-sentence descriptions (for quick reference on an internal website).



---



== Adoption Strategy 3
#place(top + left, dx: -2.5em)[
  #subbar([Hands-on Outreach])
]
#v(1em)

- **Be proactive in teaching.**
- The authors ran workshops for general design audiences.
- They also targeted key product teams, using the heuristic evaluation template to analyze those teams' actual products.
- This provided immediate, actionable feedback and value to the product teams.



---



== Adoption Strategy 4
#place(top + left, dx: -2.5em)[
  #subbar([Executive Sponsorship])
]
#v(1em)

- **Get buy-in from the top.**
- The authors worked with design executives to encourage product teams to adopt the principles.
- This advocacy from leadership (as recommended by Madaio et al.) gives designers "a seat at the table" in the creation of AI applications.



---



== Final Conclusion
#place(top + left, dx: -2.5em)[
  #subbar([Summary])
]
#v(1em)

- We developed 6 principles for designing Generative AI applications.
- **3 New Interpretations:**
  - Design Responsibly
  - Design for Mental Models
  - Design for Appropriate Trust & Reliance
- **3 New Characteristics:**
  - Design for Generative Variability
  - Design for Co-Creation
  - Design for Imperfection
- These principles and their strategies provide a toolbox to help practitioners build safer and more effective generative AI experiences.



---



== Thank You
#align(center)[
  #text(2em)[Questions?]
]