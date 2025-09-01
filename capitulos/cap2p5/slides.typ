#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/timeliney:0.2.1"
#import "../../custom.typ": *

#set figure(supplement: none, numbering: none)

= Introduction to the Semantic Web

== Motivation
#place(top + left, dx: -2.5em)[
  #subbar([From the Web of Documents to a Web of Data])
]
#h(1em)

- Originally, the Web was a web of documents, rich for humans, poor in machine interpretable meaning” (Berners-Lee et al., 2001).
- _Data_ should also be readable by machines.
- *The goal:* move to a “Web of actionable information”, data with shared meaning that software can combine and act on.

== Motivation
#place(top + left, dx: -2.5em)[
  #subbar([From the Web of Documents to a Web of Data])
]
#h(1em)

#figure(
  image("images/fromto.png", height: 80%),
  caption: [Source: Fensel (2013).]
)

== Semantic Web
#place(top + left, dx: -2.5em)[
  #subbar([Definition])
]
#h(1em)

#dblock(title: [Semantic Web])[The Semantic Web is not a separate Web but an extension of the current one, in which information is given well-defined meaning, better enabling computers and people to work in cooperation (Berners-Lee et al., 2001).]

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Linked Data])
]
#h(1em)

#dblock(title: [Linked Data])[A set of best practices for publishing and connecting structured data on the Web using international standards of the World Wide Web Consortium (Wood et al., 2014). ]

- The goal is to turn the Web into a global database where data can be reused, combined, and linked across domains: *a Web of Data*.

- It enables _cooperation without coordination:_ Data publishers don't need to pre-arrange schemas if they used shared standards.

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Linked Data principles])
]
#h(1em)

Tim Berners-Lee, the inventor of the Web, proposed the four Linked Data principles (Wood et al., 2014):

1. *Use URIs as names for things:* URIs give unambiguous identifiers for _things_: people, books, genes, abstract concepts. By naming entities with URIs instead of plain strings, we can make additional statements about them and avoid confusion. For example, http://dbpedia.org/page/War identifies the concept war, not the word “war.”

2. *Use HTTP URIs so people can look them up:* Many identification schemes exist (ISBN, DOI, ftp). But if we use HTTP URIs, then both humans and machines can resolve them directly in a browser or client. This ties Linked Data into the Web itself, ensuring identifiers are resolvable and not just opaque codes.

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Linked Data principles])
]
#h(1em)

Tim Berners-Lee, the inventor of the Web, proposed the four Linked Data principles (Wood et al., 2014):

3. *When someone looks up a URI, provide useful information:* When a URI is dereferenced, the server should return structured descriptions about the resource. This makes URIs actionable: not just identifiers, but gateways to data about the thing.

4. *Include links to other URIs to enable discovery:* Just like hyperlinks connect documents, Linked Data URIs should point to related entities in other datasets (e.g., using owl:sameAs, skos:closeMatch). This linking supports discovery, integration, and serendipitous reuse—what Wood et al. call “cooperation without coordination.”

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([The 5-Star Open Data Scheme])
]
#h(1em)

Is a practical and cumulative rating system for data publishers, introduced later by Tim Berners-Lee in 2010:

- ★ Data is available on the Web, in any format (e.g., image of a table).

- ★★ Data is available as machine-readable structured data (e.g., Excel).

- ★★★ Data is in a non-proprietary format (e.g., CSV).

- ★★★★ Data uses open W3C standards (RDF, SPARQL, URIs).

- ★★★★★ Data is linked to other datasets, providing context.


== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Knowledge Graphs])
]
#h(1em)

- A Knowledge Graph (KG) can be seen as a labeled, multirelational, directed graph: nodes and edges are labeled, and edges have directions.
- It can also be defined as a set of triples (as we'll see later in RDFs), like a directed edge with two nodes and a labeled edge in the center.
- *More than just data:* to be a KG, there must be structure and semantic coherence; otherwise it is just a collection of disconnected triples.

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Knowledge Graphs])
]

Some characteristics: 

- *Human-readable labels:* Typical KGs use understandable labels for nodes and edges (not just opaque identifiers).
- *Multi-relational:* They can represent many different types of relationships among entities (not restricted to a single edge type).
- *Flexible:* Can be uni-relational or even include undirected edges, though formally directed.
- *Application-driven:* Definitions are not rigid; what counts as a KG depends on practice and use.
#h(1em)

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Knowledge Graphs])
]
#h(1em)

