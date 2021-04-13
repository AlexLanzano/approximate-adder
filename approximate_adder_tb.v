module approximate_adder_8bit_tb();
   integer i = 0;
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
      $display("| a   | b   | sum | cout | expected sum | expected cout |");

      // Initials A L
      a = 65;
      b = 76;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("| %d | %d | %d |    %d |          %d |            %d |", 
               a_tv, b_tv, sum_ov, cout_ov, expected_sum, expected_cout);
      
      // Initials G B
      a = 71;
      b = 66;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("| %d | %d | %d |    %d |          %d |            %d |", 
               a_tv, b_tv, sum_ov, cout_ov, expected_sum, expected_cout);
      
      // Initials T I
      a = 84;
      b = 73;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("| %d | %d | %d |    %d |          %d |            %d |", 
               a_tv, b_tv, sum_ov, cout_ov, expected_sum, expected_cout);
      
   end
endmodule
