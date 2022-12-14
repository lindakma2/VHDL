library ieee;
use ieee.std_logic_1164.all;
entity D_flip_flop is
    port (clk,Din : in std_logic;
             Q: out std_logic);
 end D_flip_flop;
architecture DFF_arch of D_flip_flop is
    begin
        process (clk,Din)
          begin
           if(clk 'event and clk='1') then
                 Q <= Din;
               end if;
        end process;
end DFF_arch;

library ieee;
use ieee.std_logic_1164.all;
entity Q8 is
    port (load,clock,serial : in std_logic;
          parallel : in std_logic_vector(3 downto 0);
          Q: out std_logic_vector(3 downto 0));
 end Q8;
architecture arch of Q8 is
component D_flip_flop is
    port (clk,Din : in std_logic;
             Q: out std_logic);
end component;

signal andline:std_logic_vector(7 downto 0);
signal orline:std_logic_vector(3 downto 0);
signal qout:std_logic_vector(3 downto 0);

begin
andline(0)<=not load and serial;
andline(1)<=load and parallel(0);
andline(2)<=not load and qout(0);
andline(3)<=load and parallel(1);
andline(4)<=not load and qout(1);
andline(5)<=load and parallel(2);
andline(6)<=not load and qout(2);
andline(7)<=load and parallel(3);
orline(0)<=andline(0)or andline(1);
orline(1)<=andline(2)or andline(3);
orline(2)<=andline(4)or andline(5);
orline(3)<=andline(6)or andline(7);
U1: D_flip_flop port map(clock,orline(0),qout(0));
U2: D_flip_flop port map(clock,orline(1),qout(1));
U3: D_flip_flop port map(clock,orline(2),qout(2));
U4: D_flip_flop port map(clock,orline(3),qout(3));
Q(0)<=qout(0);
Q(1)<=qout(1);
Q(2)<=qout(2);
Q(3)<=qout(3);
end arch;