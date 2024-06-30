#import "@preview/chic-hdr:0.4.0": *
#import "@preview/physica:0.9.3": *

#let buildMainHeader(mainHeadingContent) = {
  [
    #align(center, smallcaps(mainHeadingContent)) 
    #line(length: 100%)
  ]
}

#let buildSecondaryHeader(mainHeadingContent, secondaryHeadingContent) = {
  [
    #smallcaps(mainHeadingContent)  #h(1fr)  #emph(secondaryHeadingContent) 
    #line(length: 100%)
  ]
}

#let isAfter(secondaryHeading, mainHeading) = {
  let secHeadPos = secondaryHeading.location().position()
  let mainHeadPos = mainHeading.location().position()
  if (secHeadPos.at("page") > mainHeadPos.at("page")) {
    return true
  }
  if (secHeadPos.at("page") == mainHeadPos.at("page")) {
    return secHeadPos.at("y") > mainHeadPos.at("y")
  }
  return false
}

#let getHeader() = {
  locate(loc => {
    // Find if there is a level 1 heading on the current page
    let nextMainHeading = query(selector(heading).after(loc), loc).find(headIt => {
     headIt.location().page() == loc.page() and headIt.level == 1
    })
    if (nextMainHeading != none) {
      return buildMainHeader(nextMainHeading.body)
    }
    // Find the last previous level 1 heading -- at this point surely there's one :-)
    let lastMainHeading = query(selector(heading).before(loc), loc).filter(headIt => {
      headIt.level == 1
    }).last()
    // Find if the last level > 1 heading in previous pages
    let previousSecondaryHeadingArray = query(selector(heading).before(loc), loc).filter(headIt => {
      headIt.level > 1
    })
    let lastSecondaryHeading = if (previousSecondaryHeadingArray.len() != 0) {previousSecondaryHeadingArray.last()} else {none}
    // Find if the last secondary heading exists and if it's after the last main heading
    if (lastSecondaryHeading != none and isAfter(lastSecondaryHeading, lastMainHeading)) {
      return buildSecondaryHeader(lastMainHeading.body, lastSecondaryHeading.body)
    }
    return buildMainHeader(lastMainHeading.body)
  })
}

// Project part
#let project(
  title: "", 
  authors: (), 
  subtitle: "",
  objective: "",
  department: "" , 
  institute: "", 
  year: "", 
  logo: none, 
  abstract: none,
  subject: "",
  degree: "Master of Science",
  stream: "Cybersecurity",
  guide: (),
  body
  ) = {
  // Set the document's basic properties.
  set document(
    author: authors.map(a => a.name), 
    title: title)
  set page(
    paper: "a4",
    margin: (
      top: 1in,
      bottom: 1in,
      left: 1in,
      right: 1in
    )
  )
  set text(font: "Times New Roman", lang: "en")

  set par(justify: true)
  // Title row.
  v(.10fr)
  align(center)[
    #text(12pt, strong(smallcaps(subject)))
    \ \ #text(30pt, weight: 900, smallcaps(title))
    \ #text(14pt, weight: 200, subtitle)
  ]

  // Degree Part
  align(center)[
    #text(12pt, strong(degree))
    \ #text(12pt, strong("in"))
    \ #text(12pt, strong(stream))
    #v(1cm)
    #text(12pt, strong("Submitted By,"))
  ]
  
  pad(
    top: 2em,
    for i in range(calc.ceil(authors.len() / 3)) {
      let end = calc.min((i + 1) * 3, authors.len())
      let is-last = authors.len() == end
      let slice = authors.slice(i * 3, end)
      grid(
        columns: slice.len() * (1fr,),
        gutter: 12pt,
        ..slice.map(author => align(center, {
          text(12pt, strong(author.name))
          if "rollno" in author [
            \ #author.rollno
          ]
          if "regno" in author [
            \ #author.regno
          ]
          if "department" in author [
            \ #author.department
          ]
          if "email" in author [
            \ #link("mailto:" + author.email)
          ]
        }))
      )
  
      if not is-last {
        v(16pt, weak: true)
      }
    }
  )
  v(1cm)
  align(center)[
    #text(12pt, "Under the guidance of,")
    \ #text(14pt, smallcaps(strong(guide.name)))
    \ #text(12pt, smallcaps(guide.designation+","))
    \ #text(12pt, smallcaps(guide.department))
  ]
  
  v(0.75fr)
  if logo != none {
    align(center)[
      #image(logo, width: 26%)
      \ #text(12pt, strong(smallcaps(department)))
      \ #text(14pt, institute)
      \ #text("Accademic Year: " + year)
    ]
  } else {
    align(center)[
      #text(12pt, strong(smallcaps(department)))
      \ #text(14pt, institute)
      \ #text("Accademic Year: " + year)
    ]
  }
  set page(margin: (
    top: 1in,
    bottom: 1in,
    left: 1.5in,
    right: 1in
  ))
  if abstract != none {
    pagebreak()
    align(right)[
      #text(34pt, underline(smallcaps(strong("Abstract"))))
    ]
    set par(justify: true)
    abstract
  }
  
  pagebreak()
  outline(depth: 3, indent: true)

  // Formatting the headings
  // General First and then specific headings
  show heading: it => [
    #set align(left)
    #set text(14pt)
    #block(smallcaps(it.body))
  ]
  
  show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #set align(center)
    #set text(30pt)
    #underline(extent: 2pt)[
      #block(smallcaps(it.body))
      #v(0em)
    ]
  ]

  show heading.where(level:2): it => [
    #set text(24pt)
    #block(counter(heading).display() + " " + smallcaps(it.body))
  ]

  show heading.where(level:3): it => [
    #set text(20pt)
    #block(counter(heading).display() + " " + smallcaps(it.body))
  ]

  show heading.where(level:4): it => [
    #set text(16pt)
    #block(smallcaps(it.body))
  ]

  show heading.where(level:5): it => [
    #set text(14pt)
    #block(smallcaps(it.body))
  ]

  // Main body.
  set par(justify: true)
  set heading(numbering: "1.1")
  counter(page).update(1)
  set page(header: getHeader())
  set page(numbering: "1", number-align: center)
  body
}