class scoreboard;
  mailbox mon2scb;
  int no_transaction;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    transaction trans;
    forever begin
      mon2scb.get(trans);
      if(trans.in==3'b000 && trans.out==8'b1)
          $display("Result is Expected..");
      else if(trans.in==3'b001 && trans.out==8'b10)
        $display("Result is Expected..");
      else if(trans.in==3'b010 && trans.out==8'b100)
        $display("Result is Expected..");
      else if(trans.in==3'b011 && trans.out==8'b1000)
        $display("Result is Expected..");
      else if(trans.in==3'b100 && trans.out==8'b10000)
        $display("Result is Expected..");
      else if(trans.in==3'b101 && trans.out==8'b100000)
        $display("Result is Expected..");
      else if(trans.in==3'b110 && trans.out==8'b1000000)
        $display("Result is Expected..");
      else if(trans.in==3'b111 && trans.out==8'b10000000)
        $display("Result is Expected..");
    
      
      else
        $error("Wrong Result");
      no_transaction++;
      trans.display("[SCOREBOARD]");
    end
  endtask
endclass
/*
Y0=A0'.A1'.A2'
Y1=A0.A1'.A2'
Y2=A0'.A1.A2'
Y3=A0.A1.A2'
Y4=A0'.A1'.A2
Y5=A0.A1'.A2
Y6=A0'.A1.A2
Y7=A0.A1.A2
*/