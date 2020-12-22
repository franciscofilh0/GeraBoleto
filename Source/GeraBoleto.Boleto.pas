unit GeraBoleto.Boleto;

interface

uses
  GeraBoleto.Pessoa,
  GeraBoleto.Conta,
  GeraBoleto.Titulo;

type
  IBoleto = interface
    ['{FD633CAA-580A-4CC0-AB32-DBD23600F6BC}']
    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;

    procedure Gerar;
  end;

  TBoleto = class(TInterfacedObject, IBoleto)
  private
    FBeneficiario: TPessoa;
    FConta: TConta;
    FTitulo: TTitulo;
    FPagador: TPessoa;
  public
    constructor Create;
    destructor Destroy; override;

    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;

    procedure Gerar;

    property Beneficiario: TPessoa read FBeneficiario write FBeneficiario;
    property Conta: TConta read FConta write FConta;
    property Titulo: TTitulo read FTitulo write FTitulo;
    property Pagador: TPessoa read FPagador write FPagador;
  end;

implementation

{ TBoleto }

constructor TBoleto.Create;
begin
  FBeneficiario := TPessoa.Create();
  FConta := TConta.Create();
  FTitulo := TTitulo.Create();
  FPagador := TPessoa.Create();
end;

destructor TBoleto.Destroy;
begin
  FBeneficiario.Free();
  FConta.Free();
  FTitulo.Free();
  FPagador.Free();

  inherited;
end;

procedure TBoleto.Gerar;
begin

end;

function TBoleto.GetBeneficiario: TPessoa;
begin
  Result := FBeneficiario;
end;

function TBoleto.GetConta: TConta;
begin
  Result := FConta;
end;

function TBoleto.GetPagador: TPessoa;
begin
  Result := FPagador;
end;

function TBoleto.GetTitulo: TTitulo;
begin
  Result := FTitulo;
end;

end.
