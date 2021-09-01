library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity cd_minutos is
	-- Declaracion de constantes
	-- Nos permite reutilizar el componente con pequenos cambios
	generic(
		medio_ciclo		: integer := 10							-- Deberia ser 25000000 (50MHz/2)
	);
	-- Declaracion de entradas y saldas del componente
	port (
		clk,reset		: in std_logic;							-- Reloj y reset del sistema		
		clock_1hz		: out std_logic							-- Salida 1Hz
		
	);
end cd_minutos;
  
architecture bhv of cd_minutos is
-- cada 2500 flancos positivos
-- el divisor de reloj invirte
-- la salida generando una senal
-- me menor frecuencia
signal count: integer range 0 to medio_ciclo := 0;			-- Registro interno para realizar el conteo
signal tmp 	: std_logic := '0';									-- Registro de sostenimiento del clock_out
  
begin
  
	conteno_inversion: process(clk,reset)
	begin
		if(reset='1') then
			count<=0;
			tmp<='0';
		elsif(clk'event and clk='1') then
			count <=count+1;
				if (count = medio_ciclo) then		-- el numero deberia ser 25000000
					tmp <= NOT tmp;					-- Pero para reducir el tiempo de simulacion utilizaremos
					count <= 1;							-- 2500 sin embargo el efecto es el mismo
				end if;
		end if;
		clock_1hz <= tmp;
	end process;
  
end bhv;
