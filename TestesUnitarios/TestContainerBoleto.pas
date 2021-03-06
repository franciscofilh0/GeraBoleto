unit TestContainerBoleto;

interface

uses
  TestFramework, GeraBoleto.Container, GeraBoleto.Boleto;

type
  TestBoletoContainer = class(TTestCase)
  strict private
  private
    FContainer: TBoletoContainer;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAdicaoDeBoletoNoContainer;
    procedure TestListaDeBoletoNoContainer;
    procedure TestExcluiBoletoDoContainer;
  end;


implementation

{ TestBoletoContainer }

procedure TestBoletoContainer.SetUp;
begin
  inherited;
  FContainer := TBoletoContainer.Create();
end;

procedure TestBoletoContainer.TearDown;
begin
  inherited;
end;

procedure TestBoletoContainer.TestAdicaoDeBoletoNoContainer;
var
  Boleto: IBoleto;
begin
  Boleto := FContainer.Add();
  CheckTrue((Boleto is TBoleto), 'Nenhum boleto retornado!');
end;

procedure TestBoletoContainer.TestExcluiBoletoDoContainer;
begin
  FContainer.Add();
  FContainer.Add();
  FContainer.Add();

  FContainer.Delete(1);
  CheckEquals(2, FContainer.Boletos.Count, 'M�todo Deleta n�o excluiu o boleto corretamente!');
end;

procedure TestBoletoContainer.TestListaDeBoletoNoContainer;
begin
  FContainer.Add();
  FContainer.Add();
  FContainer.Add();
  CheckEquals(3, FContainer.Boletos.Count, 'Lista de Boletos com erro!');
end;

initialization
  RegisterTest(TestBoletoContainer.Suite);

end.
