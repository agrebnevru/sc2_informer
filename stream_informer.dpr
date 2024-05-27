program stream_informer;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  ScoreForm in 'ScoreForm.pas' {FormScore},
  CommentatorsForm in 'CommentatorsForm.pas' {FormCommentators},
  CopyForm in 'CopyForm.pas' {FormCopy},
  DinamicForm in 'DinamicForm.pas' {FormDinamic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormScore, FormScore);
  Application.CreateForm(TFormCommentators, FormCommentators);
  Application.CreateForm(TFormCopy, FormCopy);
  Application.CreateForm(TFormDinamic, FormDinamic);
  Application.Run;
end.
