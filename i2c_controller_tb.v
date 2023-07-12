`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2023 04:20:59 PM
// Design Name: 
// Module Name: i2c_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module i2c_controller_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [6:0] addr;
	reg [7:0] data_in;
	reg enable;
	reg rw;

	// Outputs
	wire [7:0] data_out;
	wire ready;

	// Bidirs
	wire i2c_sda;
	wire i2c_scl;

	// Instantiate the Unit Under Test (UUT)
	i2c_controller master (
		.clk(clk), 
		.rst(rst), 
		.addr(addr), 
		.data_in(data_in), 
		.enable(enable), 
		.rw(rw), 
		.data_out(data_out), 
		.ready(ready), 
		.i2c_sda(i2c_sda), 
		.i2c_scl(i2c_scl)
	);
	
		
	i2c_slave_controller slave (
    .sda(i2c_sda), 
    .scl(i2c_scl)
    );
	
	initial begin
		clk = 0;
		forever begin
			clk = #1 ~clk;
		end		
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 0;		
		addr = 7'b0101010;
		data_in = 8'b10101010;
		rw = 0;	
		enable = 1;
		//#50;
		//addr=7'b1010100;
		//data_in=8'b11001100;
		//rw=0;
		//#100;
		//addr=7'b0101010;
		//rw=1;
		
		//#100;
		//addr=7'b1010100;
		//rw=1;
		
		//#200;
		//enable=0;
			
			#10;
                                                                rst=0;
                                                                addr=7'b0101010;
                                                                rw=1;
                                                                enable=1;
                                                                #10;
                                                                enable=0;
			
		#700
		$finish;
		
	end      
endmodule