KGs are used primarily within the organization that created them, while other are openly available. Some common examples (Source: The Alan Turing Institute): 

- Google knowledge graph
- Amazon's product graph
- DBpedia
- Wikidata

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Example of an academic KG])
]
#h(1em)

#figure(
  image("images/kg1.png", height: 85%),
  caption: [Source: Wood et al., 2021.]
)

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Example of a product KG])
]
#h(1em)

#figure(
  image("images/kg2.png", height: 85%),
  caption: [Source: Wood et al., 2021.]
)

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Example of a social network KG])
]
#h(1em)

#figure(
  image("images/kg3.png", height: 85%),
  caption: [Source: Wood et al., 2021.]
)

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Linked Data and Knowledge Graphs in action])
]
#h(1em)

#figure(
  image("images/gkg.png", height: 85%),
  caption: [Example of Knowledge Panel in Google Search query.]
)

== Core concepts
#place(top + left, dx: -2.5em)[
  #subbar([Linked Data and Knowledge Graphs in action])
]
#h(1em)

#figure(
  image("images/gkg2.png", height: 85%),
  caption: [Example of Knowledge Panel in Google Search query.]
)


= Enabling technologies for the Semantic Web

== The Semantic Web Stack
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#h(1em)

The Semantic Web Stack (also known as the Semantic Web Layer Cake) is a set of W3C standards designed to enable the exchange of semantically rich information:

- Resource Description Framework (RDF)
- Web Ontology Language (OWL)
- SPARQL
- RDFS
- Rule Interchange Format

== The Semantic Web Stack
#place(top + left, dx: -2.5em)[
  #subbar([Overview])
]
#h(1em)

#figure(
  image("images/stack.png", height: 85%),
  caption: [Source: Khalili, 2013.]
)


== Resource Description Framework
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#h(1em)

- A formal language for describing structured information on the Web.
- Goal: enable applications to exchange data while preserving meaning, not just for display (contrast with HTML/XML).
- RDF is the basic representation format of the Semantic Web.
- Emerged in the late 1990s; W3C published the first specification in 1999, revised in 2004. RDF 1.1 was published in 2014, and RDF 1.2 has a working draft in 2025.
- Widely supported: libraries in most languages, triple stores, and tools for processing.

== Resource Description Framework
#place(top + left, dx: -2.5em)[
  #subbar([Basics])
]
#h(1em)

- Graph-based model: data is represented as a directed labeled graph, not a tree (like XML).

- Triple structure:
  - *Subject,* the resource being described.
  - *Predicate,* the property (relationship).
  - *Object,* the value (another resource or literal) .

- Resources identified by URIs (or IRIs).

- Literals for strings, numbers, dates.

- Blank nodes for unnamed resources.

- Order of triples is irrelevant; the set of triples defines the RDF graph.

== Resource Description Framework
#place(top + left, dx: -2.5em)[
  #subbar([Turtle])
]
#h(1em)

- Turtle, or _Terse RDF Triple Language_ is a compact, human-readable syntax for RDF.

- Triples written as: `<subject> <predicate> <object> .`

- URIs in angle brackets, literals in quotes, each statement ends with a dot .

- Prefixes (`@prefix`) abbreviate long URIs: 

```@prefix ex: <http://example.org/> .
ex:Book1 ex:title "Foundations of Semantic Web Technologies" .```

- Shortcuts: semicolons (reuse subject), commas (reuse subject + predicate) .

== Resource Description Framework
#place(top + left, dx: -2.5em)[
  #subbar([Turtle Example])
]
#h(1em)

```turtle
@prefix ex: <http://example.org/> .
@prefix dbo: <http://dbpedia.org/ontology/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

ex:UdeChile a dbo:FootballClub ;
    foaf:name "Club Universidad de Chile"@es ;
    dbo:ground ex:EstadioNacional ;
    dbo:league ex:PrimeraDivision ;
    dbo:founded "1927-05-24"^^xsd:date .

```

== Resource Description Framework
#place(top + left, dx: -2.5em)[
  #subbar([Turtle Example])
]
#h(1em)

#figure(
  image("images/turtle.png", height: 85%),
)


== RDF Schema (RDFS)
#place(top + left, dx: -2.5em)[
  #subbar([Concepts])
]
#h(1em)

