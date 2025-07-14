#include "../formatting.typ"
#import "../aliases.typ": *

// INFO: latex style algorithms in pseudo code
// #import "@preview/algorithmic:1.0.0"
// #import algorithmic: algorithm-figure, style-algorithm
// #show: style-algorithm

// INFO: latex style equations
// #import "@preview/mitex:0.2.5": mi

#set heading(numbering: "1.")

= Theoretical Background <top_level>

== Using Acronyms

*First occurrence:*
@imu\
*Second occurrence:*
@imu\
*Plural:*
@imu:pl

== Citing

After this sentence a citation is placed. @Sha48\
We can also specify a page. @Sha48[p. 1]

== Aliases

There are multiple aliases:

This is a todo statement:

#raw("#todo(\"missing paragraph\")", lang: "typst") → #todo("missing paragraph")

#raw("#sprache(\"occurence or occurrence?\")", lang: "typst") → #sprache("occurence or occurrence?")

#raw("#quelle", lang: "typst") → #quelle

