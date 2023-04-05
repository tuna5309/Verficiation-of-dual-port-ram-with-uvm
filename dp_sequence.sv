class dp_sequence extends uvm_sequence#(dp_sequence_item_a);
    `uvm_object_utils(dp_sequence)

    dp_sequence_item_a  pkt_a;
   // dp_sequence_item_b  pkt_b;

  
  
    function new(string name = "dp_sequence");
        super.new(name);
    endfunction 

     task body();
        
        pkt_a=dp_sequence_item_a::type_id::create("pkt_a");
  //      pkt_b=dp_sequence_item_b::type_id::create("pkt_b");
    

    repeat(10)
    begin
        start_item(pkt_a);    
      if(!(pkt_a.randomize()));
         begin
          `uvm_error(get_type_name(),"RANDOMiZE ERROR FOUND \n  ")
        end 
        pkt_a.wren_a=1;
         pkt_a.print();
         finish_item(pkt_a);


        end 
    endtask 

    
endclass

       
