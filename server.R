#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output, session) {
  
  observe({
    categories <- if( is.null(input$county)) character(0) else{
      filter(origAddress, County %in% input$county)%>%
        `$`(`Category`)%>%
        unique()
    }
    stillSelected <- isolate(input$category[input$category %in% categories])
    updateSelectizeInput(session, "category", choices = categories,
                         selected = stillSelected, server= TRUE)
  })
  
  observe({
    
  })
  

  
  
  
  output$resourceTable <- DT::renderDataTable({
    df <- origAddress[!is.na(origAddress$City), ] %>%
      filter(
        is.null(input$county) | County %in% input$county
      )
    
    action <-
      DT::dataTableAjax(session, df, outputId = "resourceTable")
    
    DT::datatable(df, options = list(ajax = list(url = action)), escape = FALSE)
  })
  
  
  
  
  
  
}
  
  
  
  
  
  
# old code for quick reference  
  
#       observe({
#         locations <- if (is.null(input$county)) character(0) else{
#             filter(origAddress, Type %in% input$county) %>%
#                 `$`('Location')%>%
#                 unique()
#         }
#         stillSelected <- isolate(input$location[input$location %in% locations])
#         updateSelectizeInput(session, "location", choices = locations,
#                              selected = stillSelected, server = TRUE)
#     })
#     
#     observe({
#         programs <- if (is.null(input$county)) character(0) else {
#             resourceInventory %>%
#                 filter(County %in% input$county,
#                        is.null(input$location) | Location %in% input$location) %>%
#                 `$`('Program') %>%
#                 unique()
#         }
#         stillSelected <- isolate(input$program[input$program %in% programs])
#         updateSelectizeInput(session, "program", choices = programs,
#                              selected = stillSelected, server = TRUE)
#     })
#     
#     output$resourceTable <- DT::renderDataTable({
#         df <- origAddress[!is.na(origAddress$City),] %>%
#             filter(
#                 is.null(input$county) | County %in% input$county,
#                 is.null(input$location)     | Location %in% input$location,
#                 is.null(input$program)     | Program %in% input$program
#             )
#         action <- DT::dataTableAjax(session, df, outputId = "resourceTable")
#         
#         DT::datatable(df, options = list(ajax = list(url = action)), escape = FALSE)
#     })
#     
#     output$map <- renderLeaflet({
#         df <- origAddress[origAddress$City!= "NA",] %>%
#             filter(
#                 is.null(input$type) | Type %in% input$type,
#                 is.null(input$location)     | Location %in% input$location,
#                 is.null(input$program)     | Program %in% input$program
#             )
#         
#         leaflet() %>%
#             addTiles() %>%
#             addMarkers(data = df, lng = ~lon, lat = ~lat, 
#                        popup = ~paste(origAddress$`Program Name`, "<br>", "Address:", origAddress$`Street Address`, ", ", City, sep = "" )) 
#         
#     })
#     
#     
# }
