object FormScore: TFormScore
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormScore'
  ClientHeight = 30
  ClientWidth = 530
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
  object ImageBackGround: TImage
    Left = 0
    Top = 0
    Width = 530
    Height = 30
    Cursor = crSizeAll
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000002120000
      001E0802000000F60260BA0000001974455874536F6674776172650041646F62
      6520496D616765526561647971C9653C0000023B4944415478DAEDDDBF4BD661
      1486717F0CEAA0830E36A8A050A2288A6664A120480D2DBD434222E8E0208104
      420421481041088204E2E090200539BC2D0D45202866A486A2282A28A8430E3A
      E8900D8A0DFD0167387073BE5C1F78F66BBBA7C3939901008059E6BF974EA7D5
      1980D56AEB7D7582B3BAD92FEA04C02A954A311B08E6D7DD767582B386F96FEA
      04C08AD9403C8BB7DBD409CE9A7ECCA813002B6603F12CDC6C5527386B5E9A55
      270056CC06E299AB6F5627386B595950270056CC06E299A9695227386B5B5F54
      270056CC06E2F95A59AF4E70766F6B459D0058311B88E773458D3AC1D983DD75
      750260C56C209E4F6595EA04670FF7B7D4098015B38178A6AF55A8139C3DFABD
      AB4E00AC980DC4F3BEA8549DE0ACF3F8409D0058311B8867B2A0589DE0ACFBF4
      489D0058311B886722AF509DE0ACF7CF893A01B0623610CF5876BE3AC1D9938B
      33750260C56C209ED1CB1C7582B3A7597FD5098015B3817886CFB3D409CE9EE5
      5EAA13002B6603F1BC3EBB5027387B919FAD4E00AC980DC4F3F2E45C9DE06CA8
      30579D0058311B8867F0E8549DE0EC5571813A01B0623610CFF3C3637582B337
      2545EA04C08AD9403C037B493B8E1B294FDA0123128CD9403CFDDB87EA04676F
      6F94A813002B6603F1F46DECA9139C8D5797AB13002B6603F1F4AEEEA8139C4D
      D45D57270056CC06E2E959DE5427387BD758A54E00AC980DC4D3F5734D9DE06C
      EA56AD3A01B0623610CFE3EF49FB79FBC39DA4FD8E8E046336104FC7DCB23AC1
      D9C79646750260F57F36000030BA028AB9A81FF28744E10000000049454E44AE
      426082}
    OnMouseDown = ImageBackGroundMouseDown
  end
  object Player1: TLabel
    Left = 30
    Top = 5
    Width = 37
    Height = 13
    Caption = 'Gamer1'
  end
  object Player2: TLabel
    Left = 330
    Top = 5
    Width = 59
    Height = 18
    Caption = 'Gamer2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ImageRacePlayer1: TImage
    Left = 2
    Top = 2
    Width = 25
    Height = 25
    AutoSize = True
    Transparent = True
  end
  object ImageRacePlayer2: TImage
    Left = 302
    Top = 2
    Width = 25
    Height = 25
    AutoSize = True
    Transparent = True
  end
  object LabelScore1: TLabel
    Left = 235
    Top = 4
    Width = 20
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelScore2: TLabel
    Left = 275
    Top = 4
    Width = 20
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDvoetochie: TLabel
    Left = 262
    Top = 4
    Width = 5
    Height = 18
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
