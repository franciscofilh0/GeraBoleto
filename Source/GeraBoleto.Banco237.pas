unit GeraBoleto.Banco237;

interface

uses
  GeraBoleto.Base,
  GeraBoleto.Boleto;

const
  NOME_BANCO = 'Bradesco';
  DIGITO_NUMERO = '2';

type
  TFormata237 = class(TInterfacedObject, IFormatacao)
  private
    FBoleto: IBoleto;
  public
    constructor Create(ABoleto: IBoleto);

    procedure FormataCamposConta;
    procedure ValidaDados;
    procedure FormataCampoLivre;
    procedure FormataCamposParaImpressao;
  end;

implementation

uses
  GeraBoleto.Funcoes,
  System.SysUtils;

{ TFormata237 }

constructor TFormata237.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
end;

procedure TFormata237.FormataCampoLivre;

 function DiginoNossoNumeroBradesco: string;
 begin
   Result := Modulo11(FBoleto.GetConta.SeqNossoNumero.ToString(), 11);

   if Result = '10' then
     Result := 'P';
 end;
begin
  FBoleto.GetTitulo.NossoNumero := LeftPad(FBoleto.GetConta.SeqNossoNumero.ToString(), 11);
  FBoleto.GetTitulo.DigitoNossoNumero := DiginoNossoNumeroBradesco();
  FBoleto.SetCampoLivre( FBoleto.GetConta().Agencia +
                         FBoleto.GetConta().Carteira +
                         FBoleto.GetTitulo().NossoNumero +
                         FBoleto.GetConta().Conta +
                         '0');
end;

procedure TFormata237.FormataCamposConta;
begin
  FBoleto.GetConta.Banco.Nome := NOME_BANCO;
  FBoleto.GetConta.Agencia := LeftPad(FBoleto.GetConta.Agencia, 4);
  FBoleto.GetConta.Conta := LeftPad(FBoleto.GetConta.Conta, 7);
end;

procedure TFormata237.FormataCamposParaImpressao;
begin


  FBoleto.SetNossoNumeroFormatado(FBoleto.GetConta.Carteira + ' / ' +
                                  FBoleto.GetTitulo.NossoNumero + '-' +
                                  FBoleto.GetTitulo.DigitoNossoNumero);

  FBoleto.SetCodBeneficiarioFormatado(FBoleto.GetConta.Agencia + '-' + FBoleto.GetConta.DigitoAgencia + '/' +
                                      FBoleto.GetConta.Conta + '-' + FBoleto.GetConta.DigitoConta);

end;

procedure TFormata237.ValidaDados;
begin
  if FBoleto.GetConta.Banco.DigitoNumero <> DIGITO_NUMERO then
    raise Exception.Create('Digito do número do banco inválido!');

  if not (FBoleto.GetConta().Carteira.Length = 2) then
    raise Exception.Create('Carteira inválida!');
end;

end.
