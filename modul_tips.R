# Escape Game
# Modul Tips

# UI
tipsUI <- function(id, data, nr) {
  ns <- NS(id)
  tagList(
    dropdownButton(
      label = "Controls",
      icon = icon("sliders"),
      status = "primary",
      width = "35%",
      actionButton("buttontip1", "Erster Tip"),
      conditionalPanel(
        condition = "input.buttontip1 > 0",
        data[nr, "tip1"],
        br(), br(), br(),
        actionButton("buttontip2", "Zweiter Tip"),
        conditionalPanel(
          condition = "input.buttontip2 > 0",
          data[nr, "tip2"],
          br(), br(), br(),
          actionButton("buttontip3", "Antwort"),
          conditionalPanel(
            condition = "input.buttontip3 > 0",
            paste("Die Lösung lautet:", data[nr, "los"]),
            br()
          )
        )
        
      ))
  )
}
