library ieee;
use ieee.std_logic_1164.all;
 
entity configurador_duracion is
  port (
    switch_2	:in	std_logic;
    switch_3	:in	std_logic;
	 i_minutos	:in	std_logic_vector(5 downto 0);
	 -- DURACION PROGRAMADA PARA CADA VALVULA
	 minutos_0   	:out	std_logic_vector(5 downto 0):="000000";
	 minutos_1   	:out	std_logic_vector(5 downto 0):="000000";
	 minutos_2   	:out	std_logic_vector(5 downto 0):="000000";
	 minutos_3   	:out	std_logic_vector(5 downto 0):="000000"
    );
end entity configurador_duracion;
 
architecture RTL of configurador_duracion is
begin
	process(switch_2,switch_3) begin
	if((switch_2='0') and (switch_3 = '0')) then
		minutos_3 	<= i_minutos;
	elsif((switch_2 = '1') and (switch_3 = '0')) then
		minutos_2 	<= i_minutos;
	elsif((switch_2 = '0') and	(switch_3 = '1')) then
		minutos_1 	<= i_minutos;
	else
		minutos_0 	<= i_minutos;
	end if;
	end process;
end architecture RTL;