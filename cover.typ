// Cover letter template

#let template(
  author: "Author",
  subject: "Subject",
  address: (
    "2 Example Street",
    "Example Town",
    "AB12 3CD",
    "United Kingdom",
  ),
  company: "Company Name",
  role: "Role Name",
  to: "Hiring Manager",
  email: "hello@example.com",
  phone: "+441234567890",
  date: datetime.today(),
  body,
) = {
  let title = "Cover Letter: " + author
  set document(title: title, author: author, date: date)

  set page(paper: "a4", margin: (x: 20mm, y: 20mm))

  set text(
    font: "New Computer Modern",
    size: 10pt,
  )

  show heading: set block(above: 0.5em, below: 0.5em)

  table(
    columns: (0.5fr, 0.5fr),
    align: (left, right),
    stroke: none,
    gutter: 0mm,
    inset: 0mm,
    text(author + "\n" + address.map(line => text(line)).join("\n") + "\n\n"),

    link("mailto:" + email, email) + text("\n") + link("tel:" + phone, phone),
  )

  date.display("[Day]/[Month]/[Year]")
  text("\n\n")
  text(subject, weight: "bold")

  text("\n\n")
  text("Dear " + to + ",\n\n")

  body

  text("\n\n")
  text("Sincerely,\n")
  text(author)
}
