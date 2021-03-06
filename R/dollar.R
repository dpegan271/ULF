#' @title Format numbers as dollars, i.e. adding commas and $ signs
#' @author Daniel Egan
#' @param x numeric vector to be converted to dollars
#' @param fixed string Should the results be left-aligned? 
#' @param rounder The digits to be rounded to, before conversion. 
#' @return string Vector of formatted strings
#' @keywords finance economics formating 
#' @seealso \code{\link{nchar}} which this function wraps
#' @export
#' @examples
#' dollar(10^seq(1,10))
#' dollar(10^seq(1,10),fixed=TRUE)
#' dollar(10^seq(1,10),fixed=TRUE, rounder=0)
#' dollar(-10^seq(1,10), rounder=0)


dollar<-function(x, fixed=FALSE, rounder=2){
  x<- round(as.numeric(x), rounder)    
  neg <- ifelse(sign(x)<0, "-", "")
  
  x<- abs(x)
  
  if (fixed==TRUE) {  
    y<- formatC(x,digits = rounder,format = "f",big.mark = ",",)
    maxWidth<- max(nchar(y))
    y<- formatC(x, digits = rounder, format = "f", big.mark = ",", width=maxWidth, flag=" ")
    
    y<-paste(neg,"$", y ,sep="")
    
    return(y)  
  } else {
    y<- paste(neg,"$", formatC(x,digits = rounder,format = "f",big.mark = ",") ,sep="")

    return(y)
  }
}
