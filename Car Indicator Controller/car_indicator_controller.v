`timescale 1ns/1ps

module car_indicator_controller (
    input  wire clk,
    input  wire reset,

    // Control inputs
    // 1 = Active
    input  wire left_signal,
    input  wire right_signal,
    input  wire hazard_signal,

    // Indicator outputs
    output reg left_indicator,
    output reg right_indicator
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            left_indicator  <= 1'b0;
            right_indicator <= 1'b0;
        end

        else begin

            // Hazard has highest priority
            if (hazard_signal) begin
                left_indicator  <= 1'b1;
                right_indicator <= 1'b1;
            end

            // Left indicator
            else if (left_signal && !right_signal) begin
                left_indicator  <= 1'b1;
                right_indicator <= 1'b0;
            end

            // Right indicator
            else if (right_signal && !left_signal) begin
                left_indicator  <= 1'b0;
                right_indicator <= 1'b1;
            end

            // No signal or conflicting signals
            else begin
                left_indicator  <= 1'b0;
                right_indicator <= 1'b0;
            end

        end

    end

endmodule
