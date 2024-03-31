class transaction;
  randc bit [2:0]in;
  bit [7:0]out;
 
  
  function void display(string name);
    $display("-------------------------------");
    $display("%s",name);
    $display("-------------------------------");
    $display("in=%0d ",in);
    $display("out=%d",out);
    $display("-------------------------------");
  endfunction
endclass