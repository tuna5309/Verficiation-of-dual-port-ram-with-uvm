class dp_drv_a extends uvm_driver#(dp_sequence_item_a);

    `uvm_component_utils(dp_drv_a)

    virtual dp_intf vif;
    dp_sequence_item_a pkt_a;		
	
    function new (string name = "dp_drv_a" , uvm_component parent);
        super.new(name,parent);
    endfunction 

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        if(!(uvm_config_db#(virtual dp_intf)::get(this,"","vif",vif))) begin
            `uvm_fatal("driver","unable to get interface")
        end 
    endfunction 

    task run_phase(uvm_phase phase );
dp_sequence_item_a pkt_a;        
pkt_a=dp_sequence_item_a::type_id::create("pkt_a");
    forever begin 
        seq_item_port.get_next_item(pkt_a);
       pkt_a.wren_a=1;
        @(negedge vif.clk);
        vif.wren_a=pkt_a.wren_a;
        vif.addr_a=pkt_a.addr_a;
        vif.din_a=pkt_a.din_a;
    end

  @(negedge vif.clk);

    seq_item_port.item_done();


`uvm_info("DRV_A","DRV_a TRANSACTION TO DUT",UVM_NONE);
#5;
endtask
endclass


