unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, StdCtrls, XPMan, ImgList, registry,
  RxCombos;

type
  TFormMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TI: TTrayIcon;
    PMTray: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    XPM: TXPManifest;
    EditPl1: TEdit;
    EditPl2: TEdit;
    EditScore1: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    EditScore2: TEdit;
    CBRace1: TComboBox;
    CBRace2: TComboBox;
    ILRace: TImageList;
    MemoCommentators: TMemo;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    TabSheet3: TTabSheet;
    MemoAbout: TMemo;
    TabSheet4: TTabSheet;
    EditPath: TEdit;
    ButtonDialogOpen: TButton;
    OD: TOpenDialog;
    N8: TMenuItem;
    Label1: TLabel;
    ColorComboBoxNikName: TColorComboBox;
    ColorComboBoxScore: TColorComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ColorComboBoxCommentators: TColorComboBox;
    Label4: TLabel;
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ButtonSet2Click(Sender: TObject);
    procedure ButtonSet1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveWindowScoreSettings;
    procedure SaveWindowCommentatorsSettings;
    procedure SaveWindowDinamicSettings;
    procedure ButtonSetAll2Click(Sender: TObject);
    procedure ButtonSetAll1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TIDblClick(Sender: TObject);
    procedure ButtonDialogOpenClick(Sender: TObject);
    procedure ButtonSet3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure SaveProgPosition;
    procedure LoadProgPosition;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  KeyClose: boolean;

implementation

uses CommentatorsForm, CopyForm, ScoreForm, DinamicForm;
{$R *.dfm}

{ ------------------- Сохранение/Восстановление позиции begin ------------------ }
procedure TFormMain.SaveProgPosition;
var
  FIniFile: TRegIniFile;
begin
  FIniFile := TRegIniFile.Create('StreamInfo'); // Инициализирую реестр
  FIniFile.OpenKey('StreamInfo', true); // Открываю раздел
  FIniFile.OpenKey('StreamInfo-PositionMain', true); // Открываю ещё один раздел
  if WindowState = wsNormal then
  begin
    FIniFile.WriteInteger('Option', 'Left', Left);
    FIniFile.WriteInteger('Option', 'Top', Top);
  end;
  FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
  FIniFile.Free;
end;

procedure TFormMain.LoadProgPosition;
var
  FIniFile: TRegIniFile;
begin
  FIniFile := TRegIniFile.Create('StreamInfo');
  FIniFile.OpenKey('StreamInfo', true);
  FIniFile.OpenKey('StreamInfo-PositionMain', true);
  Left := FIniFile.ReadInteger('Option', 'Left', 100);
  Top := FIniFile.ReadInteger('Option', 'Top', 100);
  WindowState := TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
  FIniFile.Free;
end;
{ ------------------- Сохранение/Восстановление позиции end-- ------------------ }

procedure TFormMain.SaveWindowScoreSettings;
begin
  FormScore.Player1.Caption := EditPl1.Text;
  FormScore.Player2.Caption := EditPl2.Text;
  FormScore.LabelScore1.Caption := EditScore1.Text;
  FormScore.LabelScore2.Caption := EditScore2.Text;
  FormScore.Player1.Font.Color:= ColorComboBoxNikName.ColorValue;
  FormScore.Player2.Font.Color:= ColorComboBoxNikName.ColorValue;
  FormScore.LabelScore1.Font.Color:= ColorComboBoxScore.ColorValue;
  FormScore.LabelScore2.Font.Color:= ColorComboBoxScore.ColorValue;
  FormScore.LabelDvoetochie.Font.Color:= ColorComboBoxScore.ColorValue;

  if CBRace1.Text = 'None' then
  begin
    FormScore.Player1.Left:= 10;
    FormScore.ImageRacePlayer1.Picture:=nil;
  end;
  if CBRace1.Text = 'Terran' then
  begin
    FormScore.Player1.Left:= 30;
    FormScore.ImageRacePlayer1.Picture:=nil;
    ILRace.GetBitmap(0, FormScore.ImageRacePlayer1.Picture.Bitmap);
    FormScore.ImageRacePlayer1.Refresh;
  end;
  if CBRace1.Text = 'Protoss' then
  begin
    FormScore.Player1.Left:= 30;
    FormScore.ImageRacePlayer1.Picture:=nil;
    ILRace.GetBitmap(1, FormScore.ImageRacePlayer1.Picture.Bitmap);
    FormScore.ImageRacePlayer1.Refresh;
  end;
  if CBRace1.Text = 'Zerg' then
  begin
    FormScore.Player1.Left:= 30;
    FormScore.ImageRacePlayer1.Picture:=nil;
    ILRace.GetBitmap(2, FormScore.ImageRacePlayer1.Picture.Bitmap);
    FormScore.ImageRacePlayer1.Refresh;
  end;

  if CBRace2.Text = 'None' then
  begin
    FormScore.Player2.Left:= 310;
    FormScore.ImageRacePlayer2.Picture:=nil;
  end;
  if CBRace2.Text = 'Terran' then
  begin
    FormScore.Player2.Left:= 330;
    FormScore.ImageRacePlayer2.Picture:=nil;
    ILRace.GetBitmap(0, FormScore.ImageRacePlayer2.Picture.Bitmap);
    FormScore.ImageRacePlayer2.Refresh;
  end;
  if CBRace2.Text = 'Protoss' then
  begin
    FormScore.Player2.Left:= 330;
    FormScore.ImageRacePlayer2.Picture:=nil;
    ILRace.GetBitmap(1, FormScore.ImageRacePlayer2.Picture.Bitmap);
    FormScore.ImageRacePlayer2.Refresh;
  end;
  if CBRace2.Text = 'Zerg' then
  begin
    FormScore.Player2.Left:= 330;
    FormScore.ImageRacePlayer2.Picture:=nil;
    ILRace.GetBitmap(2, FormScore.ImageRacePlayer2.Picture.Bitmap);
    FormScore.ImageRacePlayer2.Refresh;
  end;

