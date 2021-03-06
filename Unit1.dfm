object Form1: TForm1
  Left = 373
  Top = 278
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Izlenim Piano Chord and Scale Asistant'
  ClientHeight = 532
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 3
    Top = 195
    Width = 166
    Height = 166
    Caption = ' Chords '
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 162
      Height = 149
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object ChordList: TListBox
        Left = 4
        Top = 4
        Width = 154
        Height = 134
        Align = alClient
        IntegralHeight = True
        ItemHeight = 13
        Items.Strings = (
          '5,8 -- Major'
          '4,8 -- Minor'
          '8 -- 5'
          '5,8,11 -- Dominant 7th'
          '5,8,12 -- Major 7th'
          '4,8,11 -- Minor 7th'
          '4,8,12 -- Minor Major 7th'
          '6,8 -- Sus 4'
          '3,8 -- Sus 2'
          '5,8,10 -- 6'
          '4,8,10 -- Minor 6'
          '5,8,11,3 -- 9'
          '4,8,11,3 -- Minor 9'
          '5,8,12,3 -- Major 9'
          '4,8,12,3 -- Minor Major 9'
          '5,8,11,3,6 -- 11'
          '4,8,11,3,6 -- Minor 11'
          '5,8,12,3,6 -- Major 11'
          '4,8,12,3,6 -- Minor Major 11'
          '5,8,11,3,10 -- 13'
          '4,8,11,3,10 -- Minor 13'
          '5,8,12,3,10 -- Major 13'
          '4,8,12,3,10 -- Minor Major 13'
          '5,8,3 -- add 9'
          '4,8,3 -- Minor add 9'
          '5,8,10,3 -- 6 add 9'
          '4,8,10,3 -- Minor 6 add 9'
          '5,8,11,6 -- Dominant 7th add 11'
          '5,8,12,6 -- Major 7th add 11'
          '4,8,11,6 -- Minor 7th add 11'
          '4,8,12,6 -- Minor Major 7th add 11'
          '5,8,11,10 -- Dominant 7th add 13'
          '5,8,12,10 -- Major 7th add 13'
          '4,8,11,10 -- Minor 7th add 13'
          '4,8,12,10 -- Minor Major 7th add 13'
          '5,7,11 -- 7b5'
          '5,9,11 -- 7#5'
          '5,8,11,2 -- 7b9'
          '5,8,11,4 -- 7#9'
          '5,9,11,2 -- 7#5b9'
          '4,7,11 -- m7b5'
          '4,9,11 -- m7#5'
          '4,8,11,2 -- m7b9'
          '5,8,11,3,7 -- 9#11'
          '5,8,11,3,9 -- 9b13'
          '6,8,10 -- 6sus4'
          '6,8,11 -- 7sus4'
          '6,8,12 -- Major 7th Sus4'
          '6,8,11,3 -- 9sus4'
          '6,8,12,3 -- Major 9 Sus4')
        TabOrder = 0
        OnClick = ChordListClick
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 363
    Width = 166
    Height = 148
    Caption = ' Scale '
    TabOrder = 1
    object Panel2: TPanel
      Left = 2
      Top = 15
      Width = 162
      Height = 131
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object ScaleList: TListBox
        Left = 4
        Top = 4
        Width = 154
        Height = 121
        Align = alClient
        IntegralHeight = True
        ItemHeight = 13
        Items.Strings = (
          '2212221 -- Major'
          '2122122 -- Natural Minor'
          '2122131 -- Harmonic Minor'
          '2122221 -- Melodic Minor'
          '23223 -- Pentatonic Major'
          '32232 -- Pentatonic Minor'
          '32113 -- Pentatonic Blues'
          '2323 -- Pentatonic Neutral'
          '2212221 -- Ionian'
          '2122122 -- Aeolian'
          '2122212 -- Dorian'
          '2212212 -- Mixolydian'
          '1222122 -- Phrygian'
          '2221221 -- Lydian'
          '1221222 -- Locrian'
          '1212121 -- Dim half'
          '2121212 -- Dim whole'
          '22222 -- Whole'
          '31313 -- Augmented'
          '111111111111 -- Chromatic'
          '2131212 -- Roumanian Minor'
          '1312122 -- Spanish Gypsy'
          '321132 -- Blues'
          '22323 -- Diatonic'
          '1312131 -- Double Harmonic'
          '12111222 -- Eight Tone Spanish'
          '1322211 -- Enigmatic'
          '222211 -- Leading Whole Tone'
          '2222121 -- Lydian Augmented'
          '1222221 -- Neoploitan Major'
          '1222122 -- Neopolitan Minor'
          '12341 -- Pelog'
          '222312 -- Prometheus'
          '132312 -- Prometheus Neopolitan'
          '131313 -- Six Tone Symmetrical'
          '1212222 -- Super Locrian'
          '2221122 -- Lydian Minor'
          '2131122 -- Lydian Diminished'
          '211211121 -- Nine Tone Scale'
          '21212121 -- Auxiliary Diminished'
          '222222 -- Auxiliary Augmented'
          '12121212 -- Auxiliary Diminished Blues'
          '2211222 -- Major Locrian'
          '2221212 -- Overtone'
          '1212222 -- Diminished Whole Tone'
          '2122122 -- Pure Minor'
          '232212 -- Dominant 7th')
        TabOrder = 0
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 3
    Top = 6
    Width = 166
    Height = 187
    Caption = ' Root '
    TabOrder = 2
    object Panel3: TPanel
      Left = 2
      Top = 15
      Width = 162
      Height = 170
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object RootList: TListBox
        Left = 4
        Top = 4
        Width = 154
        Height = 160
        Align = alClient
        IntegralHeight = True
        ItemHeight = 13
        Items.Strings = (
          'C'
          'C# / Db'
          'D'
          'D# / Eb'
          'E'
          'F / E#'
          'F# / Gb'
          'G'
          'G# / Ab'
          'A'
          'A# / Bb'
          'B / Cb')
        TabOrder = 0
        OnClick = RootListClick
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 174
    Top = 6
    Width = 511
    Height = 120
    Caption = ' Keys '
    TabOrder = 3
    object Panel4: TPanel
      Left = 2
      Top = 15
      Width = 507
      Height = 103
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object PaintBox1: TPaintBox
        Left = 4
        Top = 4
        Width = 499
        Height = 95
        Align = alClient
        Color = clWhite
        ParentColor = False
        OnMouseDown = PaintBox1MouseDown
        OnMouseUp = PaintBox1MouseUp
        OnPaint = PaintBox1Paint
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 252
    Top = 129
    Width = 73
    Height = 25
    Caption = '&Play'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 174
    Top = 129
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 5
  end
  object AdvStatusBar1: TAdvStatusBar
    Left = 0
    Top = 513
    Width = 691
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 
      ' This program is shareware. Please register!! 24 days left from ' +
      'evaluation period.'
  end
  object GroupBox5: TGroupBox
    Left = 498
    Top = 132
    Width = 187
    Height = 118
    Caption = ' Delay '
    TabOrder = 7
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 183
      Height = 101
      Align = alClient
      BorderWidth = 3
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 78
        Height = 13
        Caption = 'Length (sustain):'
      end
      object Label2: TLabel
        Left = 11
        Top = 58
        Width = 135
        Height = 13
        Caption = 'Interval (between each key):'
      end
      object LengthTrack: TTrackBar
        Left = 6
        Top = 28
        Width = 172
        Height = 22
        Max = 100
        Min = 1
        Orientation = trHorizontal
        PageSize = 5
        Frequency = 10
        Position = 5
        SelEnd = 0
        SelStart = 0
        TabOrder = 0
        ThumbLength = 10
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = LengthTrackChange
      end
      object PauseTrack: TTrackBar
        Left = 6
        Top = 73
        Width = 172
        Height = 22
        Max = 100
        Orientation = trHorizontal
        PageSize = 5
        Frequency = 10
        Position = 5
        SelEnd = 0
        SelStart = 0
        TabOrder = 1
        ThumbLength = 10
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = PauseTrackChange
      end
    end
  end
  object BitBtn3: TBitBtn
    Left = 534
    Top = 363
    Width = 70
    Height = 25
    Caption = '&Rest'
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object GroupBox6: TGroupBox
    Left = 174
    Top = 391
    Width = 511
    Height = 120
    Caption = ' Multi Chords: (Major C, Dominant 7th F, Sus 4 A)'
    TabOrder = 9
    object Panel6: TPanel
      Left = 2
      Top = 15
      Width = 507
      Height = 103
      Align = alClient
      BevelOuter = bvLowered
      BorderWidth = 3
      TabOrder = 0
      object PaintBox2: TPaintBox
        Left = 4
        Top = 4
        Width = 499
        Height = 95
        Align = alClient
        Color = clWhite
        ParentColor = False
        OnPaint = PaintBox2Paint
      end
    end
  end
  object Button1: TButton
    Left = 609
    Top = 363
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 10
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 184
    Top = 196
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 11
  end
  object XPMenu1: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clWindowText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    XPControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcListBox, xcEdit, xcMaskEdit, xcMemo, xcRichEdit, xcCheckBox, xcRadioButton, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox]
    Active = True
    Left = 497
    Top = 258
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 462
    Top = 258
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 528
    Top = 258
  end
end
