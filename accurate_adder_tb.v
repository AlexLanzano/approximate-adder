module accurate_adder_tb();
   integer error;
   reg [7:0] a, b, expected_output;
   reg expected_carry;
   wire [7:0] a_tv = a[7:0];
   wire [7:0] b_tv = b[7:0];

   wire [7:0] out_ov;
   wire carry_ov;

   accurate_adder UUT(.a(a_tv), .b(b_tv),
                      .out(out_ov),
                      .carry(carry_ov));
   initial
     begin : maintestbench
        error = 0;
        for (a = 0; a < 255; a = a + 1)
          for (b = 0; b < 255; b = b + 1)
            begin
               #1;
               {expected_carry, expected_output} = a + b;
               if (out_ov !== expected_output ||
                   carry_ov !== expected_carry)
                 begin
                    error = 1;
                    $display("FAILED: %d", a_tv[7:0], " + %d", b_tv, 
                             " produced out = %d", out_ov[7:0], 
                             " carry = %d\n", carry_ov, 
                             "Expected out = %d", expected_output,
                             " carry = %d\n", expected_carry);
                 end
            end
        if (error == 0) begin
           $display("TEST PASSED");
        end
     end
endmodule
