module inverter(input a,
                output out);
   supply1 vdd;
   supply0 gnd;

   pmos(out, vdd, a);
   nmos(out, gnd, a);
endmodule

module approximate_adder_1bit_v1(input A, B, cin,
                                 output sum, cout);
   supply1 vdd;
   supply0 gnd;

   wire invert_cout, invert_sum;
   inverter invert1(invert_cout, cout);
   inverter invert2(invert_sum, sum);

   pmos P1(a, vdd, B);
   pmos P2(b, vdd, B);
   pmos P3(invert_cout, a, cin);
   pmos P4(invert_cout, b, A);
   pmos P5(e, vdd, A);
   pmos P6(e, vdd, B);
   pmos P7(invert_sum, e, invert_cout);
   pmos P8(invert_sum, vdd, cin);

   nmos N1(c, gnd, A);
   nmos N2(invert_cout, gnd, B);
   nmos N3(invert_cout, c, cin);
   nmos N4(d, gnd, cin);
   nmos N5(invert_sum, d, invert_cout);
   nmos N6(g, gnd, B);
   nmos N7(f, g, A);
   nmos N8(invert_sum, f, cin);
endmodule

module approximate_adder_1bit_v2(input A, B, cin,
                                 output sum, cout);
   supply1 vdd;
   supply0 gnd;

   wire invert_cout;
   inverter invert1(invert_cout, cout);
   
   pmos P1(a, vdd, A);
   pmos P2(a, vdd, B);
   pmos P3(b, vdd, B);
   pmos P4(invert_cout, a, cin);
   pmos P5(invert_cout, b, A);
   pmos P6(e, vdd, invert_cout);
   pmos P7(sum, vdd, e);


   nmos N1(c, gnd, A);
   nmos N2(c, gnd, B);
   nmos N3(d, gnd, B);
   nmos N4(invert_cout, c, cin);
   nmos N5(invert_cout, d, A);
   nmos N6(e, gnd, invert_cout);
   nmos N7(sum, gnd, e);
   
endmodule

module approximate_adder_1bit_v5(input A, B, cin,
                                 output sum, cout);
   assign sum = B;
   assign cout = A;
endmodule

module approximate_adder_8bit_v1(input [7:0] A, B,
                              input cin,
                              output [7:0] sum,
                              output cout);

   wire [7:0] carry;
   approximate_adder_1bit_v1 AA0(.A(A[0]), .B(B[0]), .cin(cin),
                              .sum(sum[0]), .cout(carry[0]));

   approximate_adder_1bit_v1 AA1(.A(A[1]), .B(B[1]), .cin(carry[0]),
                              .sum(sum[1]), .cout(carry[1]));
   
   approximate_adder_1bit_v1 AA2(.A(A[2]), .B(B[2]), .cin(carry[1]),
                              .sum(sum[2]), .cout(carry[2]));
   
   approximate_adder_1bit_v1 AA3(.A(A[3]), .B(B[3]), .cin(carry[2]),
                              .sum(sum[3]), .cout(carry[3]));
   
   approximate_adder_1bit_v1 AA4(.A(A[4]), .B(B[4]), .cin(carry[3]),
                              .sum(sum[4]), .cout(carry[4]));
   
   approximate_adder_1bit_v1 AA5(.A(A[5]), .B(B[5]), .cin(carry[4]),
                              .sum(sum[5]), .cout(carry[5]));
   
   approximate_adder_1bit_v1 AA6(.A(A[6]), .B(B[6]), .cin(carry[5]),
                              .sum(sum[6]), .cout(carry[6]));
   
   approximate_adder_1bit_v1 AA7(.A(A[7]), .B(B[7]), .cin(carry[6]),
                              .sum(sum[7]), .cout(carry[7]));
   assign cout = cin^carry[7];
endmodule

module approximate_adder_8bit_v2(input [7:0] A, B,
                              input cin,
                              output [7:0] sum,
                              output cout);

   wire [7:0] carry;
   approximate_adder_1bit_v2 AA0(.A(A[0]), .B(B[0]), .cin(cin),
                              .sum(sum[0]), .cout(carry[0]));

   approximate_adder_1bit_v2 AA1(.A(A[1]), .B(B[1]), .cin(carry[0]),
                              .sum(sum[1]), .cout(carry[1]));
   
   approximate_adder_1bit_v2 AA2(.A(A[2]), .B(B[2]), .cin(carry[1]),
                              .sum(sum[2]), .cout(carry[2]));
   
   approximate_adder_1bit_v2 AA3(.A(A[3]), .B(B[3]), .cin(carry[2]),
                              .sum(sum[3]), .cout(carry[3]));
   
   approximate_adder_1bit_v2 AA4(.A(A[4]), .B(B[4]), .cin(carry[3]),
                              .sum(sum[4]), .cout(carry[4]));
   
   approximate_adder_1bit_v2 AA5(.A(A[5]), .B(B[5]), .cin(carry[4]),
                              .sum(sum[5]), .cout(carry[5]));
   
   approximate_adder_1bit_v2 AA6(.A(A[6]), .B(B[6]), .cin(carry[5]),
                              .sum(sum[6]), .cout(carry[6]));
   
   approximate_adder_1bit_v2 AA7(.A(A[7]), .B(B[7]), .cin(carry[6]),
                              .sum(sum[7]), .cout(carry[7]));
   assign cout = cin^carry[7];
endmodule

module approximate_adder_8bit_v5(input [7:0] A, B,
                              input cin,
                              output [7:0] sum,
                              output cout);

   wire [7:0] carry;
   approximate_adder_1bit_v5 AA0(.A(A[0]), .B(B[0]), .cin(cin),
                              .sum(sum[0]), .cout(carry[0]));

   approximate_adder_1bit_v5 AA1(.A(A[1]), .B(B[1]), .cin(carry[0]),
                              .sum(sum[1]), .cout(carry[1]));
   
   approximate_adder_1bit_v5 AA2(.A(A[2]), .B(B[2]), .cin(carry[1]),
                              .sum(sum[2]), .cout(carry[2]));
   
   approximate_adder_1bit_v5 AA3(.A(A[3]), .B(B[3]), .cin(carry[2]),
                              .sum(sum[3]), .cout(carry[3]));
   
   approximate_adder_1bit_v5 AA4(.A(A[4]), .B(B[4]), .cin(carry[3]),
                              .sum(sum[4]), .cout(carry[4]));
   
   approximate_adder_1bit_v5 AA5(.A(A[5]), .B(B[5]), .cin(carry[4]),
                              .sum(sum[5]), .cout(carry[5]));
   
   approximate_adder_1bit_v5 AA6(.A(A[6]), .B(B[6]), .cin(carry[5]),
                              .sum(sum[6]), .cout(carry[6]));
   
   approximate_adder_1bit_v5 AA7(.A(A[7]), .B(B[7]), .cin(carry[6]),
                              .sum(sum[7]), .cout(carry[7]));
   assign cout = cin^carry[7];
endmodule
