using SGtSNEpi, BenchmarkTools, SparseArrays

n = 2000;   # number of points
d = 10;     # average degree

P = sprand( n, n, d/n )

t = @belapsed sgtsnepi( P )
println("$t")