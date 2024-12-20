library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity playAudio is
	port(
		inputkey_in_Audio : in std_logic_vector(4 downto 0);
		enableaudio_in_Audio : in std_logic;
		VGAclock_in_Audio : in std_logic;
		tone : out std_logic
		);
end playAudio;

architecture synth of playAudio is

signal count : unsigned(17 downto 0) := (others => '0');
signal limit : unsigned(17 downto 0) := (others => '0');

begin

limit <= 18d"35972" when inputkey_in_Audio = "11110" else 
	18d"40377" when inputkey_in_Audio = "11101" else
	18d"45323" when inputkey_in_Audio = "11011" else
	18d"48016" when inputkey_in_Audio = "10111" else
	18d"50873" when inputkey_in_Audio = "01111" else
	18d"53898" when inputkey_in_Audio = "00111" else 
	18d"60498" when inputkey_in_Audio = "01011" else 
	18d"64094" when inputkey_in_Audio = "01101" else 
	18d"71944" when inputkey_in_Audio = "01110" else 
	18d"1";

process (VGAclock_in_Audio)
begin
	if rising_edge(VGAclock_in_Audio) then
		count <= count + 1;
			if inputkey_in_Audio = "00000" then 
				tone <= '0';
			else
				if count < limit then
					tone <= '1';
				elsif (count < limit&"0") and (count > limit - 1) then
					tone <= '0';
				else 
					count <= (others => '0');
				end if;
			end if;
	end if;
end process;
end;




