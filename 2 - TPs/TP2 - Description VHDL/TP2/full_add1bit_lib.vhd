-- TP 2 - 13/03/2023
-- Déric, Michelle et Nada

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity full_add1bit_lib is
  port(
  A, B, Cin: in std_logic; -- entrées A, B et retenue d'entrée Cin
  S, Cout: out std_logic -- sortie S et retenue de sortie Cout
  );
end entity;

architecture arch of full_add1bit_lib is
  signal resultat: std_logic_vector(1 downto 0); -- résultat de deux bits

  begin
    
  --resultat <= ('0' & A) + ('0' & B) + ('0' & Cin);
  resultat <= ('0' & A) + B + Cin; -- & est une concatenation

  S <= resultat(0); -- le premier bit de résultat 
  Cout <= resultat(1); -- le deuxième bit de résultat
end arch;