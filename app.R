# Escape Game
# App

#source("escapegame/global.R")

# User Interface
ui <- fluidPage(
   theme = "styles.css",

   # Startseite
   titlePanel("ESCAPE GAME"),
   setBackgroundColor(color = "#082F93"),
   
   # Intro
   fluidRow(
     br(),
     column(5, offset = 1, p(intro1)),
     column(5, p(intro2))
    ),
   # Erste Aufgabe - Ausprobieren der Scheibe 
   fluidRow(style = "background-color: #F74635;",
            scheibeUI("einsScheibe", data.basis)),
   fluidRow(style = "background-color: #F74635;",
            align = "center", "zettel"),
   fluidRow(style = "background-color: #F74635;",
            loesungUI("einsErgebnis"), 
            column(2, align = "right", tipsUI("einsTips", data.basis, 1)))
   #Zweite Aufgabe

)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  useSweetAlert()
  
  # Erste Aufgabe
  scheibe("einsScheibe", data.basis) 
  loesung("einsErgebnis", data.basis, 1) 

}

# Run the application 
shinyApp(ui = ui, server = server)

