library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity dddd is
  port(
    valuu : in unsigned(5 downto 0);
	clk : in std_logic;
    highBCD : out unsigned(3 downto 0);    
    lowBCD : out unsigned(3 downto 0)
  );
end dddd;

architecture sim of dddd is


signal tensplace : unsigned(12 downto 0) := 13b"0";
signal count : unsigned(5 downto 0) := 6b"0";
signal second_counter : unsigned(20 downto 0) := 21d"0";
--signal valuu_int : unsigned(5 downto 0) := 6b"0";

begin
--process(clk) 
--begin
	--if rising_edge(clk) then
			--second_counter <= second_counter +1;
			--if (second_counter = 21d"0") then 
				--valuu_int <= valuu_int + 1;
			--end if;
		--end if;
--end process;

-- Do the math to split up the digits. Input count is 6 bit unsigned
lowBCD <= valuu mod 4d"10"; -- Low digit result is 4 bit unsigned

-- Multiply by 52. Intermediate term is 13 bit unsigned
tensplace <= valuu * 7d"52";

-- Divide by 512 (29). High digit result is 4 bit unsigned
highBCD <= tensplace(12 downto 9);

end;

