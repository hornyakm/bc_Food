require(plumber)
require(jsonlite)

custom_json <- function(){
  function(val, req, res, errorHandler){
    tryCatch({
      json <- jsonlite::toJSON(val,auto_unbox=TRUE)

      res$setHeader("Content-Type", "application/json")
      res$body <- json

      return(res$toResponse())
    }
    , 
    error=function(e){
     errorHandler(req, res, e)
   }
  )
  }
}

addSerializer("custom_json",custom_json)
# Make sure you put the path to your blockchain-node-server.R script
r <- plumb("blockchain-node-server.R")
r$run(port=8000)
