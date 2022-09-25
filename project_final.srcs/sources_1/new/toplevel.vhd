----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 13.10.2021 15:24:39
-- Design Name: 
-- Module Name: toplevel - Behavioral
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

entity toplevel is
    Port(   tclk: in std_logic;
            trst: in std_logic;
            td : in std_logic_vector(5 downto 0);
            tc : out std_logic_vector(1 downto 0);
            ts: buffer std_logic_vector(1 downto 0);
            tnot_s: out std_logic_vector(1 downto 0);
            tm : out std_logic );
end toplevel;

architecture Behavioral of toplevel is
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
    
    component temporizador
        Port (      temp_en: in std_logic;
                    temp_clr: in std_logic;
                    temp_m : out std_logic;
                    temp_clk: in std_logic;
                    temp_reset : in std_logic);
    end component;
    signal srst_cnt, sen_cnt : std_logic;           
begin
    uut: fsm port map(  clk => tclk,
                        rst => trst,
                        d => td,
                        c => tc,
                        s => ts,
                        not_s => tnot_s,
                        rst_cnt => srst_cnt,
                        en_cnt => sen_cnt);
                        
    uua: temporizador port map( temp_en => sen_cnt,
                                temp_clr => srst_cnt,
                                temp_m   => tm,
                                temp_clk => tclk,
                                temp_reset => trst);

end Behavioral;
