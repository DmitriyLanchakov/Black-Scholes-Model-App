library(shiny)

shinyUI(pageWithSidebar(  
        headerPanel("Black-Schole Option Model"),  
        sidebarPanel(
                sliderInput('K', 'Strike',value = 100, min = 1, max = 200, step = 0.01),
                sliderInput('sigma', 'Volatility, %',value = 20, min = 1, max = 200, step = 0.01),
                sliderInput('t', 'Time to Expiration, days',value = 365, min = 0.25, max = 2*365, step = 1),
                sliderInput('r', 'Interest Rate, %',value = 0.5, min = 0, max = 10, step = 0.25)
        ), 
        mainPanel(
                tabsetPanel(
                        tabPanel("Docs", includeMarkdown("help.Rmd")),
                        tabPanel("Value", plotOutput('value')), 
                        tabPanel("Delta", plotOutput('delta')), 
                        tabPanel("Gamma", plotOutput('gamma')),
                        tabPanel("Vega", plotOutput('vega')),
                        tabPanel("Theta", plotOutput('theta'))
                )
        )
))