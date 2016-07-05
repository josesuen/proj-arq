---------------------------------------
--
-- File        : c:\Users\Thomas\proj-arq\FemtoMIPS\src\RAM_TAG.vhd
-- Generated   : Sun Jul  3 16:48:30 2016
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
--{entity {RAM_TAG} architecture {RAM_TAG}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.Numeric_Std.all;

entity RAM_TAG is
	generic(		   
    Twrite : time := 5 ns;
    Tsetup : time := 2 ns;
    Tread : time := 1 ns
	);
	 port(
		 index : in STD_LOGIC_VECTOR(7 downto 0);
		 tag_in : in STD_LOGIC_VECTOR(1 downto 0);
		 wren : in std_logic;	
		 clk: in std_logic;
		 V : out STD_LOGIC;
		 tag_out : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end RAM_TAG;

--}} End of automatically maintained section

architecture RAM_TAG of RAM_TAG is	  
type ramInst is array(255 downto 0) of std_logic_vector(2 downto 0);
signal ramInst_out : ramInst;		
signal read_address : std_logic_vector(index'range);	  			   
begin
   	
	RamProc: process(clk) is	  
  	begin
    	if rising_edge(clk) then
     		if wren = '1' then
        		ramInst_out(to_integer(unsigned(index))) <= '1'&tag_in;
      		end if;	
			read_address <= index;											  		
    	end if;		 										  
  	end process RamProc;
  
	V <= ramInst_out(to_integer(unsigned(read_address)))(2) after Tread;
	tag_out <= ramInst_out(to_integer(unsigned(read_address)))(1 downto 0) after Tread;

end RAM_TAG;
