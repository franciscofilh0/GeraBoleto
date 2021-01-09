unit DataModuleBoletoFastReport;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDBSet, frxBarcode;

type
  TdmBoletoFastReport = class(TDataModule)
    Report: TfrxReport;
    frxDsBoletos: TfrxDBDataset;
    Boletos: TFDMemTable;
    frxBarCodeObject1: TfrxBarCodeObject;
    BoletosBancoNumero: TStringField;
    BoletosBancoDigito: TStringField;
    BoletosBancoNome: TStringField;
    BoletosContaLocalPgto: TStringField;
    BoletosContaCodBeneficiario: TStringField;
    BoletosContaCarteira: TStringField;
    BoletosBenCnpjCpf: TStringField;
    BoletosBenNome: TStringField;
    BoletosBenLogradouro: TStringField;
    BoletosBenNumero: TStringField;
    BoletosBenBairro: TStringField;
    BoletosBenCep: TStringField;
    BoletosBenCidade: TStringField;
    BoletosBenUF: TStringField;
    BoletosBenFone: TStringField;
    BoletosTitData: TDateTimeField;
    BoletosTitVencimento: TDateTimeField;
    BoletosTitNossoNumero: TStringField;
    BoletosTitDataProc: TDateTimeField;
    BoletosTitDocumento: TStringField;
    BoletosTitAceite: TStringField;
    BoletosTitEspecDoc: TStringField;
    BoletosTitEspecMoeda: TStringField;
    BoletosTitValor: TCurrencyField;
    BoletosTitInstrucoes: TMemoField;
    BoletosPagCnpjCpf: TStringField;
    BoletosPagNome: TStringField;
    BoletosPagLogradouro: TStringField;
    BoletosPagNumero: TStringField;
    BoletosPagBairro: TStringField;
    BoletosPagCep: TStringField;
    BoletosPagCidade: TStringField;
    BoletosPagUF: TStringField;
    BoletosPagFone: TStringField;
    BoletosCodigoBarras: TStringField;
    BoletosLinhaDigitavel: TStringField;
    frxReport1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionaDadosNoMemTable
  end;

var
  dmBoletoFastReport: TdmBoletoFastReport;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
