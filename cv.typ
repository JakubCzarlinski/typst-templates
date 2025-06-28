// CV Template

#let template(
  author: "Author",
  linkedin: "hello",
  email: "hello@example.com",
  phone: "+44 7873362583",
  skills: ("Go", "Python", "C++"),
  github: "github.com/username",
  website: "example.com",
  date: datetime.today(),
  body,
) = {
  let title = "CV: " + author
  set document(title: title, author: author, date: date)

  set page(paper: "a4", margin: (x: 15mm, y: 15mm))

  set text(
    font: "New Computer Modern",
    size: 10pt,
  )

  show heading: set block(above: 0.5em, below: 0.5em)
  set list(indent: 0.0em, spacing: 0.8em)
  set enum(indent: 0.0em, spacing: 1.0em)

  table(
    columns: (6cm, 1fr, 6cm),
    rows: 3,
    align: (left, center, right),
    gutter: 0mm,
    inset: 1mm,

    stroke: none,

    link("https://linkedin.com/in/" + linkedin, "linkedin.com/in/" + linkedin),

    table.cell(rowspan: 3, text(16pt, author), align: horizon),

    [#skills.fold(none, (acc, skill) => (
        if acc == none { skill } else { acc + ", " + skill }
      ))],

    link("mailto:" + email, email),
    link("https://" + github, github),
    link("tel:" + phone, phone),

    link("https://" + website, website),
  )
  body
}
