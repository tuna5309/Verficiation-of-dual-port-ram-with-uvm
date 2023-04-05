class dp_mon_a extends uvm_monitor;
    `uvm_component_utils(dp_mon_a)

    dp_sequence_item_a pkt_a;
    virtual dp_intf vif;

    uvm_analysis_port#(dp_sequence_item_a) item_c_a;
    //uvm_analysis_port#(dp_seq_item_a)  ap_a;


    function new (string name = "dp_mon_a",uvm_component parent);
    super.new(name,parent);
   endfunction 
	

   virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual dp_intf)::get(this,"","vif",vif))) begin
        `uvm_fatal("monitor_a","unable to get interface")
    end    

    item_c_a=new("item_c_a",this);
    //ap_a=new("ap_a",this);
endfunction 

  task run_phase (uvm_phase phase);
    pkt_a=dp_sequence_item_a::type_id::create("pkt_a",this);

    forever begin 
        #5;
        @(posedge vif.clk)
        pkt_a.wren_a=vif.wren_a;
        pkt_a.addr_a=vif.addr_a;
        pkt_a.din_a=vif.din_a;
    end 

   /// @(posedge vif.clk)
    item_c_a.write(pkt_a);
    ///ap_a.write(pkt_a);

endtask 
endclass 









