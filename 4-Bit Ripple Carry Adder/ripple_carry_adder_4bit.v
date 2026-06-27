module ripple_carry_adder_4bit (
    input  wire [3:0] A,    // 4-bit input vector A
    input  wire [3:0] B,    // 4-bit input vector B
    input  wire       Cin,  // Carry-in to the first stage
    output wire [3:0] Sum,  // 4-bit Sum output vector
    output wire       Cout  // Final Carry-out bit
);

    // Internal wires to carry the bits from one stage to the next
    wire c1, c2, c3;

    // Instantiate four 1-bit full adders to handle each bit stage
    // Format: full_adder instance_name (.port_name(signal_name), ...)
    
    full_adder fa0 (
        .a(A[0]), 
        .b(B[0]), 
        .cin(Cin), 
        .sum(Sum[0]), 
        .cout(c1)
    );

    full_adder fa1 (
        .a(A[1]), 
        .b(B[1]), 
        .cin(c1), 
        .sum(Sum[1]), 
        .cout(c2)
    );

    full_adder fa2 (
        .a(A[2]), 
        .b(B[2]), 
        .cin(c2), 
        .sum(Sum[2]), 
        .cout(c3)
    );

    full_adder fa3 (
        .a(A[3]), 
        .b(B[3]), 
        .cin(c3), 
        .sum(Sum[3]), 
        .cout(Cout)
    );

endmodule
