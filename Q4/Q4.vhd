library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q4 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           ci : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (4 downto 0));
end Q4;

architecture Behavioral of Q4 is

signal g:STD_LOGIC_VECTOR (4 downto 0);
signal p:STD_LOGIC_VECTOR (4 downto 0);
signal c:STD_LOGIC_VECTOR (4 downto 0);

begin
    product_loop: for i in 0 to 3 generate
        p(i) <= a(i) xor b(i);
        g(i) <= a(i) and b(i);

    end generate;

    s(0) <= p(0) xor ci;
    sum_loop: for i in 0 to 3 generate
        s(i+1) <= p(i+1) xor c(i);
    end generate;

    c(0) <=
        g(0) or
        (ci and p(0));

    c(1) <=
        g(1) or
        (g(0) and p(1)) or
        (ci and p(1) and p(0));

    c(2) <=
        g(2) or
        (g(1) and p(2)) or
        (g(0) and p(2) and p(1)) or
        (ci and p(2) and p(1) and p(0));

    c(3) <=
        g(3) or
        (g(2) and p(3)) or
        (g(1) and p(3) and p(2)) or
        (g(0) and p(3) and p(2) and p(1)) or
        (ci and p(3) and p(2) and p(1) and p(0));
end Behavioral;