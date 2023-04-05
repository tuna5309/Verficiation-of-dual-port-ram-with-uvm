class dp_env extends uvm_env;
    `uvm_component_utils(dp_env)

dp_agent_a agent_a;
//dp_agent_b agent_b;

function new(string name = "dp_env",uvm_component parent);
    super.new(name,parent);
endfunction 


function void build_phase (uvm_phase phase);
super.build_phase(phase);
agent_a=dp_agent_a::type_id::create("agent_a",this);
//agent_b=dp_agent_b::type_id::create("agent_b",this);
endfunction 

endclass 
