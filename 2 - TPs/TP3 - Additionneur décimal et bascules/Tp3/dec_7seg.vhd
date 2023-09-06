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
signal V : std_logic_vector(6 downto 0);

begin
process(A)
begin 
CASE A IS
WHEN "0000" => V <= "1000000";
WHEN "0001" => V <= "1111001";
WHEN "0010" => V <= "0100100";
WHEN "0011" => V <= "0110000";
WHEN "0100" => V <= "0011001";
WHEN "0101" => V <= "0010010";
WHEN "0110" => V <= "0000010";
WHEN "0111" => V <= "1111000";
WHEN "1000" => V <= "0000000";
WHEN "1001" => V <= "0010000";
WHEN "1010" => V <= "0001000";
WHEN "1011" => V <= "0000011";
WHEN "1100" => V <= "1000110";
WHEN "1101" => V <= "0100001";
WHEN "1110" => V <= "0000110";
WHEN "1111" => V <= "0001110";
WHEN OTHERS => V <= "1111111";

END CASE;
END PROCESS ;
Vseg<= V;

end arch;