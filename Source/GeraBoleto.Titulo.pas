unit GeraBoleto.Titulo;

interface

uses
  System.Classes;

type
  TTitulo = class
  private
    FEmissao: TDate;
    FVencimento: TDate;
    FDocumento: string;
    FEspecMoeda: string;
    FEspecDoc: string;
    FAceite: string;
    FDataProc: TDate;
    FNossoNumero: string;
    FDigitoNossoNumero: string;
    FValor: Currency;
    FIntrucoes: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    property Emissao: TDate read FEmissao write FEmissao;
    property Vencimento: TDate read FVencimento write FVencimento;
    property Documento: string read FDocumento write FDocumento;
    property EspecMoeda: string read FEspecMoeda write FEspecMoeda;
    property EspecDoc: string read FEspecDoc write FEspecDoc;
    property Aceite: string read FAceite write FAceite;
    property DataProc: TDate read FDataProc write FDataProc;
    property NossoNumero: string read FNossoNumero write FNossoNumero;
    property DigitoNossoNumero: string read FDigitoNossoNumero write FDigitoNossoNumero;
    property Valor: Currency read FValor write FValor;
    property Intrucoes: TStrings read FIntrucoes write FIntrucoes;
  end;

implementation

{ TTitulo }

constructor TTitulo.Create;
begin
  FIntrucoes := TStringList.Create();
end;

destructor TTitulo.Destroy;
begin
  FIntrucoes.Free();
  inherited;
end;

end.
