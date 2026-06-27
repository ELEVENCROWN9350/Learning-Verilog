`timescale 1ns / 1ps

module tb_ripple_carry_adder_4bit;

    // Inputs (declared as reg)
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs (declared as wire)
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    ripple_carry_adder_4bit uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        // Console headers
        $display("Time\t A    B    Cin | Sum  Cout");
        $display("------------------------------");
        $monitor("%0dt\t %d    %d    %b   | %d    %b", $time, A, B, Cin, Sum, Cout);

        // Test Case 1: 0 + 0 + 0 = 0
        A = 4'd0; B = 4'd0; Cin = 0; #10;
        
        // Test Case 2: 5 + 3 + 0 = 8
        A = 4'd5; B = 4'd3; Cin = 0; #10;
        
        // Test Case 3: 7 + 2 + 1 (Cin) = 10
        A = 4'd7; B = 4'd2; Cin = 1; #10;
        
        // Test Case 4: 12 + 6 + 0 = 18 (Expect Sum=2, Cout=1 due to overflow)
        A = 4'd12; B = 4'd6; Cin = 0; #10;
        
        // Test Case 5: 15 + 15 + 1 (Cin) = 31 (Expect Sum=15, Cout=1)
        A = 4'd15; B = 4'd15; Cin = 1; #10;

        $finish;
    end
      
endmodule
