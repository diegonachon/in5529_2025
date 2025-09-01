#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "@preview/numbly:0.1.0": numbly
#import "/variables.typ"

#set text(
  font : "Source Serif Pro",
)
#set par(justify: true)

#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: variables.title,
    subtitle: variables.subtitle,
    author: "D. Cornejo, F. Hernández, and J. Velásquez",
    date: variables.date,
    institution: variables.university,
    logo: image("logo_dii.svg"),
  ),
  config-colors(
    primary: rgb("#cf2e2e"),
    primary-dark: rgb("#ffffff"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#000000"),
  ),
)

// #set heading(numbering: numbly("{1}.", default: "1.1"))
#set heading(numbering: none)

#let title-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
  )
  self.store.title = none
  let info = self.info + args.named()
  info.authors = {
    let authors = if "authors" in info {
      info.authors
    } else {
      info.author 
    }
    if type(authors) == array {
      authors
    } else {
      (authors,)
    }
  }
  let body = {
    show: std.align.with(center + horizon)
    block(
      fill: self.colors.primary,
      inset: 1.5em,
      radius: 0.5em,
      breakable: false,
      {
        text(size: 1.2em, fill: self.colors.neutral-lightest, weight: "bold", info.title)
        if info.subtitle != none {
          parbreak()
          text(size: 1.0em, fill: self.colors.neutral-lightest, weight: "bold", info.subtitle)
        }
      },
    )
    // authors
    grid(
      columns: (1fr,) * calc.min(info.authors.len(), 3),
      column-gutter: 1em,
      row-gutter: 1em,
      variables.professors,
    )
    // institution
    if info.institution != none {
      parbreak()
      text(size: 0.7em, info.institution)
    }
    // date
    if info.date != none {
      parbreak()
      text(size: 1.0em, utils.display-info-date(self))
    }
  }
  touying-slide(self: self, body)
})

#title-slide()


// Importar capitulo

//Claramente se puede hacer más eficiente o de alguna mejor manera esto xd

#include "capitulos/" + variables.cap + "/" + "slides.typ"

#title-slide()