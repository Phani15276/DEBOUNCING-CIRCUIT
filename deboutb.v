module debtb();

reg sw,m_tick,clk;
wire out;

debo uut(.sw(sw),.m_tick(m_tick),.clk(clk),.out(out));

always #10 clk=~clk;

initial begin
	clk=0;
	sw=0;
	m_tick=0;
	#30;
	sw=0;
	#20;
	sw=1;m_tick=0;
	#20;
	m_tick=1;
	#40;
	#100;
	$finish;
end
endmodule
