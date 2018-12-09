library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use work.mips_pkg.all;

entity store_byte_selector is
	generic (
		SIZE : natural := 32 );
	port (
	 	data_in		: in std_logic_vector(SIZE-1 downto 0);
		byteaddr		: in std_logic_vector(1 downto 0); -- recebe qual o byte a ser escrito
		sel			: in std_logic_vector(1 downto 0); -- qual a instrucao a ser exec (sb, sh ou sw)
		data_out		: out std_logic_vector(SIZE-1 downto 0);
		byteena		: out std_logic_vector(3 downto 0));
end entity;

-- 00 -> sw (recebimento padrao)
-- 01 -> sb
-- 10 -> sh

architecture rtl of store_byte_selector is
	alias b0	: std_logic_vector(7 downto 0) is data_in(7 downto 0);
	alias b1	: std_logic_vector(15 downto 8) is data_in(7 downto 0);
	alias b2	: std_logic_vector(23 downto 16) is data_in(7 downto 0);
	alias b3	: std_logic_vector(31 downto 24) is data_in(7 downto 0);
begin
	data_out <= data_in when (sel = "00") else
					(b1 & b0 & b1 & b0) when (sel = "10") else
					(b0 & b0 & b0 & b0) when (sel = "01") else
					data_in;

	byteena <= "0001" when (sel = "01" and byteaddr 	= "00") else
				  "0010" when (sel = "01" and byteaddr 	= "01") else
				  "0100" when (sel = "01" and byteaddr 	= "10") else 
				  "1000" when (sel = "01" and byteaddr 	= "11") else
				  "1100" when (sel = "10" and byteaddr(1) = '1') else
				  "0011" when (sel = "10" and byteaddr(1) = '0') else
				  "1111";
end architecture;