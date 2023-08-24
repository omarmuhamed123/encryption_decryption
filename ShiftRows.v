module ShiftRows 
(
    InData,
    OutData
);

input [0:127] InData;
output [0:127] OutData;
//ROW 1
assign OutData[0:31]=InData[0:31];
//ROW 2
genvar j;
assign OutData[56:63]=InData[32:39];
generate
    for(j=40;j<57;j=j+8)
    assign OutData[j-8:j-1]=InData[j:j+7];
endgenerate
//ROW3
assign OutData[88:95]=InData[72:79];
assign OutData[80:87]=InData[64:71];
generate
    for(j=80;j<89;j=j+8)
    assign OutData[j-16:j-9]=InData[j:j+7];
endgenerate
//ROW4
assign OutData[96:103]=InData[120:127];
generate
    for(j=96;j<120;j=j+8)
    assign OutData[j+8:j+15]=InData[j:j+7];
endgenerate
endmodule

