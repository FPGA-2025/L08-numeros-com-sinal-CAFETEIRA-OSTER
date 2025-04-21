/*
module numeros_com_sinal(
    input signed [7:0] entrada_signed_1,
    input signed [3:0] entrada_signed_2,
    input [7:0] entrada_unsigned_1,
    input [3:0] entrada_unsigned_2,
    input [1:0] codigo,
    output reg [7:0] saida
);

always @(*) begin
    saida = (codigo == 2'b00) ? entrada_signed_1 + entrada_signed_2 :  
            (codigo == 2'b01) ? entrada_unsigned_1 + entrada_unsigned_2 :
            (codigo == 2'b10) ? entrada_unsigned_1 + entrada_signed_1 :
            entrada_unsigned_1 + entrada_signed_2;
end

endmodule

*/

module numeros_com_sinal(
    input signed [7:0] entrada_signed_1,
    input signed [3:0] entrada_signed_2,
    input [7:0] entrada_unsigned_1,
    input [3:0] entrada_unsigned_2,
    input [1:0] codigo,
    output reg [7:0] saida
);

  always @(*) begin
    case (codigo)
      2'b00:  saida = entrada_signed_1 + entrada_signed_2;
      2'b01:  saida = entrada_unsigned_1 + entrada_unsigned_2;
      2'b10:  saida = entrada_unsigned_1 + entrada_signed_1;
      2'b11:  saida = entrada_unsigned_1 + entrada_signed_2;
    endcase
  end

endmodule
