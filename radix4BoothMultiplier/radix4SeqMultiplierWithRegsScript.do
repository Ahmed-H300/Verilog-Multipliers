vlog radix4BoothWithRegs.v
vsim -gui work.radix4BoothWithRegs
add wave -position insertpoint sim:/radix4BoothWithRegs/*
force -freeze sim:/radix4BoothWithRegs/inputA 10 0
force -freeze sim:/radix4BoothWithRegs/inputB 100 0
force -freeze sim:/radix4BoothWithRegs/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/radix4BoothWithRegs/en 1 0
force -freeze sim:/radix4BoothWithRegs/reset 1 0


