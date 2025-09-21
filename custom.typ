#let header_fill = gradient.linear(
  relative: "parent",
  (rgb("#cf2e2e"), 0%),       // try ".colors"
  (rgb("#000000"), 100%),// or ".palette" in some versions
)

#let subbar = (t) => rect(
  width: 200%,
  fill: header_fill,
)[
  #pad(x: 1.3em)[
    #text(size: 0.9em, fill: white, weight: "medium")[#t]
  ]
]

#let dblock(self: none, title: none, it) = {
  grid(
    columns: 1,
    row-gutter: 0pt,
    block(
      fill: luma(190),
      width: 100%,
      radius: (top: 6pt),
      inset: (top: 0.4em, bottom: 0.3em, left: 0.5em, right: 0.5em),
      text(fill: rgb("#cf2e2e"), weight: "bold", title),
    ),

    rect(
      fill: gradient.linear(luma(190), luma(240), angle: 90deg),
      width: 100%,
      height: 4pt,
    ),

    block(
      fill: luma(240),
      width: 100%,
      radius: (bottom: 6pt),
      inset: (top: 0.4em, bottom: 0.5em, left: 0.5em, right: 0.5em),
      it,
    ),
  )
}

#let bblock(it) = {
  block(
    fill: luma(240),
    width: 100%,
    radius: (bottom: 6pt),
    inset: (top: 0.4em, bottom: 0.5em, left: 0.5em, right: 0.5em),
    it,
  )
}