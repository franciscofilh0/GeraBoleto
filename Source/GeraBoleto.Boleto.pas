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
    function GetCampoLivre: string;
    function GetCodigoBarras: string;
    function GetLinhadigitavel: string;
    function GetCodBeneficiarioFormatado: string;
    function GetNossoNumeroFormatado: string;

    procedure SetCampoLivre(Value: string);
    procedure SetLinhaDigitavel(Value: string);
    procedure SetCodigoBarras(Value: string);
    procedure SetNossoNumeroFormatado(Value: string);
    procedure SetCodBeneficiarioFormatado(Value: string);

    procedure Gerar;
  end;

  TBoleto = class(TInterfacedObject, IBoleto)
  private
    FBeneficiario: TPessoa;
    FConta: TConta;
    FTitulo: TTitulo;
    FPagador: TPessoa;
    FCampoLivre: string;
    FCodigoBarras: string;
    FLinhaDigitavel: string;
    FNossoNumeroFormatado: string;
    FCodBeneficiarioFormatado: string;
  public
    constructor Create;
    destructor Destroy; override;

    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;
    function GetCampoLivre: string;
    function GetCodigoBarras: string;
    function GetLinhadigitavel: string;
    function GetCodBeneficiarioFormatado: string;
    function GetNossoNumeroFormatado: string;

    procedure SetCampoLivre(Value: string);
    procedure SetLinhaDigitavel(Value: string);
    procedure SetCodigoBarras(Value: string);
    procedure SetNossoNumeroFormatado(Value: string);
    procedure SetCodBeneficiarioFormatado(Value: string);

    procedure Gerar;
  end;

implementation

uses
  GeraBoleto.Base;

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
  TGeraBoletoBuilder.Create(Self).FormataCampos()
                                 .ValidaDados()
                                 .FormataCampoLivre()
                                 .FormataCodigoBarras()
                                 .FormataLindaDigitavel()
                                 .Criar();

end;

function TBoleto.GetBeneficiario: TPessoa;
begin
  Result := FBeneficiario;
end;

function TBoleto.GetCampoLivre: string;
begin
  Result := FCampoLivre;
end;

function TBoleto.GetCodBeneficiarioFormatado: string;
begin
  Result := FCodBeneficiarioFormatado;
end;

function TBoleto.GetCodigoBarras: string;
begin
  Result := FCodigoBarras;
end;

function TBoleto.GetConta: TConta;
begin
  Result := FConta;
end;

function TBoleto.GetLinhadigitavel: string;
begin
  Result := FLinhaDigitavel;
end;

function TBoleto.GetNossoNumeroFormatado: string;
begin
  Result := FNossoNumeroFormatado;
end;

function TBoleto.GetPagador: TPessoa;
begin
  Result := FPagador;
end;

function TBoleto.GetTitulo: TTitulo;
begin
  Result := FTitulo;
end;

procedure TBoleto.SetCampoLivre(Value: string);
begin
  FCampoLivre := Value;
end;

procedure TBoleto.SetCodBeneficiarioFormatado(Value: string);
begin
  FCodBeneficiarioFormatado := Value;
end;

procedure TBoleto.SetCodigoBarras(Value: string);
begin
  FCodigoBarras := Value;
end;

procedure TBoleto.SetLinhaDigitavel(Value: string);
begin
  FLinhaDigitavel := Value;
end;

procedure TBoleto.SetNossoNumeroFormatado(Value: string);
begin
  FNossoNumeroFormatado := Value;
end;

end.
