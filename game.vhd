library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--STILL SOME WEIRD SCREEN STUFF HAPPENING
entity game is
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
end game;

architecture synth of game is

signal counter : integer := 0; -- counnter

-- fall speed
constant FALL_STEP : integer := 4;  -- 2 = 120 px per second AKA 4 seconds to fall to time notes easier

-- Bar Positions
signal bar_position1y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position1x : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position2y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position2x : unsigned(9 downto 0) := to_unsigned(128, 10); -- x position of bar

signal bar_position3y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position3x : unsigned(9 downto 0) := to_unsigned(252, 10); -- x position of bar

signal bar_position4y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position4x : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position5y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position5x : unsigned(9 downto 0) := to_unsigned(508, 10); -- x position of bar

--quarter note beats
signal bar_position6y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position6x : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position7y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position7x : unsigned(9 downto 0) := to_unsigned(128, 10); -- x position of bar

signal bar_position9y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position9x2 : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position9y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position9x : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position10y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position10x : unsigned(9 downto 0) := to_unsigned(508, 10); -- x position of bar

--3 eighth note beats
signal bar_position11y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position11x : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position12y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position12x : unsigned(9 downto 0) := to_unsigned(128, 10); -- x position of bar

signal bar_position13y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position13x : unsigned(9 downto 0) := to_unsigned(252, 10); -- x position of bar

signal bar_position14y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position14x : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position15y : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position15x : unsigned(9 downto 0) := to_unsigned(508, 10); -- x position of bar

--extras
signal bar_position1y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position1x2 : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position6y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position6x2 : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position4y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position4x2 : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position3y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position3x2 : unsigned(9 downto 0) := to_unsigned(252, 10); -- x position of bar

signal bar_position2y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position2x2 : unsigned(9 downto 0) := to_unsigned(128, 10); -- x position of bar

signal bar_position14y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position14x2 : unsigned(9 downto 0) := to_unsigned(380, 10); -- x position of bar

signal bar_position11y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position11x2 : unsigned(9 downto 0) := "0000000000"; -- x position of bar

signal bar_position10y2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal bar_position10x2 : unsigned(9 downto 0) := to_unsigned(508, 10); -- x position of bar

signal halfnotey2 : unsigned(9 downto 0) := "0000000000"; -- y position of bar
signal halfnotex2 : unsigned(9 downto 0) := to_unsigned(128, 10); -- x position of bar
--bars
signal bar1 : std_logic := '0';
signal bar2 : std_logic := '0';
signal bar3 : std_logic := '0';
signal bar4 : std_logic := '0';
signal bar5 : std_logic := '0';
--quarter
signal bar6 : std_logic := '0';
signal bar7 : std_logic := '0';
signal bar9 : std_logic := '0';
signal bar9_2 : std_logic := '0';
signal bar10 : std_logic := '0';
--3 eigth note
signal bar11 : std_logic := '0';
signal bar12 : std_logic := '0';
signal bar13 : std_logic := '0';
signal bar14 : std_logic := '0';
signal bar15 : std_logic := '0';

--extra bars
signal bar1_2 : std_logic := '0';
signal bar6_2 : std_logic := '0';
signal bar11_2 : std_logic := '0';
signal bar4_2 : std_logic := '0';
signal bar3_2 : std_logic := '0';
signal bar2_2 : std_logic := '0';
signal bar14_2 : std_logic := '0';

signal bar10_2 : std_logic := '0';
signal halfnote2 : std_logic := '0';

constant BAR_WIDTH : unsigned(9 downto 0) := to_unsigned(50, 10);
constant BAR_HEIGHT : unsigned(9 downto 0) := to_unsigned(120, 10);
constant SCREEN_HEIGHT : unsigned(9 downto 0) := to_unsigned(480, 10);

