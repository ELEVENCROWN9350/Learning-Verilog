module shift_register_4bit(
    input clk,
    input serial_in,
    output reg [3:0] q
);

initial begin
    q = 4'b0000;
end

always @(posedge clk)
begin
    q <= {serial_in,q[3:1]};
end

endmodule
