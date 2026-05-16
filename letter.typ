#let colors = (
    red-1: rgb("#e60013"),
    red-2: rgb("#ea2434"),
)

#let page-width = 19.06cm
#let page-height = 26.40cm
#let page-margin = (left: 1.40cm, right: 1.60cm, top: 4.20cm, bottom: 2.00cm)
#let body-width = page-width - page-margin.left - page-margin.right
#let body-top = page-margin.top
#let body-bottom = page-height - page-margin.bottom
#let body-line-height = 1.005cm
#let body-line-count = calc.floor((body-bottom - body-top) / body-line-height)
#let content-offset = 2pt
#let content-margin = (
    left: page-margin.left,
    right: page-margin.right,
    top: page-margin.top + body-line-height - content-offset,
    bottom: page-margin.bottom,
)

#let style-line(y, fill: colors.red-1, thickness: .06cm) = place(top + left, dy: y, line(
    length: 100%,
    stroke: fill + thickness,
))

#let text-underline(y, fill: colors.red-2, thickness: .04cm) = place(top + left, dx: page-margin.left, dy: y, line(
    length: body-width,
    stroke: fill + thickness,
))

#let letter(body) = {
    set page(
        width: page-width,
        height: page-height,
        margin: content-margin,
        background: for i in range(1, body-line-count + 1) {
            text-underline(body-top + body-line-height * i)
        },
        header-ascent: 0cm,
        header: align(center + bottom, {
            image("assets/fig/sdu.png", width: 64%, height: 64%, fit: "contain")
            v(1.1cm)
            style-line(4.02cm)
            style-line(4.14cm, thickness: .03cm)
        }),
        footer: {
            set align(right)
            set text(font: "Noto Serif CJK SC", weight: "bold", 11pt, fill: colors.red-2)
            [第]
            h(.75em)
            text(font: "TeX Gyre Termes", weight: "regular", fill: black, context counter(page).display("1"))
            h(.75em)
            [页]
            h(1.7cm)
        },
        footer-descent: .5cm,
    )
    set text(font: "Source Han Serif SC", 15pt, top-edge: "baseline", bottom-edge: "baseline")
    set par(justify: true, leading: body-line-height)
    body
}
