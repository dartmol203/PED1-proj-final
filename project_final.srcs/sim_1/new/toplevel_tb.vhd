----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 08.11.2021 22:10:10
-- Design Name: 
-- Module Name: toplevel_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel_tb is
--  Port ( );
end toplevel_tb;

architecture Behavioral of toplevel_tb is
    component toplevel
        Port(   tclk: in std_logic;
                trst: in std_logic;
                td : in std_logic_vector(5 downto 0);
                tc : out std_logic_vector(1 downto 0);
                ts: buffer std_logic_vector(1 downto 0);
                tnot_s: out std_logic_vector(1 downto 0);
                tm : out std_logic );
    end component;
    
    signal sclk, srst, sm: std_logic;
    signal sc, ss, snot_s: std_logic_vector(1 downto 0);
    signal sd : std_logic_vector(5 downto 0);
begin
    uut: toplevel port map( tclk => sclk,
                            trst => srst,
                            td   => sd,
                            tc   => sc,
                            ts   => ss,
                            tnot_s => snot_s,
                            tm   => sm);
                            
    clk: process
    begin
        sclk <= '0';
        wait for 5 ns;
        sclk <= '1';
        wait for 5 ns;                     
    end process;
    
    teste: process
    begin
        srst <= '1' ;sd(0) <= '0'; sd(4) <= '0'; --primeiro "ciclo"
        wait for 40 ns; 
        srst <= '0'; sd(0) <= '1';
        wait for 60 ns;
        sd(0) <= '0'; sd(1) <= '0';
        wait for 60 ns;
        sd(1) <= '1';
        wait for 60 ns;
        sd(1) <= '0'; sd(2) <= '0';
        wait for 2 ms;
        sd(2) <= '1';
        wait for 60 ns;
        sd(2) <= '0'; sd(3) <= '0';
        wait for 60 ns;
        sd(3) <= '1';
        wait for 60 ns;
        sd(3) <= '0';
        wait for 60 ns;
        sd(0) <= '0';sd(4) <= '1'; -- segundo "ciclo"
        wait for 60 ns;
        sd(4) <= '0'; sd(2) <= '0';
        wait for 60 ns;
        sd(2) <= '1';
        wait for 60 ns;
        sd(2) <= '0'; sd(1) <= '0';
        wait for 2 ms;
        sd(1) <= '1';
        wait for 60 ns;
        sd(1) <= '0'; sd(5) <= '0';
        wait for 60 ns;
        sd(5) <= '1';
        wait for 60 ns;
        sd(5) <= '0'; 
        wait for 60 ns;
        sd(0) <= '1';sd(4) <= '1'; -- terceiro "ciclo"
        wait for 60 ns;
        sd(0) <= '0'; sd(1) <= '0';
        wait for 60 ns;
        sd(1) <= '1';
        wait for 60 ns;
        sd(1) <= '0'; sd(2) <= '0';
        wait for 2 ms;
        sd(2) <= '1';
        wait for 60 ns;
        sd(2) <= '0'; sd(3) <= '0';
        wait for 60 ns;
        sd(3) <= '1';
        wait for 60 ns;
        sd(3) <= '0';
        wait for 60 ns;
        sd(4) <= '0'; sd(2) <= '0'; -- quarto "ciclo"
        wait for 60 ns;
        sd(2) <= '1';
        wait for 60 ns;
        sd(2) <= '0'; sd(1) <= '0';
        wait for 2 ms;
        sd(1) <= '1';
        wait for 60 ns;
        sd(1) <= '0'; sd(5) <= '0';
        wait for 60 ns;
        sd(5) <= '1';
        wait for 60 ns;
        sd(5) <= '0'; 
        wait;
    end process;
        
end Behavioral;
