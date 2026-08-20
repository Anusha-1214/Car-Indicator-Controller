`timescale 1ns/1ps

module car_indicator_controller_tb;

    reg clk;
    reg reset;

    reg left_signal;
    reg right_signal;
    reg hazard_signal;

    wire left_indicator;
    wire right_indicator;

    // Instantiate Car Indicator Controller
    car_indicator_controller uut (
        .clk(clk),
        .reset(reset),
        .left_signal(left_signal),
        .right_signal(right_signal),
        .hazard_signal(hazard_signal),
        .left_indicator(left_indicator),
        .right_indicator(right_indicator)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Generate waveform
        $dumpfile("car_indicator_controller.vcd");
        $dumpvars(0, car_indicator_controller_tb);

        // Initial values
        clk = 0;
        reset = 1;

        left_signal = 0;
        right_signal = 0;
        hazard_signal = 0;

        #10;

        // Release reset
        reset = 0;

        // -----------------------------------
        // TEST 1: No Indicator
        // -----------------------------------

        #10;
        left_signal = 0;
        right_signal = 0;
        hazard_signal = 0;

        #10;

        // -----------------------------------
        // TEST 2: Left Indicator
        // -----------------------------------

        left_signal = 1;
        right_signal = 0;
        hazard_signal = 0;

        #10;

        // -----------------------------------
        // TEST 3: Right Indicator
        // -----------------------------------

        left_signal = 0;
        right_signal = 1;
        hazard_signal = 0;

        #10;

        // -----------------------------------
        // TEST 4: Hazard Lights
        // -----------------------------------

        left_signal = 0;
        right_signal = 0;
        hazard_signal = 1;

        #10;

        // -----------------------------------
        // TEST 5: Conflicting Signals
        // Both left and right selected
        // -----------------------------------

        left_signal = 1;
        right_signal = 1;
        hazard_signal = 0;

        #10;

        // -----------------------------------
        // TEST 6: Return to Normal
        // -----------------------------------

        left_signal = 0;
        right_signal = 0;
        hazard_signal = 0;

        #20;

        $finish;

    end

    // Display simulation output
    initial begin

        $monitor(
            "Time=%0t | Left_Signal=%b | Right_Signal=%b | Hazard=%b | Left_Indicator=%b | Right_Indicator=%b",
            $time,
            left_signal,
            right_signal,
            hazard_signal,
            left_indicator,
            right_indicator
        );

    end

endmodule
