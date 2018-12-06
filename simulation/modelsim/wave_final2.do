onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clock /mips_multi_tb/clk
add wave -noupdate -color Gray65 -label PC_Out -radix decimal /mips_multi_tb/i1/pc/sr_out
add wave -noupdate -label {IR Out} -radix hexadecimal /mips_multi_tb/i1/ir/sr_out
add wave -noupdate -label Current_State /mips_multi_tb/i1/ctr_mips/pstate
add wave -noupdate -label {Memory Address} -radix hexadecimal -childformat {{/mips_multi_tb/i1/mem/address(7) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(6) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(5) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(4) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(3) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(2) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(1) -radix hexadecimal} {/mips_multi_tb/i1/mem/address(0) -radix hexadecimal}} -subitemconfig {/mips_multi_tb/i1/mem/address(7) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(6) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(5) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(4) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(3) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(2) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(1) {-height 17 -radix hexadecimal} /mips_multi_tb/i1/mem/address(0) {-height 17 -radix hexadecimal}} /mips_multi_tb/i1/mem/address
add wave -noupdate -label {Memory Data Address} -radix hexadecimal /mips_multi_tb/i1/datadd_v
add wave -noupdate -label {Mem Out (q) MemData} -radix hexadecimal /mips_multi_tb/i1/mem/q
add wave -noupdate -label {Write Data Memory} -radix hexadecimal /mips_multi_tb/i1/mem/data
add wave -noupdate -label {RDM Out} -radix hexadecimal /mips_multi_tb/i1/rdm/sr_out
add wave -noupdate -color {Medium Orchid} -label RS -radix unsigned /mips_multi_tb/i1/rs_field_v
add wave -noupdate -color {Medium Orchid} -label RT -radix unsigned /mips_multi_tb/i1/rt_field_v
add wave -noupdate -color {Medium Orchid} -label RD -radix unsigned /mips_multi_tb/i1/rd_field_v
add wave -noupdate -label regA -radix decimal /mips_multi_tb/i1/bcoreg/regA
add wave -noupdate -label regB -radix decimal /mips_multi_tb/i1/bcoreg/regB
add wave -noupdate -label {A (aux reg)} -radix decimal /mips_multi_tb/i1/rgA/sr_out
add wave -noupdate -label {B (aux reg)} -radix decimal /mips_multi_tb/i1/rgB/sr_out
add wave -noupdate -label {Sign Extend} -radix hexadecimal /mips_multi_tb/i1/sgnx/output
add wave -noupdate -label ALU/AluOUt -radix decimal /mips_multi_tb/i1/alu/aluout
add wave -noupdate -label {Regitrador AluOUt} -radix hexadecimal /mips_multi_tb/i1/regULA/sr_out
add wave -noupdate -label Zero -radix binary /mips_multi_tb/i1/alu/zero
add wave -noupdate -color Blue -label {Mem Write (wren)} -radix binary /mips_multi_tb/i1/mem/wren
add wave -noupdate -color Blue -label {IRWrite (enable)} -radix binary /mips_multi_tb/i1/ir/enable
add wave -noupdate -color Blue -label {Reg Dest (Rt or Rd)} -radix binary /mips_multi_tb/i1/mux_reg_add/sel
add wave -noupdate -color Blue -label {MemToReg (MDR or AluOUt)} -radix binary /mips_multi_tb/i1/breg_data_mux/sel
add wave -noupdate -color Blue -label RegWrite -radix binary /mips_multi_tb/i1/bcoreg/enable
add wave -noupdate -color Blue -label {IorD(Mux Mem Sel)} -radix binary /mips_multi_tb/i1/mux_mem/sel
add wave -noupdate -color Blue -label selaluA -radix binary /mips_multi_tb/i1/mux_ulaA/sel
add wave -noupdate -color Blue -label selaluB -radix binary /mips_multi_tb/i1/mux_ulaB/sel
add wave -noupdate -color Blue -label ALUControl/op_alu -radix binary /mips_multi_tb/i1/actr/op_alu
add wave -noupdate -color Blue -label ALUControl/Funct -radix binary /mips_multi_tb/i1/actr/funct
add wave -noupdate -color Blue -label ALUControl/Alu_Ctr -radix octal /mips_multi_tb/i1/actr/alu_ctr
add wave -noupdate -color Blue -label ALU/AluControl -radix binary /mips_multi_tb/i1/alu/aluctl
add wave -noupdate -color Blue -label {PC Source} -radix binary /mips_multi_tb/i1/mux_pc/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {128 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 230
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {300 ps}
