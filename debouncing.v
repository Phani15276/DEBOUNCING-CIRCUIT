module debo(
input sw,m_tick,clk,
output reg out
);

reg [4:0] state,n_state;

parameter s0=5'b00001,
		  w1=5'b00010,
		  w2=5'b00100,
		  w3=5'b01000,
		  s1=5'b10000,
		  w4=5'b10001,
		  w5=5'b10010,
		  w6=5'b10100;
		  
always @(posedge clk ) begin
	state<=n_state;
end

always @(*) begin
	n_state=state;
	case(state)
	s0:n_state=sw?w1:s0;
	w1: begin
	if(sw) begin
		if(m_tick)
			n_state=w2;
		else
			n_state=w1;
		end
	else
	n_state=s0;
	end
	
	w2: begin
	if(sw) begin
		if(m_tick) 
			n_state=w3;
		else
			n_state=w2;
		end
	else
		n_state=s0;
	end
	
	w3: begin
	if(sw) begin
		if(m_tick) 
			n_state=s1;
		else
			n_state=w3;
		end
	else
		n_state=s0;
	end
	
	
	s1:n_state=sw?s1:w4;
	w4: begin
	if(sw) begin
		n_state=s1;
	end
	else begin
		if(m_tick)
			n_state=w5;
		else
			n_state=w4;
	end
	end
	
	w5: begin
	if(sw) begin
		n_state=s1;
	end
	else begin
		if(m_tick)
			n_state=w6;
		else
			n_state=w5;
	end
	end
	
	w6: begin
	if(sw) begin
		n_state=s1;
	end
	else begin
		if(m_tick)
			n_state=s0;
		else
			n_state=w6;
	end
	end
	
	
	
	default n_state=s0;
	endcase
end

always @(*) begin
	out=(n_state==s1);
end

endmodule