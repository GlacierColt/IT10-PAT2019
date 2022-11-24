program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {DominosFeeding};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDominosFeeding, DominosFeeding);
  Application.Run;
end.
