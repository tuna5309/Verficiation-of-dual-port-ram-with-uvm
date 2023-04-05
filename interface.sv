interface dp_intf (input bit clk);
logic[7:0] din_a, din_b , out_a,out_b ;
logic[5:0] addr_a , addr_b;
logic wren_a , wren_b;
modport dp_dut(input clk,wren_a,wren_b,din_a,din_b,addr_a,addr_b,output out_a,out_b);
endinterface 
