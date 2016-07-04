-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : FemtoMIPS
-- Author      : gabriel.casarin@hotmail.com
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\gabri\Documents\GitHub\proj-arq\FemtoMIPS\compile\UC.vhd
-- Generated   : Tue Jun 21 11:11:41 2016
-- From        : c:\Users\gabri\Documents\GitHub\proj-arq\FemtoMIPS\src\UC.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity UC is
  port(
       clk : in STD_LOGIC;
       opcode : in STD_LOGIC_VECTOR(5 downto 0);
       ALUop : out STD_LOGIC_VECTOR(1 downto 0)
  );
end UC;

architecture UC of UC is

begin

---- Processes ----

Decodificacao :
process (opcode, clk)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements
if clk'event and clk='1' then
	case opcode is
		-- instrucoes do tipo R
		when "000000" =>
			ALUop <= "10";

		-- instrucoes do tipo I
		when "001000" => -- addi
			ALUop <= "00";
		when "001010" => -- slti
			ALUop <= "01";
		when "101011" => -- sw
			ALUop <= "00";
		when "100011" => -- lw
			ALUop <= "00";
		when "000100" => -- beq
			ALUop <= "01";

		
		-- instrucoes do tipo J
		when "000010" => -- jump
			ALUop <= "11";
		when "000101" => --	bne	
			ALUop <= "01";
		when "000011" => -- jal
			ALUop <= "11";
		
		when others => Null;
	end case;
end if;
end process Decodificacao;



end UC;
