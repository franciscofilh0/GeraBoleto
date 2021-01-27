unit DataModuleBoletoFastReport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, frxClass, frxDBSet, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxBarcode, GeraBoleto.Boleto, DataModuleDadosBoleto;

type
  TdmBoletoFastReport = class(TDataModule)
    Report: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDsBoletos: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdicionaDadosNoMemTable(ABoleto: IBoleto);
  end;

var
  dmBoletoFastReport: TdmBoletoFastReport;

implementation

{$R *.dfm}

{ TdmBoletoFastReport }

procedure TdmBoletoFastReport.AdicionaDadosNoMemTable(ABoleto: IBoleto);
begin
  dmDadosBoletos.AdicionaDadosNoMemTable(ABoleto)
end;

procedure TdmBoletoFastReport.DataModuleCreate(Sender: TObject);
begin
  dmDadosBoletos := TdmDadosBoletos.Create(Self);
end;

end.
