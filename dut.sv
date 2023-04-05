module dpram(dp_intf.dp_dut vif);
logic[7:0] mem[0:63];

always@(posedge vif.clk)
begin
if(vif.wren_a == 1) begin
mem[vif.addr_a] <= vif.din_a;
vif.out_a <= mem[ vif.addr_a];
end
else 
vif.out_a <= mem[vif.addr_a];
end 

always@(posedge vif.clk)
begin
if(vif.wren_b == 1) begin
mem[vif.addr_b] <= vif.din_b;
vif.out_b <= mem[ vif.addr_b];
end
else 
vif.out_b <= mem[ vif.addr_b];
end 

endmodule
