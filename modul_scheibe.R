# Escape Game
# Modul zur Scheibe

# UI
scheibeUI <- function(id, data) {
  ns <- NS(id)
  tagList(
    dropdownButton(
      label = "Controls",
      icon = icon("sliders"),
      status = "primary",
      width = "100%", 
      #Dropdownmenue mit drei Wahlmenues fuer jeden Ring der Scheibe einen 
      column(3, 
             selectInput(inputId = ns('scheibeInnen'),
                         label = 'Innere Scheibe',
                         choices = data[, "nr"],
                         selected = data[1, "nr"]),
             selectInput(inputId = ns('scheibeMittig'),
                         label = 'Mittlere Scheibe',
                         choices = data[, "nr"],
                         selected = data[1, "nr"]),
             selectInput(inputId = ns('scheibeAussen'),
                         label = 'Äußere Scheibe',
                         choices =  data[, "nr"],
                         selected =  data[1, "nr"])),
      #Einfügen der Scheibe
      column(9, 
             plotOutput(ns("scheibe")))
    )
  )
}


# Server
scheibe <- function(id, data) {
  moduleServer(
    id,
    function(input, output, session) {
      reactiveInnen <- reactive({
        ifelse(rep(input$scheibeInnen, length(data[, "nr"])) != 1, 
               c(data[, "nr"][-which(data[, "nr"] < input$scheibeInnen)], 
                 data[, "nr"][which(data[, "nr"] <= input$scheibeInnen)]),
               data[, "nr"])
      })
      
      reactiveMittig <- reactive({
        ifelse(rep(input$scheibeMittig, length(data[, "nr"])) != 1, 
               c(data[, "nr"][-which(data[, "nr"] < input$scheibeMittig)], 
                 data[, "nr"][which(data[, "nr"] <= input$scheibeMittig)]),
               data[, "nr"])
      })
      
      reactiveAussen <- reactive({
        ifelse(rep(input$scheibeAussen, length(data[, "nr"])) != 1, 
               c(data[, "nr"][-which(data[, "nr"] < input$scheibeAussen)], 
                 data[, "nr"][which(data[, "nr"] <= input$scheibeAussen)]),
               data[, "nr"])
      })
      
      reactiveScheibe <- reactive({
        data.frame(innen = as.character(reactiveInnen()),
                   mittig = as.character(reactiveMittig()),
                   aussen = as.character(reactiveAussen()),
                   symbole = as.character(data$icon)) %>% 
          pivot_longer(cols = everything(),
                       names_to = "position",
                       values_to = "name") %>%
          mutate(position = fct_relevel(position, "innen", "mittig", "aussen", "symbole")) %>%
          add_column(value = 1)
      })  
      
      output$scheibe <- renderPlot({
        ggplot(reactiveScheibe(), aes(x = position, y = value)) +
          geom_col(aes(fill = name), color = "black", width = 1) +
          geom_text(aes(label = name), 
                    size = 7,
                    position = position_stack(vjust = 0.5)) +
          #scale_fill_manual(values = cols) +
          coord_polar(theta = "y", start = 0) +
          theme_void() +
          theme(legend.position = "none",
                text = element_text(family = "Bahnschrift"))
        
      },
      bg="transparent")
    }
  )
}


