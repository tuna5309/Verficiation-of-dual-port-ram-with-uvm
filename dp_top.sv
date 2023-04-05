import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "dut.sv"
`include "dp_sequence_item.sv"
`include "dp_sequence.sv"
`include "dp_sequencer.sv"
`include "dp_drv_a.sv"
//`include "dp_drv_b.sv"
`include "dp_mon_a.sv"
//`include "dp_mon_b.sv"
`include "dp_agent_a.sv"
//`include "dp_agent_b.sv"
`include "dp_env.sv"
`include "dp_test.sv"

module dp_top();
    bit clk; 
    initial
begin
clk=1'b0;
forever #5 clk=~clk;
end


dp_intf vif(clk);
dpram dut(vif);

initial
begin
uvm_config_db#(virtual dp_intf)::set(uvm_root::get(),"*","vif",vif);
run_test("dp_test");
end
endmodule

