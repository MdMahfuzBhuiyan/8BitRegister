library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register1Bit is
    Port ( D     : in  STD_LOGIC;
           LOAD  : in  STD_LOGIC;
           CLK   : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q     : out STD_LOGIC);
end Register1Bit;

architecture Structural of Register1Bit is

    component Multiplexer2 is
        Port ( D0  : in  STD_LOGIC;
               D1  : in  STD_LOGIC;
               SEL : in  STD_LOGIC;
               Y   : out STD_LOGIC);
    end component;

    component DFlipFlop is
        Port ( D     : in  STD_LOGIC;
               CLK   : in  STD_LOGIC;
               RESET : in  STD_LOGIC;
               Q     : out STD_LOGIC);
    end component;

    signal mux_out    : STD_LOGIC;
    signal q_internal : STD_LOGIC;

begin

    MUX_INST: Multiplexer2 port map (
        D0  => q_internal,
        D1  => D,
        SEL => LOAD,
        Y   => mux_out
    );

    FF_INST: DFlipFlop port map (
        D     => mux_out,
        CLK   => CLK,
        RESET => RESET,
        Q     => q_internal
    );

    Q <= q_internal;

end Structural;