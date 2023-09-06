-- TP 2 - 13/03/2023
-- Déric, Michelle et Nada

library ieee;
use ieee.std_logic_1164.all;

entity full_add4bit_comp is
	port (A, B : in std_logic_vector(3 downto 0); -- entrées
			Cin : in std_logic; -- retenue d'entrée
			S   : out std_logic_vector(3 downto 0); -- sortie
			Cout : out std_logic); -- retenue de sortie
end full_add4bit_comp ;

architecture rtl of full_add4bit_comp is
	component full_add1bit is
		port (A, B   : in std_logic;
				Cin : in std_logic;
				S   : out std_logic;
				Cout : out std_logic);
	end component;

	signal c : std_logic_vector(3 downto 0);
	signal sum : std_logic_vector(4 downto 0);

	begin

	INST1: full_add1bit port map (A(0), B(0), Cin, sum(0), c(0));
	INST2: full_add1bit  port map (A(1), B(1), c(0), sum(1), c(1));
	INST3: full_add1bit  port map (A(2), B(2), c(1), sum(2), c(2));
	INST4: full_add1bit port map (A(3), B(3), c(2), sum(3), c(3));

	S <= sum(3 downto 0);
	Cout <= c(3);

end rtl;