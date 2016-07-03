-------------------------------------------------------------------------------
--
-- Title       : DATA_TAG
-- Design      : FemtoMIPS
-- Author      : jose
-- Company     : suen
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\BubbaNote\Documents\GitHub\proj-arq\FemtoMIPS\src\DATA_TAG.vhd
-- Generated   : Sun Jul  3 17:59:12 2016
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
--{entity {DATA_TAG} architecture {DATA_TAG}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

entity DATA_TAG is	   
	generic(
    



    -- Define o tamanho (em bits) de uma palavra da memoria
    word_len : integer := 512

   
  );
	
	 port(
		 index : in STD_LOGIC_VECTOR(7 downto 0);
		 w0 : out STD_LOGIC_VECTOR(31 downto 0);
		 w1 : out STD_LOGIC_VECTOR(31 downto 0);
		 w2 : out STD_LOGIC_VECTOR(31 downto 0);
		 w3 : out STD_LOGIC_VECTOR(31 downto 0);
		 w5 : out STD_LOGIC_VECTOR(31 downto 0);
		 w4 : out STD_LOGIC_VECTOR(31 downto 0);
		 w6 : out STD_LOGIC_VECTOR(31 downto 0);
		 w7 : out STD_LOGIC_VECTOR(31 downto 0);
		 w8 : out STD_LOGIC_VECTOR(31 downto 0);
		 w9 : out STD_LOGIC_VECTOR(31 downto 0);
		 wA : out STD_LOGIC_VECTOR(31 downto 0);
		 wB : out STD_LOGIC_VECTOR(31 downto 0);
		 wC : out STD_LOGIC_VECTOR(31 downto 0);
		 wD : out STD_LOGIC_VECTOR(31 downto 0);
		 wE : out STD_LOGIC_VECTOR(31 downto 0);
		 wF : out STD_LOGIC_VECTOR(31 downto 0);
		 datain : in STD_LOGIC_VECTOR(511 downto 0);
		 
		 wren : in std_logic;
		 clk : in std_logic
	     );
end DATA_TAG;

--}} End of automatically maintained section

architecture DATA_TAG of DATA_TAG is  


  type data_type is array (0 to 2**(index'length) - 1) of std_logic_vector(word_len - 1 downto 0);
  signal data : data_type;
  signal read_address : std_logic_vector(index'range);


begin	
	
	  DataProc: process(clk) is

	  begin
		if rising_edge(clk) then
	      if wren = '1' then
	        data(to_integer(unsigned(index))) <= datain;
	      end if;
	      read_address <= index;
	    end if;	  
	  end process DataProc;
	  
	  wF <= data(to_integer(unsigned(read_address)))(511 downto 480);
	  wE <= data(to_integer(unsigned(read_address)))(479 downto 448);
	  wD <= data(to_integer(unsigned(read_address)))(447 downto 416);
	  wC <= data(to_integer(unsigned(read_address)))(415 downto 384);
	  wB <= data(to_integer(unsigned(read_address)))(383 downto 352);
	  wA <= data(to_integer(unsigned(read_address)))(351 downto 320);
	  w9 <= data(to_integer(unsigned(read_address)))(319 downto 288);
	  w8 <= data(to_integer(unsigned(read_address)))(287 downto 256);
	  w7 <= data(to_integer(unsigned(read_address)))(255 downto 224);
	  w6 <= data(to_integer(unsigned(read_address)))(223 downto 192);
	  w5 <= data(to_integer(unsigned(read_address)))(191 downto 160);
	  w4 <= data(to_integer(unsigned(read_address)))(159 downto 128);
	  w3 <= data(to_integer(unsigned(read_address)))(127 downto 96);
	  w2 <= data(to_integer(unsigned(read_address)))(95 downto 64);
	  w1 <= data(to_integer(unsigned(read_address)))(63 downto 32);
	  w0 <= data(to_integer(unsigned(read_address)))(31 downto 0);

									  

end DATA_TAG;
