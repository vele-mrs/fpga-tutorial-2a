`timescale 1ns / 100ps

module top_tb ;

    // 信号を定義
    reg         r_clk           ;
    reg  [3:0]  r_sw_n          ;
    wire        w_led_blue      ;
    wire        w_led_green     ;
    wire        w_led_orange    ;
    wire        w_led_red       ;

    // 100MHzクロック信号を生成
    initial begin
        r_clk = 0 ;
    end

    always #(5) begin
        r_clk <= ~r_clk ;
    end

    // スイッチ信号を生成
    initial fork
        #0      r_sw_n[3:0] = 4'b1111 ;
        #100    r_sw_n[3:0] = 4'b1110 ;
        #200    r_sw_n[3:0] = 4'b1111 ;
        #300    r_sw_n[3:0] = 4'b1101 ;
        #400    r_sw_n[3:0] = 4'b1111 ;
        #500    r_sw_n[3:0] = 4'b1011 ;
        #600    r_sw_n[3:0] = 4'b1111 ;
        #700    r_sw_n[3:0] = 4'b0111 ;
        #800    r_sw_n[3:0] = 4'b1111 ;

        #2100   r_sw_n[3:0] = 4'b0111 ;
        #2200   r_sw_n[3:0] = 4'b1111 ;
        #2300   r_sw_n[3:0] = 4'b1011 ;
        #2400   r_sw_n[3:0] = 4'b1111 ;
        #2500   r_sw_n[3:0] = 4'b1101 ;
        #2600   r_sw_n[3:0] = 4'b1111 ;
        #2700   r_sw_n[3:0] = 4'b1110 ;
        #2800   r_sw_n[3:0] = 4'b1111 ;

        #3000   $finish ;
    join

    // top.vを読み出す
    top top_inst (
         .i_clk         (r_clk          )
        ,.i_sw_n        (r_sw_n         )
        ,.o_led_blue    (w_led_blue     )
        ,.o_led_green   (w_led_green    )
        ,.o_led_orange  (w_led_orange   )
        ,.o_led_red     (w_led_red      )
    );

endmodule