begin
process(clk)
begin
        if rising_edge(clk) then
           if game_start = '1' then
				if x = 640 and y = 480 then	
					-- add input from pattern to start counter in if statement
					if counter < 4200 then
						counter <= counter + 1;
						go_to_end <= '0';
					else
					go_to_end <= '1';
					counter <= 0;
					end if;

					-- BAR FALL LOGIC
                        if bar1 = '0' then
							if counter = 970 then
                                        bar1 <= '1';
							elsif counter = 1930 then
                                        bar1 <= '1';
							elsif counter = 2082 then
                                        bar1 <= '1';
							elsif counter = 2320 then
                                        bar1 <= '1';
							elsif counter = 2560 then
                                        bar1 <= '1';
							elsif counter = 2800 then
                                        bar1 <= '1';
							elsif counter = 3040 then
                                        bar1 <= '1';
							elsif counter = 3280 then
                                        bar1 <= '1';
							elsif counter = 3520 then
                                        bar1 <= '1';
							elsif counter = 3760 then
                                        bar1 <= '1';
                                end if;
                        else
                                if bar_position1y < (SCREEN_HEIGHT + BAR_HEIGHT) then
										bar_position1y <= bar_position1y + to_unsigned(FALL_STEP, 9);
										bar1<='1';
										if  bar_position1y > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position1y <= "0000000000"; -- Reset to top
                                        bar1 <= '0'; --bar off
										bar1out <= '0';
                                end if;
                        end if;

                        if bar2 = '0' then
                                if counter = 160 then
                                        bar2 <= '1';
								elsif counter = 880 then
                                        bar2 <= '1';
                                elsif counter = 1120 then
                                        bar2 <= '1';
							   elsif counter = 1840 then --might need new
                                        bar2 <= '1';
								elsif counter = 1540 then
                                        bar2 <= '1';
							   elsif counter = 1840 then
                                        bar2 <= '1';
                                end if;
                        else
                                if bar_position2y < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position2y <= bar_position2y + to_unsigned(FALL_STEP, 9);
										if  bar_position2y > (SCREEN_HEIGHT) then
										bar2out<='1';
									end if;
                                else
                                        bar_position2y <= "0000000000"; -- Reset to top
                                        bar2 <= '0'; --bar off
										 bar2out <= '0';
                                end if;
                        end if;


                        if bar3 = '0' then
                                if counter = 520 then
                                        bar3 <= '1';
							  elsif counter = 1000 then --what is this
                                        bar3 <= '1';
							  elsif counter = 1480 then
                                        bar3 <= '1';
							  elsif counter = 1960 then
                                        bar3 <= '1';
							  elsif counter = 2200 then
                                        bar3 <= '1';
							  elsif counter = 2410 then
                                        bar3 <= '1';
							  elsif counter = 2562 then
                                        bar3 <= '1';
							elsif counter = 2800 then
                                        bar3 <= '1';
							elsif counter = 3040 then
                                        bar3 <= '1';
							elsif counter = 3280 then
                                        bar3 <= '1';
							elsif counter = 3520 then
                                        bar3 <= '1';
							elsif counter = 3760 then
                                        bar3 <= '1';
                                end if;
                        else
                                if bar_position3y < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position3y <= bar_position3y + to_unsigned(FALL_STEP, 9);
									if  bar_position3y > (SCREEN_HEIGHT) then
										bar3out<='1';
									end if;
								else
                                        bar_position3y <= "0000000000"; -- Reset to top
                                        bar3 <= '0'; --bar off
										bar3out <= '0';
										
                                end if;
                        end if;

                        if bar4 = '0' then
                                  if counter = 400 then
                                      bar4 <= '1';
								elsif counter = 1360 then
                                      bar4 <= '1';
                                end if;
                        else
                                if bar_position4y < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position4y <= bar_position4y + to_unsigned(FALL_STEP, 9);
										if  bar_position4y > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position4y <= "0000000000"; -- Reset to top
                                        bar4 <= '0'; --bar off
										bar4out <= '0';
                                end if;
                        end if;

                        --if bar5 = '0' then
							  --if counter = 2800 then
                                        --bar5 <= '1';
                                --end if;
                        --else
                                --if bar_position5y < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        --bar_position5y <= bar_position5y + to_unsigned(FALL_STEP, 9);
                                --else
                                        --bar_position5y <= "0000000000"; -- Reset to top
                                        --bar5 <= '0'; --bar off
										 --bar5outmid <= '1';
                                --end if;
                        --end if;

                        if bar6 = '0' then
                                if counter = 910 then
                                      bar6 <= '1';
							  elsif counter = 910 then
                                      bar6 <= '1';
							elsif counter = 1870 then
                                      bar6 <= '1';
							elsif counter = 2350 then
                                      bar6 <= '1';
							elsif counter = 2830 then
                                      bar6 <= '1';
							elsif counter = 3310 then
                                      bar6 <= '1';
							elsif counter = 3790 then
                                      bar6 <= '1';
                                end if;
                        else
                                if bar_position6y < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position6y <= bar_position6y + to_unsigned(FALL_STEP, 9);
										if  bar_position6y > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position6y <= "0000000000"; -- Reset to top
                                        bar6 <= '0'; --bar off
									  bar1out <= '0'; -- becoems fuzzy when i use the same bar
                                end if;
                        end if;

                        if bar7 = '0' then
                                if counter = 580 then
                                        bar7 <= '1';
                                end if;
                        else
                                if bar_position7y < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position7y <= bar_position7y + to_unsigned(FALL_STEP, 9);
										if  bar_position7y > (SCREEN_HEIGHT) then
										bar2out<='1';
										end if;
                                else
                                        bar_position7y <= "0000000000"; -- Reset to top
                                        bar7 <= '0'; --bar off
									  bar2out <= '0';
                                end if;
                        end if;

                        if bar9_2 = '0' then
                                if counter = 2440 then
                                        bar9_2 <= '1';
                                elsif counter = 2920 then
                                        bar9_2 <= '1';
								elsif counter = 3400 then
                                        bar9_2 <= '1';
							elsif counter = 3880 then
                                        bar9_2 <= '1';
                                end if;
                        else
                                if bar_position9y2 < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position9y2 <= bar_position9y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position9y2 > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position9y2 <= "0000000000"; -- Reset to top
                                        bar9_2 <= '0'; --bar off
									bar4out <= '0';
                                end if;
                        end if;

                        if bar9 = '0' then
                                if counter = 190 then
                                        bar9 <= '1';
                                elsif counter = 1150 then
                                        bar9 <= '1';
							elsif counter = 2350 then
                                        bar9 <= '1';
							elsif counter = 2830 then
                                        bar9 <= '1';
							elsif counter = 3310 then
                                        bar9 <= '1';
							elsif counter = 3790 then
                                        bar9 <= '1';
                                end if;
                        else
                                if bar_position9y < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position9y <= bar_position9y + to_unsigned(FALL_STEP, 9);
										if  bar_position9y > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position9y <= "0000000000"; -- Reset to top
                                        bar9 <= '0'; --bar off
										 bar4out <= '0';
                                end if;
                        end if;

                        if bar10 = '0' then
                                if counter = 250 then
                                        bar10 <= '1';
                                elsif counter = 1210 then
                                        bar10 <= '1';
								elsif counter = 2500 then
                                        bar10 <= '1';
								elsif counter = 2980 then
                                        bar10 <= '1';
								elsif counter = 3460 then
                                        bar10 <= '1';
								elsif counter = 3940 then
                                        bar10 <= '1';
                                end if;
                        else
                                if bar_position10y < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position10y <= bar_position10y + to_unsigned(FALL_STEP, 9);
										if  bar_position10y > (SCREEN_HEIGHT) then
										bar5out<='1';
									end if;
                                else
                                        bar_position10y <= "0000000000"; -- Reset to top
                                        bar10 <= '0'; --bar off
										 bar5out <= '0';
                                end if;
                        end if;

							if bar11 = '0' then
                                if counter = 310 then
                                        bar11 <= '1';
                                elsif counter = 730 then
                                        bar11<= '1';
								elsif counter = 1030 then
                                        bar11<= '1';
								elsif counter = 1270 then
                                        bar11<= '1';
								elsif counter = 1690 then
                                        bar11<= '1';
								elsif counter = 1990 then
                                        bar11<= '1';
								elsif counter = 2230 then
                                        bar11<= '1';
								elsif counter = 2470 then
                                        bar11<= '1';
								elsif counter = 2710 then
                                        bar11<= '1';
								elsif counter = 2950 then
                                        bar11<= '1';
								elsif counter = 3190 then
                                        bar11<= '1';
								elsif counter = 3430 then
                                        bar11<= '1';
								elsif counter = 3670 then
                                        bar11<= '1';
								elsif counter = 3910 then
                                        bar11<= '1';
                                end if;
                        else
                                if bar_position11y < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
										bar_position11y <= bar_position11y + to_unsigned(FALL_STEP, 9);
										if  bar_position11y > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position11y <= "0000000000"; -- Reset to top
                                        bar11 <= '0'; --bar off
										bar1out <= '0';
                                end if;
                        end if;

                        if bar12 = '0' then
                                --if counter = 400 then
                                        --bar12 <= '1';  
								if counter = 550 then 
                                        bar12 <= '1';
								elsif counter = 1510 then
                                        bar12 <= '1';
                                end if;
                        else
                                if bar_position12y < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        bar_position12y <= bar_position12y + to_unsigned(FALL_STEP, 9);
										if  bar_position12y > (SCREEN_HEIGHT) then
										bar2out<='1';
									end if;
                                else
                                        bar_position12y <= "0000000000"; -- Reset to top
                                        bar12 <= '0'; --bar off
										 bar2out <= '0';
                                end if;
                        end if;


                        if bar13 = '0' then
                                if counter = 310 then
                                        bar13 <= '1';
                                elsif counter = 790 then
                                        bar13 <= '1';
								--elsif counter = 1270 then
                                        --bar13 <= '1';
							    elsif counter = 1750 then
                                        bar13 <= '1';
								--else
									--bar13 <= '0';
                                end if;
                        else
                                if bar_position13y < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        bar_position13y <= bar_position13y + to_unsigned(FALL_STEP, 9);
										if  bar_position13y > (SCREEN_HEIGHT) then
										bar3out<='1';
									end if;
                                else
                                        bar_position13y <= "0000000000"; -- Reset to top
                                        bar13 <= '0'; --bar off
									bar3out<='0';
                                end if;
                        end if;

                        if bar14 = '0' then
                                if counter = 1030 then
                                      bar14 <= '1';
								elsif counter = 1030 then
                                      bar14 <= '1';
								elsif counter = 1990 then
                                      bar14 <= '1';
								elsif counter = 2230 then
                                      bar14 <= '1';
								elsif counter = 2710 then
                                      bar14 <= '1';
								elsif counter = 3190 then
                                      bar14 <= '1';
								elsif counter = 3670 then
                                      bar14 <= '1';
                                end if;
                        else
                                if bar_position14y < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        bar_position14y <= bar_position14y + to_unsigned(FALL_STEP, 9);
										if  bar_position14y > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position14y <= "0000000000"; -- Reset to top
                                        bar14 <= '0'; --bar off
										bar4out <= '0';
                                end if;
                        end if;

                        --if bar15 = '0' then
                                --if counter = 2470 then
                                        --bar15 <= '1';
                                --elsif counter = 2950 then
                                        --bar15 <= '1';
							--elsif counter = 3430 then
                                        --bar15 <= '1';
							--elsif counter = 3910 then
                                        --bar15 <= '1';
                                --end if;
                        --else
                                --if bar_position15y < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        --bar_position15y <= bar_position15y + to_unsigned(FALL_STEP, 9);
                                --else
                                        --bar_position15y <= "0000000000"; -- Reset to top
                                        --bar15 <= '0'; --bar off
										 --bar5outmid <= '1';
                                --end if;
                        --end if;
						
					  if bar1_2 = '0' then
								if counter = 1000 then
                                        bar1_2 <= '1';
								elsif counter = 1960 then
                                        bar1_2 <= '1';
								elsif counter = 2200 then
                                        bar1_2 <= '1';
								elsif counter = 2680 then
                                        bar1_2 <= '1';
								elsif counter = 3160 then
                                        bar1_2 <= '1';
								elsif counter = 3640 then
                                        bar1_2 <= '1';
                                end if;
                       else
                                if bar_position1y2 < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position1y2 <= bar_position1y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position1y2 > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position1y2 <= "0000000000"; -- Reset to top
                                        bar1_2 <= '0'; --bar off
										bar1out <= '0';
                                end if;
                        end if;
						
						if bar6_2 = '0' then
                                if counter = 2410 then
                                        bar6_2 <= '1';
								elsif counter = 2410 then
                                        bar6_2 <= '1';
								elsif counter = 2890 then
                                        bar6_2 <= '1';
								elsif counter = 3370 then
                                        bar6_2 <= '1';
								elsif counter = 3850 then
                                        bar6_2 <= '1';
                                end if;
                       else
                                if bar_position6y2 < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position6y2 <= bar_position6y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position6y2 > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position6y2 <= "0000000000"; -- Reset to top
                                        bar6_2 <= '0'; --bar off
										 bar1out <= '0';
                                end if;
                        end if;
						
						if bar11_2 = '0' then
                                if counter = 820 then
                                        bar11_2 <= '1';
								elsif counter = 1780 then
                                        bar11_2 <= '1';
								elsif counter = 2110 then
                                        bar11_2 <= '1';
								elsif counter = 2590 then
                                        bar11_2 <= '1';
								elsif counter = 3070 then
                                        bar11_2 <= '1';
								elsif counter = 3550 then
                                        bar11_2 <= '1';
                                end if;
                       else
                                if bar_position11y2 < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        bar_position11y2 <= bar_position11y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position11y2 > (SCREEN_HEIGHT) then
										bar1out<='1';
									end if;
                                else
                                        bar_position11y2 <= "0000000000"; -- Reset to top
                                        bar11_2 <= '0'; --bar off
										bar1out <= '0';
                                end if;
                        end if;
						
						if bar4_2 = '0' then
								if counter = 490 then
                                      bar4_2 <= '1';
								elsif counter = 1450 then
                                      bar4_2 <= '1';
                                end if;
                        else
                                if bar_position4y2 < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position4y2 <= bar_position4y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position4y2 > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position4y2 <= "0000000000"; -- Reset to top
                                        bar4_2 <= '0'; --bar off
										bar4out <= '0';
                                end if;
                        end if;
						
						if bar3_2 = '0' then
								if counter = 640 then
                                      bar3_2 <= '1';
								elsif counter = 1600 then
                                        bar3_2 <= '1';
								elsif counter = 2080 then
                                        bar3_2 <= '1';
								elsif counter = 2110 then
                                        bar3_2 <= '1';
								elsif counter = 2320 then
                                        bar3_2 <= '1';
								elsif counter = 2680 then
                                        bar3_2 <= '1';
								elsif counter = 2890 then
                                        bar3_2 <= '1';
								elsif counter = 3160 then
                                        bar3_2 <= '1';
								elsif counter = 3370 then
                                        bar3_2 <= '1';
								elsif counter = 3640 then
                                        bar3_2 <= '1';
								elsif counter = 3850 then
                                        bar3_2 <= '1';
                                end if;
                        else
                                if bar_position3y2 < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position3y2 <= bar_position3y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position3y2 > (SCREEN_HEIGHT) then
										bar3out<='1';
									end if;
                                else
                                        bar_position3y2 <= "0000000000"; -- Reset to top
                                        bar3_2 <= '0'; --bar off
										bar3out <= '0';
                                end if;
                        end if;
						
						if bar2_2 = '0' then
								if counter = 970 then
                                        bar2_2 <= '1';
								elsif counter = 1930 then
                                        bar2_2 <= '1';
                                end if;
                        else
                                if bar_position2y2 < (SCREEN_HEIGHT + BAR_HEIGHT) then
                                        bar_position2y2 <= bar_position2y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position2y2 > (SCREEN_HEIGHT) then
										bar2out<='1';
									end if;
                                else
                                        bar_position2y2 <= "0000000000"; -- Reset to top
                                        bar2_2 <= '0'; --bar off
									bar2out<= '0';
                                end if;
                        end if;
						
						if bar14_2 = '0' then
								if counter = 2140 then
                                      bar14_2 <= '1';
                              elsif counter = 2110 then
                                      bar14_2 <= '1';
								elsif counter = 2590 then
                                      bar14_2 <= '1';
								elsif counter = 3070 then
                                      bar14_2 <= '1';
								elsif counter = 3550 then
                                      bar14_2 <= '1';
								end if;
                        else
                                if bar_position14y2 < (SCREEN_HEIGHT + 3*BAR_HEIGHT) then
                                        bar_position14y2 <= bar_position14y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position14y2 > (SCREEN_HEIGHT) then
										bar4out<='1';
									end if;
                                else
                                        bar_position14y2 <= "0000000000"; -- Reset to top
                                        bar14_2 <= '0'; --bar off
										bar4out <= '0';
                                end if;
                        end if;
						
						if bar10_2 = '0' then
								if counter = 430 then
                                      bar10_2 <= '1';
                              elsif counter = 1390 then
                                      bar10_2 <= '1';
								end if;
                        else
                                if bar_position10y2 < (SCREEN_HEIGHT + 2*BAR_HEIGHT) then
                                        bar_position10y2 <= bar_position10y2 + to_unsigned(FALL_STEP, 9);
										if  bar_position10y2 > (SCREEN_HEIGHT) then
										bar5out<='1';
									end if;
                                else
                                        bar_position10y2 <= "0000000000"; -- Reset to top
                                        bar10_2 <= '0'; --bar off
									bar5out <= '0';
                                end if;
                        end if;
						
					
						if halfnote2 = '0' then
								if counter = 670 then
                                      halfnote2 <= '1';
                              elsif counter = 1630 then
                                      halfnote2 <= '1';
								end if;
                        else
                                if halfnotey2 < (SCREEN_HEIGHT + 4*BAR_HEIGHT) then
                                        halfnotey2 <= halfnotey2 + to_unsigned(FALL_STEP, 9);
										if  halfnotey2 > (SCREEN_HEIGHT) then
										bar2out<='1';
									end if;
                                else
                                        halfnotey2 <= "0000000000"; -- Reset to top
                                        halfnote2 <= '0'; --bar off
										bar2out <= '0';
                                end if;
                        end if;
					end if;	
                end if;
    end if;
