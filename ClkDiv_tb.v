`timescale 1ns/1ps
module ClkDiv_tb ();



parameter ratio_width = 8 ;
parameter CLK_PERIOD = 10 ;


reg i_ref_clk_tb;
reg i_rst_n_tb;
reg i_clk_en_tb;
reg [ratio_width-1 :0 ]i_div_ratio_tb;
wire o_div_clk_tb;


initial
 begin
 initialize();
 reset ();
  i_clk_en_tb =1'b1;
///////////////// test divide by 2 ////////////
 /*i_div_ratio_tb = 'b10;
 #200
 reset ();
////////////////// test divide by 3 ////////////
  i_div_ratio_tb = 'b11;
  #200
  reset ();	
/////////////////// test divide by 4 ////////////
  i_div_ratio_tb = 'b100;
  #200
  reset ();	
*//////////////////// test divide by 5 ////////////
  i_div_ratio_tb = 'b00100000;
  #200
 	reset ();
 	i_div_ratio_tb = 'b00001000;
  	  
/////////////////// test not enabling the clk div /////////
	 
 #5000
 $stop;
 
 
 
 
 
 end


task reset ;
 begin
  #(CLK_PERIOD)
  i_rst_n_tb  = 'b0;           
  #(CLK_PERIOD)
  i_rst_n_tb  = 'b1;
  #(CLK_PERIOD) ;
 end
endtask


task initialize ;
  begin
	i_ref_clk_tb   = 1'b0  ;
	i_rst_n_tb     = 1'b1  ;   
	i_clk_en_tb    = 1'b0  ;
	i_div_ratio_tb =  'b0  ;
  end
endtask



///////////////////// Clock Generator //////////////////

always #(CLK_PERIOD/2) i_ref_clk_tb = ~i_ref_clk_tb ;




///////// Design Instaniation //////////////////
ClkDiv DUT
(
.i_ref_clk 	 (i_ref_clk_tb),
.i_rst_n	 	 (i_rst_n_tb),
.i_clk_en 	 (i_clk_en_tb),
.i_div_ratio (i_div_ratio_tb),
.o_div_clk (o_div_clk_tb)
);

endmodule





