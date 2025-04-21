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

module tb();

    reg [7:0] tb_entrada_signed_1;
    reg [3:0] tb_entrada_signed_2;
    reg [7:0] tb_entrada_unsigned_1;
    reg [3:0] tb_entrada_unsigned_2;
    reg [1:0] tb_codigo;
    wire [7:0] tb_saida;

    numeros_com_sinal r(
        .entrada_signed_1(tb_entrada_signed_1),
        .entrada_signed_2(tb_entrada_signed_2),
        .entrada_unsigned_1(tb_entrada_unsigned_1),
        .entrada_unsigned_2(tb_entrada_unsigned_2), 
        .codigo(tb_codigo),
        .saida(tb_saida)
    );

    initial begin
        $monitor("entrada_signed_1=%d, entrada_signed_2=%d, entrada_unsigned_1=%d, entrada_unsigned_2=%d, codigo=%b, saida=%d", 
            tb_entrada_signed_1, tb_entrada_signed_2, tb_entrada_unsigned_1, tb_entrada_unsigned_2, tb_codigo, tb_saida);

        tb_entrada_signed_1 = 8'b00000001; // 1
        tb_entrada_signed_2 = 4'b0001; // 1
        tb_entrada_unsigned_1 = 8'b00000001; // 1
        tb_entrada_unsigned_2 = 4'b0001; // 1
        tb_codigo = 2'b00; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000001; // 1
        tb_entrada_signed_2 = 4'b0001; // 1
        tb_entrada_unsigned_1 = 8'b00000001; // 1
        tb_entrada_unsigned_2 = 4'b0001; // 1
        tb_codigo = 2'b01; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000001; // 1
        tb_entrada_signed_2 = 4'b0001; // 1
        tb_entrada_unsigned_1 = 8'b00000001; // 1
        tb_entrada_unsigned_2 = 4'b0001; // 1
        tb_codigo = 2'b10; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000001; // 1
        tb_entrada_signed_2 = 4'b0001; // 1
        tb_entrada_unsigned_1 = 8'b00000001; // 1
        tb_entrada_unsigned_2 = 4'b0001; // 1
        tb_codigo = 2'b00; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000001; // 1
        tb_entrada_signed_2 = 4'b0001; // 1
        tb_entrada_unsigned_1 = 8'b00000001; // 1
        tb_entrada_unsigned_2 = 4'b0001; // 1
        tb_codigo = 2'b11; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000010; // 2
        tb_entrada_signed_2 = 4'b0011; // 3
        tb_entrada_unsigned_1 = 8'b00000010; // 2
        tb_entrada_unsigned_2 = 4'b0011; // 3
        tb_codigo = 2'b11; // soma signed
        #2;
        tb_entrada_signed_1 = 8'b00000011; // 3
        tb_entrada_signed_2 = 4'b0011; // 3
        tb_entrada_unsigned_1 = 8'b00000011; // 3
        tb_entrada_unsigned_2 = 4'b0011; // 3
        tb_codigo = 2'b00; // soma signed
        #2;
    end

endmodule