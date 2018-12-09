library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
use work.mips_pkg.all;

entity load_byte_selector is
	generic (
		SIZE : natural := 32 );
	port (
	 	data_in		: in std_logic_vector(SIZE-1 downto 0);
		sel			: in std_logic_vector(2 downto 0);
		byteaddress : in std_logic_vector(1 downto 0); -- recebe qual o byte a ser lido
		data_out		: out std_logic_vector(SIZE-1 downto 0));
end entity;

-- 000 -> lw (selecao normal para todas as intrucoes)
-- 1XX -> sem sinal (extende com 0s)
-- 0XX -> extensao considerando sinal da saida
-- 101 -> lbu
-- 110 -> lhu
-- 001 -> lb
-- 010 -> lh

-- byteaddress = "0001" 00
-- byteaddress = "0010" 01
-- byteaddress = "0100" 10
-- byteaddress = "1000" 11

architecture rtl of load_byte_selector is
	alias b0	: std_logic_vector(7 downto 0) is data_in(7 downto 0);
	alias b1	: std_logic_vector(15 downto 8) is data_in(7 downto 0);
	alias b2	: std_logic_vector(23 downto 16) is data_in(7 downto 0);
	alias b3	: std_logic_vector(31 downto 24) is data_in(7 downto 0);
	
	signal tmp1byte  : std_logic_vector(7 downto 0);
	signal tmp2bytes : std_logic_vector(15 downto 0);
begin
	tmp1byte <= b0 when (byteaddress = "00") else
					b1 when (byteaddress = "01") else
					b2 when (byteaddress = "10") else
					b3 when (byteaddress = "11") else
					b0;
	
	tmp2bytes <= (b3 & b2) when (byteaddress(1) = '1') else
					 (b1 & b0) when (byteaddress(1) = '0') else
					 (b1 & b0);
	
	data_out <= data_in when (sel = "000") else
					std_logic_vector(resize(unsigned(tmp2bytes), 32)) when (sel = "110") else
					std_logic_vector(resize(  signed(tmp2bytes), 32)) when (sel = "010") else
					std_logic_vector(resize(unsigned(tmp1byte),  32)) when (sel = "101") else
					std_logic_vector(resize(  signed(tmp1byte),  32)) when (sel = "001") else
					data_in;
end architecture;