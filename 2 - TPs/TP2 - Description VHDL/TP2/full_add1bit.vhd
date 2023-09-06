-- TP 2 - 13/03/2023
-- Déric, Michelle et Nada

entity full_add1bit is
  port(
  A, B, Cin: in bit; -- entrées A, B et retenue d'entrée Cin
  S, Cout: out bit --ici pas de virgule (dernier port)
  );
end entity;

Architecture arch of full_add1bit is
  begin
  -- si l'un seule des élements est égal à 1, S = 1
  -- dans le cas où A = B = Cin = 1, on aura s <= ( 1 xor (0) ) = 1
  S <= Cin xor (A xor B); 
  Cout <= (Cin and A) or (Cin and B) or (A and B); -- s'il y a plus que deux elements = 1, Cout = 1
end arch;