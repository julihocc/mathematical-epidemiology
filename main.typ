#import "template.typ": *

#show: project.with(
  title: "Mathematical Epidemiology",
  authors: ("Author Name",),
)

#include "chapters/01-introduction.typ"
#include "chapters/02-sir-model.typ"
#include "chapters/03-reproduction-number.typ"
#include "chapters/04-extensions.typ"
#include "chapters/05-vaccination.typ"
#include "chapters/06-next-generation-matrix.typ"
#include "chapters/07-case-study.typ"
