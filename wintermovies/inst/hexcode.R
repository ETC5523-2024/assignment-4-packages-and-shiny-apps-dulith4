library(hexSticker)
library(showtext)


font_add_google("Pacifico", "pacifico")
showtext_auto()


sticker(
  subplot = "inst/images/image2.png",
  package = "wintermovies",
  p_size = 17,
  s_x = 1, s_y = 0.75, s_width = 0.5,
  h_fill = "#1be592",
  h_color = "#FF6347",
  p_color = "#FFFFFF",
  filename = "man/figures/logo.png"
)

