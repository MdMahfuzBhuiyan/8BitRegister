library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register8BitTb is
end Register8BitTb;

architecture behavior of Register8bitTb is 

    component Register8Bit
    port(
         D     : in  std_logic_vector(7 downto 0);
         LOAD  : in  std_logic;
         CLK   : in  std_logic;
         RESET : in  std_logic;
         Q     : out std_logic_vector(7 downto 0)
        );
    end component;

   signal D     : std_logic_vector(7 downto 0) := (others => '0');
   signal LOAD  : std_logic := '0';
   signal CLK   : std_logic := '0';
   signal RESET : std_logic := '0';

   signal Q : std_logic_vector(7 downto 0);

   constant CLK_period : time := 20 ns;

begin

   uut: Register8Bit port map (
          D     => D,
          LOAD  => LOAD,
          CLK   => CLK,
          RESET => RESET,
          Q     => Q
        );

   CLK_process :process
   begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
   end process;

   stim_proc: process
   begin		
  
      RESET <= '1';
      wait for 40 ns;
      RESET <= '0';
      wait for 20 ns;

      LOAD <= '1';
      D <= "10101010";
      wait for 40 ns;

      LOAD <= '0';
      D <= "11111111";
      wait for 40 ns;

      LOAD <= '1';
      D <= "01010101";
      wait for 40 ns;

      RESET <= '1';
      wait for 40 ns;
      RESET <= '0';

      wait;
   end process;

end behavior;