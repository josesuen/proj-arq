-------------------------------------------------------------------------------
--
-- Title       : CacheController
-- Design      : FemtoMIPS
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Thomas\proj-arq\FemtoMIPS\src\CacheController.vhd
-- Generated   : Sun Jul  3 18:09:32 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {CacheController} architecture {CacheController}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CacheController is
	 port(
		 hitUC : in STD_LOGIC;
		 memRdy : in STD_LOGIC;
		 wren : out STD_LOGIC;  
		 clk: in STD_LOGIC
	     );
end CacheController;

--}} End of automatically maintained section

architecture CacheController of CacheController is
begin
	RamProc: process(clk) is	  
  	begin
	if rising_edge(clk) then
		if hitUC = '0' then
			wren <= memRdy;
		else
			wren <= '0';
		end if; 
	end if;		 										  
  	end process RamProc;		   		 
end CacheController;
