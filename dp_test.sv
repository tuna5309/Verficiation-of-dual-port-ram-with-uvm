class dp_test extends uvm_test;
    `uvm_component_utils(dp_test)

    dp_env env; 
    dp_sequence sequ;

//dp_sequence_item_b pkt_b_s;

function new(string name = "dp_test",uvm_component parent);
    super.new(name,parent);
endfunction 

virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    env=dp_env::type_id::create("env",this);
endfunction 

virtual task run_phase(uvm_phase phase);
 //super.run_phase(phase);
 dp_sequence_item_a pkt_a_s;
  pkt_a_s=dp_sequence_item_a::type_id::create("pkt_a_s",this);
  sequ=dp_sequence::type_id::create("sequ",this);
//  pkt_b_s=dp_sequence_item_b::type_id::create("pkt_b_s",this);

  phase.raise_objection(this);
 sequ.start(env.agent_a.seq_a);
 //sequ.start(env.agent_b.seq_b);
  #100;
  phase.drop_objection(this);
endtask 
endclass 


