# Escape Game
# Modul zur Lösungseingabe

# UI
loesungUI <- function(id) {
  ns <- NS(id)
  tagList(
             numericInput(ns("los"),
                          label = "Lösung", 
                          value = 100,
                          min = 100,
                          max = 999),
             actionButton(ns("erg"),
                          label = "Lösung prüfen")
    )
}


# Server 
loesung <- function(id, data, nr) {
  moduleServer(
    id,
    function(input, output, session) {
     observeEvent(input$erg, {
       if(input$los == data[nr, "los"]){
          sendSweetAlert(
          session = session,
          title = "Richtig!",
          text = sample(richtig, 1),
          type = "success"
        )
       }})
      
      observeEvent(input$erg, {
        if(input$los != data[nr, "los"]){
          sendSweetAlert(
            session = session,
            title = "Falsch!",
            text = sample(falsch, 1),
            type = "error"
          )
        }})
    })
}
