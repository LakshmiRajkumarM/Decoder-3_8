class driver;
  mailbox gen2driv;
  int no_transaction;
  virtual intf vif;
  
  function new(virtual intf vif,mailbox gen2driv);
    this.vif=vif;
    this.gen2driv=gen2driv;
  endfunction
  
  task reset;
    wait(vif.reset);
    $display("[DRIVER].........Reset Started.....");
    vif.in<=0;
    vif.out<=0;
    
    wait(!vif.reset);
    $display("[DRIVER].........Reset Ended.......");
  endtask
  
  task main;
    forever begin
      transaction trans;
      gen2driv.get(trans);
      @(posedge vif.clk);
      vif.valid<=1;
      vif.in=trans.in;
      @(posedge vif.clk);
      vif.valid<=0;
      //trans.c<=vif.c;
      @(posedge vif.clk);
      trans.display("[DRIVER]");
      no_transaction++;
    end
  endtask
endclass
