library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_valvulas is
    Port ( 
	 
				
			  -- tiempo real
			  rt_hora	: in	std_logic_vector(5 downto 0);
			  rt_minuto	: in	std_logic_vector(5 downto 0);
			  -- hora programada de cada valvula
			  hora_0		: in  std_logic_vector(5 downto 0);
			  minuto_0	: in std_logic_vector(5 downto 0);
			  -- duracion del tiempo de riego
			  dur_v		: in std_logic_vector(5 downto 0);
			  --condicion
				condicion : in std_logic;
			  -- Valvulas
           Valvula	: out std_logic
	 );
end control_valvulas;

architecture control_arch of control_valvulas is

signal hora_minutos_real	: std_logic_vector(11 downto 0):= "000000000000";
signal hora_minutos_prog	: std_logic_Vector(11 downto 0):= "000000000000";
signal hora_minutos_finl	: std_logic_Vector(11 downto 0):= "000000000000";
begin
	hora_minutos_real(5 downto 0)		<= rt_minuto;
	hora_minutos_real(11 downto 6)	<= rt_hora;
	
	hora_minutos_prog(5 downto 0) 	<= minuto_0;
	hora_minutos_prog(11 downto 6) 	<= hora_0;
	-- Hora final
	hora_minutos_finl <= hora_minutos_prog + dur_v;
	-- Process
	process(hora_minutos_real,hora_minutos_prog,hora_minutos_finl)	-- Lista de sensibilidad
		begin
		if ((hora_minutos_real>=hora_minutos_prog) and (hora_minutos_real<hora_minutos_finl)and (condicion='1')) then 
			valvula <= '1';
		else
			valvula <= '0';
		end if;
	end process;
end control_arch;