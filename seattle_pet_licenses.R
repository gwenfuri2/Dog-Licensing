# Load necessary libraries
library(shiny)
library(readr)

# Define UI
ui <- fluidPage(
  titlePanel("Seattle Pet Licenses"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      dataTableOutput("dog_table")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Load data
  dog_licenses <- read_csv("https://github.com/gwenfuri2/Dog-Licensing/raw/main/seattle_pet_licenses.csv")
  
  # Render table
  output$dog_table <- renderDataTable({
    dog_licenses
  })
}

# Run the application
shinyApp(ui = ui, server = server)
