`timescale 1ns/1ns

module counter_32_bit_tb;
    

    // Define parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    parameter N=32;

    // Inputs
    logic clk;
    logic reset;

    // Outputs
    logic [N-1:0]q;

    // Instantiate the counter module
    counter_32_bit #(.N(N)) dut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Initial values
    initial begin
        clk = 0;
        reset = 1; // Assert reset initially
        #20; // Wait for a few clock cycles
        reset = 0; // Deassert reset
        #100; // Run simulation for some time
        $finish; // End simulation
    end

    // Stimulus generation
    always @(posedge clk) begin
        // Insert stimulus here if needed
    end

    // Monitor
    always @(posedge clk) begin
        $display("q = %d", q);
    end

endmodule


// `timescale 1ns/1ns

// module testbench;

//     // Parameters
//     parameter N = 32;

//     // Inputs
//     logic clk;
//     logic reset;

//     // Outputs
//     logic [N-1:0] q;

//     // Instantiate the counter
//     counter_32_bit #(.N(N)) dut (
//         .clk(clk),
//         .reset(reset),
//         .q(q)
//     );

//     // Clock generation
//     always #5 clk = ~clk;

//     // Initial reset
//     initial begin
//         clk = 0;
//         reset = 1;
//         #10 reset = 0;
//     end

//     // Monitor the output
//     always @(posedge clk) begin
//         $display("q = %d", q);
//     end

//     // Stop simulation after some cycles
//     initial begin
//         #1000;
//         $stop;
//     end

// endmodule
