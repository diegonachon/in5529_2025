#import "@preview/touying:0.6.1": *
#import themes.stargazer: *

#import "@preview/numbly:0.1.0": numbly
#import "@preview/timeliney:0.2.1"

// ===== Portada =====

// Titulo
#let title  = "Artificial Intelligence Applied to the Web"


//Cap
#let cap = "cap2p1"

#let chapter_titles = (
  cap0:   "Chapter 0 – Introduction",
  cap1p1: "Chapter 1 Part 1 – Initial Concepts and Knowledge Discovery in Databases",
  cap1p2: "Chapter 1 Part 2 - Other methodologies, Web Mining and Overview of Foundational Models",
  cap2p1: "Chapter 2 Part 1 - Web Content Mining: Text Mining on the Web"
)

//Subtitulos
#let subtitle = chapter_titles.at(cap, default: "Unknown chapter")


// Profesores
#let professors = "Diego Cornejo, Felipe Hernández and Juan Velásquez"


// Universidad - Departamento
#let university = "University of Chile 
Departament of Industrial Engineering"


// Semestre
#let date = "Spring 2025"