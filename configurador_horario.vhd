library ieee;
use ieee.std_logic_1164.all;
 
entity configurador_horario is
  port (
    switch_2	:in	std_logic;
    switch_3	:in	std_logic;
	 i_hora		:in	std_logic_vector(5 downto 0);
	 i_minutos	:in	std_logic_vector(5 downto 0);
	 -- HORA PROGRAMADA PARA CADA VALVULA
    hora_0   	:out	std_logic_vector(5 downto 0);
	 hora_1   	:out	std_logic_vector(5 downto 0);
	 hora_2   	:out	std_logic_vector(5 downto 0);
	 hora_3   	:out	std_logic_vector(5 downto 0);
	 -- MINUTOS PROGRAMADOS PARA CADA VALVULA
	 minutos_0   	:out	std_logic_vector(5 downto 0);
	 minutos_1   	:out	std_logic_vector(5 downto 0);
	 minutos_2   	:out	std_logic_vector(5 downto 0);
	 minutos_3   	:out	std_logic_vector(5 downto 0)
    );
end entity configurador_horario;
 
architecture RTL of configurador_horario is
signal hr0,hr1,hr2,hr3: std_logic_vector(5 downto 0):="000000";
signal mn0,mn1,mn2,mn3: std_logic_vector(5 downto 0):="000000";
begin
	process(switch_2,switch_3) begin
	if((switch_2='0') and (switch_3 = '0')) then
		hr0 	<= i_hora;
		mn0 	<= i_minutos;
	elsif((switch_2 = '1') and (switch_3 = '0')) then
		hr1 	<= i_hora;
		mn1 	<= i_minutos;
	elsif((switch_2 = '0') and	(switch_3 = '1')) then
		hr2 	<= i_hora;
		mn2 	<= i_minutos;
	else
		hr3 	<= i_hora;
		mn3 	<= i_minutos;
	end if;
	end process;
hora_0 		<= hr3;
minutos_0 	<= mn3;
hora_1 		<= hr2;
minutos_1 	<= mn2;
hora_2 		<= hr1;
minutos_2 	<= mn1;
hora_3 		<= hr0;
minutos_3 	<= mn0;
end architecture RTL;