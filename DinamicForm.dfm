object FormDinamic: TFormDinamic
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormDinamic'
  ClientHeight = 105
  ClientWidth = 106
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImageBack: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 105
    Cursor = crSizeAll
    AutoSize = True
    OnMouseDown = ImageBackMouseDown
  end
end
