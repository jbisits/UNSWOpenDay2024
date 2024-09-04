### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ 15bb6500-b175-422d-b2a5-2b66aae0af41
begin
	using Pkg
	Pkg.activate(".")
end

# ╔═╡ 84e02c5a-a436-4ecf-bc05-5c23ffa32f1a
using HypertextLiteral, PlutoUI

# ╔═╡ 068fc5c9-2077-4ca4-ae7b-7a09cf0a012c
md"""
# Pluto notebook for dashboard display

I am hoping to create a dashboard using Pluto.jl featuring some animations and information about passive tracer flows.
"""

# ╔═╡ 84614b56-42e6-4ec0-9ca1-789d09911ddc
md"""
I have not been able to get these `Resource`s to appear in the notebook so instead i will use a `LocalResource`.
"""

# ╔═╡ eb2c5980-06b1-40c7-a092-0c2d15c576e9
md"""
# Layout

The layout order on the static dashboard depends on the cell order in this notebook.
To get the writing to go underneath the plots you have to move this cell to below the cell with the plots.
It may be that the description of the animations needs to go under the animations but for now can leave this as is.
"""

# ╔═╡ 6e661452-36f7-4261-9e1e-3e562fdbed0d
begin
	expl_cell_1 = PlutoRunner.currently_running_cell_id[] |> string
	#$(LocalResource(unsw_logo, :width => 60, :height => 60)) Simulating the ocean
	PlutoUI.ExperimentalLayout.vbox(
		[
			html"""
			<h1 align="center"> Bela edit here - title</h1>
			"""
			PlutoUI.ExperimentalLayout.hbox([
			md"""
			**Bela edit here text**
			
			Running experiments in the ocean is very expensive and labour intensive. To try and understand more about the physical processes in the ocean, simulations are often used.
			These range from simple simulations, such as the first the animations below, all the way to simulating the global circulation of the ocean as realistically as possible.

			The rotating tank showed how a dye spreads out in various flows.
			We can use the advection-diffusion (or move around-spread out) equation to simulate what happens to a concentration field (like a dye) in different flow fields.

			For more information about our group visit the [Climate data and dynamics lab website](https://climate-data-dynamics.github.io/climate-data-dynamics-lab-website/).
			""",
			#Need the newline for the zoomed in version of the presentation
			md"""\
			
			This dashboard and the simulations that produced the animations can be found at `https://github.com/jbisits/UNSWOpenDay2024`.
			"""
			#Add this when you want to add the animation $(local_sst)
			],
			style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "5em"))
		],
		style=Dict("background" => "border-radius" => "50px", "padding" => "20px", "margin" => "20px"))
end

# ╔═╡ 3a22c38a-f530-487a-ba6f-1e9faeca6f36
md"""
# Images as `LocalResource`

Thus far cannot make the `Resource` work.
Not sure if this is a GitHub issue to do with how the files are saved or just have the address wrong.
"""

# ╔═╡ 171d64c3-caf0-4425-ac65-ff034770d920
path_to_anims = joinpath(pwd(), "animations")

# ╔═╡ f37333ef-5b7d-4e4a-922d-32298fd05c35
begin
	# sst = joinpath(path_to_anims, "filename.mp4")
	dc = joinpath(path_to_anims, "diffusive_convection.mp4")
	convection = joinpath(path_to_anims, "convection.mp4")
	convection_tracers = joinpath(path_to_anims, "tracers_convection.mp4")
	unsw_logo = joinpath(path_to_anims, "logo.png")
end

# ╔═╡ c2ea0a8a-b024-42b5-9ead-91c6b43eeb31
# begin
# 	sst_cell = PlutoRunner.currently_running_cell_id[] |> string
# 	local_sst = LocalResource(sst, :autoplay => "", :loop => "", :width => 800, :height => 600)
# end

# ╔═╡ 61b91bdf-ead5-4aa1-a4d5-1e1cda8c50cd
begin
	dc_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_dc = LocalResource(dc, :autoplay => "", :loop => "", :width => 800, :height => 600)
end

# ╔═╡ bdcfcd1b-6973-4c41-b1d5-08a2ec877e46
begin
	convection_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_convection = LocalResource(convection, :autoplay => "", :loop => "", :width => 800, :height => 600)
end

# ╔═╡ 46039523-887d-4df6-9be7-170c929fcf72
begin
	convection_tracers_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_convection_tracers = LocalResource(convection_tracers, :autoplay => "", :loop => "", :width => 800, :height => 600)
end

