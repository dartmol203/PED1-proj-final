----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Levi de Oliveira
-- 
-- Create Date: 08.11.2021 15:51:57
-- Design Name: 
-- Module Name: contador - Behavioral
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

entity contador is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           clr : in STD_LOGIC:= '0';
           tempo_corrido : buffer unsigned (15 downto 0) := "0000000000000000");
end contador;

architecture Behavioral of contador is

begin
    process(clk, clr)
        begin
            if rising_edge(clr) then
                tempo_corrido <= "0000000000000000";
            end if;
            if rising_edge(clk) then
                if ( en ='1') then
                    tempo_corrido <= tempo_corrido + 1;
                end if;
            end if;
    end process;
end Behavioral;
