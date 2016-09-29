----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.09.2016 10:04:50
-- Design Name: 
-- Module Name: demultiplexer_tb - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demultiplexer_tb is
--  Port ( );
end demultiplexer_tb;

architecture Simulation of demultiplexer_tb is

component demultiplexer is
  Port ( CLK, EN, S	: in STD_LOGIC;
    	 A			: in STD_LOGIC_VECTOR(1 downto 0);
         P			: out STD_LOGIC_VECTOR(3 downto 0));
end component demultiplexer;

signal simEN, simCLK, simS	: STD_LOGIC;
signal simA					: STD_LOGIC_VECTOR(1 downto 0);
signal simP					: STD_LOGIC_VECTOR(3 downto 0);


constant CLK_period : time := 1 us;    -- 1 MHz
begin
UUT: demultiplexer port map ( CLK	=> simCLK,
                    		EN	=> simEN,
                     		A	=> simA,
                     		S	=> simS, 
                     		P	=> simP	);

CLK_process: process
  begin
      simCLK <= '0';
      wait for CLK_period/2;
      simCLK <= '1';
      wait for CLK_period/2;
end process;

process
	begin
		simEN <= '0';	simA <= "00";	simS <= '0';	wait for 2 us;
		
		simEN <= '1';	simA <= "00";	simS <= '1';	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simS <= '0';	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simS <= '1';	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simS <= '0';	wait for CLK_period;
		
		simEN <= '0';	simA <= "00";	simS <= '0';	wait for 2 us;
		
		simEN <= '1';	simA <= "00";	simS <= '0';	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simS <= '0';	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simS <= '1';	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simS <= '1';	wait for CLK_period;

		simEN <= '0';	simA <= "00";	simS <= '0';	wait for 2 us;
		
		simEN <= '1';	simA <= "00";	simS <= '1';	wait for CLK_period;
		simEN <= '1';	simA <= "01";	simS <= '0';	wait for CLK_period;
		simEN <= '1';	simA <= "10";	simS <= '0';	wait for CLK_period;
		simEN <= '1';	simA <= "11";	simS <= '1';	wait for CLK_period;

		simEN <= '0';	simA <= "00";	simS <= '0';	wait for 2 us;

		wait;
end process;

end Simulation;
