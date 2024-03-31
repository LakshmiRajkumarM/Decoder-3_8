`include "Environment.sv"
program test(intf i_intf);
  environment env;
  initial
    begin
      env=new(i_intf);
      env.gen.repeat_count=10;
      env.run();
    end
endprogram
