
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_port_bec_nbit is 
end tb_port_bec_nbit;
    
    architecture behavior of tb_port_bec_nbit is
        component port_bec_nbit
            generic (
                n : integer := 4              );
            port (
                B : in std_logic_vector(n-1 downto 0);  
                X : out std_logic_vector(n-1 downto 0)  
            );
        end component;
    
        
        constant N_BITS : integer := 4;  
        signal B_tb : std_logic_vector(N_BITS-1 downto 0);  
        signal X_tb : std_logic_vector(N_BITS-1 downto 0);  
        
        constant CLK_PERIOD : time := 10 ns;  
        
    begin
        uut: port_bec_nbit
        generic map (
            n => N_BITS  
        )
        port map (
            B => B_tb,  
            X => X_tb   
        );
        
        stim_proc: process
        begin
            B_tb <= (others => '0');  
            wait for CLK_PERIOD*2;    
            
            B_tb <= "0000";
            wait for CLK_PERIOD;
            
            B_tb <= "0001";
            wait for CLK_PERIOD;
            
            B_tb <= "0010";
            wait for CLK_PERIOD;
            
            B_tb <= "0101";
            wait for CLK_PERIOD;
            
            B_tb <= "1111";
            wait for CLK_PERIOD;
            
            wait for CLK_PERIOD*2;
            
            report "the end" severity note;
            wait;  
        end process;
    
    end behavior;