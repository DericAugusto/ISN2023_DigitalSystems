-- TP 2 partie 2 - 13/03/2023
-- Déric, Michelle et Nada

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TB_ADD_BCD IS
END TB_ADD_BCD;
 
ARCHITECTURE behavior OF TB_ADD_BCD IS 

COMPONENT ADD_BCD is
port(
a,b:in std_logic_vector(3 downto 0);
cin:in std_logic;
S:out std_logic_vector(3 downto 0);
cout:out std_logic_vector(3 downto 0)
);
END COMPONENT; 
    
   signal aa,bb,ssum : std_logic_vector(3 downto 0) := (others => '0');
   signal ccin : std_logic:='0';
   signal ccout : std_logic_vector(3 downto 0);
   signal Expected_S:std_logic_vector(3 downto 0);
   signal Expected_Cout:std_logic_vector(3 downto 0);
   signal OK_TB: Boolean;
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: ADD_BCD PORT MAP (
          a => aa,
          b => bb,
          Cin => CCin,
          s => ssum,
          cout => ccout
        );
          
   -- Stimulus process
   stim_proc: process
   begin        
        aa <= X"0"; bb <= X"1";  CCin <= '0'; Expected_S<=X"1"; Expected_Cout<=X"0"; wait for 100 ns;
        aa <= X"1"; bb <= X"2";  CCin <= '0'; Expected_S<=X"3"; Expected_Cout<=X"0"; wait for 100 ns;
        aa <= X"4"; bb <= X"4";  CCin <= '0'; Expected_S<=X"8"; Expected_Cout<=X"0"; wait for 100 ns;
        aa <= X"4"; bb <= X"5";  CCin <= '0'; Expected_S<=X"9"; Expected_Cout<=X"0"; wait for 100 ns;
        aa <= X"5"; bb <= X"5";  CCin <= '0'; Expected_S<=X"0"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"6"; bb <= X"5";  CCin <= '0'; Expected_S<=X"1"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"6"; bb <= X"5";  CCin <= '1'; Expected_S<=X"2"; Expected_Cout<=X"1"; wait for 100 ns;
        
        
        aa <= X"4"; bb <= X"9";  CCin <= '0'; Expected_S<=X"3"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"5"; bb <= X"9";  CCin <= '0'; Expected_S<=X"4"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"6"; bb <= X"9";  CCin <= '0'; Expected_S<=X"5"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"7"; bb <= X"9";  CCin <= '0'; Expected_S<=X"6"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"8"; bb <= X"9";  CCin <= '0'; Expected_S<=X"7"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"9"; bb <= X"9";  CCin <= '0'; Expected_S<=X"8"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"A"; bb <= X"9";  CCin <= '0'; Expected_S<=X"9"; Expected_Cout<=X"1"; wait for 100 ns;
        aa <= X"A"; bb <= X"A";  CCin <= '0'; Expected_S<=X"0"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"B"; bb <= X"A";  CCin <= '0'; Expected_S<=X"1"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"7"; bb <= X"F";  CCin <= '0'; Expected_S<=X"2"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"8"; bb <= X"F";  CCin <= '0'; Expected_S<=X"3"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"9"; bb <= X"F";  CCin <= '0'; Expected_S<=X"4"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"A"; bb <= X"F";  CCin <= '0'; Expected_S<=X"5"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"B"; bb <= X"F";  CCin <= '0'; Expected_S<=X"6"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"C"; bb <= X"F";  CCin <= '0'; Expected_S<=X"7"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"D"; bb <= X"F";  CCin <= '0'; Expected_S<=X"8"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"E"; bb <= X"F";  CCin <= '0'; Expected_S<=X"9"; Expected_Cout<=X"2"; wait for 100 ns;
        aa <= X"F"; bb <= X"F";  CCin <= '0'; Expected_S<=X"0"; Expected_Cout<=X"3"; wait for 100 ns;         
      wait;
   end process;

   OK_TB <= true when ((ssum = Expected_S) and (ccout =Expected_Cout)) else false;
END;
