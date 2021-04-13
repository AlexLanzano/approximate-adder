// module truth_table_v1();
//    integer i;
   
//    reg A, B, cin;

//    wire A_tv = A;
//    wire B_tv = B;
//    wire cin_tv = cin;

//    wire sum_ov;
//    wire cout_ov;

//    approximate_adder_1bit_v5 UUT(.A(A_tv), .B(B_tv), .cin(cin_tv),
//                                  .sum(sum_ov), .cout(cout_ov));
   
//    initial begin : truthtablev1
//       $display("| A | B | cin | sum | cout |");
//       for (i = 0; i < 8; i = i + 1) begin
//          {A, B, cin} = i;
//          #1;
//          $display("| %d | %d |  %d  |  %d  |   %d  |", A_tv, B_tv, cin_tv, sum_ov, cout_ov);
//       end
//    end
   
// endmodule

   
module approximate_adder_8bit_tb();
   integer i = 0;
   reg [7:0] a, b, expected_sum;
   reg expected_cout;
   
   wire [7:0] a_tv = a[7:0];
   wire [7:0] b_tv = b[7:0];
   wire cin_tv = 0;

   wire [7:0] sum_ov_v1;
   wire cout_ov_v1;

   wire [7:0] sum_ov_v2;
   wire cout_ov_v2;

   wire [7:0] sum_ov_v5;
   wire cout_ov_v5;

   approximate_adder_8bit_v1 UUT1(.A(a_tv), .B(b_tv), 
                                 .cin(cin_tv),
                                 .sum(sum_ov_v1),
                                 .cout(cout_ov_v1));
   approximate_adder_8bit_v2 UUT2(.A(a_tv), .B(b_tv), 
                                 .cin(cin_tv),
                                 .sum(sum_ov_v2),
                                 .cout(cout_ov_v2));
   approximate_adder_8bit_v5 UUT3(.A(a_tv), .B(b_tv), 
                                 .cin(cin_tv),
                                 .sum(sum_ov_v5),
                                 .cout(cout_ov_v5));
   
   initial begin : maintestbench
      
      $display("| version | Initials | sum | cout | expected sum | expected cout |");

      // Initials A L
      a = 65;
      b = 76;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("|   v1    |       AL | %d |    %d |          %d |             %d |", 
               sum_ov_v1, cout_ov_v1, expected_sum, expected_cout);
      $display("|   v2    |       AL | %d |    %d |          %d |             %d |", 
               sum_ov_v2, cout_ov_v2, expected_sum, expected_cout);
      $display("|   v5    |       AL | %d |    %d |          %d |             %d |", 
               sum_ov_v5, cout_ov_v5, expected_sum, expected_cout);
      
      // Initials G B
      a = 71;
      b = 66;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("|   v1    |       GB | %d |    %d |          %d |             %d |", 
               sum_ov_v1, cout_ov_v1, expected_sum, expected_cout);
      $display("|   v2    |       GB | %d |    %d |          %d |             %d |", 
               sum_ov_v2, cout_ov_v2, expected_sum, expected_cout);
      $display("|   v5    |       GB | %d |    %d |          %d |             %d |", 
               sum_ov_v5, cout_ov_v5, expected_sum, expected_cout);
      
      // Initials T I
      a = 84;
      b = 73;
      #1;
      {expected_cout, expected_sum} = a + b;
      $display("|   v1    |       TI | %d |    %d |          %d |             %d |", 
               sum_ov_v1, cout_ov_v1, expected_sum, expected_cout);
      $display("|   v2    |       TI | %d |    %d |          %d |             %d |", 
               sum_ov_v2, cout_ov_v2, expected_sum, expected_cout);
      $display("|   v5    |       TI | %d |    %d |          %d |             %d |", 
               sum_ov_v5, cout_ov_v5, expected_sum, expected_cout);
      
   end
endmodule
