vlog boothmultiplier.v
vlog boothmultiplierWithRegs.v
vlog boothmultiplierTB.v
vsim -gui work.boothmultiplierTB
add wave a
add wave b
add wave clk
add wave reset
add wave en
add wave passed
add wave failed
add wave -color #00eaff boothmultiplierResult
run 1100


