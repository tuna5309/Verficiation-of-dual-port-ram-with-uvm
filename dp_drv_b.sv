class dp_drv_b extends uvm_driver#(dp_sequence_item_b);

    `uvm_component_utils(dp_drv_b)

    virtual dp_intf vif;


    function new (string name = "dp_drv_b" , uvm_component parent);
        super.new(name);
    endfunction 

    virtual function void build_phase (uvm_phase phase);
        super.build_phase();
        if(!(uvm_config_db#(virtual dp_intf)::get(this,"","vif",vif))) begin
            `uvm_fatal("driver","unable to get interface")
        end 
    endfunction 

    task run_phase(uvm_phase phase );
        pkt_b=dp_sequence_item_b::type_id::create("pkt_b",this);
    forever begin 
        seq_item_port.get_next_item(pkt_b);
        pkt_b.wren_b=1;
        @(negedge vif.clk);
        vif.wren_b=pkt_b.wren_b;
        vif.addr_b=pkt_a.addr_b;
        vif.data_b=pkt_a.data_b;
    end

    @(negedge vif.clk);

    seq_item_port.item(done);



`uvm_info("DRV_b","DRV_b TRANSACTION TO DUT",UVM_NONE);
#5;
endtask
endclass


