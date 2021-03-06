unit GeraBoleto.Base;

interface

uses
  GeraBoleto.Conta,
  GeraBoleto.Titulo,
  GeraBoleto.Boleto;

const
  MOEDA = '9';

type
  IFormataCampoLivre = interface
    ['{8C47A949-B2F6-4CD1-A421-21802D3E95E0}']
    procedure Formata(ABoleto: IBoleto);
  end;

  IFormatacao = interface
    ['{61806E63-25CC-4AB7-BA76-83E6CB880194}']
    procedure FormataCamposConta;
    procedure ValidaDados;
    procedure FormataCampoLivre;
    procedure FormataCamposParaImpressao;
  end;

  IGeraBoletoBuilder = interface
    ['{C991EB3A-0539-4EFB-9043-976A5ED48D06}']
    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataCampoLivre: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    function FormataLindaDigitavel: IGeraBoletoBuilder;
    function FormatacamposParaImpressao: IGeraBoletoBuilder;
    function Criar: Boolean;
  end;

  TGeraBoletoBuilder = class(TInterfacedObject, IGeraBoletoBuilder)
  private
    FBoleto: IBoleto;
    FConta: TConta;
    FTitulo: TTitulo;
    FFormatadorBanco: IFormatacao;
  public
    constructor Create(ABoleto: IBoleto);
    destructor Destroy; override;

    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataCampoLivre: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    function FormataLindaDigitavel: IGeraBoletoBuilder;
    function FormataCamposParaImpressao: IGeraBoletoBuilder;

    function Criar: Boolean;
  end;

implementation

uses
  System.SysUtils,
  GeraBoleto.Funcoes,
  GeraBoleto.Factories;

{ TGeraBoletoBuilder }

constructor TGeraBoletoBuilder.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
  FConta := FBoleto.GetConta();
  FTitulo := FBoleto.GetTitulo();

  FFormatadorBanco :=  TFactoryBoleto.GetFormatter(FBoleto);
end;

function TGeraBoletoBuilder.Criar: Boolean;
begin
  Result := FBoleto.GetCodigoBarras().Length > 0;
end;

destructor TGeraBoletoBuilder.Destroy;
begin

  inherited;
end;

function TGeraBoletoBuilder.FormataCampoLivre: IGeraBoletoBuilder;
begin
  FFormatadorBanco.FormataCampoLivre();
  Result := Self;
end;

function TGeraBoletoBuilder.FormataCampos: IGeraBoletoBuilder;
begin
  FFormatadorBanco.FormataCamposConta();
  Result := Self;
end;

function TGeraBoletoBuilder.FormataCamposParaImpressao: IGeraBoletoBuilder;
begin
  FFormatadorBanco.FormataCamposParaImpressao();
  Result := Self;
end;

function TGeraBoletoBuilder.FormataCodigoBarras: IGeraBoletoBuilder;
var
  CodigoBarras: string;
  DigitoCodigoBarras: string;
begin
  CodigoBarras := FConta.Banco.Numero +
                  MOEDA +
                  FatorVencimento(FTitulo.Vencimento) +
                  FormatFloat('0000000000', FTitulo.Valor * 100) +
                  FBoleto.GetCampoLivre();

  DigitoCodigoBarras := CalcDigitoVerificadorCodigoBarras(CodigoBarras);
  Insert(DigitoCodigoBarras, CodigoBarras, 5);
  FBoleto.SetCodigoBarras(CodigoBarras);

  Result := Self;

//<00196790500000300000000001234567000000000117>
//<00198790500000300000000001234567000000000117>
end;

function TGeraBoletoBuilder.FormataLindaDigitavel: IGeraBoletoBuilder;
var
  Campos: array[1..5] of string;

  function GetCampoFmt(Texto: string): string;
  var
    Dv: string;
  begin
    Result := Texto;
    Dv := Modulo10(Result);

    Result := Result + Dv;
    Insert('.', Result, 6);
  end;
begin
  Campos[1] := GetCampoFmt(FConta.Banco.Numero + MOEDA + Copy(FBoleto.GetCodigoBarras(), 20, 5));
  Campos[2] := GetCampoFmt(Copy(FBoleto.GetCodigoBarras(), 25, 10));
  Campos[3] := GetCampoFmt(Copy(FBoleto.GetCodigoBarras(), 35, 10));
  Campos[4] := FBoleto.GetCodigoBarras()[5];
  Campos[5] := Copy(FBoleto.GetCodigoBarras(), 6, 14);

  FBoleto.SetLinhaDigitavel(Campos[1] + ' ' +
                            Campos[2] + ' ' +
                            Campos[3] + ' ' +
                            Campos[4] + ' ' +
                            Campos[5]);

//<00190.00009 01234.567004 00000.001172 6 79050000030000> but was:
//<00190.00000 01234.567000 00000.001170 8 79050000030000>

  Result := Self;
end;

function TGeraBoletoBuilder.ValidaDados: IGeraBoletoBuilder;
begin
  FFormatadorBanco.ValidaDados();
  Result := Self;
end;

end.
