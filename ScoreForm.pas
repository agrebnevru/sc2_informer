unit ScoreForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls, registry;

type
  TFormScore = class(TForm)
    ImageBackGround: TImage;
    Player1: TLabel;
    Player2: TLabel;
    ImageRacePlayer1: TImage;
    ImageRacePlayer2: TImage;
    LabelScore1: TLabel;
    LabelScore2: TLabel;
    LabelDvoetochie: TLabel;
    procedure ImageBackGroundMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SaveProgPosition;
    procedure LoadProgPosition;
  public
    { Public declarations }
  end;

var
  FormScore: TFormScore;

implementation

uses MainForm;

{$R *.dfm}

{------------------- Сохранение/Восстановление позиции begin ------------------}
procedure TFormScore.SaveProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo'); // Инициализирую реестр
FIniFile.OpenKey('StreamInfo',true); // Открываю раздел
FIniFile.OpenKey('StreamInfo-PositionScore',true); // Открываю ещё один раздел
if WindowState=wsNormal then
begin
FIniFile.WriteInteger('Option', 'Left', Left);
FIniFile.WriteInteger('Option', 'Top', Top);
end;
//FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
FIniFile.Free;
end;

procedure TFormScore.LoadProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo');
FIniFile.OpenKey('StreamInfo',true);
FIniFile.OpenKey('StreamInfo-PositionScore',true);
Left:=FIniFile.ReadInteger('Option', 'Left', 100);
Top:=FIniFile.ReadInteger('Option', 'Top', 100);
//WindowState:=TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
FIniFile.Free;
end;
{------------------- Сохранение/Восстановление позиции end-- ------------------}

procedure TFormScore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
end;

procedure TFormScore.FormCreate(Sender: TObject);
begin
  SetWindowLong(FormScore.Handle, GWL_HWNDPARENT, GetDesktopWindow);
  SetWindowPos(FormScore.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
LoadProgPosition;

FormStyle:=fsStayOnTop;
SetWindowLong(Handle, GWL_HWNDPARENT, GetDesktopWindow);
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
end;

procedure TFormScore.ImageBackGroundMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
sc_dragmove = $f012;
begin
releasecapture;
FormScore.Perform(wm_syscommand, sc_dragmove, 0);
end;

end.
