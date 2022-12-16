vlog XMult.v
vlog MulXWithRegs.v
vlog MulXTB.v
vsim -gui work.MulXTB
add wave a
add wave b
add wave clk
add wave reset
add wave en
add wave passed
add wave failed
add wave overflowMulX
add wave -color #00eaff MulXResult
run 1100


