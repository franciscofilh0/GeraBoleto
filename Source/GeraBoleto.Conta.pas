unit GeraBoleto.Conta;

interface

uses
  GeraBoleto.Banco;

type
  TConta = class
  private
    FBanco: TBanco;
    FLocalPagamento: string;
    FAgencia: string;
    FDigitoAgencia: string;
    FConta: string;
    FDigitoConta: string;
    FCarteira: string;
    FConvenio: string;
    FSeqNossoNumero: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property Banco: TBanco read FBanco write FBanco;
    property LocalPagamento: string read FLocalPagamento write FLocalPagamento;
    property Agencia: string read FAgencia write FAgencia;
    property DigitoAgencia: string read FDigitoAgencia write FDigitoAgencia;
    property Conta: string read FConta write FConta;
    property DigitoConta: string read FDigitoConta write FDigitoConta;
    property Carteira: string read FCarteira write FCarteira;
    property Convenio: string read FConvenio write FConvenio;
    property SeqNossoNumero: Integer read FSeqNossoNumero write FSeqNossoNumero;
  end;

implementation

{ TConta }

constructor TConta.Create;
begin
  FBanco := TBanco.Create();
end;

destructor TConta.Destroy;
begin
  FBanco.Free;
  inherited;
end;

end.
