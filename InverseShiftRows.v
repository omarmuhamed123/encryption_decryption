module InverseShiftRows
(
    InData,
    OutData
);

input [0:127] InData;
output [0:127] OutData;

//ROW1
assign OutData[0:31]=InData[0:31];
//ROW2
genvar j;
assign OutData[32:39]=InData[56:63];
generate
    for(j=32;j<49;j=j+8)
    assign OutData[j+8:j+15]=InData[j:j+7];
endgenerate
//ROW3
assign OutData[72:79]=InData[88:95];
assign OutData[64:71]=InData[80:87];
generate
    for(j=64;j<73;j=j+8)
    assign OutData[j+16:j+23]=InData[j:j+7];
endgenerate
//ROW4
assign OutData[120:127]=InData[96:103];
generate
    for(j=104;j<121;j=j+8)
    assign OutData[j-8:j-1]=InData[j:j+7];
endgenerate


endmodule