- *Extension of RDF:* adds schema-level vocabulary to describe classes, properties, and their hierarchies.
  - Allows expression of terminological knowledge (schema/ontology) in addition to assertional knowledge (facts).
  - Enables _basic inference_ (implicit types and relations): e.g., if ex:Player rdfs:subClassOf ex:Person and Juan a ex:Player, then Juan a ex:Person.
- Class & property hierarchies: `rdfs:subClassOf`, `rdfs:subPropertyOf`.
- Typing via `rdfs:domain` and `rdfs:range`.

== RDF Schema (RDFS)
#place(top + left, dx: -2.5em)[
  #subbar([Modifying the previous example])
]
#h(1em)

```turtle
@prefix ex: <http://example.org/> .
@prefix dbo: <http://dbpedia.org/ontology/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

# Schema-level (RDFS)
ex:FootballClub rdfs:subClassOf ex:SportsClub .
dbo:ground rdfs:domain ex:FootballClub ;
           rdfs:range ex:Stadium .

# Data-level (RDF assertions)
ex:UdeChile a ex:FootballClub ;
    foaf:name "Club Universidad de Chile"@es ;
    ...
```

== RDF Schema (RDFS)
#place(top + left, dx: -2.5em)[
  #subbar([Modifying the previous example])
]
#h(1em)

#figure(
  image("images/turtle2.png", height: 80%),
)

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([What is an Ontology?])
]
#h(1em)

#dblock(title: [Ontology (Gruber, 1993)])[An ontology is an explicit specification of conceptualization.
- Conceptualization: the abstract model of a domain (its entities, relationships, constraints).
- Explicit: formally defined, not implicit or ad hoc.
- Specification: written in a language that can be shared and used computationally.
]

Ontologies are *designed to enable knowledge* sharing and reuse by providing a common understanding of a domain that can be communicated between people and heterogeneous systems.

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([Introduction])
]
#h(1em)

- Web Ontology Language or OWL (W3C standard since 2004). OWL 2, published in 2009, extends OWL.
- Allows modeling of complex knowledge and reasoning beyond RDF(S).
- Designed to be expressive yet computationally manageable (avoid undecidability).
- Applications: biomedical ontologies, knowledge management, semantic search, linked data.

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([OWL Basics])
]
#h(1em)

Core elements:
- Classes: sets of individuals (e.g., `ex:FootballClub`).
- Individuals: instances of classes (e.g., `ex:UdeChile`).
- Properties: relations between individuals or individuals-values.

Key constructs:
- `owl:equivalentClass` — define class equivalence.
- `owl:disjointWith` — classes that share no individuals.
- `owl:Restriction` — e.g., “has at least 1 player.”
- `owl:sameAs` — asserts identity of individuals.

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([How does it relate to RDF(S)?])
]
#h(1em)

- OWL is not a separate syntax; it is a vocabulary (set of terms) that extends RDF(S).

- That means OWL axioms (like `owl:Class`, `owl:disjointWith`, `owl:sameAs`, restrictions, etc.) are expressed as RDF triples.

- Since those triples can be serialized in any RDF syntax, you can indeed write OWL in Turtle.

- So when you see an OWL ontology in Turtle, it’s just an RDF graph that uses OWL vocabulary.

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([Example])
]
#h(1em)


```turtle
@prefix ex: <http://example.org/> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix dbo: <http://dbpedia.org/ontology/> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

# Ontology definition
ex:FootballClub a owl:Class ;
    rdfs:subClassOf ex:SportsClub ;
    owl:disjointWith ex:BasketballClub .
```

== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([Extended example with more semantics])
]
#h(1em)
```
# Property restrictions
dbo:ground a owl:ObjectProperty ;
    rdfs:domain ex:FootballClub ;
    rdfs:range ex:Stadium .

# Individual assertions
ex:UdeChile a ex:FootballClub ;
    foaf:name "Club Universidad de Chile"@es ;
    dbo:ground ex:EstadioNacional ;
    dbo:founded "1927-05-24"^^xsd:date .

# Identity statements
ex:LaU owl:sameAs ex:UdeChile .
```
== Web Ontology Language
#place(top + left, dx: -2.5em)[
  #subbar([Extended example with more semantics])
]
#h(1em)

#figure(
  image("images/owl.png", height: 63%),
)

== SPARQL Introduction
#place(top + left, dx: -2.5em)[
  #subbar([SPARQL])
]
#h(1em)

