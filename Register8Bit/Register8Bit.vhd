library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register8Bit is
    Port ( D     : in  STD_LOGIC_VECTOR (7 downto 0);
           LOAD  : in  STD_LOGIC;
           CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q     : out STD_LOGIC_VECTOR (7 downto 0));
end Register8Bit;

architecture Structural of Register8Bit is

    component Register1Bit is
        Port ( D     : in  STD_LOGIC;
               LOAD  : in  STD_LOGIC;
               CLK   : in  STD_LOGIC;
               RESET : in  STD_LOGIC;
               Q     : out STD_LOGIC);
    end component;

begin

    R0: Register1Bit port map (D => D(0), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(0));
    R1: Register1Bit port map (D => D(1), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(1));
    R2: Register1Bit port map (D => D(2), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(2));
    R3: Register1Bit port map (D => D(3), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(3));
    R4: Register1Bit port map (D => D(4), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(4));
    R5: Register1Bit port map (D => D(5), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(5));
    R6: Register1Bit port map (D => D(6), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(6));
    R7: Register1Bit port map (D => D(7), LOAD => LOAD, CLK => CLK, RESET => RESET, Q => Q(7));

end Structural;