# ╔═╡ f9594b4f-37f9-4741-887c-901873c7e4be
begin
	expl_cell_2 = PlutoRunner.currently_running_cell_id[] |> string
	PlutoUI.ExperimentalLayout.vbox(
		[
			PlutoUI.ExperimentalLayout.hbox([
				md""" 
				## Vertical transport of salinity and temperature 
				## Convection
				The vertical transport of heat into the ocean is **relatively slow** compared to the lateral transport.
				The exception to this is *convective mixing*.
				
				Convection occurs when dense water forms atop lighter water.
				This creates a gravitational instability leading to the dense water sinking very rapidly through lighter waters.

				The simulation below shows an example of convection.
				We start with dense water over light water and see very vigorous vertical mixing until the density is approximately uniform over the domain.
				$(local_convection)

				Our model setup means that no heat or salt enter or escape our domain (for those interested this is because our boundary conditions are horizontally periodic and zero flux vertically).
				Looking at the salinity and temperature, which determine the density, we can see that the mixing occurs until these tracers are homogeneous over the domain
				$(local_convection_tracers)
				""",
				##
				md""" ## Other convective instabilities
				Due to the differing rates of molecular diffusion between heat and salt (salt is around 100 times slower in the ocean), convective type instabilities are able to form in profiles that are overall gravitationally stable but *unstable* in either salinity or temperature.

				### Salt fingering
				When salinity is acting to destratify the water column we see an instability known as *salt fingers* form.
				As the animation below shows this leads to fingers of warm salty water intruding into the denser water below.
				
				### Diffusive convection
				When temperature is acting to destratify the water column *diffusive convection occurs*.
				In this situation we often see *thermohaline staircases* form where well mixed layers are seperated by very sharp changes in density.
				$(local_dc)
				"""],
			style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "5em"))
		],
		style=Dict("background" => "border-radius" => "50px", "padding" => "20px", "margin" => "20px"))
end

# ╔═╡ 3f51870b-c4b7-405a-9e1e-f35dd70aac8f
md"""
# Create the dashboard from the cells
"""

# ╔═╡ 88abdf87-52ec-4141-8fb6-3170d46e77ee
begin
	plot_cell = PlutoRunner.currently_running_cell_id[] |> string
	PlutoUI.ExperimentalLayout.vbox(
		[
			PlutoUI.ExperimentalLayout.hbox([dc_cell],
			style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "5em"))
		],
		style=Dict("background" => "border-radius" => "50px", "padding" => "20px", "margin" => "20px"))
end

# ╔═╡ fe3e08f8-3dd0-4ebe-a1e7-7ec063222aba
cells = [expl_cell_1, expl_cell_2]

# ╔═╡ 092a445d-7ece-4eb5-844b-c6032e6e4c09
notebook = PlutoRunner.notebook_id[] |> string

# ╔═╡ f4a2dbcf-e134-4530-b464-d1dc38236e53
dash_final_url = "http://localhost:1234/edit?" * "id=$notebook&" * join(["isolated_cell_id=$cell" for cell ∈ cells], "&")

# ╔═╡ 8f410075-033a-4cdf-827e-3e89d4db3762
@htl("""<a href="$dash_final_url" style="font-size: 30px">Click here to get to the dashboard!</a>""")

# ╔═╡ Cell order:
# ╟─068fc5c9-2077-4ca4-ae7b-7a09cf0a012c
# ╟─15bb6500-b175-422d-b2a5-2b66aae0af41
# ╠═84e02c5a-a436-4ecf-bc05-5c23ffa32f1a
# ╟─84614b56-42e6-4ec0-9ca1-789d09911ddc
# ╟─eb2c5980-06b1-40c7-a092-0c2d15c576e9
# ╠═6e661452-36f7-4261-9e1e-3e562fdbed0d
# ╠═f9594b4f-37f9-4741-887c-901873c7e4be
# ╟─3a22c38a-f530-487a-ba6f-1e9faeca6f36
# ╠═171d64c3-caf0-4425-ac65-ff034770d920
# ╠═f37333ef-5b7d-4e4a-922d-32298fd05c35
# ╠═c2ea0a8a-b024-42b5-9ead-91c6b43eeb31
# ╠═61b91bdf-ead5-4aa1-a4d5-1e1cda8c50cd
# ╠═bdcfcd1b-6973-4c41-b1d5-08a2ec877e46
# ╠═46039523-887d-4df6-9be7-170c929fcf72
# ╟─3f51870b-c4b7-405a-9e1e-f35dd70aac8f
# ╠═88abdf87-52ec-4141-8fb6-3170d46e77ee
# ╠═fe3e08f8-3dd0-4ebe-a1e7-7ec063222aba
# ╠═092a445d-7ece-4eb5-844b-c6032e6e4c09
# ╠═f4a2dbcf-e134-4530-b464-d1dc38236e53
# ╠═8f410075-033a-4cdf-827e-3e89d4db3762
