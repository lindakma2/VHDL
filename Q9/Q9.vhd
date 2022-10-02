LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Q9 IS
PORT ( A,B,C,D,E: IN STD_LOGIC;
Y1,Y2,Y3 : OUT STD_LOGIC);
END Q9;
ARCHITECTURE a OF Q9 IS
signal tempend:std_logic;
function Fn1(F1,F2,F3,F4:std_logic) return std_logic is
variable temp:std_logic;
begin
temp:=(F1 xor F2) xor (F3 xor F4);
Return temp;
end function Fn1; 

BEGIN
process(A,B,C,D,E)
begin
tempend<=Fn1(A,B,C,D) xor E;
--�I�sFn1�禡(�ϥΦ�m������ܪk)
Y1<=tempend;
--�I�sFn1�禡(�ϥΦW�ٹ�����ܪk)
Y2<=tempend;
--�I�sFn1�禡(��m�P�W�ٹ����V�X�k)
Y3<=tempend;
end process;
end a; 