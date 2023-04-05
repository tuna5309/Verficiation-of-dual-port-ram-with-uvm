class dp_mon_b extends uvm_monitor;
    `uvm_component_utils(dp_mon_b)

    dp_sequence_item_a pkt_b;
    virtual dp_intf vif;

    uvm_analysis_port#(dram_seq_item_a) item_c_b;
    uvm_analysis_port#(dram_seq_item_a)  ap_b;


    function new (string name = "dp_mon_b",uvm_component parent);
    super.new(name,parent);
   endfunction 


   virtual function void build_phase (uvm_phase phase);
    super.build_phase();
    if(!(uvm_config_db#(virtual dp_intf)::get(this,"","vif",vif))) begin
        `uvm_fatal("monitor_b","unable to get interface")
    end    

    item_c_b=new("item_c_a",this);
    ap_b=new("ap_b",this);
endfunction 

  task run_phase (uvm_phase phase);
    pkt_b=dp_sequence_item_b::type_id::create("pkt_b",this);

    forever begin 
        #5;
        @(posedge vif.clk)
        pkt.wren_b=vif.wren_b;
        pkt.adress_b=vif.adress_b;
        pkt.din_b=vif.din_b;
    end 

    @(posedge vif.clk)
    item_c_a.write(pkt_b);
    ap.write(pkt_b);

endtask 
endclass 