end process;
-- RGB yellow "001111", blue: "110000", orang "001011"
-- RGB


                        --rgb <= "001100" when (y >= bar_position1y) and (y < (bar_position1y + BAR_HEIGHT)) and (to_integer(x) < BAR_WIDTH) else -- Bar 1 color
						rgb <= "000011" when (y > bar_position1y-BAR_HEIGHT or (bar_position1y-BAR_HEIGHT>bar_position1y)) and (y < bar_position1y) and (x < BAR_WIDTH) else
						"001111" when (y > bar_position2y-BAR_HEIGHT or (bar_position2y-BAR_HEIGHT>bar_position2y)) and (y < bar_position2y) and (x >= bar_position2x and (x < bar_position2x + BAR_WIDTH)) else
						"110000" when (y > bar_position3y-BAR_HEIGHT or (bar_position3y-BAR_HEIGHT>bar_position3y)) and (y < bar_position3y) and (x >= bar_position3x and (x < bar_position3x + BAR_WIDTH)) else
						"001011" when (y > bar_position4y-BAR_HEIGHT or (bar_position4y-BAR_HEIGHT>bar_position4y)) and (y < bar_position4y) and (x >= bar_position4x and (x < bar_position4x + BAR_WIDTH)) else
						"111111" when (y > bar_position5y-BAR_HEIGHT or (bar_position5y-BAR_HEIGHT>bar_position5y)) and (y < bar_position5y) and (x >= bar_position5x and (x < bar_position5x + BAR_WIDTH)) else
						"000011" when (y > bar_position6y-2*BAR_HEIGHT or (bar_position6y-2*BAR_HEIGHT>bar_position6y)) and (y < bar_position6y) and (x < BAR_WIDTH) else
						"001111" when (y > bar_position7y-2*BAR_HEIGHT or (bar_position7y-2*BAR_HEIGHT>bar_position7y)) and (y < bar_position7y) and (x >= bar_position7x and (x < bar_position7x + BAR_WIDTH)) else
						"001011" when (y > bar_position9y2-2*BAR_HEIGHT or (bar_position9y2-2*BAR_HEIGHT>bar_position9y2)) and (y < bar_position9y2) and (x >= bar_position9x2 and (x < bar_position9x2 + BAR_WIDTH)) else
						"001011" when (y > bar_position9y-2*BAR_HEIGHT or (bar_position9y-2*BAR_HEIGHT>bar_position9y)) and (y < bar_position9y) and (x >= bar_position9x and (x < bar_position9x + BAR_WIDTH)) else
						"111111" when (y > bar_position10y-2*BAR_HEIGHT or (bar_position10y-2*BAR_HEIGHT>bar_position10y)) and (y < bar_position10y) and (x >= bar_position10x and (x < bar_position10x + BAR_WIDTH)) else
						"000011" when (y > bar_position11y-3*BAR_HEIGHT or (bar_position11y-3*BAR_HEIGHT>bar_position11y)) and (y < bar_position11y) and (x < BAR_WIDTH) else
						"001111" when (y > bar_position12y-3*BAR_HEIGHT or (bar_position12y-3*BAR_HEIGHT>bar_position12y)) and (y < bar_position12y) and (x >= bar_position12x and (x < bar_position12x + BAR_WIDTH)) else
						"110000" when (y > bar_position13y-3*BAR_HEIGHT or (bar_position13y-3*BAR_HEIGHT>bar_position13y)) and (y < bar_position13y) and (x >= bar_position13x and (x < bar_position13x + BAR_WIDTH)) else
						"001011" when (y > bar_position14y-3*BAR_HEIGHT or (bar_position14y-3*BAR_HEIGHT>bar_position14y)) and (y < bar_position14y) and (x >= bar_position14x and (x < bar_position14x + BAR_WIDTH)) else
						"111111" when (y > bar_position15y-3*BAR_HEIGHT or (bar_position15y-3*BAR_HEIGHT>bar_position15y)) and (y < bar_position15y) and (x >= bar_position15x and (x < bar_position15x + BAR_WIDTH)) else
						"001111" when (y > bar_position2y2-BAR_HEIGHT or (bar_position2y2-BAR_HEIGHT>bar_position2y2)) and (y < bar_position2y2) and (x >= bar_position2x2 and (x < bar_position2x2 + BAR_WIDTH)) else
						"110000" when (y > bar_position3y2-BAR_HEIGHT or (bar_position3y2-BAR_HEIGHT>bar_position3y2)) and (y < bar_position3y2) and (x >= bar_position3x2 and (x < bar_position3x2 + BAR_WIDTH)) else
						"001011" when (y > bar_position4y2-BAR_HEIGHT or (bar_position4y2-BAR_HEIGHT>bar_position4y2)) and (y < bar_position4y2) and (x >= bar_position4x2 and (x < bar_position4x2 + BAR_WIDTH)) else
						"001011" when (y > bar_position14y2-3*BAR_HEIGHT or (bar_position14y2-3*BAR_HEIGHT>bar_position14y2)) and (y < bar_position14y2) and (x >= bar_position14x2 and (x < bar_position14x2 + BAR_WIDTH)) else
						"000011" when (y > bar_position1y2-BAR_HEIGHT or (bar_position1y2-BAR_HEIGHT>bar_position1y2)) and (y < bar_position1y2) and (x < BAR_WIDTH) else
						"000011" when (y > bar_position6y2-2*BAR_HEIGHT or (bar_position6y2-2*BAR_HEIGHT>bar_position6y2)) and (y < bar_position6y2) and (x < BAR_WIDTH) else
						"000011" when (y > bar_position11y2-3*BAR_HEIGHT or (bar_position11y2-3*BAR_HEIGHT>bar_position11y2)) and (y < bar_position11y2) and (x < BAR_WIDTH) else
						"001111" when (y > halfnotey2-4*BAR_HEIGHT or (halfnotey2-4*BAR_HEIGHT>halfnotey2)) and (y < halfnotey2) and (x >= halfnotex2 and (x < halfnotex2 + BAR_WIDTH)) else
						"111111" when (y > bar_position10y2-2*BAR_HEIGHT or (bar_position10y2-2*BAR_HEIGHT>bar_position10y2)) and (y < bar_position10y2) and (x >= bar_position10x2 and (x < bar_position10x2 + BAR_WIDTH)) else
                        "000000"; -- Background

end synth;


