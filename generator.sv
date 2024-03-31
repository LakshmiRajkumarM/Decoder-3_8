class generator;
  rand transaction trans;
  mailbox gen2driv;
  event ended;
  int repeat_count;
  function new(mailbox gen2driv);
    this.gen2driv=gen2driv;
  endfunction
  
  task main();
    repeat(repeat_count)begin
    trans=new();
    if(!trans.randomize())$fatal("[GEN]: TRANS RANDOMIZATION FAILED...");
      trans.display("[Generator]");
    gen2driv.put(trans);
    end
    ->ended;
  endtask
endclass
