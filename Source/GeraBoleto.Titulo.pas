unit GeraBoleto.Titulo;

interface

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
    FValor: Currency;
  public
    property Emissao: TDate read FEmissao write FEmissao;
    property Vencimento: TDate read FVencimento write FVencimento;
    property Documento: string read FDocumento write FDocumento;
    property EspecMoeda: string read FEspecMoeda write FEspecMoeda;
    property EspecDoc: string read FEspecDoc write FEspecDoc;
    property Aceite: string read FAceite write FAceite;
    property DataProc: TDate read FDataProc write FDataProc;
    property NossoNumero: string read FNossoNumero write FNossoNumero;
    property Valor: Currency read FValor write FValor;
  end;

implementation

end.