end;

procedure TFormMain.TIDblClick(Sender: TObject);
begin
if FormMain.Showing then
  FormMain.Hide
  else
  FormMain.Show;
end;

procedure TFormMain.SaveWindowCommentatorsSettings;
begin
  FormCommentators.LabelInfoCommentators.Caption := MemoCommentators.Text;
  FormCommentators.LabelInfoCommentators.Font.Color:= ColorComboBoxCommentators.ColorValue;
end;

procedure TFormMain.SaveWindowDinamicSettings;
begin
  if Length(EditPath.Text)>0 then
    FormDinamic.ImageBack.Picture.LoadFromFile(EditPath.Text);
  FormDinamic.Height:= FormDinamic.ImageBack.Height;
  FormDinamic.Width:= FormDinamic.ImageBack.Width;
end;

procedure TFormMain.ButtonSetAll1Click(Sender: TObject);
begin
SaveWindowScoreSettings;
SaveWindowCommentatorsSettings;
SaveWindowDinamicSettings;
end;

procedure TFormMain.ButtonSetAll2Click(Sender: TObject);
begin
SaveWindowScoreSettings;
SaveWindowCommentatorsSettings;
end;

procedure TFormMain.ButtonSet3Click(Sender: TObject);
begin
if Length(EditPath.Text)>0 then
  SaveWindowDinamicSettings;
end;

procedure TFormMain.ButtonDialogOpenClick(Sender: TObject);
begin
if OD.Execute then
begin
  EditPath.Text:= OD.FileName;
end;
end;

procedure TFormMain.ButtonSet1Click(Sender: TObject);
begin
SaveWindowScoreSettings;
end;

procedure TFormMain.ButtonSet2Click(Sender: TObject);
begin
SaveWindowCommentatorsSettings;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
CanClose:= KeyClose;
if CanClose=true then
  begin
  FormScore.Close;
  FormCommentators.Close;
  FormCopy.Close;
  FormDinamic.Close;

  SaveProgPosition;
  end
  else
  Hide;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  KeyClose:= false;
  LoadProgPosition;
end;

procedure TFormMain.N1Click(Sender: TObject);
begin
  KeyClose:= true;
  Close;
end;

procedure TFormMain.N3Click(Sender: TObject);
begin
if FormMain.Showing then
  FormMain.Hide
  else
  FormMain.Show;
end;

procedure TFormMain.N4Click(Sender: TObject);
begin
  if FormScore.Showing then
    FormScore.CLose
  else
    FormScore.Show;
end;

procedure TFormMain.N5Click(Sender: TObject);
begin
  if FormCommentators.Showing then
    FormCommentators.CLose
  else
    FormCommentators.Show;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
  if FormCopy.Showing then
    FormCopy.CLose
  else
    FormCopy.Show;
end;

procedure TFormMain.N8Click(Sender: TObject);
begin
  if FormDinamic.Showing then
    FormDinamic.CLose
  else
    FormDinamic.Show;
end;

end.
