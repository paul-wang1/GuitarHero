library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity zero is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end;
architecture synth of zero is

signal address: std_logic_vector(10 downto 0);

begin
		
address <= std_logic_vector(y_in) & std_logic_vector(x_in);

process (clk)
begin
	if rising_edge(clk) then
			case address is
			                        when "00101000110" => rgb <= "000000";
            when "00101000111" => rgb <= "000000";
            when "00101001000" => rgb <= "000000";
            when "00101001001" => rgb <= "000000";
            when "00101001010" => rgb <= "000000";
            when "00101001011" => rgb <= "000000";
            when "00101001100" => rgb <= "000000";
            when "00101001101" => rgb <= "000000";
            when "00101100110" => rgb <= "000000";
            when "00101100111" => rgb <= "000000";
            when "00101101000" => rgb <= "000000";
            when "00101101001" => rgb <= "000000";
            when "00101101010" => rgb <= "000000";
            when "00101101011" => rgb <= "000000";
            when "00101101100" => rgb <= "000000";
            when "00101101101" => rgb <= "000000";
            when "00110000110" => rgb <= "000000";
            when "00110000111" => rgb <= "000000";
            when "00110001000" => rgb <= "000000";
            when "00110001001" => rgb <= "000000";
            when "00110001010" => rgb <= "000000";
            when "00110001011" => rgb <= "000000";
            when "00110001100" => rgb <= "000000";
            when "00110001101" => rgb <= "000000";
            when "00110100110" => rgb <= "000000";
            when "00110100111" => rgb <= "000000";
            when "00110101000" => rgb <= "000000";
            when "00110101001" => rgb <= "000000";
            when "00110101010" => rgb <= "000000";
            when "00110101011" => rgb <= "000000";
            when "00110101100" => rgb <= "000000";
            when "00110101101" => rgb <= "000000";
            when "00111000010" => rgb <= "000000";
            when "00111000011" => rgb <= "000000";
            when "00111000100" => rgb <= "000000";
            when "00111000101" => rgb <= "000000";
            when "00111001101" => rgb <= "001010";
            when "00111001110" => rgb <= "000000";
            when "00111001111" => rgb <= "000000";
            when "00111010000" => rgb <= "000000";
            when "00111010001" => rgb <= "000000";
            when "00111010010" => rgb <= "100000";
            when "00111100010" => rgb <= "000000";
            when "00111100011" => rgb <= "000000";
            when "00111100100" => rgb <= "000000";
            when "00111100101" => rgb <= "000000";
            when "00111101101" => rgb <= "001010";
            when "00111101110" => rgb <= "000000";
            when "00111101111" => rgb <= "000000";
            when "00111110000" => rgb <= "000000";
            when "00111110001" => rgb <= "000000";
            when "00111110010" => rgb <= "100000";
            when "01000000010" => rgb <= "000000";
            when "01000000011" => rgb <= "000000";
            when "01000000100" => rgb <= "000000";
            when "01000000101" => rgb <= "000000";
            when "01000001101" => rgb <= "001010";
            when "01000001110" => rgb <= "000000";
            when "01000001111" => rgb <= "000000";
            when "01000010000" => rgb <= "000000";
            when "01000010001" => rgb <= "000000";
            when "01000010010" => rgb <= "100000";
            when "01000100010" => rgb <= "000000";
            when "01000100011" => rgb <= "000000";
            when "01000100100" => rgb <= "000000";
            when "01000100101" => rgb <= "000000";
            when "01000101101" => rgb <= "001010";
            when "01000101110" => rgb <= "000000";
            when "01000101111" => rgb <= "000000";
            when "01000110000" => rgb <= "000000";
            when "01000110001" => rgb <= "000000";
            when "01000110010" => rgb <= "100000";
            when "01001000010" => rgb <= "000000";
            when "01001000011" => rgb <= "000000";
            when "01001000100" => rgb <= "000000";
            when "01001000101" => rgb <= "000000";
            when "01001001101" => rgb <= "001010";
            when "01001001110" => rgb <= "000000";
            when "01001001111" => rgb <= "000000";
            when "01001010000" => rgb <= "000000";
            when "01001010001" => rgb <= "000000";
            when "01001010010" => rgb <= "100000";
            when "01001100010" => rgb <= "000000";
            when "01001100011" => rgb <= "000000";
            when "01001100100" => rgb <= "000000";
            when "01001100101" => rgb <= "000000";
            when "01001101101" => rgb <= "001010";
            when "01001101110" => rgb <= "000000";
            when "01001101111" => rgb <= "000000";
            when "01001110000" => rgb <= "000000";
            when "01001110001" => rgb <= "000000";
            when "01001110010" => rgb <= "100000";
            when "01010000010" => rgb <= "000000";
            when "01010000011" => rgb <= "000000";
            when "01010000100" => rgb <= "000000";
            when "01010000101" => rgb <= "000000";
            when "01010001101" => rgb <= "001010";
            when "01010001110" => rgb <= "000000";
            when "01010001111" => rgb <= "000000";
            when "01010010000" => rgb <= "000000";
            when "01010010001" => rgb <= "000000";
            when "01010010010" => rgb <= "100000";
            when "01010100010" => rgb <= "000000";
            when "01010100011" => rgb <= "000000";
            when "01010100100" => rgb <= "000000";
            when "01010100101" => rgb <= "000000";
            when "01010101101" => rgb <= "001010";
            when "01010101110" => rgb <= "000000";
            when "01010101111" => rgb <= "000000";
            when "01010110000" => rgb <= "000000";
            when "01010110001" => rgb <= "000000";
            when "01010110010" => rgb <= "100000";
            when "01011000010" => rgb <= "000000";
            when "01011000011" => rgb <= "000000";
            when "01011000100" => rgb <= "000000";
            when "01011000101" => rgb <= "000000";
            when "01011001101" => rgb <= "001010";
            when "01011001110" => rgb <= "000000";
            when "01011001111" => rgb <= "000000";
            when "01011010000" => rgb <= "000000";
            when "01011010001" => rgb <= "000000";
            when "01011010010" => rgb <= "100000";
            when "01011100010" => rgb <= "000000";
            when "01011100011" => rgb <= "000000";
            when "01011100100" => rgb <= "000000";
            when "01011100101" => rgb <= "000000";
            when "01011100110" => rgb <= "001010";
            when "01011101101" => rgb <= "001010";
            when "01011101110" => rgb <= "000000";
            when "01011101111" => rgb <= "000000";
            when "01011110000" => rgb <= "000000";
            when "01011110001" => rgb <= "000000";
            when "01011110010" => rgb <= "100000";
            when "01100000010" => rgb <= "000000";
            when "01100000011" => rgb <= "000000";
            when "01100000100" => rgb <= "000000";
            when "01100000101" => rgb <= "000000";
            when "01100000110" => rgb <= "001010";
            when "01100001101" => rgb <= "001010";
            when "01100001110" => rgb <= "000000";
            when "01100001111" => rgb <= "000000";
            when "01100010000" => rgb <= "000000";
            when "01100010001" => rgb <= "000000";
            when "01100010010" => rgb <= "100000";
            when "01100100010" => rgb <= "000000";
            when "01100100011" => rgb <= "000000";
            when "01100100100" => rgb <= "000000";
            when "01100100101" => rgb <= "000000";
            when "01100100110" => rgb <= "001010";
            when "01100100111" => rgb <= "001010";
            when "01100101000" => rgb <= "001010";
            when "01100101001" => rgb <= "001010";
            when "01100101010" => rgb <= "001010";
            when "01100101011" => rgb <= "001010";
            when "01100101100" => rgb <= "001010";
            when "01100101101" => rgb <= "001010";
            when "01100101110" => rgb <= "000000";
            when "01100101111" => rgb <= "000000";
            when "01100110000" => rgb <= "000000";
            when "01100110001" => rgb <= "000000";
            when "01100110010" => rgb <= "100000";
            when "01101000110" => rgb <= "000000";
            when "01101000111" => rgb <= "000000";
            when "01101001000" => rgb <= "000000";
            when "01101001001" => rgb <= "000000";
            when "01101001010" => rgb <= "000000";
            when "01101001011" => rgb <= "000000";
            when "01101001100" => rgb <= "000000";
            when "01101001101" => rgb <= "000000";
            when "01101001110" => rgb <= "100000";
            when "01101001111" => rgb <= "100000";
            when "01101010000" => rgb <= "100000";
            when "01101010001" => rgb <= "100000";
            when "01101010010" => rgb <= "100000";
            when "01101100110" => rgb <= "000000";
            when "01101100111" => rgb <= "000000";
            when "01101101000" => rgb <= "000000";
            when "01101101001" => rgb <= "000000";
            when "01101101010" => rgb <= "000000";
            when "01101101011" => rgb <= "000000";
            when "01101101100" => rgb <= "000000";
            when "01101101101" => rgb <= "000000";
            when "01101101110" => rgb <= "100000";
            when "01110000110" => rgb <= "000000";
            when "01110000111" => rgb <= "000000";
            when "01110001000" => rgb <= "000000";
            when "01110001001" => rgb <= "000000";
            when "01110001010" => rgb <= "000000";
            when "01110001011" => rgb <= "000000";
            when "01110001100" => rgb <= "000000";
            when "01110001101" => rgb <= "000000";
            when "01110001110" => rgb <= "100000";
            when "01110100110" => rgb <= "000000";
            when "01110100111" => rgb <= "000000";
            when "01110101000" => rgb <= "000000";
            when "01110101001" => rgb <= "000000";
            when "01110101010" => rgb <= "000000";
            when "01110101011" => rgb <= "000000";
            when "01110101100" => rgb <= "000000";
            when "01110101101" => rgb <= "000000";
            when "01110101110" => rgb <= "100000";
            when "01111000110" => rgb <= "100000";
            when "01111000111" => rgb <= "100000";
            when "01111001000" => rgb <= "100000";
            when "01111001001" => rgb <= "100000";
            when "01111001010" => rgb <= "100000";
            when "01111001011" => rgb <= "100000";
            when "01111001100" => rgb <= "100000";
            when "01111001101" => rgb <= "100000";
            when "01111001110" => rgb <= "100000";
                    when others => rgb <= "111111";
		end case;
	end if;
end process;
end;
