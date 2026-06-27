`timescale 1ns / 1ps

module tb_counter_4bit;

    // Inputs (declared as reg)
    reg clk;

    // Outputs (declared as wire)
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter_4bit uut (
        .clk(clk),
        .count(count)
    );

    // 1. Clock Generation Logic
    // Generates a 100MHz clock signal (period = 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggles every 5ns
    end

    // 2. Simulation Control Process
    initial begin
        // Print header to the simulator console
        $display("Time\t clk | count (Bin) | count (Dec)");
        $display("----------------------------------------");
        $monitor("%0dt\t  %b  |    %b     |    %d", $time, clk, count, count);

        // Run the simulation for 200ns 
        // This is long enough to see the counter step from 0 to 15, and wrap around back to 0
        #200;

        // Stop the simulation
        $finish;
    end

endmodule
