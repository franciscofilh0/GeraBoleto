unit FormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  GeraBoleto.Container,
  GeraBoleto.Boleto;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtNomeBeneficiario: TEdit;
    Label1: TLabel;
    edtLogradouro: TEdit;
    Label2: TLabel;
    edtCnpjCpf: TEdit;
    Label3: TLabel;
    edtNumero: TEdit;
    Label4: TLabel;
    edtBairro: TEdit;
    Label5: TLabel;
    edtCep: TEdit;
    Label6: TLabel;
    edtCidade: TEdit;
    Label7: TLabel;
    edtUF: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNumeroBanco: TEdit;
    edtDigitoNumeroBanco: TEdit;
    Label10: TLabel;
    edtCarteira: TEdit;
    Label11: TLabel;
    edtConvenio: TEdit;
    Label12: TLabel;
    edtSequencia: TEdit;
    Label13: TLabel;
    edtAgencia: TEdit;
    edtDigitoAgencia: TEdit;
    Label14: TLabel;
    edtConta: TEdit;
    edtDigitoConta: TEdit;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    edtEmissao: TEdit;
    Label16: TLabel;
    edtVencimento: TEdit;
    Label17: TLabel;
    edtDocumento: TEdit;
    Label18: TLabel;
    edtAceite: TEdit;
    Label19: TLabel;
    edtDataProcessamento: TEdit;
    Label20: TLabel;
    edtValor: TEdit;
    Label21: TLabel;
    edtNomePagador: TEdit;
    Label22: TLabel;
    edtCnpjCpfPagador: TEdit;
    Label23: TLabel;
    edtLogradouroPagador: TEdit;
    Label24: TLabel;
    edtNumeroPagador: TEdit;
    Label25: TLabel;
    edtBairroPagador: TEdit;
    Label26: TLabel;
    edtCepPagador: TEdit;
    Label27: TLabel;
    edtCidadePagador: TEdit;
    Label28: TLabel;
    edtUFPagador: TEdit;
    btnAdiciona: TButton;
    btnExclui: TButton;
    btnVerMemo: TButton;
    btnImprimir: TButton;
    memObservacao: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnVerMemoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FContainer: IBoletoContainer;
    procedure PreencheBoleto(ABoleto: IBoleto);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  GeraBoleto.Impressao.FastReport,
  GeraBoleto.Impressao;

{$R *.dfm}

procedure TfrmPrincipal.btnAdicionaClick(Sender: TObject);
var
  Boleto: IBoleto;
begin
  Boleto := FContainer.Add();
  PreencheBoleto(Boleto);
  Boleto.Gerar();
end;

procedure TfrmPrincipal.btnImprimirClick(Sender: TObject);
var
  ModuloImpressao: IImpressaoBoleto;
  Arquivo: string;
begin
  Arquivo := '..\..\Report\Boleto.fr3';

  if FContainer.Boletos.Count > 0 then
  begin
    ModuloImpressao := TImpressaoBoletoFast.Create(Arquivo);
    FContainer.SetModuloImpressao(ModuloImpressao);
    FContainer.Imprimir();
  end;

end;

procedure TfrmPrincipal.btnVerMemoClick(Sender: TObject);
var
  Boleto: IBoleto;
begin
  if FContainer.Boletos.Count > 0 then
  begin
    Boleto := FContainer.Boletos[0];
    memObservacao.Clear();
    memObservacao.Lines.Add('Nome banco: ' + Boleto.GetConta.Banco.Nome);
    memObservacao.Lines.Add('Nosso número: ' + Boleto.GetTitulo.NossoNumero);
    memObservacao.Lines.Add('Dígito nosso número: ' + Boleto.GetTitulo.DigitoNossoNumero);
    memObservacao.Lines.Add('Código de barras: ' + Boleto.GetCodigoBarras());
    memObservacao.Lines.Add('Linha digitável: ' + Boleto.GetLinhadigitavel());
    memObservacao.Lines.Add('Nome do pagador: ' + Boleto.GetPagador.Nome);
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FContainer := TBoletoContainer.Create();
end;

procedure TfrmPrincipal.PreencheBoleto(ABoleto: IBoleto);
begin
  ABoleto.GetBeneficiario.CnpjCpf := edtCnpjCpf.Text;
  ABoleto.GetBeneficiario.Nome := edtNomeBeneficiario.Text;
  ABoleto.GetBeneficiario.Endereco.Logradouro := edtLogradouro.Text;
  ABoleto.GetBeneficiario.Endereco.Numero := edtNumero.Text;
  ABoleto.GetBeneficiario.Endereco.Bairro := edtBairro.Text;
  ABoleto.GetBeneficiario.Endereco.CEP := edtCep.Text;
  ABoleto.GetBeneficiario.Endereco.Cidade := edtCidade.Text;
  ABoleto.GetBeneficiario.Endereco.UF := edtUF.Text;

  ABoleto.GetConta.Banco.Numero := edtNumeroBanco.Text;
  ABoleto.GetConta.Banco.DigitoNumero := edtDigitoNumeroBanco.Text;
  ABoleto.GetConta.LocalPagamento := 'Pago em qualquer agência até o vencimento';
  ABoleto.GetConta.Agencia := edtAgencia.Text;
  ABoleto.GetConta.DigitoAgencia := edtDigitoAgencia.Text;
  ABoleto.GetConta.Conta := edtConta.Text;
  ABoleto.GetConta.DigitoConta := edtDigitoConta.Text;
  ABoleto.GetConta.Carteira := edtCarteira.Text;
  ABoleto.GetConta.Convenio := edtConvenio.Text;
  ABoleto.GetConta.SeqNossoNumero := StrToInt(edtSequencia.Text);

  ABoleto.GetTitulo.Emissao := StrToDate(edtEmissao.Text);
  ABoleto.GetTitulo.Vencimento := StrToDate(edtVencimento.Text);
  ABoleto.GetTitulo.Documento := edtDocumento.Text;
  ABoleto.GetTitulo.Aceite := edtAceite.Text;
  ABoleto.GetTitulo.DataProc := StrToDate(edtDataProcessamento.Text);
  ABoleto.GetTitulo.EspecMoeda := 'R$';
  ABoleto.GetTitulo.EspecDoc := 'DM';
  ABoleto.GetTitulo.Valor := StrToCurr(edtValor.Text);

  ABoleto.GetPagador.CnpjCpf := edtCnpjCpfPagador.Text;
  ABoleto.GetPagador.Nome := edtNomePagador.Text;
  ABoleto.GetPagador.Endereco.Logradouro := edtLogradouroPagador.Text;
  ABoleto.GetPagador.Endereco.Numero := edtNumeroPagador.Text;
  ABoleto.GetPagador.Endereco.Bairro := edtBairroPagador.Text;
  ABoleto.GetPagador.Endereco.CEP := edtCepPagador.Text;
  ABoleto.GetPagador.Endereco.Cidade := edtCidadePagador.Text;
  ABoleto.GetPagador.Endereco.UF := edtUFPagador.Text;
end;

end.
