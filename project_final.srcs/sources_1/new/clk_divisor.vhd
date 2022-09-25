----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Levi de Oliveira
-- 
-- Create Date: 08.11.2021 15:51:57
-- Design Name: 
-- Module Name: clk_divisor - Behavioral
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

entity clk_divisor is
    Port ( clk : in STD_LOGIC;
           clk_1khz : out STD_LOGIC;
           reset : in std_logic);
end clk_divisor;

architecture Behavioral of clk_divisor is
    signal contador: integer:=0;
    signal clk_novo : std_logic := '0';
  
begin
  
    process(clk,reset)
        begin
            if(reset='1') then
                contador<=1;
                clk_novo<='0';
            elsif(clk'event and clk='1') then
                if (contador = 49999) then
                    clk_novo <= not clk_novo;
                    contador <= 0;
                else
                    contador <=contador+1;
                end if;
            end if;
            clk_1khz <= clk_novo;
    end process;

end Behavioral;
