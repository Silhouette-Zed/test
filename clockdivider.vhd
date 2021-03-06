library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity clockDivider is
    Port ( clockIn : in STD_LOGIC;
           resetClk : in STD_LOGIC;
           clockOut : out STD_LOGIC);
end clockDivider;

architecture Behavioral of clockDivider is

signal temp : STD_LOGIC;
begin

frequencyDivider: process (clockIn,resetClk)
                  variable count : integer range 0 to 60000000 := 0;  --49
                  begin
                    if resetClk = '1' then
                        temp <= '0';
                        count := 0;
                    elsif rising_edge(clockIn) then
                        if (count = 60000000) then
                            temp <= NOT(temp);
                            count := 0;
                        else
                            count := count + 1;
                        end if;
                    end if;
                    
                    end process;
                    
   clockOut <= temp;
end Behavioral;
