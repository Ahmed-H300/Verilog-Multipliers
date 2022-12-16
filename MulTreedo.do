vlog MulTree.v
vlog MulTreeWithRegs.v
vlog MulTreeTB.v
vsim -gui work.MulTreeTB
add wave a
add wave b
add wave clk
add wave reset
add wave en
add wave passed
add wave failed
add wave overflowMulTree
add wave -color #00eaff MulTreeResult
run 1100


