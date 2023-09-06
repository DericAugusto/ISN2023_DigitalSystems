-- TP 2 partie 2 - 13/03/2023
-- Déric, Michelle et Nada

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ADD_BCD is
port(
A, B : IN std_logic_vector(3 downto 0);
Cin : IN std_logic;
S : OUT std_logic_vector(3 downto 0);
Cout : OUT std_logic_vector(3 downto 0)
 );
END ADD_BCD;
Architecture arch of ADD_BCD is
signal resultat: std_logic_vector(7 downto 0);
signal resultat_BCD: std_logic_vector(7 downto 0);
begin

resultat <= ("0000" & A)+ B + Cin;

Process (resultat)
begin

IF (resultat<=9) then
resultat_BCD <= resultat;
End if;

IF ((10<=resultat) and (resultat<=19)) then
resultat_BCD <= resultat + 6;
End if;

IF ((20<=resultat) and (resultat<=29)) then
resultat_BCD<= resultat + 12;
End if;

IF ((30<=resultat) and (resultat<=31)) then
resultat_BCD<= resultat + 18;
End if;


end Process;
S <= resultat_BCD(3 downto 0);
Cout <= resultat_BCD(7 downto 4) ; 
end arch;