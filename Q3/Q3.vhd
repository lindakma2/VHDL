LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
entity Q3 is
port(Clock : IN STD_LOGIC ;
Q : OUT STD_LOGIC;
in1,in2:in std_logic;
a,b:in std_logic
);
end Q3;

architecture arch of Q3 is

signal x1:std_logic;
signal x2:std_logic;
begin 
x1<=a and b;

process(x1,in1,in2)
begin
if(x1='0')then
x2<=in1;
elsif(x1='1')then
x2<=in2;
end if;
end process;

PROCESS ( Clock,x2 )
BEGIN
IF Clock'EVENT AND Clock = '1' THEN
Q <= x2 ;
END IF ;
END PROCESS ;

end arch;

