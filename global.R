# Globale Einstellungen 

# lade Pakete
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(emojifont)

# lade Module
source("escapegame/modul_scheibe.R")
source("escapegame/modul_tips.R")
source("escapegame/intro.R")

# Datensatz zu Aufgaben 
data.basis <- data.frame(nr = 1:6,
                         los = c(123,123,123,123,123,123),
                         tip1 = c("Tip1", "Tip1", "Tip1", "Tip1", "Tip1", "tip1"),
                         tip2 = c("Tip2", "Tip2", "Tip2", "Tip2", "Tip2", "Tip2"),
                         icon = c(emoji("droplet"), emoji("snowflake"), emoji("train2"),
                                  "II", emoji("black_flag"), "€"))

# Antwortexte 
richtig <- c("Du hast es geschafft. Versuch dich am nächsten Rätsel.",
             "Super, das war richtig. Mach weiter so!",
             "Jay, das war richtig! Weiter zum nächsten Rätsel.",
             "Ein Rätsel geschafft, das Nächste wartet schon!",
             "Fantastisch, du hast die Lösung gefunden. 
             Kannst du auch das nächste Rätsel lösen?")

falsch <- c("Das war nicht korrekt. Versuchs nochmal!", 
            "Hast du dich vertippt? Das stimmt so nicht.",
            "Das war wohl nichts. Versuch was anderes.",
            "Computer sagt nein.",
            "Nein, damit kommst du nicht weiter. Denk noch einmal drüber nach.",
            "Du solltest was anderes versuchen. So wird das nichts.")
