transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mips_pkg.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/reg.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/regbuf.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mips_multi.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mux_2.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mips_mem.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/breg.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/extsgn.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mux_4.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/alu_ctr.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/ulamips.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mux_3.vhd}
vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mips_control.vhd}

vcom -93 -work work {/home/jhosoume/unb/oac/multiciclo_projeto/mips_multi/mips_multi_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  mips_multi_tb

add wave *
view structure
view signals
run 5 ns
