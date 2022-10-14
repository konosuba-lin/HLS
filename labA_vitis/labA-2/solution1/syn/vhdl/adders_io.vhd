-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adders_io is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    in1 : IN STD_LOGIC_VECTOR (31 downto 0);
    in1_ap_vld : IN STD_LOGIC;
    in2 : IN STD_LOGIC_VECTOR (31 downto 0);
    in2_ap_vld : IN STD_LOGIC;
    in_out1_i : IN STD_LOGIC_VECTOR (31 downto 0);
    in_out1_i_ap_vld : IN STD_LOGIC;
    in_out1_i_ap_ack : OUT STD_LOGIC;
    in_out1_o : OUT STD_LOGIC_VECTOR (31 downto 0);
    in_out1_o_ap_vld : OUT STD_LOGIC;
    in_out1_o_ap_ack : IN STD_LOGIC );
end;


architecture behav of adders_io is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "adders_io_adders_io,hls_ip_2022_1,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-1-e,HLS_INPUT_CLOCK=2.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.907000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=69,HLS_SYN_LUT=180,HLS_VERSION=2022_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal in1_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal in1_in_sig : STD_LOGIC_VECTOR (31 downto 0);
    signal in1_ap_vld_preg : STD_LOGIC := '0';
    signal in1_ap_vld_in_sig : STD_LOGIC;
    signal in2_preg : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal in2_in_sig : STD_LOGIC_VECTOR (31 downto 0);
    signal in2_ap_vld_preg : STD_LOGIC := '0';
    signal in2_ap_vld_in_sig : STD_LOGIC;
    signal in1_blk_n : STD_LOGIC;
    signal in2_blk_n : STD_LOGIC;
    signal in_out1_i_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal in_out1_o_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_state2 : BOOLEAN;
    signal add_ln53_fu_55_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal regslice_forward_in_out1_o_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal regslice_forward_in_out1_i_U_apdone_blk : STD_LOGIC;
    signal in_out1_i_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal in_out1_i_ap_vld_int_regslice : STD_LOGIC;
    signal in_out1_i_ap_ack_int_regslice : STD_LOGIC;
    signal regslice_forward_in_out1_i_U_ack_in : STD_LOGIC;
    signal in_out1_o_int_regslice : STD_LOGIC_VECTOR (31 downto 0);
    signal in_out1_o_ap_vld_int_regslice : STD_LOGIC;
    signal in_out1_o_ap_ack_int_regslice : STD_LOGIC;
    signal regslice_forward_in_out1_o_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component adders_io_regslice_forward IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_forward_in_out1_i_U : component adders_io_regslice_forward
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => in_out1_i,
        vld_in => in_out1_i_ap_vld,
        ack_in => regslice_forward_in_out1_i_U_ack_in,
        data_out => in_out1_i_int_regslice,
        vld_out => in_out1_i_ap_vld_int_regslice,
        ack_out => in_out1_i_ap_ack_int_regslice,
        apdone_blk => regslice_forward_in_out1_i_U_apdone_blk);

    regslice_forward_in_out1_o_U : component adders_io_regslice_forward
    generic map (
        DataWidth => 32)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => in_out1_o_int_regslice,
        vld_in => in_out1_o_ap_vld_int_regslice,
        ack_in => in_out1_o_ap_ack_int_regslice,
        data_out => in_out1_o,
        vld_out => regslice_forward_in_out1_o_U_vld_out,
        ack_out => in_out1_o_ap_ack,
        apdone_blk => regslice_forward_in_out1_o_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    in1_ap_vld_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in1_ap_vld_preg <= ap_const_logic_0;
            else
                if ((not(((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    in1_ap_vld_preg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) and (in1_ap_vld = ap_const_logic_1))) then 
                    in1_ap_vld_preg <= in1_ap_vld;
                end if; 
            end if;
        end if;
    end process;


    in1_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in1_preg <= ap_const_lv32_0;
            else
                if ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) and (in1_ap_vld = ap_const_logic_1))) then 
                    in1_preg <= in1;
                end if; 
            end if;
        end if;
    end process;


    in2_ap_vld_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in2_ap_vld_preg <= ap_const_logic_0;
            else
                if ((not(((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    in2_ap_vld_preg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) and (in2_ap_vld = ap_const_logic_1))) then 
                    in2_ap_vld_preg <= in2_ap_vld;
                end if; 
            end if;
        end if;
    end process;


    in2_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                in2_preg <= ap_const_lv32_0;
            else
                if ((not(((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) and (in2_ap_vld = ap_const_logic_1))) then 
                    in2_preg <= in2;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, in1_ap_vld_in_sig, in2_ap_vld_in_sig, ap_CS_fsm_state2, ap_CS_fsm_state3, regslice_forward_in_out1_o_U_apdone_blk, in_out1_i_ap_vld_int_regslice, in_out1_o_ap_ack_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (in2_ap_vld_in_sig = ap_const_logic_0) or (in1_ap_vld_in_sig = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if ((not(((in_out1_o_ap_ack_int_regslice = ap_const_logic_0) or (in_out1_i_ap_vld_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not(((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    add_ln53_fu_55_p2 <= std_logic_vector(unsigned(in2_in_sig) + unsigned(in1_in_sig));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, in1_ap_vld_in_sig, in2_ap_vld_in_sig)
    begin
        if (((ap_start = ap_const_logic_0) or (in2_ap_vld_in_sig = ap_const_logic_0) or (in1_ap_vld_in_sig = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(in_out1_i_ap_vld_int_regslice, in_out1_o_ap_ack_int_regslice)
    begin
        if (((in_out1_o_ap_ack_int_regslice = ap_const_logic_0) or (in_out1_i_ap_vld_int_regslice = ap_const_logic_0))) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state3_blk_assign_proc : process(regslice_forward_in_out1_o_U_apdone_blk, in_out1_o_ap_ack_int_regslice)
    begin
        if (((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, in1_ap_vld_in_sig, in2_ap_vld_in_sig)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (in2_ap_vld_in_sig = ap_const_logic_0) or (in1_ap_vld_in_sig = ap_const_logic_0));
    end process;


    ap_block_state2_assign_proc : process(in_out1_i_ap_vld_int_regslice, in_out1_o_ap_ack_int_regslice)
    begin
                ap_block_state2 <= ((in_out1_o_ap_ack_int_regslice = ap_const_logic_0) or (in_out1_i_ap_vld_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_assign_proc : process(regslice_forward_in_out1_o_U_apdone_blk, in_out1_o_ap_ack_int_regslice)
    begin
                ap_block_state3 <= ((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state3, regslice_forward_in_out1_o_U_apdone_blk, in_out1_o_ap_ack_int_regslice)
    begin
        if ((not(((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3, regslice_forward_in_out1_o_U_apdone_blk, in_out1_o_ap_ack_int_regslice)
    begin
        if ((not(((regslice_forward_in_out1_o_U_apdone_blk = ap_const_logic_1) or (in_out1_o_ap_ack_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    in1_ap_vld_in_sig_assign_proc : process(in1_ap_vld, in1_ap_vld_preg)
    begin
        if ((in1_ap_vld = ap_const_logic_1)) then 
            in1_ap_vld_in_sig <= in1_ap_vld;
        else 
            in1_ap_vld_in_sig <= in1_ap_vld_preg;
        end if; 
    end process;


    in1_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, in1_ap_vld)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            in1_blk_n <= in1_ap_vld;
        else 
            in1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    in1_in_sig_assign_proc : process(in1, in1_preg, in1_ap_vld)
    begin
        if ((in1_ap_vld = ap_const_logic_1)) then 
            in1_in_sig <= in1;
        else 
            in1_in_sig <= in1_preg;
        end if; 
    end process;


    in2_ap_vld_in_sig_assign_proc : process(in2_ap_vld, in2_ap_vld_preg)
    begin
        if ((in2_ap_vld = ap_const_logic_1)) then 
            in2_ap_vld_in_sig <= in2_ap_vld;
        else 
            in2_ap_vld_in_sig <= in2_ap_vld_preg;
        end if; 
    end process;


    in2_blk_n_assign_proc : process(ap_start, ap_CS_fsm_state1, in2_ap_vld)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            in2_blk_n <= in2_ap_vld;
        else 
            in2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    in2_in_sig_assign_proc : process(in2, in2_preg, in2_ap_vld)
    begin
        if ((in2_ap_vld = ap_const_logic_1)) then 
            in2_in_sig <= in2;
        else 
            in2_in_sig <= in2_preg;
        end if; 
    end process;

    in_out1_i_ap_ack <= regslice_forward_in_out1_i_U_ack_in;

    in_out1_i_ap_ack_int_regslice_assign_proc : process(ap_CS_fsm_state2, in_out1_i_ap_vld_int_regslice, in_out1_o_ap_ack_int_regslice)
    begin
        if ((not(((in_out1_o_ap_ack_int_regslice = ap_const_logic_0) or (in_out1_i_ap_vld_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            in_out1_i_ap_ack_int_regslice <= ap_const_logic_1;
        else 
            in_out1_i_ap_ack_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    in_out1_i_blk_n_assign_proc : process(ap_CS_fsm_state2, in_out1_i_ap_vld_int_regslice)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            in_out1_i_blk_n <= in_out1_i_ap_vld_int_regslice;
        else 
            in_out1_i_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_out1_o_ap_vld <= regslice_forward_in_out1_o_U_vld_out;

    in_out1_o_ap_vld_int_regslice_assign_proc : process(ap_CS_fsm_state2, in_out1_i_ap_vld_int_regslice, in_out1_o_ap_ack_int_regslice)
    begin
        if ((not(((in_out1_o_ap_ack_int_regslice = ap_const_logic_0) or (in_out1_i_ap_vld_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            in_out1_o_ap_vld_int_regslice <= ap_const_logic_1;
        else 
            in_out1_o_ap_vld_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    in_out1_o_blk_n_assign_proc : process(ap_CS_fsm_state2, ap_CS_fsm_state3, in_out1_o_ap_ack_int_regslice)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state3) or (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            in_out1_o_blk_n <= in_out1_o_ap_ack_int_regslice;
        else 
            in_out1_o_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    in_out1_o_int_regslice <= std_logic_vector(unsigned(add_ln53_fu_55_p2) + unsigned(in_out1_i_int_regslice));
end behav;
