object Form1: TForm1
  Left = 241
  Top = 179
  Width = 599
  Height = 375
  VertScrollBar.Tracking = True
  Caption = #1055#1072#1082#1077#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 30
    Align = alTop
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 10
      Width = 36
      Height = 13
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object Label2: TLabel
      Left = 230
      Top = 10
      Width = 36
      Height = 13
      Caption = #1041#1072#1079'. '#8470
    end
    object Label3: TLabel
      Left = 350
      Top = 10
      Width = 22
      Height = 13
      Caption = #1042#1072#1083'.'
    end
    object Edit1: TEdit
      Left = 46
      Top = 7
      Width = 174
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 275
      Top = 5
      Width = 68
      Height = 21
      MaxLength = 6
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 488
      Top = 4
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        F872FFFFFFFFFFFF8707FFFFFFFFFFF87678FFFFFFFFFFF727FFFFFFFFFFF872
        7FFFFFF4666677678FFFF8688888667FFFFF86888888867FFFFF68888888886F
        FFFF68F8F888886FFFFF68FFF888886FFFFF68FFFFF8886FFFFF68FFFF88886F
        FFFFF68FFFF882FFFFFFF86888886FFFFFFFFFF666668FFFFFFF}
    end
    object ComboBox1: TComboBox
      Left = 378
      Top = 5
      Width = 79
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Items.Strings = (
        ''
        'UAH'
        'USD'
        'EUR')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 591
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 30
    Width = 591
    Height = 250
    Align = alClient
    TabOrder = 2
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 1
      Width = 589
      Height = 248
      Align = alClient
      DataSource = DM.DSDocuments
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'kodval'
          Title.Caption = #1042#1072#1083'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'klient'
          Title.Caption = #1050#1083#1080#1077#1085#1090
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ndog'
          Title.Caption = #8470' '#1076#1086#1075'.'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dbeg'
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dend'
          Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085'.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summa'
          Title.Caption = #1057#1091#1084#1084#1072' '#1082#1088#1077#1076#1080#1090#1072
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'stavka'
          Title.Caption = #1057#1090#1072#1074#1082#1072
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ssc'
          Title.Caption = #1057#1089#1091#1076#1085'. '#1089#1095#1077#1090
          Visible = True
        end>
    end
  end
  object WordApplication1: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 24
    Top = 32
  end
  object WordDocument1: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 64
    Top = 32
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 80
    object N8: TMenuItem
      Caption = #1044#1086#1075#1086#1074#1086#1088
      object N9: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N12Click
      end
    end
    object N1: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N2Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 128
    Top = 88
    object N3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N3Click
    end
    object N7: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N7Click
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      OnClick = N6Click
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = True
    Left = 24
    Top = 80
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 24
    Top = 136
  end
end
