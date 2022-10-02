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
           if(clk'event and clk='1') then
                 Q <= Din;
               end if;
        end process;
end DFF_arch;

library ieee;
use ieee.std_logic_1164.all;

entity generater is
    port (input,clk1 : in std_logic;
             Q: out std_logic_vector(3 downto 0)
          );
 end generater;


ARCHITECTURE g OF generater IS
component D_flip_flop
port (clk,Din : in std_logic;
             Q: out std_logic);
end component;
signal din:std_logic_vector(4 downto 0); 
BEGIN
din(0)<=input;
G1:for I in 3 downto 0 generate
FA: D_flip_flop port map (clk1,din(I),din(I+1));
end generate G1;

Q(0)<=din(1);
Q(1)<=din(2);
Q(2)<=din(3);
Q(3)<=din(4);
END g; 