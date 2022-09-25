----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 29.10.2021 16:31:12
-- Design Name: 
-- Module Name: fsm_tb2 - Behavioral
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

entity fsm_tb2 is
--  Port ( );
end fsm_tb2;

architecture Behavioral of fsm_tb2 is
    component fsm
        Port (      clk:  in std_logic;
                    rst: in std_logic;
                    d : in std_logic_vector(5 downto 0);
                    c : out std_logic_vector(1 downto 0);
                    s: buffer std_logic_vector(1 downto 0);
                    not_s: out std_logic_vector(1 downto 0);
                    rst_cnt: out std_logic;
                    en_cnt: out std_logic );
    end component;
    signal sclk, srst, srst_cnt, sen_cnt: std_logic;
    signal sd: std_logic_vector(5 downto 0);
    signal sc, ss, snot_s: std_logic_vector(1 downto 0);
    
begin
    uut: fsm port map(  clk => sclk,
                        rst => srst,
                        d => sd,
                        c => sc,
                        s => ss,
                        not_s => snot_s,
                        rst_cnt => srst_cnt,
                        en_cnt => sen_cnt);
                        
    clk: process
    begin
        sclk <= '0';
        wait for 10 ns;
        sclk <= '1';
        wait for 10 ns;
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
        wait for 60 ns;
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
        wait for 60 ns;
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
        wait for 60 ns;
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
        wait for 60 ns;
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
