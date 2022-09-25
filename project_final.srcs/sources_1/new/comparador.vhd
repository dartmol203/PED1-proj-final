----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Levi de Oliveira
-- 
-- Create Date: 08.11.2021 15:51:57
-- Design Name: 
-- Module Name: comparador - Behavioral
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

entity comparador is
    Port ( A : in unsigned (15 downto 0);
           B : in unsigned (15 downto 0);
           multa : out STD_LOGIC);
end comparador;

architecture Behavioral of comparador is

begin
    process( A, B)
        begin
            if (A /= "0000000000000000") then
                if (A < B) then
                    multa <= '1';
                else
                    multa <= '0';
                end if;
            else
                multa <= '0';
            end if;
        end process;
end Behavioral;
