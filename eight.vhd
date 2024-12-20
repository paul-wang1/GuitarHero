library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity eight is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end;
architecture synth of eight is

signal address: std_logic_vector(10 downto 0);

begin
		
address <= std_logic_vector(y_in) & std_logic_vector(x_in);

process (clk)
begin
	if rising_edge(clk) then
			case address is
		                       when "00101000101" => rgb <= "001010";
            when "00101000110" => rgb <= "000000";
            when "00101000111" => rgb <= "000000";
            when "00101001000" => rgb <= "000000";
            when "00101001001" => rgb <= "000000";
            when "00101001010" => rgb <= "000000";
            when "00101001011" => rgb <= "000000";
            when "00101001100" => rgb <= "000000";
            when "00101001101" => rgb <= "000000";
            when "00101001110" => rgb <= "100000";
            when "00101100101" => rgb <= "001010";
            when "00101100110" => rgb <= "000000";
            when "00101100111" => rgb <= "000000";
            when "00101101000" => rgb <= "000000";
            when "00101101001" => rgb <= "000000";
            when "00101101010" => rgb <= "000000";
            when "00101101011" => rgb <= "000000";
            when "00101101100" => rgb <= "000000";
            when "00101101101" => rgb <= "000000";
            when "00101101110" => rgb <= "100000";
            when "00110000101" => rgb <= "001010";
            when "00110000110" => rgb <= "000000";
            when "00110000111" => rgb <= "000000";
            when "00110001000" => rgb <= "000000";
            when "00110001001" => rgb <= "000000";
            when "00110001010" => rgb <= "000000";
            when "00110001011" => rgb <= "000000";
            when "00110001100" => rgb <= "000000";
            when "00110001101" => rgb <= "000000";
            when "00110001110" => rgb <= "100000";
            when "00110100101" => rgb <= "001010";
            when "00110100110" => rgb <= "000000";
            when "00110100111" => rgb <= "000000";
            when "00110101000" => rgb <= "000000";
            when "00110101001" => rgb <= "000000";
            when "00110101010" => rgb <= "000000";
            when "00110101011" => rgb <= "000000";
            when "00110101100" => rgb <= "000000";
            when "00110101101" => rgb <= "000000";
            when "00110101110" => rgb <= "100000";
            when "00111000001" => rgb <= "001010";
            when "00111000010" => rgb <= "000000";
            when "00111000011" => rgb <= "000000";
            when "00111000100" => rgb <= "000000";
            when "00111000101" => rgb <= "000000";
            when "00111000110" => rgb <= "100000";
            when "00111001101" => rgb <= "001010";
            when "00111001110" => rgb <= "000000";
            when "00111001111" => rgb <= "000000";
            when "00111010000" => rgb <= "000000";
            when "00111010001" => rgb <= "000000";
            when "00111010010" => rgb <= "100000";
            when "00111100001" => rgb <= "001010";
            when "00111100010" => rgb <= "000000";
            when "00111100011" => rgb <= "000000";
            when "00111100100" => rgb <= "000000";
            when "00111100101" => rgb <= "000000";
            when "00111100110" => rgb <= "100000";
            when "00111101101" => rgb <= "001010";
            when "00111101110" => rgb <= "000000";
            when "00111101111" => rgb <= "000000";
            when "00111110000" => rgb <= "000000";
            when "00111110001" => rgb <= "000000";
            when "00111110010" => rgb <= "100000";
            when "01000000001" => rgb <= "001010";
            when "01000000010" => rgb <= "000000";
            when "01000000011" => rgb <= "000000";
            when "01000000100" => rgb <= "000000";
            when "01000000101" => rgb <= "000000";
            when "01000000110" => rgb <= "100000";
            when "01000001101" => rgb <= "001010";
            when "01000001110" => rgb <= "000000";
            when "01000001111" => rgb <= "000000";
            when "01000010000" => rgb <= "000000";
            when "01000010001" => rgb <= "000000";
            when "01000010010" => rgb <= "100000";
            when "01000100001" => rgb <= "001010";
            when "01000100010" => rgb <= "000000";
            when "01000100011" => rgb <= "000000";
            when "01000100100" => rgb <= "000000";
            when "01000100101" => rgb <= "000000";
            when "01000100110" => rgb <= "100000";
            when "01000101101" => rgb <= "001010";
            when "01000101110" => rgb <= "000000";
            when "01000101111" => rgb <= "000000";
            when "01000110000" => rgb <= "000000";
            when "01000110001" => rgb <= "000000";
            when "01000110010" => rgb <= "100000";
            when "01001000101" => rgb <= "001010";
            when "01001000110" => rgb <= "000000";
            when "01001000111" => rgb <= "000000";
            when "01001001000" => rgb <= "000000";
            when "01001001001" => rgb <= "000000";
            when "01001001010" => rgb <= "000000";
            when "01001001011" => rgb <= "000000";
            when "01001001100" => rgb <= "000000";
            when "01001001101" => rgb <= "000000";
            when "01001001110" => rgb <= "100000";
            when "01001100101" => rgb <= "001010";
            when "01001100110" => rgb <= "000000";
            when "01001100111" => rgb <= "000000";
            when "01001101000" => rgb <= "000000";
            when "01001101001" => rgb <= "000000";
            when "01001101010" => rgb <= "000000";
            when "01001101011" => rgb <= "000000";
            when "01001101100" => rgb <= "000000";
            when "01001101101" => rgb <= "000000";
            when "01001101110" => rgb <= "100000";
            when "01010000101" => rgb <= "001010";
            when "01010000110" => rgb <= "000000";
            when "01010000111" => rgb <= "000000";
            when "01010001000" => rgb <= "000000";
            when "01010001001" => rgb <= "000000";
            when "01010001010" => rgb <= "000000";
            when "01010001011" => rgb <= "000000";
            when "01010001100" => rgb <= "000000";
            when "01010001101" => rgb <= "000000";
            when "01010001110" => rgb <= "100000";
            when "01010100101" => rgb <= "001010";
            when "01010100110" => rgb <= "000000";
            when "01010100111" => rgb <= "000000";
            when "01010101000" => rgb <= "000000";
            when "01010101001" => rgb <= "000000";
            when "01010101010" => rgb <= "000000";
            when "01010101011" => rgb <= "000000";
            when "01010101100" => rgb <= "000000";
            when "01010101101" => rgb <= "000000";
            when "01010101110" => rgb <= "100000";
            when "01011000001" => rgb <= "001010";
            when "01011000010" => rgb <= "000000";
            when "01011000011" => rgb <= "000000";
            when "01011000100" => rgb <= "000000";
            when "01011000101" => rgb <= "000000";
            when "01011000110" => rgb <= "100000";
            when "01011001101" => rgb <= "001010";
            when "01011001110" => rgb <= "000000";
            when "01011001111" => rgb <= "000000";
            when "01011010000" => rgb <= "000000";
            when "01011010001" => rgb <= "000000";
            when "01011010010" => rgb <= "100000";
            when "01011100001" => rgb <= "001010";
            when "01011100010" => rgb <= "000000";
            when "01011100011" => rgb <= "000000";
            when "01011100100" => rgb <= "000000";
            when "01011100101" => rgb <= "000000";
            when "01011100110" => rgb <= "100000";
            when "01011101101" => rgb <= "001010";
            when "01011101110" => rgb <= "000000";
            when "01011101111" => rgb <= "000000";
            when "01011110000" => rgb <= "000000";
            when "01011110001" => rgb <= "000000";
            when "01011110010" => rgb <= "100000";
            when "01100000001" => rgb <= "001010";
            when "01100000010" => rgb <= "000000";
            when "01100000011" => rgb <= "000000";
            when "01100000100" => rgb <= "000000";
            when "01100000101" => rgb <= "000000";
            when "01100000110" => rgb <= "100000";
            when "01100001101" => rgb <= "001010";
            when "01100001110" => rgb <= "000000";
            when "01100001111" => rgb <= "000000";
            when "01100010000" => rgb <= "000000";
            when "01100010001" => rgb <= "000000";
            when "01100010010" => rgb <= "100000";
            when "01100100001" => rgb <= "001010";
            when "01100100010" => rgb <= "000000";
            when "01100100011" => rgb <= "000000";
            when "01100100100" => rgb <= "000000";
            when "01100100101" => rgb <= "000000";
            when "01100100110" => rgb <= "100000";
            when "01100101101" => rgb <= "001010";
            when "01100101110" => rgb <= "000000";
            when "01100101111" => rgb <= "000000";
            when "01100110000" => rgb <= "000000";
            when "01100110001" => rgb <= "000000";
            when "01100110010" => rgb <= "100000";
            when "01101000101" => rgb <= "001010";
            when "01101000110" => rgb <= "000000";
            when "01101000111" => rgb <= "000000";
            when "01101001000" => rgb <= "000000";
            when "01101001001" => rgb <= "000000";
            when "01101001010" => rgb <= "000000";
            when "01101001011" => rgb <= "000000";
            when "01101001100" => rgb <= "000000";
            when "01101001101" => rgb <= "001010";
            when "01101001110" => rgb <= "100000";
            when "01101100101" => rgb <= "001010";
            when "01101100110" => rgb <= "000000";
            when "01101100111" => rgb <= "000000";
            when "01101101000" => rgb <= "000000";
            when "01101101001" => rgb <= "000000";
            when "01101101010" => rgb <= "000000";
            when "01101101011" => rgb <= "000000";
            when "01101101100" => rgb <= "000000";
            when "01101101101" => rgb <= "000000";
            when "01101101110" => rgb <= "100000";
            when "01110000101" => rgb <= "001010";
            when "01110000110" => rgb <= "000000";
            when "01110000111" => rgb <= "000000";
            when "01110001000" => rgb <= "000000";
            when "01110001001" => rgb <= "000000";
            when "01110001010" => rgb <= "000000";
            when "01110001011" => rgb <= "000000";
            when "01110001100" => rgb <= "000000";
            when "01110001101" => rgb <= "000000";
            when "01110001110" => rgb <= "100000";
            when "01110100101" => rgb <= "001010";
            when "01110100110" => rgb <= "000000";
            when "01110100111" => rgb <= "000000";
            when "01110101000" => rgb <= "000000";
            when "01110101001" => rgb <= "000000";
            when "01110101010" => rgb <= "000000";
            when "01110101011" => rgb <= "000000";
            when "01110101100" => rgb <= "000000";
            when "01110101101" => rgb <= "000000";
            when "01110101110" => rgb <= "100000";
                    when others => rgb <= "111111";
			end case;
	end if;
end process;
end;
