----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Levi de Oliveira
-- 
-- Create Date: 13.10.2021 15:24:39
-- Design Name: 
-- Module Name: temporizador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity temporizador is
  Port (    temp_en: in std_logic;
            temp_clr: in std_logic;
            temp_m : out std_logic;
            temp_clk: in std_logic;
            temp_reset: in std_logic);
end temporizador;

architecture Behavioral of temporizador is
    component clk_divisor
        Port (      clk : in STD_LOGIC;
                    clk_1khz : out STD_LOGIC;
                    reset : in std_logic);
    end component;
    
    component comparador
        Port (      A : in unsigned (15 downto 0);
                    B : in unsigned (15 downto 0);
                    multa : out STD_LOGIC);
    end component;
    
    component contador
        Port (      clk : in STD_LOGIC;
                    en : in STD_LOGIC;
                    clr : in STD_LOGIC;
                    tempo_corrido : buffer unsigned (15 downto 0));
    end component;
    
    signal sclk_1khz : std_logic;
    signal sA : unsigned(15 downto 0);
    constant v_max : std_logic_vector(15 downto 0) := "0010001100101000"; -- quantidade de clocks para 40km/hr
begin
    uub: clk_divisor port map(  clk => temp_clk,
                                clk_1khz => sclk_1khz,
                                reset => temp_reset);
                                
    uuc: comparador port map(   A => sA,
                                B => unsigned(v_max),
                                multa   => temp_m);
                                
    uud: contador port map(     clk => sclk_1khz,
                                en => temp_en,
                                clr => temp_clr,
                                tempo_corrido => sA);

end Behavioral;
