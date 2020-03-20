library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Resource Finder"),
  
  dashboardSidebar(
    selectInput(
      "county",
      "Select County:",
      choices = origAddress$County,
      multiple = TRUE
    ),
    selectInput(
      "category",
      "Select Category:",
      choices = c("All Locations" = ''),
      multiple = TRUE
    ),
    selectInput(
      "program",
      "Select Programs:",
      choices = c("All Programs" = ''),
      multiple = FALSE
    )
  ),
  
  dashboardBody(
    DT::dataTableOutput("resourceTable"),
    hr()
    #leafletOutput("map", width = 600, height = 400)
  )
)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
       
#     dashboardSidebar(
#         selectInput("county", "Choose Service Type:", choices = Resources$County, multiple = TRUE),
#         selectInput("location", "Select Service Location:", choices = c("All Locations"=''), multiple = TRUE),
#         selectInput("program", "Select Programs:", choices = c("All Programs"=''), multiple = TRUE)
#     ),
#     
#     
#     dashboardBody(
#         DT::dataTableOutput("resourceTable"),
#         hr(),
#         leafletOutput("map", width= 600, height = 400)
#     )
# )
