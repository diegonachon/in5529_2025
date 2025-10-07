#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#import "@preview/numbly:0.1.0": numbly
#import "@preview/timeliney:0.2.1"

// ===== Portada =====

// Titulo
#let title  = "Artificial Intelligence Applied to the Web"


// Cap
#let cap = "cap4p4"

#let chapter_titles = (
  cap0:   "Chapter 0 – Introduction",
  cap1p1: "Chapter 1 Part 1 – Initial Concepts and Knowledge Discovery in Databases",
  cap1p2: "Chapter 1 Part 2 - CRISP-DM and Other Methodologies, Web Mining and Overview of Foundation Models",
  cap2p1: "Chapter 2 Part 1 - Web Content Mining: Text Mining on the Web",
  cap2p2: "Chapter 2 Part 2 - VSM Feature Engineering and Statistical Language Models",
  cap2p3: "Chapter 2 Part 3 - Vector Semantics and Neural Language Models",
  cap2p4: "Chapter 2 Part 4 - Neural Language Models and LLMs", 
  cap2p5: "Chapter 2 Part 5 - The Semantic Web",
  cap3p1: "Chapter 3 Part 1 - Fundamentals of Web Structure Mining and Graph Theory",
  cap3p2: "Chapter 3 Part 2 - Web Page Rank Algorithms",
  cap3p3: "Chapter 3 Part 3 - Modern Web Search Approaches",
  cap3p4: "Chapter 3 Part 4 - Graph Neural Networks",
  cap4p2: "Chapter 4 Part 2 - Web Logs and Session Reconstruction",
  cap4p3: "Chapter 4 Part 3 - Recommendation Systems",
  cap4p4: "Chapter 4 Part 4 - Recommendation Systems II"
)

// Subtitulos
#let subtitle = chapter_titles.at(cap, default: "Unknown chapter")


// Profesores
#let professors = "Diego Cornejo, Felipe Hernández and Juan Velásquez"


// Universidad - Departamento
#let university = "University of Chile 
Departament of Industrial Engineering"


// Semestre
#let date = "Spring 2025"