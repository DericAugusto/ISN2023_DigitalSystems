Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY TB_dec_7Seg IS
END TB_dec_7Seg;


Architecture arch of TB_dec_7Seg is


component DEC_7Seg IS
PORT(
a:in std_logic_vector(3 downto 0);
VSeg:out std_logic_vector(6 downto 0)
);
end component;
signal AA :std_logic_vector(3 downto 0);
Signal VVSeg : std_logic_vector(6 downto 0);
Signal Expected_S : std_logic_vector(6 downto 0);
signal ok_TB: Boolean;

begin


uut: DEC_7Seg port map( 
			a => aa,
			VSeg => VVSeg
);

-- Stimulus process
   stim_proc: process
   --variable 
   begin        
        AA <= X"0";  Expected_S<=not("0111111");  wait for 100 ns; -----Affichage du 0
        AA <= X"1";  Expected_S<=not("0000110");  wait for 100 ns; -----Affichage du 1
        AA <= X"2";  Expected_S<=not("1011011");  wait for 100 ns; -----Affichage du 2
        AA <= X"3";  Expected_S<=not("1001111");  wait for 100 ns; -----Affichage du 3
        AA <= X"4";  Expected_S<=not("1100110");  wait for 100 ns; -----Affichage du 4
        AA <= X"5";  Expected_S<=not("1101101");  wait for 100 ns; -----Affichage du 5
        AA <= X"6";  Expected_S<=not("1111101");  wait for 100 ns; -----Affichage du 6
        AA <= X"7";  Expected_S<=not("0000111");  wait for 100 ns; -----Affichage du 7
        AA <= X"8";  Expected_S<=not("1111111");  wait for 100 ns; -----Affichage du 8
        AA <= X"9";  Expected_S<=not("1101111");  wait for 100 ns; -----Affichage du 9
        AA <= X"A";  Expected_S<=not("1110111");  wait for 100 ns; -----Affichage du A
        AA <= X"B";  Expected_S<=not("1111100");  wait for 100 ns; -----Affichage du B
        AA <= X"C";  Expected_S<=not("0111001");  wait for 100 ns; -----Affichage du C
        AA <= X"D";  Expected_S<=not("1011110");  wait for 100 ns; -----Affichage du D
        AA <= X"E";  Expected_S<=not("1111001");  wait for 100 ns; -----Affichage du E
        AA <= X"F";  Expected_S<=not("1110001");  wait for 100 ns; -----Affichage du F
        
        
   
      
	
               
      wait;
   end process;

   
   
   OK_TB <= true when (VVSeg = Expected_S)  else false;


end arch;