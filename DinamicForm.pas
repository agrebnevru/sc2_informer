unit DinamicForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, registry;

type
  TFormDinamic = class(TForm)
    ImageBack: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ImageBackMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  procedure SaveProgPosition;
  procedure LoadProgPosition;
  public
    { Public declarations }
  end;

var
  FormDinamic: TFormDinamic;

implementation

{$R *.dfm}

{------------------- Сохранение/Восстановление позиции begin ------------------}
procedure TFormDinamic.SaveProgPosition;
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

procedure TFormDinamic.LoadProgPosition;
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

procedure TFormDinamic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
SaveProgPosition;
end;

procedure TFormDinamic.FormCreate(Sender: TObject);
begin
  SetWindowLong(FormDinamic.Handle, GWL_HWNDPARENT, GetDesktopWindow);
  SetWindowPos(FormDinamic.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE   or SWP_NOSIZE);
LoadProgPosition;
end;

procedure TFormDinamic.ImageBackMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
sc_dragmove = $f012;
begin
releasecapture;
FormDinamic.Perform(wm_syscommand, sc_dragmove, 0);
end;

end.
