class dp_agent_a extends uvm_agent;
    `uvm_component_utils(dp_agent_a)

dp_mon_a mon_a;
dp_drv_a drv_a;
dp_seq_a seq_a;


function new (string name = "dp_agent_a",uvm_component parent );
    super.new(name,parent);
endfunction

virtual function void buil_phase (uvm_phase phase);
    super.build_phase(phase);
    mon_a=dp_mon_a::type_id::create("mon_a",this);
    drv_a=dp_drv_a::type_id::create("drv_a",this);
    seq_a=dp_seq_a::type_id::create("seq_a",this);
endfunction 


virtual function void connect_phase (uvm_phase phase);
super.connect_phase(phase);
//drv_a.seq_item_export.connect(seq_a.seq_item_export);
endfunction 

endclass 
