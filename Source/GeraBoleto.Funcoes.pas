unit GeraBoleto.Funcoes;

interface

uses
  SysUtils, StrUtils;

  function IsNumber(Value: string): Boolean;

implementation

function IsNumber(Value: string): Boolean;
var
  i: Integer;
begin
  Result := True;

  for i := 1 to Value.Length do
  begin
    if not (Value[i] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

end.
