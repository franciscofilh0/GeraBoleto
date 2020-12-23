unit GeraBoleto.Base;

interface

uses
  GeraBoleto.Conta,
  GeraBoleto.Titulo,
  GeraBoleto.Boleto;

type
  IFormatacao = interface
    ['{61806E63-25CC-4AB7-BA76-83E6CB880194}']
    procedure FormataCamposConta;
    procedure ValidaDados;
    procedure FormataCampoLivre;
  end;

  IGeraBoletoBuilder = interface
    ['{C991EB3A-0539-4EFB-9043-976A5ED48D06}']
    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataCampoLivre: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    function FormataLindaDigitavel: IGeraBoletoBuilder;
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
    function Criar: Boolean;
  end;

implementation

uses
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
  Result := True;
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

function TGeraBoletoBuilder.FormataCodigoBarras: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TGeraBoletoBuilder.FormataLindaDigitavel: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TGeraBoletoBuilder.ValidaDados: IGeraBoletoBuilder;
begin
  FFormatadorBanco.ValidaDados();
  Result := Self;
end;

end.
