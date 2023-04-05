class dp_sequence_item_a extends uvm_sequence_item;
     
    rand bit [5:0] addr_a; 
    rand logic [7:0] din_a;
    bit wren_a;
    bit [7:0] out_a;


    `uvm_object_utils_begin(dp_sequence_item_a)
        `uvm_field_int(addr_a,UVM_DEFAULT)
        `uvm_field_int(din_a,UVM_DEFAULT)
        `uvm_field_int(wren_a,UVM_DEFAULT)
        `uvm_field_int(out_a,UVM_DEFAULT)
    `uvm_object_utils_end


    function new (string name = "dp_sequence_item_a");
        super.new(name);
    endfunction 

endclass 


