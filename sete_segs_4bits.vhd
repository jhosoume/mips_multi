library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sete_segs_4bits is
	port (
		binary: in std_logic_vector(3 downto 0);
		segs: out std_logic_vector(0 to 6)
	);
end sete_segs_4bits;

architecture behavioral of sete_segs_4bits is
begin
	with binary select
		segs <= 	"1000000" when "0000",	--0
					"1111001" when "0001",	--1
					"0100100" when "0010",	--2
					"0110000" when "0011",	--3
					"0011001" when "0100",	--4
					"0010010" when "0101",	--5
					"0000010" when "0110",	--6
					"1111000" when "0111",	--7
					"0000000" when "1000",	--8
					"0010000" when "1001",	--9
					"0001000" when "1010",	--A
					"0000011" when "1011",	--B
					"1000110" when "1100",	--C
					"0100001" when "1101",	--D
					"0000110" when "1110",	--E
					"0001110" when "1111",	--F
					"1111111" when others;	--OTHERS
end architecture behavioral;