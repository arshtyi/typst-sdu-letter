#let letter(body) = {
    set page(
        width: 19.06cm,
        height: 26.40cm,
        margin: (left: 1.40cm, right: 1.60cm, top: 4.00cm, bottom: 2.00cm),
        footer: context {
            set align(right)
            set text(8pt)
            counter(page).display("第1页")
        },
    )
    set par(justify: true)
    body
}
