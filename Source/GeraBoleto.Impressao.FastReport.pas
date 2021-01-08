unit GeraBoleto.Impressao.FastReport;

interface

uses
  DataModuleBoletoFastReport,
  GeraBoleto.Impressao,
  GeraBoleto.Boleto,
  System.SysUtils,
  System.Generics.Collections;

type
  TImpressaoBoletoFast = class(TInterfacedObject, IImpressaoBoleto)
  private
    FReportFile: string;
  public
    constructor Create(AReportFile: string);
    procedure Imprimir(ABoleto: TList<IBoleto>);
  end;

implementation

{ TImpressaoBoletoFast }

constructor TImpressaoBoletoFast.Create(AReportFile: string);
begin
  FReportFile := AReportFile;

  if FReportFile.IsEmpty() then
    raise Exception.Create('Arquivo do FastReport n�o informado!');

  if not FileExists(FReportFile) then
    raise Exception.Create('Arquivo do FastReport n�o encontrado!');
end;

procedure TImpressaoBoletoFast.Imprimir(ABoleto: TList<IBoleto>);
var
  Dm: TdmBoletoFastReport;
  i: Integer;
begin
  Dm := TdmBoletoFastReport.Create(nil);

  for i := 0 to ABoleto.Count - 1 do
    Dm.AdicionaDadosNoMemTable(ABoleto[i]);

  Dm.Report.LoadFromFile(FReportFile);
  Dm.Report.ShowReport();
end;

end.
