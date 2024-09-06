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
	sst = joinpath(path_to_anims, "sst_animation.mp4")
	dc = joinpath(path_to_anims, "diffusive_convection.mp4")
	convection = joinpath(path_to_anims, "convection.mp4")
	convection_tracers = joinpath(path_to_anims, "tracers_convection.mp4")
	cabbeling = joinpath(path_to_anims, "cabbeling.mp4")
end

# ╔═╡ c2ea0a8a-b024-42b5-9ead-91c6b43eeb31
begin
	sst_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_sst = LocalResource(sst, :autoplay => "", :loop => "", :width => 1500, :height => 500)
end

# ╔═╡ 6e661452-36f7-4261-9e1e-3e562fdbed0d
begin
	intro_and_sst_cell = PlutoRunner.currently_running_cell_id[] |> string
	#$(LocalResource(unsw_logo, :width => 60, :height => 60)) Simulating the ocean
	PlutoUI.ExperimentalLayout.vbox(
		[
			html"""
			<h1 align="center", style="font-size: 80px"> Ocean uptake and trasport of heat</h1>
			"""
			PlutoUI.ExperimentalLayout.hbox([
					PlutoUI.ExperimentalLayout.vbox([
			md"""
			
			The ocean absorbs more than 90% of the Earth’s excess heat due to human-made global warming. Understanding how this heat is distributed globally is vital for assessing long-term impacts such as sea-level rise, marine heat waves, and potential shifts in large-scale ocean circulation patterns. Here we show examples of how this heat is distributed globally and explore the critical role of vertical mixing.
			
			Surface waters of the ocean carry the majority of the Earth’s heat budget, making sea surface temperature (SST) a valuable indicator of how heat is distributed around the globe. Most solar energy is absorbed around the equator, warming tropical waters, which are then redistributed through atmospheric and oceanic circulation.
			
			For more information about our group visit the [Climate data and dynamics lab website](https://climate-data-dynamics.github.io/climate-data-dynamics-lab-website/).
			This dashboard and the simulations that produced the animations can be found at `https://github.com/jbisits/UNSWOpenDay2024`.
			"""], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "em"))
				PlutoUI.ExperimentalLayout.vbox([	
			local_sst], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "1em"))
			],
			style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "5em"))
		],
		style=Dict("background" => "border-radius" => "50px", "padding" => "20px", "margin" => "20px", "font-size" => "45px"))
end

# ╔═╡ 61b91bdf-ead5-4aa1-a4d5-1e1cda8c50cd
begin
	dc_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_dc = LocalResource(dc, :autoplay => "", :loop => "", :width => 1000, :height => 500)
end

# ╔═╡ bdcfcd1b-6973-4c41-b1d5-08a2ec877e46
begin
	convection_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_convection = LocalResource(convection, :autoplay => "", :loop => "", :width => 1000, :height => 600)
end

# ╔═╡ 46039523-887d-4df6-9be7-170c929fcf72
begin
	convection_tracers_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_convection_tracers = LocalResource(convection_tracers, :autoplay => "", :loop => "", :width => 1000, :height => 1000)
end

# ╔═╡ 981b3dc4-f4d7-4466-a0ff-18d1d4938c24
begin
	cabbeling_cell = PlutoRunner.currently_running_cell_id[] |> string
	local_cabbeling = LocalResource(cabbeling, :autoplay => "", :loop => "", :width => 1000, :height => 500)
end

