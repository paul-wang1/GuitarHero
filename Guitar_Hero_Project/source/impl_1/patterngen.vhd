library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--STILL SOME WEIRD SCREEN STUFF HAPPENING
entity gen is
  port(
    x : in unsigned(9 downto 0);  -- Horizontal pixel position
    y : in unsigned(8 downto 0);  -- Vertical pixel position
	go_to_start : in std_logic;
	go_to_game : in std_logic;
    clk : in std_logic;       
	valid : in std_logic; 
    rgb_out : out std_logic_vector(5 downto 0);  -- RGB output
	tensdigit : in unsigned(3 downto 0);
	onesdigit : in unsigned(3 downto 0);
	reset_score : out std_logic;
	expected : out std_logic_vector(4 downto 0)
  );
end gen;


architecture synth of gen is
signal rgb1 : std_logic_vector(5 downto 0);
component rom is
  port(
	clk: in std_logic;
		 x_in : unsigned(6 downto 0);
		 y_in : unsigned(5 downto 0);
		 rgb : out std_logic_vector(5 downto 0)
  );
end component;
 

component end_screen is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(6 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;


component zero is
  port(
				clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component one is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component two is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component three is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component four is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component five is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component six is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component seven is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component eight is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component nine is
  port(
		clk : in std_logic;
		y_in : in  unsigned(5 downto 0);
		x_in : in unsigned(4 downto 0);
		rgb : out std_logic_vector(5 downto 0)
  );
end component;

component game is
  port(
    x : in unsigned(9 downto 0);  -- Horizontal pixel position
    y : in unsigned(8 downto 0);  -- Vertical pixel position
    clk : in std_logic;         -- ~60 Hz ***I think I should add new consistent clock because timing is important
	game_start : in std_logic;
    rgb : out std_logic_vector(5 downto 0);  -- RGB output
	bar1out : out std_logic;
	bar2out : out std_logic;
	bar3out : out std_logic;
	bar4out : out std_logic;
	bar5out : out std_logic;
	go_to_end : out std_logic
  );
end component;

	signal 	y_in : unsigned(6 downto 0);
	signal  x_in : unsigned(7 downto 0);

signal end_screen_rgb : std_logic_vector(5 downto 0);
signal start_screen_rgb : std_logic_vector(5 downto 0);

signal state_screen : std_logic_vector(5 downto 0);

--number rgb signals
signal zero_rgb : std_logic_vector(5 downto 0);
signal one_rgb : std_logic_vector(5 downto 0);
signal two_rgb : std_logic_vector(5 downto 0);
signal three_rgb : std_logic_vector(5 downto 0);
signal four_rgb : std_logic_vector(5 downto 0);
signal five_rgb : std_logic_vector(5 downto 0);
signal six_rgb : std_logic_vector(5 downto 0);
signal seven_rgb : std_logic_vector(5 downto 0);
signal eight_rgb : std_logic_vector(5 downto 0);
signal nine_rgb : std_logic_vector(5 downto 0);

--Digits RGB
signal tens_digit_rgb : std_logic_vector(5 downto 0);
signal ones_digit_rgb : std_logic_vector(5 downto 0);

type State is (start_screen, end_screen_state, game_state);
signal curr_state : State := start_screen;

signal game_rgb : std_logic_vector(5 downto 0);
signal game_start : std_logic;

signal bar1out : std_logic;
signal bar2out : std_logic;
signal bar3out : std_logic;
signal bar4out : std_logic;
signal bar5out : std_logic;

signal go_to_end : std_logic;

begin
--x_in <= x(9 downto 2);
--y_in <= y(8 downto 2);

process (clk) begin
	if rising_edge(clk) then
		case curr_state is
				when start_screen =>
					game_start <= '0';
					if (go_to_game = '0') then
						curr_state <= game_state;
					else 
						curr_state <= start_screen;
					end if;
				when game_state =>
					curr_state <= game_state;
					game_start <= '1';
					if (go_to_end = '1') then
						curr_state <= end_screen_state;
					end if;
				when end_screen_state =>
					game_start <= '0';
					if (go_to_start = '0') then
						curr_state <= start_screen;
					else
						curr_state <= end_screen_state;
					end if;
			end case;
		end if;
end process;

rom1 : rom port map (clk => clk, y_in => y(8 downto 3), x_in => x(9 downto 3), rgb => start_screen_rgb);
end_screen1 : end_screen port map (clk => clk, y_in => y(8 downto 3), x_in => x(9 downto 3), rgb => end_screen_rgb);
game1 : game port map(clk => clk, x=>x, y=>y, rgb=>game_rgb, bar1out => bar1out, bar2out => bar2out, bar3out => bar3out, bar4out => bar4out, bar5out => bar5out, game_start => game_start, go_to_end => go_to_end);
expected <= bar1out & bar2out & bar3out & bar4out & bar5out;

zero1 : zero port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => zero_rgb);
one1 : one port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => one_rgb);
two1 : two port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => two_rgb);
three1 : three port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => three_rgb);
four1 : four port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => four_rgb);
five1 : five port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => five_rgb);
six1 : six port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => six_rgb);
seven1 : seven port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => seven_rgb);
eight1 : eight port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => eight_rgb);
nine1 : nine port map (clk => clk, y_in => y(6 downto 1), x_in => x(5 downto 1), rgb => nine_rgb);

tens_digit_rgb <= nine_rgb when tensdigit = 9 else
	one_rgb when tensdigit = 1 else
	two_rgb when tensdigit = 2 else
	three_rgb when tensdigit = 3 else
	four_rgb when tensdigit = 4 else
	five_rgb when tensdigit = 5 else
	six_rgb when tensdigit = 6 else
	seven_rgb when tensdigit = 7 else
	eight_rgb when tensdigit = 8 else
zero_rgb;

ones_digit_rgb <= nine_rgb when onesdigit = 9 else
  one_rgb when onesdigit = 1 else
  two_rgb when onesdigit = 2 else
  three_rgb when onesdigit = 3 else
  four_rgb when onesdigit = 4 else
  five_rgb when onesdigit = 5 else
  six_rgb when onesdigit = 6 else
  seven_rgb when onesdigit = 7 else
  eight_rgb when onesdigit = 8 else
zero_rgb;

state_screen <= start_screen_rgb when curr_state = start_screen else end_screen_rgb;
reset_score <= '1' when curr_state <= start_screen else '0';
rgb1 <= 
    tens_digit_rgb when (y > "101111100" and y < "111100000") and ( x > "1000000011" and x < "1000101011") and curr_state = end_screen_state else
	ones_digit_rgb when (y > "101111100" and y < "111100000") and ( x > "1000111010" and x < "1001100010") and curr_state = end_screen_state else
	game_rgb when curr_state = game_state else
	state_screen; 

rgb_out <= rgb1 when valid = '1' else "000000"; 

--rgb_out <= "111111" when valid = '1' else "000000"; 

end ;