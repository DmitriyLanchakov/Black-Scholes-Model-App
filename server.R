library(UsingR)
source('black_scholes.R')

shinyServer(  
        function(input, output) { 
                output$value <- renderPlot({
                        K <- input$K
                        sigma <- input$sigma/100
                        r <- input$r/100
                        t <- input$t/365
                        
                        plot(function(S){bscall.value(S,K,t,r,sigma)}, 1, 300, col="#19304f", lwd=3, xlab="", ylab="")
                        plot(function(S){bsput.value(S,K,t,r,sigma)}, 1, 300, add=T, col="#d63d00", lwd=3)
                        title(main='', xlab='Stock Price', ylab='Value')
                        legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
                        abline(v=K,lty=3)
                        title('Value', line=1)
                })
                
                output$delta <- renderPlot({
                        K <- input$K
                        sigma <- input$sigma/100
                        r <- input$r/100
                        t <- input$t/365
                        
                        plot(function(S){bscall.delta(S,K,t,r,sigma)}, 1, 300, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(-1,1))
                        plot(function(S){bsput.delta(S,K,t,r,sigma)}, 1, 300, add=T, col="#d63d00", lwd=3)
                        abline(v=K,lty=3)
                        abline(0,0)
                        title('', xlab='Stock Price', ylab='Delta')
                        legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
                        title('Delta', line=1)
                })
                
                output$gamma<- renderPlot({
                        K <- input$K
                        sigma <- input$sigma/100
                        r <- input$r/100
                        t <- input$t/365
                        
                        plot(function(S){bscall.gamma(S,K,t,r,sigma)}, 1, 300, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,0.10))
                        abline(v=K,lty=3)
                        title('Gamma', xlab='Stock Price', ylab='Gamma')
                        legend('topleft', c('Call/Put Gamma'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
                })
                
                output$vega<- renderPlot({
                        K <- input$K
                        sigma <- input$sigma/100
                        r <- input$r/100
                        t <- input$t/365
                        
                        plot(function(S){bscall.vega(S,K,t,r,sigma)}, 1, 300, col="#19304f", lwd=3, xlab="", ylab="", ylim=c(0,50))
                        abline(v=K,lty=3)
                        title('Vega', xlab='Stock Price', ylab='Vega')
                        legend('topleft', c('Call/Put Vega'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
                })
                
                output$theta<- renderPlot({
                        K <- input$K
                        sigma <- input$sigma/100
                        r <- input$r/100
                        t <- input$t/365
                        
                        plot(function(S){bscall.theta(S,K,t,r,sigma)}, 1, 300, col="#19304f", lwd=3, xlab="", ylab="",ylim=c(-20,5))
                        plot(function(S){bsput.theta(S,K,t,r,sigma)}, 1, 300, add=T, col="#d63d00", lwd=3)
                        abline(v=K,lty=3)
                        abline(0,0)
                        title('Theta', xlab='Stock Price', ylab='Theta')
                        legend('topleft', c('Call', 'Put'), lwd=3, col=c("#19304f","#d63d00"), bty='n')
                })
        }
)