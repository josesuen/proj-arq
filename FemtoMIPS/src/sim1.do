#force -freeze {/FemtoMIPS/ALUop} 00
#force -freeze {/FemtoMIPS/ALUsrc} 1
#force -freeze {/FemtoMIPS/MemRead} 0
#force -freeze {/FemtoMIPS/MemWrite} 0
#force -freeze {/FemtoMIPS/MemtoReg} 0 0 ns, 1 72 ns, 0 82ns
force -freeze {/FemtoMIPS/PCreset} 1 0 ns, 0 1ns
#force -freeze {/FemtoMIPS/PCsrc} 0
#force -freeze {/FemtoMIPS/RegDst} 0
#force -freeze {/FemtoMIPS/RegWrite} 0 0 ns, 1 20 ns, 0 60ns
#force -freeze -r 10.000000 ns {/FemtoMIPS/clka} 1 0 ns, 0 5 ns
#force -freeze -r 5000.000000 ps {/FemtoMIPS/clkb} 1 0 ps, 0 2 ps
force -freeze {/FemtoMIPS/reset} 1 0 ns, 0 1ns
