# Escape Game
# App

#source("escapegame/global.R")

# User Interface
ui <- fluidPage(
   theme = "styles.css",

   titlePanel("ESCAPE GAME"),
   setBackgroundColor(color = "#082F93"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     br(),
     column(5, offset = 1, p(intro1)),
     column(5, p(intro2)),
     br()
    ),
   fluidRow(style = "background-color:#F74635;",
     column(5, offset = 1, 
            p("zettel")),
     column(5, 
            scheibeUI("introScheibe", data.basis),
            tipsUI("introTips", data.basis, 1)
     )),
   fluidRow( column(5, offset = 1, 
                    p("zettel")),
             column(5, 
                    scheibeUI("einsScheibe", data.basis),
                    tipsUI("einsTips", data.basis, 1)))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  scheibe("introScheibe", data.basis) 
  scheibe("einsScheibe", data.basis) 
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)

