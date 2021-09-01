

library ieee;
use ieee.std_logic_1164.all;

entity MSS is

	port(
		clk		 		: in	std_logic;							-- Clock 50Mhz
		start	 			: in	std_logic;							-- Start del sistema
		reset	 			: in	std_logic;							-- Reset al estado inicial
		siguiente		: in	std_logic;							-- Configuracion -> Duracion
		minuto			: in	std_logic;							-- Boton minuto
		hora				: in	std_logic;							-- Boton hora
		switch_1			: in	std_logic;							-- Configuracion hora actual / hora de riego
		switch_2			: in	std_logic;							-- Configuaracion de valvula
		switch_3			: in	std_logic;							-- Configuaracion de valvula
		configuracion	: out std_logic;							-- Salida para configuracion de la hora
		duracion			: out std_logic;							-- Salida para configuracion de la duracion 
		En_cnt			: out std_logic;							-- Enables que no usamos en el proyecto
		Rst_cnt			: out std_logic;							-- Reset del contador
		
		
		
		
		estados	 		: out	std_logic_vector(2 downto 0)	-- Salida para verificar el estado de la MSS
		
		
		
	);
	
end entity;

architecture secuential of MSS is

	-- ESTADOS
	type state_type is (s0, s1, s2, s3, s4, s5 ,s6);
	
	-- REGISTRO:  MEMORIA DE ESTADOS
	signal state   : state_type;

begin
	-- LOGICA SECUENCIAL
	DECODIFICADOR_ESTADO_SIGUIENTE: process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if start = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if start = '0' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>
					if switch_1 = '1' then
						state <= s3;
					else
						state <= s2;
					end if;
				when s3 =>
					if siguiente = '1' then
						state <= s4;
					else
						state <= s3;
					end if;
				when s4 =>
					if siguiente = '0' then
						state <= s5;
					else
						state <= s4;
					end if;
				when s5 =>
					if siguiente = '1' then
						state <= s6;
					else
						state <= s5;
					end if;
				when s6 =>
					if siguiente = '0' then
						state <= s0;
					else
						state <= s6;
					end if;
			end case;
		end if;
	end process;
	
	-- SALIDA POR ESTADO
	DECODIFICADOR_SALIDA: process (state)
	begin
	
		case state is
			when s0 =>
				duracion			<= '0';
				configuracion	<= '0';
				estados 			<= "000";
			when s1 =>
				duracion			<= '0';
				configuracion	<= '0';
				estados			<= "001";
			when s2 =>
				duracion			<= '0';
				configuracion	<= '0';
				estados 			<= "010";
			when s3 =>
				duracion			<= '0';
				configuracion 	<= '1';
				estados 			<= "011";
			when s4 =>
				duracion			<= '0';
				configuracion	<= '0';
				estados 			<= "100";
			when s5 =>
				duracion			<= '1';
				configuracion	<= '0';
				estados 			<= "101";
			when s6 =>
				duracion			<= '0';
				configuracion	<= '0';
				estados 			<= "110";
		end case;
	end process;
	
end secuential;