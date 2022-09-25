----------------------------------------------------------------------------------
-- Company: 
-- Engineer: André Corrêa da Silva
-- 
-- Create Date: 08.11.2021 21:33:04
-- Design Name: 
-- Module Name: comparador_tb - Behavioral
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

entity comparador_tb is
--  Port ( );
end comparador_tb;

architecture Behavioral of comparador_tb is
    component comparador
        Port (  A : in unsigned (15 downto 0);
                B : in unsigned (15 downto 0);
                multa : out STD_LOGIC);
    end component;
    
    signal sA, sB: unsigned(15 downto 0);
    signal smulta: std_logic;
begin

    uut: comparador port map (  A => sA,
                                B => sB,
                                multa => smulta);

    teste: process
        begin
        sA <= "1111111111111111"; sB <= "0010001100101000"; --0
        wait for 50 ns;
        sA <= "0010001100101000"; sB <= "0010001100101000"; --0
        wait for 50 ns;
        sA <= "0010001100100000"; sB <= "0010001100101000"; --1
        wait for 50 ns;
        sA <= "0010001100101001"; sB <= "0010001100101000"; --0
        wait for 50 ns;
        sA <= "0000000000000000"; sB <= "0010001100101000"; --1
        wait for 50 ns;
        sA <= "0010001101001000"; sB <= "0010001100101000"; --1
        wait for 50 ns;
        sA <= "0010001100011000"; sB <= "0010001100101000"; --0
        wait;
    end process;
end Behavioral;
