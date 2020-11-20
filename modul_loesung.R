# Escape Game
# Modul zur Lösungseingabe

# UI
loesungUI <- function(id) {
  ns <- NS(id)
  tagList(
    column(9, align = "right",
             numericInput(ns("los"),
                          label = NULL, 
                          value = 100,
                          min = 100,
                          max = 999,
                          width = "80px")),
    column(1, align = "right",
             actionButton(ns("erg"),
                          label = "Lösung prüfen"))
    )
}


# Server 
loesung <- function(id, data, nr) {
  moduleServer(
    id,
    function(input, output, session) {
     #Rueckmeldung, wenn Eingabe korrekt  
     observeEvent(input$erg, {
       if(input$los == data[nr, "los"]){
          sendSweetAlert(
          session = session,
          title = "Richtig!",
          text = sample(richtig, 1),
          type = "success"
        )
       }})
      
      # Rueckmeldung, wenn Eingabe falsch
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
