library ieee;
use ieee.std_logic_1164.all;
use work.mips_pkg.all;

entity MULTI_FPGA is
	port 
	(
		clk		: in std_logic;
		clk_rom	: in std_logic;
		rst	   : in std_logic;
		debug		: in std_logic_vector(1 downto 0);
		display7seg0 : out std_logic_vector(6 downto 0);
		display7seg1 : out std_logic_vector(6 downto 0);
		display7seg2 : out std_logic_vector(6 downto 0);
		display7seg3 : out std_logic_vector(6 downto 0);
		display7seg4 : out std_logic_vector(6 downto 0);
		display7seg5 : out std_logic_vector(6 downto 0);
		display7seg6 : out std_logic_vector(6 downto 0);
		display7seg7 : out std_logic_vector(6 downto 0)
	);
end entity;
	
architecture Behavioral of MULTI_FPGA is

	signal output : std_logic_vector(31 downto 0);

begin

	multMIPS: mips_multi
		PORT MAP (
			clk => clk,
			clk_rom => clk_rom,
			rst => rst,
			debug => debug,
			data => output
		);
		
	DISP0: sete_segs_4bits
		PORT MAP(
			binary => output(3 downto 0),
			segs => display7seg0
		);
	
	DISP1: sete_segs_4bits
		PORT MAP(
			binary => output(7 downto 4),
			segs => display7seg0
		);
	
	DISP2: sete_segs_4bits
		PORT MAP(
			binary => output(11 downto 8),
			segs => display7seg0
		);
		
	DISP3: sete_segs_4bits
		PORT MAP(
			binary => output(15 downto 12),
			segs => display7seg0
		);
		
	DISP4: sete_segs_4bits
		PORT MAP(
			binary => output(19 downto 16),
			segs => display7seg0
		);
		
	DISP5: sete_segs_4bits
		PORT MAP(
			binary => output(23 downto 20),
			segs => display7seg0
		);

	DISP6: sete_segs_4bits
		PORT MAP(
			binary => output(27 downto 24),
			segs => display7seg0
		);

	DISP7: sete_segs_4bits
		PORT MAP(
			binary => output(31 downto 28),
			segs => display7seg0
		);

end Behavioral;
