unit GeraBoleto.Impressao.Fortes;

interface

uses
  GeraBoleto.Impressao, GeraBoleto.Boleto,
  System.Generics.Collections, FormBoletoFortesReport, Sysutils;

type
  TImpressaoBoletoFortes = class(TInterfacedObject, IImpressaoBoleto)
    procedure Imprimir(ABoletos: TList<IBoleto>);
  end;


implementation

{ TImpressaoBoletoFortes }

procedure TImpressaoBoletoFortes.Imprimir(ABoletos: TList<IBoleto>);
var
  i: Integer;
  frmFortesReport: TfrmBoletoFortesReport;
begin
  frmFortesReport := TfrmBoletoFortesReport.Create(nil);
  try
    for i := 0 to ABoletos.Count - 1 do
      frmFortesReport.AdicionarBoletoNoMemTable(ABoletos[i]);

    frmFortesReport.BoletoFortes.PreviewModal();

  finally
    frmFortesReport.Free();
  end;
end;

end.