# ╔═╡ f9594b4f-37f9-4741-887c-901873c7e4be
begin
	convection_cell_explantation = PlutoRunner.currently_running_cell_id[] |> string
	PlutoUI.ExperimentalLayout.vbox([
			# html"""
			# <h1 align="center"> Vertical transport of salinity and temperature</h1>
			# """
			PlutoUI.ExperimentalLayout.hbox([
					PlutoUI.ExperimentalLayout.vbox([
					html"""
					<h1 align="center", style="font-size: 60px"> Convection</h1>
					""",
							PlutoUI.ExperimentalLayout.hbox([
					md""" 
				In the ocean, the vertical transport of heat and other biogeochemical tracers is **relatively slow** compared to the lateral transport.
				The exception to this is *convective mixing*.
				
				Convection occurs when dense water forms atop lighter water.
				This creates a gravitational instability leading to the dense water sinking very rapidly through lighter waters.
				This process is important near the surface of the ocean where temperature is taken in by the ocean, consequently modulating the local density. 

				The simulation to the right shows an example of convection.
				We start with dense water over light water and see very vigorous vertical mixing until the density is approximately uniform over the domain.""",
						
				local_convection], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "1em")),
							PlutoUI.ExperimentalLayout.hbox([
					local_convection_tracers,
					md"""
					Our model setup means that no heat or salt enter or escape our domain (for those interested this is because our boundary conditions are horizontally periodic and zero flux vertically).
					Looking at the salinity and temperature, which determine the density, we can see that the mixing occurs until these tracers are homogeneous over the domain.
					"""], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "1em"))
					]),
				
					PlutoUI.ExperimentalLayout.vbox([
					html"""
					<h1 align="center", style="font-size: 60px"> Other convective instabilities</h1>
					""",
				md"""
				Due to the differing rates at which heat and salt are diffused (salt is around 100 times slower in the ocean), or the non-linear dependence of seawater density on salinity and temperature, convective instabilities are able to form in profiles that are overall gravitationally stable.

				Below we look at two instabilities that can form when less dense relatively cold/fresh water sits atop desnser warmer/saltier water.
				In this case temperature is weakening the stability but salinity compensates to maintain overall gravitational stability.
				This scenario is common in the polar oceans where there intense cooling at the sea surface during winter causing the surface water to approach freezing.
				# """,
				html"""
				<h1 align="left", style="font-size: 50px"> Diffusive convection</h1>
				""",
						PlutoUI.ExperimentalLayout.hbox([
				md"""
				When temperature is weakening the stability of a water column, and there are no external sources of mixing or turbulence, *diffusive convection* occurs.
				In this situation we often see *thermohaline staircases* form where well mixed layers are seperated by very sharp changes in density.
				These staircases have been well observed in the Artic and increase the rate at which heat is transported vertically.
				""",
				local_dc], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "0em")),
				html"""
				<h1 align="left", style="font-size: 50px"> Cabbbeling induced instability</h1>
				""",
						PlutoUI.ExperimentalLayout.hbox([
				local_cabbeling,
				md"""
				Non-linearities in the equation of state for seawater density lead to non-linear processes.
				One such process is cabbeling whereby the mixture of two water parcels with equal density, but with differing salinity and temperature, is *denser* than the parent water parcels.
				This process means that a water column can be gravitataionlly stable but if mixed an instability forms triggering convection.
				This is what we see in the simulation below.
				For more information on this work see the research poster ''Cabbeling's influence on mixing in Direct Numerical Simulations''.
				"""], style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "0em"))
					],style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "1.5em"))
			],
			style=Dict("justify-content" => "center", "align-items" => "center", "gap" => "5em"))
		],
		style=Dict("justify-content" => "center", "background" => "border-radius" => "50px", "padding" => "20px", "margin" => "20px", "font-size" => "45px"))
end

# ╔═╡ 3f51870b-c4b7-405a-9e1e-f35dd70aac8f
md"""
# Create the dashboard from the cells
"""

# ╔═╡ fe3e08f8-3dd0-4ebe-a1e7-7ec063222aba
cells = [intro_and_sst_cell, convection_cell_explantation]

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
# ╠═981b3dc4-f4d7-4466-a0ff-18d1d4938c24
# ╟─3f51870b-c4b7-405a-9e1e-f35dd70aac8f
# ╠═fe3e08f8-3dd0-4ebe-a1e7-7ec063222aba
# ╠═092a445d-7ece-4eb5-844b-c6032e6e4c09
# ╠═f4a2dbcf-e134-4530-b464-d1dc38236e53
# ╠═8f410075-033a-4cdf-827e-3e89d4db3762
