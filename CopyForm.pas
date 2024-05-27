unit CopyForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, registry;

type
  TFormCopy = class(TForm)
    ImageBackground: TImage;
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
  FormCopy: TFormCopy;

implementation

{$R *.dfm}

{------------------- Сохранение/Восстановление позиции begin ------------------}
procedure TFormCopy.SaveProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo'); // Инициализирую реестр
FIniFile.OpenKey('StreamInfo',true); // Открываю раздел
FIniFile.OpenKey('StreamInfo-PositionCopy',true); // Открываю ещё один раздел
if WindowState=wsNormal then
begin
FIniFile.WriteInteger('Option', 'Left', Left);
FIniFile.WriteInteger('Option', 'Top', Top);
end;
//FIniFile.WriteInteger('Option', 'WinState', Integer(WindowState));
FIniFile.Free;
end;

procedure TFormCopy.LoadProgPosition;
var
FIniFile: TRegIniFile;
begin
FIniFile := TRegIniFile.Create('StreamInfo');
FIniFile.OpenKey('StreamInfo',true);
FIniFile.OpenKey('StreamInfo-PositionCopy',true);
Left:=FIniFile.ReadInteger('Option', 'Left', 100);
Top:=FIniFile.ReadInteger('Option', 'Top', 100);
//WindowState:=TWindowState(FIniFile.ReadInteger('Option', 'WinState', 2));
FIniFile.Free;
end;
{------------------- Сохранение/Восстановление позиции end-- ------------------}

procedure TFormCopy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
end;

procedure TFormCopy.FormCreate(Sender: TObject);
begin
LoadProgPosition;

FormStyle:=fsStayOnTop;
SetWindowLong(Handle, GWL_HWNDPARENT, GetDesktopWindow);
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
end;

procedure TFormCopy.ImageBackgroundMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
sc_dragmove = $f012;
begin
releasecapture;
FormCopy.Perform(wm_syscommand, sc_dragmove, 0);
end;

end.
