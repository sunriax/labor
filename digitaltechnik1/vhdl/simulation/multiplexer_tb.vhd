
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use UNISIM.VComponents.all;

entity multiplexer_tb is
--  Port ( );
end multiplexer_tb;

architecture Simulation of multiplexer_tb is

component multiplexer is
  Port ( CLK	: in STD_LOGIC;
  		 EN		: in STD_LOGIC;
    	 A		: in STD_LOGIC_VECTOR(1 downto 0);
         P		: in STD_LOGIC_VECTOR(3 downto 0);
         S		: out STD_LOGIC	);
end component multiplexer;

signal simEN, simCLK	: STD_LOGIC;
signal simA				: STD_LOGIC_VECTOR(1 downto 0);
signal simP				: STD_LOGIC_VECTOR(3 downto 0);
signal simS				: STD_LOGIC;

constant CLK_period : time := 1 us;    -- 1 MHz
begin
UUT: multiplexer port map ( CLK	=> simCLK,
                    		EN	=> simEN,
                     		A	=> simA,
                     		P	=> simP,
                     		S	=> simS );

CLK_process: process
  begin
      simCLK <= '0';
      wait for CLK_period/2;
      simCLK <= '1';
      wait for CLK_period/2;
end process;

process
	begin
		simEN <= '0';	simA <= "00";	simP <=	"0000";	wait for 2 us;

		simEN <= '1';	simA <= "00";	simP <= "0101";	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simP <= "0101";	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simP <= "0101";	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simP <= "0101";	wait for CLK_period;
		
		simEN <= '0';	simA <= "00";	simP <=	"0000";	wait for 2 us;
		
		simEN <= '1';	simA <= "00";	simP <= "1100";	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simP <= "1100";	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simP <= "1100";	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simP <= "1100";	wait for CLK_period;

		simEN <= '0';	simA <= "00";	simP <=	"0000";	wait for 2 us;
     
     	simEN <= '1';	simA <= "00";	simP <= "1001";	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simP <= "1001";	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simP <= "1001";	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simP <= "1001";	wait for CLK_period;
 
 		simEN <= '0';	simA <= "00";	simP <=	"0000";	wait for 2 us;
 
		wait;
end process;

end Simulation;
