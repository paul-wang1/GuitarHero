library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
  port(
	clk : in std_logic;
	hsync : out std_logic;
	vsync : out std_logic;
	x : out unsigned(9 downto 0);
	y : out unsigned(8 downto 0);
	valid : out std_logic;
	screenclk : out std_logic
  );
end vga;

architecture synth of vga is

constant horizontal_display : integer := 640; --640
constant horizontal_front : integer := 16;
constant horizontal_pulse : integer := 96;
constant horizontal_back : integer := 48;
constant horizontal_total : integer := 800; --800

constant vertical_display : integer := 480; --480
constant vertical_front : integer := 10;
constant vertical_pulse : integer := 2;
constant vertical_back : integer := 33;
constant vertical_total : integer := 525; --525

signal xpos : integer := 0; --trying to make coutner
signal ypos : integer := 0;

begin
	process (clk) begin
		if rising_edge(clk) then
			if (xpos = horizontal_total) then -- -1
				xpos <= 0;
				if (ypos = vertical_total) then -- -1
					ypos <= 0;
				else
					ypos <= ypos + 1;
				end if;
			else
				xpos <= xpos + 1;
			end if;
			--if xpos = horizontal_display and ypos = vertical_display then
				--screenclk <= '1';
			--else 
				--screenclk <= '0';
			--end if;
		end if;
	end process;
	x <= to_unsigned(xpos, x'length);
	y <= to_unsigned(ypos, y'length);
	
	hsync <= '0' when (xpos>= (horizontal_display + horizontal_front)) and (xpos <= (horizontal_display + horizontal_front + horizontal_pulse-1)) else '1'; -- -1
	vsync <= '0' when (ypos>= (vertical_display + vertical_front)) and (ypos <= (vertical_display + vertical_front + vertical_pulse-1)) else '1'; -- -1
	valid <= '1' when (xpos<=horizontal_display) and (ypos <= (vertical_display)) else '0'; --when inside the screen
	
end synth;


