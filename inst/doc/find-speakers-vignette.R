## ------------------------------------------------------------------------
library(findRspeakers)
library(pander)
possibleSpeakers = findRspeakers("rug\\.nl")
pander(possibleSpeakers, split.table=Inf)

