module InverseSubByte
(
    InData,
    OutData
);

input [0:127] InData;
output [0:127] OutData;

genvar i;

generate
for(i=0;i<128;i=i+8) 
    begin
	    InverseSbox s(InData[i:i+7],OutData[i:i+7]);
	end
endgenerate
endmodule
