LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity fa is
port (a,b,c :in std_logic;
sum,cv:out std_logic
);
end fa;

architecture behav of fa is
begin
sum<=a xor b xor c;
cv<=(a and b) or ((a xor b)and c);
end behav;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity q1 is
port (
a,b :in std_logic_vector(3 downto 0);
cin :in std_logic;
s :out std_logic_vector(3 downto 0);
cv :out std_logic);
end;
architecture struct of q1 is
component fa
port (a,b,c :in std_logic;
sum,cv:out std_logic
);
end component;
signal cv0,cv1,cv2 :std_logic;
signal bi:std_logic_vector(3 downto 0);
begin
bi(0)<=b(0) xor cin;
bi(1)<=b(1) xor cin;
bi(2)<=b(2) xor cin;
bi(3)<=b(3) xor cin;
fa0:fa
port map(a=>a(0),b=>bi(0),c=>cin,sum=>s(0),cv=>cv0);
fa1:fa
port map(a=>a(1),b=>bi(0),c=>cv0,sum=>s(1),cv=>cv1);
fa2:fa
port map(a=>a(2),b=>bi(0),c=>cv1,sum=>s(2),cv=>cv2);
fa3:fa
port map(a=>a(3),b=>bi(0),c=>cv2,sum=>s(3),cv=>cv);
end struct;

