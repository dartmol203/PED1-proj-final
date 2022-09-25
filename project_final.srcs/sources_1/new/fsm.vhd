----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 13.10.2021 15:24:39
-- Design Name: 
-- Module Name: fsm - Behavioral
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

entity fsm is
  Port (    clk:  in std_logic;
            rst: in std_logic;
            d : in std_logic_vector(5 downto 0);
            c : out std_logic_vector(1 downto 0);
            s: buffer std_logic_vector(1 downto 0);
            not_s: out std_logic_vector(1 downto 0);
            rst_cnt: out std_logic;
            en_cnt: out std_logic );
end fsm;

architecture Behavioral of fsm is

    type state is (inicial, e1, e2, e3, d1, d2, d3) ;
    signal current_state, next_state : state := inicial;
    
begin
    
    armazena_estado: process (clk, rst)
    begin
       if rising_edge(clk) then
           if rst = '1' then
               current_state <= inicial;
           else
               current_state <= next_state;
           end if;
       end if;
    end process;

    transicao_estado: process (current_state, d)
    begin
        case current_state is 
            when inicial =>
                if (d(0) = '0' and d(4) = '0') then
                    next_state <= inicial;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                    rst_cnt <= '0';
                    en_cnt <= '0';
                elsif ( d(0) = '1') then
                    next_state <= e1;
                    c(0) <= '1';
                    c(1) <= '0';
                    s(0) <= '1';
                    s(1) <= '0';
                    not_s(0) <= '0';
                    not_s(1) <= '1';
                    rst_cnt <= '1';
                    en_cnt <= '0';
                elsif ( d(4) = '1' and d(0) = '0') then
                    next_state <= d1;
                    c(0) <= '0';
                    c(1) <= '1';
                    s(0) <= '0';
                    s(1) <= '1';
                    not_s(0) <= '1';
                    not_s(1) <= '0';
                    rst_cnt <= '1';
                    en_cnt <= '0';
                end if;  
            when e1 =>
                if (d(1) = '0') then
                    next_state <= e1;
                    c(0) <= '1';
                    c(1) <= '0';
                    s(0) <= '1';
                    s(1) <= '0';
                    not_s(0) <= '0';
                    not_s(1) <= '1';
                elsif (d(1) = '1') then
                    next_state <= e2;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                    rst_cnt <= '0';
                    en_cnt <= '1';
                end if;
            when e2 =>
                if (d(2) = '0') then
                    next_state <= e2;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                elsif (d(2) = '1') then
                    next_state <= e3;
                    c(0) <= '0';
                    c(1) <= '1';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                    rst_cnt <= '0';
                    en_cnt <= '0';
                end if;
            when e3 =>
                if (d(3) = '0') then
                    next_state <= e3;
                    c(0) <= '0';
                    c(1) <= '1';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                elsif (d(3) = '1') then
                    next_state <= inicial;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                end if;
            when d1 =>
                if (d(2) = '0') then
                    next_state <= d1;
                    c(0) <= '0';
                    c(1) <= '1';
                    s(0) <= '0';
                    s(1) <= '1';
                    not_s(0) <= '1';
                    not_s(1) <= '0';
                elsif (d(2) = '1') then
                    next_state <= d2;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                    rst_cnt <= '0';
                    en_cnt <= '1';
                end if;
            when d2 =>
                if (d(1) = '0') then
                    next_state <= d2;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                elsif (d(1) = '1') then
                    next_state <= d3;
                    c(0) <= '1';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                    rst_cnt <= '0';
                    en_cnt <= '0';
                end if;
            when d3 =>
                if (d(5) = '0') then
                    next_state <= d3;
                    c(0) <= '1';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                elsif (d(5) = '1') then
                    next_state <= inicial;
                    c(0) <= '0';
                    c(1) <= '0';
                    s(0) <= '0';
                    s(1) <= '0';
                    not_s(0) <= '1';
                    not_s(1) <= '1';
                end if;                
        end case;
    end process;
    
end Behavioral;
