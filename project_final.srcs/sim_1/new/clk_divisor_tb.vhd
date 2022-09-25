----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 08.11.2021 21:33:04
-- Design Name: 
-- Module Name: clk_divisor_tb - Behavioral
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity clk_divisor_tb is
end clk_divisor_tb;
 
architecture behaviorial of clk_divisor_tb is
    component clk_divisor
        port(   clk : in std_logic;
                clk_1khz : out std_logic;
                reset : in std_logic);
    end component;
    
    
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    
    signal clock_out : std_logic;
    
    constant clk_period : time := 10 ns;
    
    begin
    
        uut: clk_divisor port map (     clk => clk,
                                        clk_1khz => clock_out,
                                        reset => reset);
         
        clock:process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;
         
        teste: process
            begin
            wait for 100 ns;
            reset <= '1';
            wait for 100 ns;
            reset <= '0';
            wait;
        end process;

end;
