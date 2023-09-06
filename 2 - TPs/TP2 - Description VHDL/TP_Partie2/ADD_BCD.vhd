-- TP 2 partie 2 - 13/03/2023
-- Déric, Michelle et Nada

-- Adicioneur avec résultat donée en BCD
--------------------------------------------------------------------------------
-- le code en question fait la somme entre les entrées binaires de 4 bits A et B
-- et donne comme sortie la somme résultant S et un retenue "Cout", mais pas en
-- binaire, mais en codage BCD. 

-- Comme example, si on fait la somme entre entre A = 0011 (3) et B = 0111 (7), 
-- on aura S = 0000 et Cout = 0001 (10 binaire). 
-- "Cout" c'est toujours = 0 ou 1, depuis qu'il  est le retenue.

-- dans cet cas, 10 en binaire est = 1010 (8+2), 
-- mais en BCD on aura 0001 0000 (1 0)
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ADD_BCD is
  port(
    A, B : IN std_logic_vector(3 downto 0); -- entrée (qui vont être sommés)
    Cin : IN std_logic; -- retenue d'entrée
    S : OUT std_logic_vector(3 downto 0); -- sortie
    Cout : OUT std_logic_vector(3 downto 0) -- retenue de sortie
  );
END ADD_BCD;

Architecture arch of ADD_BCD is
  signal resultat: std_logic_vector(7 downto 0); -- resultat de l'operation
  signal resultat_BCD: std_logic_vector(7 downto 0); -- résultat décimal dans la codage BCD
  begin

  -- calculant le resultat de la somme entre A et B
  -- le premier "0000" c'est juste pour expliciter que "resultat" est donée en 8 bits
  -- comme A et B sont des valeurs de 4 bits, on va concatener 4 bits 0s à A pour expliciter ça, avec l'operateur &
  resultat <= ("0000" & A) + B + Cin;

  -- dans la fenetre Process on utilise toujours des "signal"s pour iterer (faire des operations)
  Process (resultat) 
  begin

    -- on fait ici la convertion du resultat de la somme obtenue on BCD
    IF (resultat <= 9) then
      resultat_BCD <= resultat; 
    End if;

    IF ((10 <= resultat) and (resultat <= 19)) then
      resultat_BCD <= resultat + 6;
    End if;

    IF ((20 <= resultat) and (resultat <= 29)) then
      resultat_BCD<= resultat + 12;
    End if;

    IF ((30 <= resultat) and (resultat <= 31)) then
      resultat_BCD <= resultat + 18;
    End if;

  end Process;

  -- resultat = 0001 0000 (8 bits) 
  -- comme on a A et B de 4 bits, son valeur maximal va être 1111 (15 en décimal)
  -- alors le résultat maximal est 15 + 15 = 30 (0011 0000 en notation BCD)
  S <= resultat_BCD(3 downto 0); -- les trois premiers bits du résultat sont S
  Cout <= resultat_BCD(7 downto 4) ; -- les trois dernièrs vont au retenue
end arch;