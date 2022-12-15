vlog sequentialmultiplier.v
vlog sequentialmultiplierWithRegs.v
vlog sequentialmultiplierTB.v
vsim -gui work.sequentialmultiplierTB
add wave a
add wave b
add wave clk
add wave reset
add wave en
add wave passed
add wave failed
add wave overflowsequentialmultiplier
add wave -color #00eaff sequentialmultiplierResult
run 1100


