using SGtSNEpi, BenchmarkTools, SparseArrays, CSV, DataFrames, Plots, Random

n = 1000;   # number of points
d = 10;     # average degree

# Set the random seed for reproducibility
Random.seed!(42)

P = sprand( n, n, d/n )

#t = @belapsed sgtsnepi( P )

# benchmark
results=[]
for i in 1:20
    t=@elapsed sgtsnepi( P )
    push!(results,t)
end

# Generate and store results in a CSV file
CSV.write("times.csv", DataFrame(results=results))

# Read data from CSV file
data = CSV.read("times.csv", DataFrame)
readData = data[:, :results] # ":" means all rows, ":results" specifies the column named "results"

# Plot the data
plot(readData, xlabel="embedding number", ylabel="time", title="C/C++ with Julia wrapper")
display(plot)
savefig("plot.png")

println(results)