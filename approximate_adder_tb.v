module approximate_adder_8bit_tb();
   integer error;
   reg [7:0] a, b, expected_sum;
   reg expected_cout;
   
   wire [7:0] a_tv = a[7:0];
   wire [7:0] b_tv = b[7:0];
   wire cin_tv = 0;

   wire [7:0] sum_ov;
   wire cout_ov;

   approximate_adder_8bit UUT(.A(a_tv), .B(b_tv), 
                              .cin(cin_tv),
                              .sum(sum_ov),
                              .cout(cout_ov));

   initial begin : maintestbench
      error = 0;
      for (a = 0; a < 255; a = a + 1)
        for (b = 0; b < 255; b = b + 1) begin
           #1;
           {expected_cout, expected_sum} = a + b;
           if (sum_ov !== expected_sum ||
               cout_ov !== expected_cout) begin
              $display("FAILED: %d + %d produced sum=%d carry=%d",
                       a_tv, b_tv, sum_ov, cout_ov);
              $display("Expected sum=%d carry=%d\n", expected_sum, expected_cout);
           end
        end
   end
endmodule
