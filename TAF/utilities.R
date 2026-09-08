# Show progress while reading file
reading <- function(string, action)
{
  cat("  Reading", string, "... ")
  x <- action
  cat("done\n")
  x
}

read.MFCLRegScaleLong <- function(file)
{
  # Read as text
  reg <- readLines(file)

  # Parse first line
  begyr <- as.integer(strsplit(reg[1], " ")[[1]][1])
  begmon <- as.integer(strsplit(reg[1], " ")[[1]][2])
  endyr <- as.integer(strsplit(reg[1], " ")[[1]][3])
  endmon <- as.integer(strsplit(reg[1], " ")[[1]][4])

  # Create year-month sequence
  n <- length(reg) - 1
  year <- begyr + seq(begmon, by=3, length=n) %/% 12
  month <- seq(begmon, by=3, length=n) %% 12
  season <- as.integer((1 + month) / 3)
  if(endyr != year[n] || endmon != month[n])
    stop("year-month header does not match number of rows")

  # Create and rearrange data frame
  reg <- read.table(text=paste(year, season, reg[-1]))
  reg <- data.frame(reg[1:2], stack(reg[-(1:2)]))
  reg <- data.frame(year=as.integer(reg[[1]]), season=as.integer(reg[[2]]),
                    area=as.integer(reg[[4]]), value=reg[[3]])
  reg
}
