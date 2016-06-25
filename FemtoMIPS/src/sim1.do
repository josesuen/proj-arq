force -freeze {/FemtoMIPS/ALUop} 00
force -freeze {/FemtoMIPS/ALUsrc} 1
force -freeze {/FemtoMIPS/MemRead} 0
force -freeze {/FemtoMIPS/MemWrite} 0
force -freeze {/FemtoMIPS/MemtoReg} 0 0 ns, 1 72 ns, 0 82ns
force -freeze {/FemtoMIPS/PCce} 1
force -freeze {/FemtoMIPS/PCreset} 1 0 ns, 0 10ns
force -freeze {/FemtoMIPS/PCsrc} 0
force -freeze {/FemtoMIPS/RegDst} 0
force -freeze {/FemtoMIPS/RegWrite} 0 0 ns, 1 20 ns, 0 60ns
#force -freeze {/FemtoMIPS/clka} 0 0 ns, 1 5ns -r 10ns
#force -freeze {/FemtoMIPS/clkb} 0 0 ps, 1 2ps -r 5ns
force -freeze {/FemtoMIPS/reset} 1 0 ns, 0 10ns
