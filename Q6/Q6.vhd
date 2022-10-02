library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity adder_3_bit is
    port(
    a,b : in std_logic_vector(2 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(2 downto 0)
    );
end adder_3_bit;
architecture behav of adder_3_bit is 
    signal temp : std_logic_vector(3 downto 0);
    begin
    temp <= ('0' & a) + ('0' & b) + ("000" & cin);
    sum <= temp(2 downto 0);
    cout <= temp(3);
end behav;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Q6 is
    port(
    a,b : in std_logic_vector(2 downto 0);
    x:out std_logic_vector(5 downto 0)
    );
end Q6;

architecture behav of Q6 is 

signal augend: std_logic_vector(2 downto 0);
signal adden: std_logic_vector(2 downto 0);
signal sum: std_logic_vector(2 downto 0);
signal cout:std_logic;
signal augend2: std_logic_vector(2 downto 0);
signal adden2: std_logic_vector(2 downto 0);
signal sum2: std_logic_vector(2 downto 0);
signal cout2:std_logic;
	
component adder_3_bit
    port(
    a,b : in std_logic_vector(2 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(2 downto 0)
    );
end component;	
begin
    x(0)<=a(0)and b(0);
    augend(0)<=b(0)and a(1);
    augend(1)<=b(0)and a(2);
    augend(2)<='0';
    adden(0)<=b(1)and a(0);
    adden(1)<=b(1)and a(1);
    adden(2)<=b(1)and a(2);
u1:adder_3_bit port map(augend,adden,'0',cout,sum);
	x(1)<=sum(0);
	augend2(0)<=sum(1);
    augend2(1)<=sum(2);
    augend2(2)<=cout;
    adden2(0)<=b(2)and a(0);
    adden2(1)<=b(2)and a(1);
    adden2(2)<=b(2)and a(2);
u2:adder_3_bit port map(augend2,adden2,'0',cout2,sum2);
	x(2)<=sum2(0);
	x(3)<=sum2(1);
	x(4)<=sum2(2);
	x(5)<=cout2;
end behav;