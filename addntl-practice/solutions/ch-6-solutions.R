temps <- c(66, 71, 68, 74, 70)
days <- c('Mon', 'Tue', 'Wed', 'Thr', 'Fri')

names(temps) <- days

temps['Wed']


temps[c('Mon', 'Fri')]

temps[c(1, 5)]
