unit DataModuleBoletoFastReport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, frxClass, frxDBSet, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxBarcode;

type
  TdmBoletoFastReport = class(TDataModule)
    Report: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    Boletos: TFDMemTable;
    frxDBDataset1: TfrxDBDataset;
    BoletosBancoNumero: TStringField;
    BoletosBancoDigito: TStringField;
    BoletosBancoNome: TStringField;
    BoletosContaLocalPagamento: TStringField;
    BoletosContaCodigoBeneficiario: TStringField;
    BoletosContaCarteira: TStringField;
    BoletosBeneficiarioCnpjCpf: TStringField;
    BoletosBeneficiarioNome: TStringField;
    BoletosBeneficiarioLogradouro: TStringField;
    BoletosBeneficiarioNumero: TStringField;
    BoletosBeneficiarioBairro: TStringField;
    BoletosBeneficiarioCep: TStringField;
    BoletosBeneficiarioCidade: TStringField;
    BoletosBeneficiarioUF: TStringField;
    BoletosBeneficiarioTelefone: TStringField;
    BoletosTituloData: TDateTimeField;
    BoletosTituloVencimento: TDateTimeField;
    BoletosTituloNossoNumero: TStringField;
    BoletosTituloDataProcessamento: TDateTimeField;
    BoletosTituloDocumento: TStringField;
    BoletosTituloAceite: TStringField;
    BoletosTituloEspecieDocumento: TStringField;
    BoletosTituloEspecMoeda: TStringField;
    BoletosTituloValor: TCurrencyField;
    BoletosTituloInstrucoes: TMemoField;
    BoletosPagadorCnpjCpf: TStringField;
    BoletosPagadorNome: TStringField;
    BoletosPagadorLogradouro: TStringField;
    BoletosPagadorNumero: TStringField;
    BoletosPagadorBairro: TStringField;
    BoletosPagadorCep: TStringField;
    BoletosPagadorCidade: TStringField;
    BoletosPagadorUF: TStringField;
    BoletosPagadorTelefone: TStringField;
    BoletosCodigoBarras: TStringField;
    BoletosLinhaDigitavel: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBoletoFastReport: TdmBoletoFastReport;

implementation

{$R *.dfm}

end.
