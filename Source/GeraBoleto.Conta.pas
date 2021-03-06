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
    procedure SetConvenio(const Value: string);
    procedure SetDigitoAgencia(const Value: string);
    procedure SetDigitoConta(const Value: string);
    procedure SetConta(const Value: string);
    procedure SetAgencia(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Banco: TBanco read FBanco write FBanco;
    property LocalPagamento: string read FLocalPagamento write FLocalPagamento;
    property Agencia: string read FAgencia write SetAgencia;
    property DigitoAgencia: string read FDigitoAgencia write SetDigitoAgencia;
    property Conta: string read FConta write SetConta;
    property DigitoConta: string read FDigitoConta write SetDigitoConta;
    property Carteira: string read FCarteira write FCarteira;
    property Convenio: string read FConvenio write SetConvenio;
    property SeqNossoNumero: Integer read FSeqNossoNumero write FSeqNossoNumero;
  end;

implementation

uses
  SysUtils;

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

procedure TConta.SetAgencia(const Value: string);
begin
  FAgencia := Value;
end;

procedure TConta.SetConta(const Value: string);
begin
  FConta := Value;
end;

procedure TConta.SetConvenio(const Value: string);
begin
  FConvenio := Trim(Value);
end;

procedure TConta.SetDigitoAgencia(const Value: string);
begin
  FDigitoAgencia := Value;
end;

procedure TConta.SetDigitoConta(const Value: string);
begin
  FDigitoConta := Value;
end;

end.
