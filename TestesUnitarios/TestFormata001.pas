unit TestFormata001;

interface

uses
  TestFrameWork, GeraBoleto.Boleto;

type

  TestTFormata001 = class(TTestCase)
  strict private
    FBoleto: IBoleto;
  private
    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDigitoNumeroBancoInvalido;
    procedure TestFormatacaoDoNumeroDaAgencia;
    procedure TestFormatacaoNumeroConta;
  end;


implementation

uses
  GeraBoleto.Conta,
  GeraBoleto.Titulo, System.SysUtils;

{ TestTFormata001 }

procedure TestTFormata001.SetDadosPadrao;
var
  Conta: TConta;
  Titulo: TTitulo;
begin
  Conta := FBoleto.GetConta();
  Conta.Banco.Numero := '001';
  Conta.Banco.DigitoNumero := '9';
  Conta.Agencia := '9999';
  Conta.DigitoAgencia := '9';
  Conta.Conta := '123456';
  Conta.DigitoConta := '1';
  Conta.Convenio := '1234567';
  Conta.SeqNossoNumero := 1;
  Conta.Carteira := '17';

  Titulo := FBoleto.GetTitulo();
  Titulo.Emissao := StrToDate('1/1/2019');
  Titulo.Vencimento := StrToDate('30/05/2019');
  Titulo.EspecMoeda := '9';
  Titulo.EspecDoc := 'DM';
  Titulo.Aceite := 'N';
  Titulo.DataProc := StrToDate('1/1/2019');
  Titulo.Valor := 300.00;
end;

procedure TestTFormata001.SetUp;
begin
  inherited;
  FBoleto := TBoleto.Create();
  SetDadosPadrao();
end;

procedure TestTFormata001.TearDown;
begin
  inherited;
  // FBoleto � uma interface que ser� destruida quando a classe test for finalizada;
end;

procedure TestTFormata001.TestDigitoNumeroBancoInvalido;
begin
  StartExpectingException(Exception);
  FBoleto.GetConta.Banco.DigitoNumero := '8';
  FBoleto.Gerar();
  StopExpectingException('Nenhuma exce��o gerada quando informado o d�gito do n�mero do banco inv�lido');
end;

procedure TestTFormata001.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto.GetConta.Agencia := '123';
  FBoleto.Gerar();
  CheckEquals('0123', FBoleto.GetConta.Agencia, 'Ag�ncia com formato inv�lido!');
end;

procedure TestTFormata001.TestFormatacaoNumeroConta;
begin
  FBoleto.GetConta.Conta := '12345';
  FBoleto.Gerar();
  CheckEquals('00012345', FBoleto.GetConta.Conta, 'Formata��o do n�mero da conta inv�lido');
end;

initialization
  RegisterTest(TestTFormata001.Suite);

end.
