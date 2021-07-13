module counter(clk,rst,leds);
input clk,rst;
output reg[3:0]  leds;

integer cnt;

always @(posedge clk,posedge rst)
    begin
        if(rst)
            begin
                leds<=0;
                 cnt<=0;
            end
        else
            begin
                cnt<=cnt+1;
                if(cnt==20000000)
                    begin
                        cnt<=0;
                        leds<=leds+1;
                    end
            end         
    end
endmodule