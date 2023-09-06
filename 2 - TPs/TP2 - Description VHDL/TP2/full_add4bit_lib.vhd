library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
Entity full_add4bit_lib is
port(
cin: in std_logic;
A, B: in std_logic_vector(3 downto 0);
s: out std_logic_vector(3 downto 0);
cout: out std_logic
 ); 
end entity;

architecture arch of full_add4bit_lib is
signal resultat: std_logic_vector(4 downto 0);
begin
resultat <= ('0' & A)+ B +cin;
s <= resultat(3 downto 0);
cout <= resultat(4); 
end arch;