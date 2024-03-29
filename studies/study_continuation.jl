println("--- Continuation: ---")

Re_start = 100
p.params.Re = Re_start
steps = 140
h = 1
Ψi = 1e-3 * abs.(randn((n + 1), (n + 1)))

println("Calculate unstable solution at Re_start = $Re_start:")
Ψt = @time CF.timestepping(Ψi, p, h, steps, verbose = true)
Ψs, iter, tol = CF.steadystate(Ψt, p)


ΔRe = 1
steps = 840

println("Arclength continuation, ΔRe = $ΔRe, steps = $steps:")
@time CF.continuation_arclength(foldercont, Ψs, p, Re_start, ΔRe, steps)
