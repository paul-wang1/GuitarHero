library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity keyCompare is
  port(
		clk : in std_logic;
		expectedkey_in_keyCompare : in std_logic_vector(4 downto 0);
		inputkey_in_keyCompare : in std_logic_vector(4 downto 0);
		counter_out : out unsigned(5 downto 0);
		reset_count : in std_logic;
		enableaudio_from_keyCompare : out std_logic	
	);
end keyCompare;

architecture synth of keyCompare is
signal key_previous : std_logic_vector(4 downto 0);
signal key_current : std_logic_vector(4 downto 0) ;
signal is_new_key : std_logic := '0';
signal counter : unsigned(5 downto 0);
signal correctNote : std_logic;

begin

correctNote <= '1' when expectedkey_in_keyCompare = not inputkey_in_keyCompare else '0';
key_current <= expectedkey_in_keyCompare;
enableaudio_from_keyCompare <= correctNote;

process (clk) begin
	if rising_edge(clk) then
	key_previous <= key_current;
		if (reset_count = '1') then
			counter <= 6d"0";
		end if;
		if(expectedkey_in_keyCompare /= "00000") then
			if (key_current = key_previous) then
				if (is_new_key = '1') and correctNote = '1' then 	
					counter <= counter + 1;
					is_new_key <= '0';
				else
					is_new_key <= '0';
				end if;
			else
				is_new_key <= '1';
			end if;
		else 
			
		end if;
	end if;
end process;



			
-- compare expected key with the last expected key (
	counter_out <= counter;

-- if they're different, reset counter update to 0 (ie no it hasn't been updated) 

-- score 
end;
