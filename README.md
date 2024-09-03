# UNSWOpenDay2024

Pluto.jl dashboard for the School of Mathematics and Statistics, University of New South Wales, open day activities.
Many thanks to [@ghaetinger](https://github.com/ghaetinger) for [this](https://www.youtube.com/watch?v=dP9UuEL00iM&t=437s) brilliant demonstration of how to use [Pluto.jl](https://github.com/fonsp/Pluto.jl) to create a dashboard!

To bulid the dashboard first [download julia](https://julialang.org/downloads/) and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) this repository.
To install Pluto.jl, first open julia in a terminal by typing `julia`, then

```julia
julia> ] # to enter julia's package manager
(@v 1.10) pkg> add Pluto
```

To then use Pluto.jl

```julia
julia> using Pluto

julia> Pluto.run()
```

Next change to the directory where the repository, activate the environment and instantiate (build the required dependecies) to build the dashboard

```julia
julia> ] # Enter package manager
(@v 1.10) pkg> activate .
(UNSWOpenDay2024) pkg> instantiate
```

After this you should be able to open `create_db.jl` and build the dashboard.
