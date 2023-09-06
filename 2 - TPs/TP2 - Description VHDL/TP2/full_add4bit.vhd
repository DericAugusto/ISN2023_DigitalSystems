-- TP 2 - 13/03/2023
-- Déric, Michelle et Nada

entity full_add4bit is
  port(
  a0, a1, a2, a3, cin : in bit ;
  b0, b1, b2, b3 : in bit ;
  S0, s1, s2, s3 : out bit ; 
  Cout : out bit 
  );
end entity;

Architecture arch of full_add4bit is
  signal C0, C1, C2: bit;

  begin

  S0 <= cin xor (a0 xor b0);
  C0 <= (cin and a0) or (cin and b0) or (a0 and b0); 

  s1 <= C0 xor (a1 xor b1);
  C1 <= (C0 and a1) or (C0 and b1) or (a1 and b1); 

  s2 <= C1 xor (a2 xor b2);
  C2 <= (C1 and a2) or (C1 and b2) or (a2 and b2); 

  s3 <= C2 xor (a3 xor b3);
  Cout <= (C2 and a3) or (C2 and b3) or (a3 and b3); 

end arch;