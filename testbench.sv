// Code your testbench here
// or browse Examples
`include "Interface.sv"
`include "Test.sv"
module tbench_top;
  bit clk;
  bit reset;
  
  always #5 clk=~clk;
  initial
    begin
      reset=1;
      #5 reset=0;
    end
  
  intf i_intf(clk,reset);
  test t1(i_intf);
  
  Decoder3_8 DUT(.clk(i_intf.clk),.valid(i_intf.valid),.rst(i_intf.reset),.in(i_intf.in),.out(i_intf.out));
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