- SPARQL Protocol and RDF Query Language (W3C standard).
- Designed to query RDF graphs; works like SQL but for graph data.
- Queries: graph patterns with variables (e.g., `?club`, `?stadium`).
- Returns results in tables, RDF graphs, or XML/JSON formats.
- Can query:
  - local RDF files,
  - databases (triplestores),
  - remote SPARQL endpoints (e.g., DBpedia).

== SPARQL Basics
#place(top + left, dx: -2.5em)[
  #subbar([SPARQL])
]
#h(1em)

- Structure of a query:
  1. `PREFIX` — declare namespaces.
  2. `SELECT` — variables to retrieve.
  3. `WHERE { … }` — graph patterns (triple patterns).
  4. Optional modifiers: `ORDER BY`, `LIMIT`, `FILTER`.
- Variables start with `?` (e.g., `?name`).
- Triple patterns look like RDF triples but can have variables.

```sparql
?club foaf:name ?name .
?club dbo:ground ?stadium .
```

== SPARQL Example 1: Club name and stadium
#place(top + left, dx: -2.5em)[
  #subbar([Examples])
]
#h(1em)

```sparql
PREFIX ex: <http://example.org/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?name ?stadium
WHERE {
  ex:UdeChile foaf:name ?name ;
              dbo:ground ?stadium .
}
```
Returns: `?name = "Club Universidad de Chile"`, `?stadium = ex:EstadioNacional`

== SPARQL Example 2: Clubs and founding dates
#place(top + left, dx: -2.5em)[
  #subbar([Examples])
]
#h(1em)

```sparql
PREFIX ex: <http://example.org/>
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?club ?date
WHERE {
  ?club a ex:FootballClub ;
        dbo:founded ?date .
}
```
Returns: `?club = ex:UdeChile`, `?date = "1927-05-24"^^xsd:date`

== SPARQL Example 3: Filter by founding year
#place(top + left, dx: -2.5em)[
  #subbar([Examples])
]
#h(1em)

```sparql
PREFIX ex: <http://example.org/>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

SELECT ?club ?date
WHERE {
  ?club a ex:FootballClub ;
        dbo:founded ?date .
  FILTER (?date > "1930-01-01"^^xsd:date)
}
```
Returns only clubs founded after 1930.

= State of Semantic Web Research

== State of Research
#place(top + left, dx: -2.5em)[
  #subbar([Semantic Web: A Forgotten Wave of AI (Pitkäranta & Hyvönen, 2025)])
]
#h(1em)

- The Semantic Web (2000–2010) was an _overlooked wave of AI_, focused on symbolic methods (knowledge representation, logic, reasoning, ontologies).
- _Why forgotten?_ Classified under “Web technologies” instead of “AI,” despite overlap with _agents_ and symbolic AI.
- Bibliometric analysis shows the 2000s period, wrongly considered as an “AI winter,” though SW research laid groundwork (RDF, OWL, SPARQL, Linked Data).
- Revisiting the Semantic Web offers insights for _neuro-symbolic AI_ and modern agent systems.

== State of Research
#place(top + left, dx: -2.5em)[
  #subbar([Here’s Charlie! Realising the Semantic Web vision of Agents in the Age of LLMs (Wright, 2024)])
]
#h(1em)

- _Vision_: Semi-autonomous _Web agents_ that act for users, but consult them when confidence is low.
- _Key features_:
  - Trust and provenance of data (agents must justify what they believe).
  - _Dialogue with users_ to set data-sharing preferences.
  - Safety mechanisms via rules (Notation3) + LLMs for natural dialogue.
- _Demo use case_: Personal assistant scheduling a meeting via agents negotiating calendars.
- Shows how _Semantic Web standards (RDF, N3)_ + _LLMs_ enable trustworthy, interoperable agents.

== State of Research
#place(top + left, dx: -2.5em)[
  #subbar([From Semantic Web & MAS to Agentic AI (Petrova et al., 2025)])
]
#h(1em)

- Provides the _first evolutionary overview_ of the *Web of Agents (WoA)*, bridging _Semantic Web, Multi-Agent Systems, and LLM-powered agents_.
- _Paradigm shift_:
  - Old model: “Semantics in data” (RDF, OWL).
  - New model: “Semantics in models” (LLMs embed knowledge directly).
- _Taxonomy_: Compares generations of agents (1.0 to 4.0), from static bots to _LLM-driven autonomous agents_.
- _Challenges ahead_: Governance, decentralized identity, economic models, and _open interoperability protocols (A2A, MCP)_.
