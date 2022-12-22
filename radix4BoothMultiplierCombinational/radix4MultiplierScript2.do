vlog radix4Booth.v
vsim -gui work.radix4Booth
add wave -position insertpoint sim:/radix4Booth/*
force -freeze sim:/radix4Booth/a 1111111111111111111111111111111 0
force -freeze sim:/radix4Booth/b 10 0
force -freeze sim:/radix4Booth/reset 1 0
force -freeze sim:/radix4Booth/en 1 0
force -freeze sim:/radix4Booth/clk 0 0, 1 {50 ps} -r 100


