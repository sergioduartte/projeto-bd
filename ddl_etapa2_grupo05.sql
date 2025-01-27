CREATE TABLE  "FILIAL" 
   (	"CODIGO_IDENTIFICACAO" NUMBER NOT NULL ENABLE, 
	"NOME" VARCHAR2(30), 
	"ENDERECO" VARCHAR2(50), 
	"TELEFONE" VARCHAR2(20), 
	 CONSTRAINT "FILIAL_PK" PRIMARY KEY ("CODIGO_IDENTIFICACAO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "CAIXA" 
   (	"NUMERO_CAIXA" NUMBER NOT NULL ENABLE, 
	"FILIAL" NUMBER, 
	 CONSTRAINT "CAIXA_PK" PRIMARY KEY ("NUMERO_CAIXA")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "EQUIPAMENTO" 
   (	"IDENTIFICADOR" NUMBER NOT NULL ENABLE, 
	"DESCRICAO" VARCHAR2(50), 
	"CAIXA" NUMBER, 
	 CONSTRAINT "EQUIPAMENTO_PK" PRIMARY KEY ("IDENTIFICADOR")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "FUNCIONARIO" 
   (	"MATRICULA" VARCHAR2(10) NOT NULL ENABLE, 
	"CPF" VARCHAR2(14) NOT NULL ENABLE, 
	"IDENTIDADE" VARCHAR2(10), 
	"NOME" VARCHAR2(30) NOT NULL ENABLE, 
	"ENDERECO" VARCHAR2(50), 
	"SALARIO" NUMBER, 
	"FUNCAO" VARCHAR2(15), 
	"CODIGO_FILIAL" NUMBER, 
	"MAT_SUPERVISOR" VARCHAR2(10), 
	 CONSTRAINT "FUNCIONARIO_PK" PRIMARY KEY ("MATRICULA")
  USING INDEX  ENABLE, 
	 CONSTRAINT "FUNC_FUNCOES" CHECK (FUNCAO IN ('caixa', 'empacotador', 'açougueiro', 'padeiro', 'limpeza','segurança')) ENABLE
   )
/
CREATE TABLE  "CLIENTE" 
   (	"CPF" VARCHAR2(14) NOT NULL ENABLE, 
	"NOME" VARCHAR2(30) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(30), 
	"PONTOS_CRM" NUMBER, 
	"RUA" VARCHAR2(30), 
	"NUM" VARCHAR2(6), 
	"BAIRRO" VARCHAR2(20), 
	"CIDADE" VARCHAR2(20), 
	"ESTADO" VARCHAR2(20), 
	 CONSTRAINT "CLIENTE_PK" PRIMARY KEY ("CPF")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ORDEM_DE_COMPRA" 
   (	"NUMERO_NOTA_FISCAL" NUMBER NOT NULL ENABLE, 
	"DATA_E_HORA_VENDA" DATE, 
	"NUMERO_DO_CAIXA" NUMBER, 
	"CLIENTE" VARCHAR2(14), 
	"FILIAL" NUMBER, 
	"FUNCIONARIO" VARCHAR2(10), 
	 CONSTRAINT "ORDEM_DE_COMPRA_PK" PRIMARY KEY ("NUMERO_NOTA_FISCAL")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "TELEFONE_FUNCIONARIO" 
   (	"MATRICULA" VARCHAR2(10) NOT NULL ENABLE, 
	"NUMERO" VARCHAR2(20) NOT NULL ENABLE, 
	 CONSTRAINT "TELEFONE_FUNCIONARIO_PK" PRIMARY KEY ("MATRICULA", "NUMERO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REALIZA_MANUTENCAO" 
   (	"IDENTIFICADOR_EQUIPAMENTO" NUMBER, 
	"MATRICULA_FUNCIONARIO" VARCHAR2(10), 
	"DATA_HORA" TIMESTAMP (6), 
	"CUSTO" NUMBER, 
	 CONSTRAINT "REALIZA_MANUTENCAO_PK" PRIMARY KEY ("IDENTIFICADOR_EQUIPAMENTO", "MATRICULA_FUNCIONARIO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "DEPENDENTE" 
   (	"MATRICULA" VARCHAR2(10) NOT NULL ENABLE, 
	"CPF_DEPENDENTE" VARCHAR2(14) NOT NULL ENABLE, 
	"DATA_NASCIMENTO" DATE, 
	"NOME" VARCHAR2(30) NOT NULL ENABLE, 
	 CONSTRAINT "DEPENDENTE_PK" PRIMARY KEY ("MATRICULA", "CPF_DEPENDENTE")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "MARCA" 
   (	"IDENTIFICADOR" NUMBER, 
	"NOME" VARCHAR2(30), 
	 CONSTRAINT "MARCA_PK" PRIMARY KEY ("IDENTIFICADOR")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "CATEGORIA" 
   (	"IDENTIFICADOR" NUMBER NOT NULL ENABLE, 
	"NOME" VARCHAR2(30), 
	 CONSTRAINT "CATEGORIA_PK" PRIMARY KEY ("IDENTIFICADOR")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "PRODUTO" 
   (	"CODIGO_IDENTIFICACAO" NUMBER NOT NULL ENABLE, 
	"NOME" VARCHAR2(30) NOT NULL ENABLE, 
	"DESCRICAO" VARCHAR2(50), 
	"MARGEM_LUCRO_MIN" NUMBER, 
	"CATEGORIA" NUMBER, 
	"FILIAL" NUMBER, 
	"QUANTIDADE" NUMBER, 
	"DATA_VALIDADE" DATE, 
	"PRECO_COMPRA" NUMBER, 
	"PRECO_VENDA" NUMBER, 
	"DATA_COMPRA" DATE, 
	"MARCA" NUMBER, 
	 CONSTRAINT "PRODUTO_PK" PRIMARY KEY ("CODIGO_IDENTIFICACAO")
  USING INDEX  ENABLE, 
	 CONSTRAINT "CHECK_QUANTIDADE_PRODUTO" CHECK (QUANTIDADE >= 0) ENABLE
   )
/
CREATE TABLE  "FORNECEDOR" 
   (	"CNPJ" NUMBER(14,0) NOT NULL ENABLE, 
	"NOME" VARCHAR2(30), 
	"ENDERECO" VARCHAR2(60), 
	"EMAIL" VARCHAR2(30), 
	"SITE" VARCHAR2(30), 
	"CATEGORIA" NUMBER, 
	 CONSTRAINT "FORNECEDOR_PK" PRIMARY KEY ("CNPJ")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "REALIZA_RECLAMACAO" 
   (	"CPF" VARCHAR2(14) NOT NULL ENABLE, 
	"CODIGO_IDENTIFICACAO" NUMBER NOT NULL ENABLE, 
	"DATA_E_HORA" TIMESTAMP (6), 
	"DESCRICAO" VARCHAR2(100), 
	 CONSTRAINT "REALIZA_RECLAMACAO_PK" PRIMARY KEY ("CPF", "CODIGO_IDENTIFICACAO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "NOTA_FISCAL" 
   (	"NUMERO" NUMBER NOT NULL ENABLE, 
	"CNPJ" VARCHAR2(14), 
	"QUANTIDADE" NUMBER, 
	"DATA" DATE, 
	"VALOR_POR_ITEM" NUMBER, 
	 CONSTRAINT "NOTA_FISCAL_PK" PRIMARY KEY ("NUMERO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "SOLICITACAO" 
   (	"IDENTIFICADOR" NUMBER NOT NULL ENABLE, 
	"DATA_SOLICITACAO" DATE, 
	"DATA_PREV_ENTREGA" DATE, 
	"DATA_ENTREGA" DATE, 
	"VALOR_COMPRA" NUMBER, 
	"PRAZO_PAG_DIAS" NUMBER, 
	"FORNECEDOR" NUMBER(14,0), 
	"FILIAL" NUMBER, 
	"NOTA_FISCAL" NUMBER, 
	 CONSTRAINT "SOLICITACAO_PK" PRIMARY KEY ("IDENTIFICADOR")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "ITEM" 
   (	"INDENTIFICADOR" NUMBER NOT NULL ENABLE, 
	"QUANTIDADE" NUMBER, 
	"PRECO_DO_PRODUTO" NUMBER, 
	"DESCONTO" NUMBER, 
	"NOTA_FISCAL" NUMBER, 
	 CONSTRAINT "ITEM_PK" PRIMARY KEY ("INDENTIFICADOR")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "TELEFONE_CLIENTE" 
   (	"CPF" VARCHAR2(14) NOT NULL ENABLE, 
	"NUMERO" VARCHAR2(20) NOT NULL ENABLE, 
	 CONSTRAINT "TELEFONE_CLIENTE_PK" PRIMARY KEY ("CPF", "NUMERO")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "TELEFONE_FORNECEDOR" 
   (	"CNPJ_FORNECEDOR" NUMBER(14,0) NOT NULL ENABLE, 
	"TELEFONE" VARCHAR2(15) NOT NULL ENABLE, 
	 CONSTRAINT "TELEFONE_FORNECEDOR_PK" PRIMARY KEY ("CNPJ_FORNECEDOR", "TELEFONE")
  USING INDEX  ENABLE
   )
/
ALTER TABLE  "CAIXA" ADD CONSTRAINT "CAIXA_FILIAL_FK" FOREIGN KEY ("FILIAL")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ORDEM_DE_COMPRA" ADD CONSTRAINT "CAIXA_FK" FOREIGN KEY ("NUMERO_DO_CAIXA")
	  REFERENCES  "CAIXA" ("NUMERO_CAIXA") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ORDEM_DE_COMPRA" ADD CONSTRAINT "CLIENTE_FK" FOREIGN KEY ("CLIENTE")
	  REFERENCES  "CLIENTE" ("CPF") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "FUNCIONARIO" ADD CONSTRAINT "CODIGO_FILIAL_FK" FOREIGN KEY ("CODIGO_FILIAL")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ENABLE
/
ALTER TABLE  "DEPENDENTE" ADD CONSTRAINT "DEPENDENTE_FK" FOREIGN KEY ("MATRICULA")
	  REFERENCES  "FUNCIONARIO" ("MATRICULA") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "EQUIPAMENTO" ADD CONSTRAINT "EQUIPAMENTO_CAIXA_FK" FOREIGN KEY ("CAIXA")
	  REFERENCES  "CAIXA" ("NUMERO_CAIXA") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "ORDEM_DE_COMPRA" ADD CONSTRAINT "FILIAL_FK" FOREIGN KEY ("FILIAL")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "FORNECEDOR" ADD CONSTRAINT "FORNECEDOR_CATEGORIA_FK" FOREIGN KEY ("CATEGORIA")
	  REFERENCES  "CATEGORIA" ("IDENTIFICADOR") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "ORDEM_DE_COMPRA" ADD CONSTRAINT "FUNCIONARIO_FK" FOREIGN KEY ("FUNCIONARIO")
	  REFERENCES  "FUNCIONARIO" ("MATRICULA") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "PRODUTO" ADD CONSTRAINT "MARCA_FK" FOREIGN KEY ("MARCA")
	  REFERENCES  "MARCA" ("IDENTIFICADOR") ENABLE
/
ALTER TABLE  "ITEM" ADD CONSTRAINT "NUM_NOTA_FISCAL" FOREIGN KEY ("NOTA_FISCAL")
	  REFERENCES  "NOTA_FISCAL" ("NUMERO") ENABLE
/
ALTER TABLE  "PRODUTO" ADD CONSTRAINT "PRODUTO_CATEGORIA_FK" FOREIGN KEY ("CATEGORIA")
	  REFERENCES  "CATEGORIA" ("IDENTIFICADOR") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "PRODUTO" ADD CONSTRAINT "PRODUTO_FILIAL_FK" FOREIGN KEY ("FILIAL")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "REALIZA_MANUTENCAO" ADD CONSTRAINT "REALIZA_MANUTENCAO_EQUIPAMENTO_FK" FOREIGN KEY ("IDENTIFICADOR_EQUIPAMENTO")
	  REFERENCES  "EQUIPAMENTO" ("IDENTIFICADOR") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "REALIZA_MANUTENCAO" ADD CONSTRAINT "REALIZA_MANUTENCAO_FUNCIONARIO_FK" FOREIGN KEY ("MATRICULA_FUNCIONARIO")
	  REFERENCES  "FUNCIONARIO" ("MATRICULA") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "REALIZA_RECLAMACAO" ADD CONSTRAINT "REALIZA_RECLAMACAO_CLIENTE_FK" FOREIGN KEY ("CPF")
	  REFERENCES  "CLIENTE" ("CPF") ENABLE
/
ALTER TABLE  "REALIZA_RECLAMACAO" ADD CONSTRAINT "REALIZA_RECLAMACAO_FILIAL_FK" FOREIGN KEY ("CODIGO_IDENTIFICACAO")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ENABLE
/
ALTER TABLE  "SOLICITACAO" ADD CONSTRAINT "SOLICITACAO_FILIAL_FK" FOREIGN KEY ("FILIAL")
	  REFERENCES  "FILIAL" ("CODIGO_IDENTIFICACAO") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "SOLICITACAO" ADD CONSTRAINT "SOLICITACAO_FORNECEDOR_FK" FOREIGN KEY ("FORNECEDOR")
	  REFERENCES  "FORNECEDOR" ("CNPJ") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "SOLICITACAO" ADD CONSTRAINT "SOLICITACAO_NOTA_FISCAL_FK" FOREIGN KEY ("NOTA_FISCAL")
	  REFERENCES  "NOTA_FISCAL" ("NUMERO") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "TELEFONE_CLIENTE" ADD CONSTRAINT "TELEFONE_CLIENTE_FK" FOREIGN KEY ("CPF")
	  REFERENCES  "CLIENTE" ("CPF") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "TELEFONE_FORNECEDOR" ADD CONSTRAINT "TELEFONE_FORNECEDOR_FK" FOREIGN KEY ("CNPJ_FORNECEDOR")
	  REFERENCES  "FORNECEDOR" ("CNPJ") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "TELEFONE_FUNCIONARIO" ADD CONSTRAINT "TELEFONE_FUNCIONARIO_FK" FOREIGN KEY ("MATRICULA")
	  REFERENCES  "FUNCIONARIO" ("MATRICULA") ON DELETE CASCADE ENABLE
/