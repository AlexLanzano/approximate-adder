module accurate_adder(input [7:0] a, b,
                      output [7:0] out,
                      output carry);
   assign {carry, out} = a + b;
endmodule
