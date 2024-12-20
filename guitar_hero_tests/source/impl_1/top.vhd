library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is
  port(
	hsyncout : out std_logic;
	vsyncout : out std_logic;
	rgb_out : out std_logic_vector(5 downto 0);
	clkout : out std_logic;
	clkin : in std_logic;
	--go_to_start : in std_logic;
	inputKeys : in std_logic_vector(4 downto 0); 
	audioTone : out std_logic
	--go_to_game : in std_logic
  );
end top;

-- You're on your own for the rest!
architecture synth of top is

component pll1 is
    port(
        ref_clk_i: in std_logic; --input clock
        rst_n_i: in std_logic; -- reset
        outcore_o: out std_logic; --output to pins
        outglobal_o: out std_logic -- output for clock network
    );
end component;

component dddd is
  port(    valuu : in unsigned(5 downto 0);
	clk : in std_logic;
    highBCD : out unsigned(3 downto 0);    
    lowBCD : out unsigned(3 downto 0)
  );
end component;

component vga is
  port(
	clk : in std_logic;
	hsync : out std_logic;
	vsync : out std_logic;
	x : out unsigned(9 downto 0);
	y : out unsigned(8 downto 0);
	valid : out std_logic;
	screenclk : out std_logic
  );
end component;

component gen is
  port(
	x : in unsigned(9 downto 0);
	y : in unsigned(8 downto 0);
	clk : in std_logic;
	valid : in std_logic;
    rgb_out : out std_logic_vector(5 downto 0);  -- RGB output
	go_to_start : in std_logic;
	go_to_game : in std_logic;
	tensdigit : in unsigned(3 downto 0);
	onesdigit : in unsigned(3 downto 0);
	reset_score : out std_logic;
	expected : out std_logic_vector(4 downto 0)
  );
end component;


component keyCompare is
  port(
		clk : in std_logic;
		expectedkey_in_keyCompare : in std_logic_vector(4 downto 0);
		inputkey_in_keyCompare : in std_logic_vector(4 downto 0);
		counter_out : out unsigned(5 downto 0);
		reset_count : in std_logic;
		enableaudio_from_keyCompare : out std_logic	
	);
end component;


component playAudio is
	port(
		inputkey_in_Audio : in std_logic_vector(4 downto 0);
		enableaudio_in_Audio : in std_logic;
		VGAclock_in_Audio : in std_logic;
		tone : out std_logic
		);
end component;



--component rom is
  --port(
	--clk: in std_logic;
		--x_in : in std_logic_vector( 9 downto 0);
		--y_in : in std_logic_vector( 8 downto 0);
		--data : out std_logic(5 downto 0)
  --);
--end component;

signal rst : std_logic := '1';
signal vga_clk : std_logic;
signal valid : std_logic;
signal x : unsigned(9 downto 0);
signal y : unsigned(8 downto 0);
signal screen_refresh : std_logic;

signal vsyncoutmid : std_logic;

signal highBCDtoPatternGen : unsigned(3 downto 0); 
signal lowBCDtoPatternGen  : unsigned(3 downto 0);

signal expectedKeyFromPatGen : std_logic_vector(4 downto 0);

signal decoder_value : unsigned(5 downto 0); 

signal enable_audio_signal : std_logic; 
signal start_game : std_logic;
signal back_to_start : std_logic;
signal reset_score : std_logic;
begin

start_game <= '0' when inputKeys = "00000" else '1';

--reset <= rst;
pll : pll1 port map(ref_clk_i => clkin, rst_n_i => '1', outcore_o => clkout, outglobal_o => vga_clk);

vga1 : vga port map(clk => vga_clk, hsync => hsyncout, vsync => vsyncoutmid, valid => valid, x => x, y => y, screenclk => screen_refresh);
vsyncout <= vsyncoutmid;

gen1 : gen port map(
	x => x, 
	y => y, 
	clk => vga_clk, 
	rgb_out => rgb_out, 
	valid => valid, 
	go_to_start => inputKeys(0), 
	go_to_game => start_game, 
	expected => expectedKeyFromPatGen,
	tensdigit =>highBCDtoPatternGen, 
	onesdigit => lowBCDtoPatternGen,
	reset_score => reset_score
);

decoder: dddd 
	port map(    valuu => decoder_value, 
	clk  => vga_clk,
    highBCD => highBCDtoPatternGen,    
    lowBCD => lowBCDtoPatternGen
  );
  
compare: keyCompare 
	port map(
		clk => vga_clk, 
		expectedkey_in_keyCompare => expectedKeyFromPatGen, 
		inputkey_in_keyCompare => inputKeys, 
		counter_out => decoder_value,
		enableaudio_from_keyCompare => enable_audio_signal,
		reset_count => reset_score
	);
	
audio: playAudio 
	port map (
		inputkey_in_Audio => inputKeys, 
		enableaudio_in_Audio => enable_audio_signal, 
		VGAclock_in_Audio => vga_clk,  
		tone => audioTone		
	);


end;


