module top (
         input          i_clk
        ,input  [3:0]   i_sw_n
        ,output         o_led_blue
        ,output         o_led_green
        ,output         o_led_orange
        ,output         o_led_red
    );

    // スイッチを押すたび点灯と消灯を切り替える処理
    wire [3:0] w_sw_n_edge      ;
    reg  [3:0] r_sw_n_d1        ;
    reg  [3:0] r_sw_n_d2        ;
    reg  [3:0] r_sw_n_toggle    ;

    initial begin
        r_sw_n_d1     [3:0] = 4'b0000 ;
        r_sw_n_d2     [3:0] = 4'b0000 ;
        r_sw_n_toggle [3:0] = 4'b0000 ;
    end

    assign w_sw_n_edge = r_sw_n_d2 & ~r_sw_n_d1 ;
    always @(posedge i_clk) begin
        r_sw_n_d1          <= i_sw_n ;
        r_sw_n_d2          <= r_sw_n_d1 ;

        r_sw_n_toggle[3]   <= (w_sw_n_edge[3]) ? ~r_sw_n_toggle[3] : r_sw_n_toggle[3] ;
        r_sw_n_toggle[2]   <= (w_sw_n_edge[2]) ? ~r_sw_n_toggle[2] : r_sw_n_toggle[2] ;
        r_sw_n_toggle[1]   <= (w_sw_n_edge[1]) ? ~r_sw_n_toggle[1] : r_sw_n_toggle[1] ;
        r_sw_n_toggle[0]   <= (w_sw_n_edge[0]) ? ~r_sw_n_toggle[0] : r_sw_n_toggle[0] ;
    end

    assign o_led_blue       = r_sw_n_toggle[3] ; 
    assign o_led_green      = r_sw_n_toggle[2] ; 
    assign o_led_orange     = r_sw_n_toggle[1] ; 
    assign o_led_red        = r_sw_n_toggle[0] ; 

endmodule