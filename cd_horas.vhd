library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity cd_horas is
	-- Declaracion de constantes
	-- Nos permite reutilizar el componente con pequenos cambios
	generic(
		medio_ciclo		: integer := 30							-- cada 30 segundos
	);
	-- Declaracion de entradas y saldas del componente
	port (
		clk_1hz,reset	: in std_logic;							-- Reloj y reset del sistema		
		clock_0016hz	: out std_logic							
		
	);
end cd_horas;
  
architecture bhv of cd_horas is
-- cada 30 flancos positivos
-- el divisor de reloj invirte
-- la salida generando una senal
-- me menor frecuencia
signal count: integer range 0 to medio_ciclo := 0;			-- Registro interno para realizar el conteo
signal tmp 	: std_logic := '1';									-- Registro de sostenimiento del clock_out
  
begin
  
	conteno_inversion: process(clk_1hz,reset)
	begin
		if(reset='1') then
			count<=0;
			tmp<='1';
		elsif(clk_1hz'event and clk_1hz='1') then
			count <=count+1;
				if (count = medio_ciclo) then		
					tmp <= NOT tmp;					
					count <= 1;							
				end if;
		end if;
		clock_0016hz <= tmp;
	end process;
  
end bhv;
