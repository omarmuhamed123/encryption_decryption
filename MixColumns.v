module MixColumns 
(
  InData,
  OutData,
);

input [127:0] InData;
output[127:0] OutData;

function [7:0] m2;
  input[7:0]data;
  begin
    if(data>127)
    m2 = (data*2) ^ 8'b00011011;
    else
    m2 = data * 2;
  end
endfunction

function [7:0] m3;
  input[7:0]data;
  begin
    m3 = data ^ m2(data);
  end
endfunction

genvar i;
generate
  for(i=127;i>102;i=i-8)
  begin
  assign OutData[i:i-7]=m2(InData[i:i-7])^m3(InData[i-32:i-39])^(InData[i-64:i-71])^(InData[i-96:i-103]);
  assign OutData[i-32:i-39]=(InData[i:i-7])^m2(InData[i-32:i-39])^m3(InData[i-64:i-71])^(InData[i-96:i-103]);
  assign OutData[i-64:i-71]=(InData[i:i-7])^(InData[i-32:i-39])^m2(InData[i-64:i-71])^m3(InData[i-96:i-103]);
  assign OutData[i-96:i-103]=m3(InData[i:i-7])^(InData[i-32:i-39])^(InData[i-64:i-71])^m2(InData[i-96:i-103]);
  end
endgenerate













endmodule