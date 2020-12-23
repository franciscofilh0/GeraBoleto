unit GeraBoleto.Banco001;

interface

uses
  GeraBoleto.Base,
  GeraBoleto.Boleto;

const
  DIGITO_NUMERO = '9';

type
  TFormata001 = class(TInterfacedObject, IFormatacao)
  private
    FBoleto: IBoleto;
  public
    constructor Create(ABoleto: IBoleto);

    procedure FormataCamposConta;
    procedure ValidaDados;
    procedure FormataCampoLivre;
  end;

implementation

uses
  GeraBoleto.Funcoes,
  System.SysUtils;

{ TFormata001 }

constructor TFormata001.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
end;

procedure TFormata001.FormataCampoLivre;
begin

end;

procedure TFormata001.FormataCamposConta;
begin
  FBoleto.GetConta.Agencia := LeftPad(FBoleto.GetConta.Agencia, 4);
  FBoleto.GetConta.Conta := LeftPad(FBoleto.GetConta.Conta, 8);
end;

procedure TFormata001.ValidaDados;
begin
  if FBoleto.GetConta.Banco.DigitoNumero <> DIGITO_NUMERO then
    raise Exception.Create('Digito do n�mero do banco inv�lido!');
end;

end.
