program TesteCaixaPreta;

uses
  Vcl.Forms,
  FormPrincipal in 'FormPrincipal.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
