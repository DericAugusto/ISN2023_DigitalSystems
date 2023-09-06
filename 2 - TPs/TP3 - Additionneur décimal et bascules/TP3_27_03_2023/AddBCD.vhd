Library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity dec_7seg is
  port(
    A: in std_logic_vector (3 downto 0);
    VSeg: out std_logic_vector (6 downto 0)
  );
end entity;

Architecture arch of dec_7seg is
begin

  process(A)
  begin 
    CASE A IS
      WHEN "0000" => VSeg <= "0111111";
      WHEN "0001" => VSeg <= "0000110";
      WHEN "0010" => VSeg <= "1011011";
      WHEN "0011" => VSeg <= "1001111";
      WHEN "0100" => VSeg <= "1100110";
      WHEN "0101" => VSeg <= "1101101";
      WHEN "0110" => VSeg <= "1111101";
      WHEN "0111" => VSeg <= "0000111";
      WHEN "1000" => VSeg <= "1111111";
      WHEN "1001" => VSeg <= "1101111";
      WHEN "1010" => VSeg <= "1110111";
      WHEN "1011" => VSeg <= "1111100";
      WHEN "1100" => VSeg <= "0111001";
      WHEN "1101" => VSeg <= "1011110";
      WHEN "1110" => VSeg <= "1111001";
      WHEN "1111" => VSeg <= "1110001";
    END CASE;
  END PROCESS ;
end arch;