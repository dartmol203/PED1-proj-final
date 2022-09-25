----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 08.11.2021 19:29:22
-- Design Name: 
-- Module Name: contador_tb - Behavioral
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

entity contador_tb is
--  Port ( );
end contador_tb;

architecture Behavioral of contador_tb is
    component contador
        Port (  clk : in STD_LOGIC;
                en : in STD_LOGIC;
                clr : in STD_LOGIC;
                tempo_corrido : buffer unsigned (15 downto 0));
    end component;
    signal sclk, sen, sclr: std_logic;
    signal stempo_corrido: unsigned (15 downto 0);
begin
    uut: contador port map(   clk => sclk,
                                en  => sen,
                                clr => sclr,
                                tempo_corrido => stempo_corrido);

    clock: process
    begin
        sclk <= '0';
        wait for 10 ns;
        sclk <= '1';
        wait for 10 ns;
    end process;
    
    teste: process
    begin
        sen <= '1'; sclr <= '0';
        wait for 40 ns;
        sclr <= '1';
        wait for 60 ns;
        sclr <= '0'; sen <= '1';
        wait for 140 ns;
        sen <= '0';
        wait for 60 ns;
        sclr <= '1';
        wait for 40 ns;
        sen <= '1';
        wait;
    end process;
    
end Behavioral;
