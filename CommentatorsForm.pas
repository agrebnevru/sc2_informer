unit CommentatorsForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, registry;

type
  TFormCommentators = class(TForm)
    ImageBackground: TImage;
    LabelInfoCommentators: TLabel;
    procedure ImageBackgroundMouseDown(Sender: TObject; Button: TMouseButton;
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
  FormCommentators: TFormCommentators;

implementation

{$R *.dfm}

{------------------- Сохранение/Восстановление позиции begin ------------------}
procedure TFormCommentators.SaveProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo'); // Инициализирую реестр
FIniFile.OpenKey('StreamInfo',true); // Открываю раздел
FIniFile.OpenKey('StreamInfo-PositionCommentators',true); // Открываю ещё один раздел
if WindowState=wsNormal then
begin
FIniFile.WriteInteger('Option', 'Left', Left);
FIniFile.WriteInteger('Option', 'Top', Top);
end;
//FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
FIniFile.Free;
end;

procedure TFormCommentators.LoadProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo');
FIniFile.OpenKey('StreamInfo',true);
FIniFile.OpenKey('StreamInfo-PositionCommentators',true);
Left:=FIniFile.ReadInteger('Option', 'Left', 100);
Top:=FIniFile.ReadInteger('Option', 'Top', 100);
//WindowState:=TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
FIniFile.Free;
end;
{------------------- Сохранение/Восстановление позиции end-- ------------------}

procedure TFormCommentators.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
end;

procedure TFormCommentators.FormCreate(Sender: TObject);
begin
LoadProgPosition;

FormStyle:=fsStayOnTop;
SetWindowLong(Handle, GWL_HWNDPARENT, GetDesktopWindow);
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
end;

procedure TFormCommentators.ImageBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
sc_dragmove = $f012;
begin
releasecapture;
FormCommentators.Perform(wm_syscommand, sc_dragmove, 0);
end;

end.
