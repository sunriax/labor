
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer is
    Port (	CLK, EN : in STD_LOGIC;
    		A		: in STD_LOGIC_VECTOR(1 downto 0);
			P		: in STD_LOGIC_VECTOR(3 downto 0);
			S		: out STD_LOGIC	);
end multiplexer;

architecture Behavioral of multiplexer is
begin
	process (CLK, EN)
		begin
			if (EN = '1') then
				if rising_edge(CLK) then
					case (A) is
						when "00"	=>	S <= P(0);
						when "01"	=>	S <= P(1);
						when "10"	=>	S <= P(2);
						when "11"	=>	S <= P(3);
						when others =>	S <= '0';
					end case;
				end if;
			else
				S <= '0';
			end if;
	end process;
end Behavioral;
