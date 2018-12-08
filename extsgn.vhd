
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mips_pkg.all;

entity extsgn is
	generic (
		IN_SIZE : natural := 16;
		OUT_SIZE : natural := 32	
		);
	port (
		is_unsigned : in std_logic;
		input : in std_logic_vector(IN_SIZE-1 downto 0);
		output: out std_logic_vector(OUT_SIZE-1 downto 0)
		);
end entity;
		
architecture wires of extsgn is
--signal tmp : std_logic_vector(OUT_SIZE-1 downto 0);
begin
	--output <= tmp;
	--tmp(IN_SIZE-1 downto 0) <= input;
	--tmp(OUT_SIZE-1 downto IN_SIZE) <= (others => input(IN_SIZE-1));
	output <= std_logic_vector(resize(unsigned(input), 32)) when (is_unsigned = '1') else std_logic_vector(resize(signed(input), 32));
end wires;