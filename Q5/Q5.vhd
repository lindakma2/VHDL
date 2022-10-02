library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Q5 is
    port(
        CLK,x: in std_logic;
        DOUT : out std_logic_vector (2 downto 0)
    );
end Q5;
architecture behav of Q5 is

signal temp:std_logic_vector(2 downto 0); 

begin
    process(CLK,x)
    begin
     if(clk'event and clk = '1')then
		if(x='1')then
		case temp is
			when "000" =>temp<="001";
			when "001" =>temp<="011";
			when "011" =>temp<="010";
			when "010" =>temp<="110";
			when "110" =>temp<="111";
			when "111" =>temp<="101";
			when "101" =>temp<="100";
			when "100" =>temp<="000";
		end case;
		else
		case temp is
			when "000" =>temp<="100";
			when "100" =>temp<="101";
			when "101" =>temp<="111";
			when "111" =>temp<="110";
			when "110" =>temp<="010";
			when "010" =>temp<="011";
			when "011" =>temp<="001";
			when "001" =>temp<="000";
		end case;
		end if;
		dout<=temp;
	end if;
    end process;
end behav;