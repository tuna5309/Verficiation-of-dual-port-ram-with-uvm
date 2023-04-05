class dp_agent_b extends uvm_agent;
    `uvm_component_utils(dp_agent_b)

dp_mon_b mon_b;
dp_drv_b drv_b;
dp_seq_b seq_b;


function new (string name = "dp_agent_b");
    super.new(name,parent);
endfunction

virtual function void buil_phase (uvm_phase phase);
    super.build_phase(phase);
    mon_b=dp_mon_b::type_id::create("mon_b",this);
    drv_b=dp_drv_b::type_id::create("drv_b",this);
    seq_b=dp_seq_b::type_id::create("seq_b",this);
endfunction 


virtual function void connect_phase (uvm_phase phase);
super.connect_phase(phase);
drv_b.seq_item_export.connect(seq_b.seq_item_export);
endfunction 

endclass 
