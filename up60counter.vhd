library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.numeric_std.ALL;

entity up60counter is
	 generic(
			  truncado	: std_logic_vector(0 to 5) := "111100"; --El contador llegara hasta 60
			  inicial	: std_logic_vector(0 to 5) := "000000" --ESTADO INCIAL DEL CONTADOR
	 );
    Port ( clk,rst 	: in	std_logic;
           o			: out std_logic_vector(0 to 5)
	 );
end up60counter;

architecture count_arch of up60counter is

signal count : std_logic_vector(0 to 5):=inicial;	--Registro del valor de salida

begin
	process(rst,clk,count)									-- Lista de sensibilidad
		begin
		if ((rst = '1')or(count = truncado)) then 
			count <= "000000";
		elsif (clk'event and clk = '1') then 
			count <= count + 1;
		end if;
	end process;
	
o <= count;

end count_arch;