unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, AdvStatusBar, Buttons, XPMenu,
  FFPBox, MMSystem;

type
  TMIDIChannel = 1..16;

  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Panel3: TPanel;
    RootList: TListBox;
    ChordList: TListBox;
    ScaleList: TListBox;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    AdvStatusBar1: TAdvStatusBar;
    XPMenu1: TXPMenu;
    Timer1: TTimer;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LengthTrack: TTrackBar;
    PauseTrack: TTrackBar;
    BitBtn3: TBitBtn;
    GroupBox6: TGroupBox;
    Panel6: TPanel;
    Button1: TButton;
    Timer2: TTimer;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure keybyname(note:string; octave : integer; showIt : boolean; playIt : Boolean);
    procedure keybyInt(note:Integer; octave : integer; showIt : Boolean);
    procedure keybyIntPlay(note:Integer; octave : integer; playIt : Boolean);

    procedure LengthTrackChange(Sender: TObject);
    procedure PauseTrackChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ChordListClick(Sender: TObject);
    procedure RootListClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);

    procedure PaintAudioKeyboard;
    procedure PaintVisualKeyboard;
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);

    procedure PaintKey(Canvas : TCanvas; xKey,xOctave : Integer; Active : Boolean);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    BlackKey,AKey,ERightKey,DCenterKey,CKey : TBitmap;
    BlackKey_Selected,AKey_Selected,ERightKey_Selected,DCenterKey_Selected,CKey_Selected : TBitmap;

      FMIDIDevice : Integer;
      FMIDIChannel : TMIDIChannel;
      FMIDIPortName : string;
      FMIDIPortOk : Boolean;
      FMIDIPort : Integer;

      procedure SetMIDIDevice (value : Integer);
  public
      property MIDIPort : Integer read FMIDIPort;
    { Public declarations }

  protected
      procedure SelectMIDIPort;
  end;

keyStruct = Record
             note:integer;
             volume:integer;
             duration:integer;
             // pause:integer;
             PlayCounter : Integer;
            end;

var
  Form1: TForm1;
  LastNote : String;
  NotesToPlay : Array[1..1000] of keyStruct;

  maxNotes,notePlaying : integer;
  startPlay,noteIsPlaying : boolean;
  timeCounter,timeToPlay,timeToWait : integer;

  OctaveToPlay : Integer;

  ChordViews : Array[1..20] of Record
                                chordNotes    : array[1..15] of keyStruct;
                                maxChordNotes : integer;
                                ListBoxString : String;
                               end;
  maxChordViews : Integer;
  ChordViewShowNo : Integer;

  LastKey,LastOctave : Integer;


implementation

{$R *.DFM}

procedure TForm1.PaintAudioKeyboard;
var
 i:integer;
begin
end;

procedure TForm1.PaintVisualKeyboard;
var
 i:integer;
begin
end;

function notetonumber(note:String) : integer;
begin
 result := 0;
 if note = 'C'        then Result := 1;
 if note = 'C# / Db'  then Result := 2;
 if note = 'D'        then Result := 3;
 if note = 'D# / Eb'  then Result := 4;
 if note = 'E'        then Result := 5;
 if note = 'F / E#'   then Result := 6;
 if note = 'F# / Gb'  then Result := 7;
 if note = 'G'        then Result := 8;
 if note = 'G# / Ab'  then Result := 9;
 if note = 'A'        then Result :=10;
 if note = 'A# / Bb'  then Result :=11;
 if note = 'B / Cb'   then Result :=12;
end;

procedure TForm1.keybyInt(note:Integer; octave : integer; showIt : boolean);
var
 noteint : integer;

 data : record
         case boolean of
          True  : (b1, b2, b3, b4 : byte);
          False : (l : LongInt);
        end;
begin
 noteInt := note;

 if showIt then
 begin
  PaintKey(PaintBox1.Canvas,note,octave,TRUE);
//MIDIKeys1.PressNote(35+(12*(octave-1))+noteInt,99, FALSE);
 end else
 if not showIt then
 begin
  PaintKey(PaintBox1.Canvas,note,octave,FALSE);
//MIDIKeys1.ReleaseNote(35+(12*(octave-1))+noteInt,99, FALSE);
 end;
end;

procedure TForm1.keybyIntPlay(note:Integer; octave : integer; playIt : Boolean);
var
 noteint : integer;

 data : record
         case boolean of
          True  : (b1, b2, b3, b4 : byte);
          False : (l : LongInt);
        end;
begin
 noteInt := note;

 if playIt then
 begin
  if midiPort = 0 then SelectMIDIPort;
  if FMIDIPortOk then with data do
  begin
    b1 := $90 + FMIDIChannel - 1;
    b2 := note+((Octave+2)*12);
    b3 := 64;
    b4 := 0;
    midiOutShortMsg (midiPort, l);
  end;
 end else
 begin
  if FMIDIPortOk then with data do
  begin
   b1 := $80 + FMIDIChannel - 1;
   b2 := note+((Octave+2)*12);
   b3 := 64;
   b4 := 0;
   midiOutShortMsg (midiPort, l);
  end;
 end;
end;

procedure TForm1.keybyname(note:string; octave : integer; showIt : boolean; playIt : Boolean);
var
 noteint : integer;
begin
 noteInt := noteToNumber(note);

 if showIt then
 begin
//  MIDIKeys1.PressNote(35+(12*(octave-1))+noteInt,99, FALSE);
 end else
 if not showIt then
 begin
//  MIDIKeys1.ReleaseNote(35+(12*(octave-1))+noteInt,99, FALSE);
 end;

 if playIt then
 begin
//  if showIt then MIDIKeys1.NoteOn(Application,35+(12*(octave-1))+noteInt,99) else
//                 MIDIKeys1.NoteOff(Application,35+(12*(octave-1))+noteInt,99);
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 StartNote : Integer;
 s         : string;
 i         : integer;
begin
// MIDIKeys1.AllNotesOff(FALSE);

 maxNotes := 0;
 notePlaying := 0;


 startNote := noteToNumber(RootList.Items[RootList.itemindex]);
 inc(maxNotes);
 NotesToPlay[maxNotes].note := startNote;
 NotesToPlay[maxNotes].volume := 99;
 NotesToPlay[maxNotes].duration := LengthTrack.Position;
 NotesToPlay[maxNotes].PlayCounter := -1;

 s := ChordList.Items[ChordList.itemindex];
 s := copy(s,1,pos(' ',s)-1)+',';
 repeat

  inc(maxNotes);
  NotesToPlay[maxNotes].note := startNote+strtoint(copy(s,1,pos(',',s)-1))-1;
  NotesToPlay[maxNotes].volume := 99;
  NotesToPlay[maxNotes].duration := LengthTrack.Position;
  NotesToPlay[maxNotes].PlayCounter := -1;

  delete(s,1,pos(',',s));
 until (s='') or (pos(',',s)=0);

 StartPlay := TRUE;
 timeCounter := 0;
 notePlaying := 0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
 i,j,xoctave :integer;
begin

 if StartPlay then
 begin
  inc(TimeCounter);

  if (TimeCounter>PauseTrack.Position) and (notePlaying<maxNotes) then
  begin
   timeCounter := 0;
   inc(notePlaying);

   xoctave := (NotesToPlay[notePlaying].note div 12);

   if (NotesToPlay[notePlaying].note mod 12)>0 then inc(xoctave);

   keybyInt( notesToPlay[notePlaying].note - ( (xoctave-1)*12) , xoctave ,false);
   keybyIntPlay( notesToPlay[notePlaying].note - ( (xoctave-1)*12) , xoctave ,true);

   NotesToPlay[notePlaying].PlayCounter := NotesToPlay[notePlaying].duration;
  end;


  for i := 1 to maxNotes do
   if NotesToPlay[i].PlayCounter<>-1 then
   begin
    dec(NotesToPlay[i].PlayCounter);
    if NotesToPlay[i].PlayCounter=0 then
    begin
     xoctave := (NotesToPlay[i].note div 12);
     if (NotesToPlay[i].note mod 12)>0 then inc(xoctave);

     keybyInt( notesToPlay[i].note - ( (xoctave-1)*12) , xoctave ,true);
     keybyIntPlay( notesToPlay[i].note - ( (xoctave-1)*12) , xoctave ,false);

     NotesToPlay[i].PlayCounter := -1;
     if i=maxNotes then StartPlay := FALSE;
    end;
   end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 FMIDIDevice := -1;
 FMIDIPortName := 'Microsoft MIDI Mapper';
 FMIDIChannel := 1;

 OctaveToPlay := 0;

 RootList.ItemIndex := 0;
 ChordList.ItemIndex := 0;
 ScaleList.ItemIndex := 0;
 LastNote := '';
 StartPlay := FALSE;
 label1.caption := 'Length: '+inttostr(LengthTrack.Position*10)+' MSec';
 label2.caption := 'Space: '+inttostr(PauseTrack.Position*10)+' MSec';

// MIDIKeys1.FillColour := RGB(100,100,255);
// Keys1.FillColour := RGB(160,160,255);

 maxChordViews := 0;

 BlackKey    := TBitmap.Create;
 AKey        := TBitmap.Create;
 ERightKey   := TBitmap.Create;
 DCenterKey  := TBitmap.Create;
 CKey        := TBitmap.Create;
(*
 BlackKey.LoadFromFile('images\black.bmp');
 AKey.LoadFromFile('images\A.bmp');
 ERightKey.LoadFromFile('images\E_Right.bmp');
 DCenterKey.LoadFromFile('images\D_Center.bmp');
 CKey.LoadFromFile('images\C.bmp');
*)

 BlackKey.LoadFromFile('images\black.bmp');
 AKey.LoadFromFile('images\AWithBlack.bmp');
 ERightKey.LoadFromFile('images\E_RightWithBlack.bmp');
 DCenterKey.LoadFromFile('images\D_CenterWithBlack.bmp');
 CKey.LoadFromFile('images\CWithBlack.bmp');

 BlackKey_Selected    := TBitmap.Create;
 AKey_Selected        := TBitmap.Create;
 ERightKey_Selected   := TBitmap.Create;
 DCenterKey_Selected  := TBitmap.Create;
 CKey_Selected        := TBitmap.Create;
(*
 BlackKey.LoadFromFile('images\black.bmp');
 AKey.LoadFromFile('images\A.bmp');
 ERightKey.LoadFromFile('images\E_Right.bmp');
 DCenterKey.LoadFromFile('images\D_Center.bmp');
 CKey.LoadFromFile('images\C.bmp');
*)

 BlackKey_Selected.LoadFromFile('images\black_Selected.bmp');
 AKey_Selected.LoadFromFile('images\AWithBlack_Selected.bmp');
 ERightKey_Selected.LoadFromFile('images\E_RightWithBlack_Selected.bmp');
 DCenterKey_Selected.LoadFromFile('images\D_CenterWithBlack_Selected.bmp');
 CKey_Selected.LoadFromFile('images\CWithBlack_Selected.bmp');
end;

procedure TForm1.LengthTrackChange(Sender: TObject);
begin
 label1.caption := 'Length: '+inttostr(LengthTrack.Position*10)+' MSec';
end;

procedure TForm1.PauseTrackChange(Sender: TObject);
begin
 label2.caption := 'Space: '+inttostr(PauseTrack.Position*10)+' MSec';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
// Keys1.AllNotesOff(false);
 maxChordViews := 0;
// ListBox1.clear;
end;

procedure TForm1.ChordListClick(Sender: TObject);
var
 StartNote : Integer;
 s         : string;
 i         : integer;
begin
 RootListClick(Sender);
end;

procedure TForm1.RootListClick(Sender: TObject);
var
 StartNote : Integer;
 s         : string;
 i         : integer;
 xoctave   : integer;
begin
// MIDIKeys1.AllNotesOff(FALSE);

 for i := 1 to maxNotes do
 begin
  xoctave := (NotesToPlay[i].note div 12);
  if (NotesToPlay[i].note mod 12)>0 then inc(xoctave);

  PaintKey(PaintBox1.Canvas,NotesToPlay[i].note - ( (xoctave-1)*12), xoctave ,FALSE);
 end;

 maxNotes := 0;
 notePlaying := 0;


 startNote := noteToNumber(RootList.Items[RootList.itemindex]);
 inc(maxNotes);
 NotesToPlay[maxNotes].note := startNote;
 NotesToPlay[maxNotes].volume := 99;
 NotesToPlay[maxNotes].duration := LengthTrack.Position;
 NotesToPlay[maxNotes].PlayCounter := -1;

 s := ChordList.Items[ChordList.itemindex];
 s := copy(s,1,pos(' ',s)-1)+',';
 repeat

  inc(maxNotes);
  NotesToPlay[maxNotes].note := startNote+strtoint(copy(s,1,pos(',',s)-1))-1;
  NotesToPlay[maxNotes].volume := 99;
  NotesToPlay[maxNotes].duration := LengthTrack.Position;
  NotesToPlay[maxNotes].PlayCounter := -1;

  delete(s,1,pos(',',s));
 until (s='') or (pos(',',s)=0);

// StartPlay := TRUE;
// timeCounter := 0;
// notePlaying := 0;

 Memo1.Lines.Clear;
 for i := 1 to maxNotes do
 begin
  xoctave := (NotesToPlay[i].note div 12);
  if (NotesToPlay[i].note mod 12)>0 then inc(xoctave);

  PaintKey(PaintBox1.Canvas,NotesToPlay[i].note - ( (xoctave-1)*12) , xoctave ,TRUE);
  memo1.lines.add( inttostr ( NotesToPlay[i].note)+' '+inttostr( xoctave ) );
 end;
//  MidiKeys1.PressNote(35+(12*(OctaveToPlay-1))+NotesToPlay[i].note,99, FALSE);

 BitBtn1Click(Sender);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 i:integer;
begin
// for i := 1 to maxNotes do
//  Keys1.PressNote(35+(12*(OctaveToPlay-1))+NotesToPlay[i].note,99, FALSE);

 inc(maxChordViews);
 with ChordViews[maxChordViews] do
 begin
  ListBoxString := RootList.Items[RootList.itemIndex]+ ' ' + ChordList.Items[ChordList.ItemIndex];
  maxChordNotes := 0;
  for i := 1 to maxNotes do
  begin
   inc(maxChordNotes);

   ChordNotes[maxChordNotes].note     := NotesToPlay[i].note;
   ChordNotes[maxChordNotes].volume   := NotesToPlay[i].volume;
   ChordNotes[maxChordNotes].duration := NotesToPlay[i].duration;
  end;
 end;

// ListBox1.Clear;
// for i := 1 to maxChordViews do
//  ListBox1.Items.Add(chordViews[i].ListBoxString);
 ChordViewShowNo := 0;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
 i:integer;
begin
 if maxChordViews>0 then
 begin
  inc(ChordViewShowNo);
  if ChordViewShowNo>maxChordViews then ChordViewShowNo := 1;

//  ListBox1.ItemIndex := ChordViewShowNo-1;

//  Keys1.AllNotesOff(false);

//  for i := 1 to ChordViews[ChordViewShowNo].maxChordNotes do
//   PressNote(35+(12*(OctaveToPlay-1))+ChordViews[ChordViewShowNo].chordNotes[i].note ,99, FALSE);


 end;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
 x,x1,y:integer;
 Octaves:integer;
 i,j:integer;
begin
 for i := 1 to 5 do
  for j := 1 to 12 do
   PaintKey(PaintBox1.Canvas,j,i,false);

   (*
 x := 0;

 for Octaves := 1 to 5 do
 begin
  PaintBox1.Canvas.Draw(x,0,CKey); x1 := x; inc(x,CKey.Width);
  PaintBox1.Canvas.Draw(x,0,DCenterKey); inc(x,DCenterKey.Width);
//  PaintBox1.Canvas.Draw(x1+10,0,BlackKey);

  PaintBox1.Canvas.Draw(x,0,ERightKey); x1 := x; inc(x,ERightKey.Width);
//  PaintBox1.Canvas.Draw(x1-5,0,BlackKey);

  PaintBox1.Canvas.Draw(x,0,CKey); inc(x,CKey.Width);

  PaintBox1.Canvas.Draw(x,0,DCenterKey); x1 := x; inc(x,DCenterKey.Width);
  PaintBox1.Canvas.Draw(x,0,AKey); inc(x,AKey.Width);

//  PaintBox1.Canvas.Draw(x1-9,0,BlackKey);
//  PaintBox1.Canvas.Draw(x1+15,0,BlackKey);

  PaintBox1.Canvas.Draw(x,0,ERightKey); x1 := x; inc(x,ERightKey.Width);

//  PaintBox1.Canvas.Draw(x1-5,0,BlackKey);
 end;
*)
end;

procedure TForm1.PaintBox2Paint(Sender: TObject);
var
 x,x1,y:integer;
 i,j,Octaves:integer;
begin
 for i := 1 to 5 do
  for j := 1 to 12 do
   PaintKey(PaintBox2.Canvas,j,i,false);
(*
 x := 0;

 for Octaves := 1 to 5 do
 begin
  PaintBox2.Canvas.Draw(x,0,CKey); x1 := x; inc(x,CKey.Width);
  PaintBox2.Canvas.Draw(x,0,DCenterKey); inc(x,DCenterKey.Width);
  PaintBox2.Canvas.Draw(x1+10,0,BlackKey);

  PaintBox2.Canvas.Draw(x,0,ERightKey); x1 := x; inc(x,ERightKey.Width);
  PaintBox2.Canvas.Draw(x1-5,0,BlackKey);

  PaintBox2.Canvas.Draw(x,0,CKey); inc(x,CKey.Width);

  PaintBox2.Canvas.Draw(x,0,DCenterKey); x1 := x; inc(x,DCenterKey.Width);
  PaintBox2.Canvas.Draw(x,0,AKey); inc(x,AKey.Width);

  PaintBox2.Canvas.Draw(x1-9,0,BlackKey);
  PaintBox2.Canvas.Draw(x1+15,0,BlackKey);

  PaintBox2.Canvas.Draw(x,0,ERightKey); x1 := x; inc(x,ERightKey.Width);

  PaintBox2.Canvas.Draw(x1-5,0,BlackKey);
 end;
*)
end;

procedure TForm1.PaintKey(Canvas : TCanvas; xKey,xOctave : Integer; Active : Boolean);
var
 Px,Px1,Py  : Integer;
 Octaves    : Integer;
 Key,Octave : Integer;
begin
 Px := 0;

 Key := -1;
 Octave := -1;


 for Octaves := 1 to 5 do
 begin

  Key := 1;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,CKey_Selected) else
                  Canvas.Draw(Px,0,CKey);
  end;

  Px1 := Px; inc(Px,CKey.Width);

  Key := 3;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,DCenterKey_Selected) else
                  Canvas.Draw(Px,0,DCenterKey);
  end;



  inc(Px,DCenterKey.Width);

  Key := 2;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px1+10,0,BlackKey_Selected) else
                  Canvas.Draw(Px1+10,0,BlackKey);
  end;

  Key := 5;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,ERightKey_Selected) else
                  Canvas.Draw(Px,0,ERightKey);
  end;


  Px1 := Px; inc(Px,ERightKey.Width);

  key := 4;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px1-5,0,BlackKey_Selected) else
                  Canvas.Draw(Px1-5,0,BlackKey);
  end;

  key := 6;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,CKey_Selected) else
                  Canvas.Draw(Px,0,CKey);
  end;


  Inc(Px,CKey.Width);

  key := 8;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,DCenterKey_Selected) else
                  Canvas.Draw(Px,0,DCenterKey);
  end;


  Px1 := Px; inc(Px,DCenterKey.Width);

  key := 10;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,AKey_Selected) else
                  Canvas.Draw(Px,0,AKey);
  end;

  inc(Px,AKey.Width);


  key := 7;

  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px1-9,0,BlackKey_Selected) else
                  Canvas.Draw(Px1-9,0,BlackKey);
  end;


  key := 9;
  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px1+15,0,BlackKey_Selected) else
                  Canvas.Draw(Px1+15,0,BlackKey);
  end;

  key := 12;
  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px,0,ERightKey_Selected) else
                  Canvas.Draw(Px,0,ERightKey);
  end;


  Px1 := Px; inc(Px,ERightKey.Width);

  key := 11;
  if (xOctave=Octaves) and (key=xKey) then
  begin
   if Active then Canvas.Draw(Px1-5,0,BlackKey_Selected) else
                  Canvas.Draw(Px1-5,0,BlackKey);
  end;

 end;
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 Px,Px1,Py:integer;
 Octaves:integer;
 key,Octave : Integer;



 data : record
         case boolean of
          True  : (b1, b2, b3, b4 : byte);
          False : (l : LongInt);
        end;

begin
 Px := 0;

 Key := -1;
 Octave := -1;


 for Octaves := 1 to 5 do
 begin
  if (x>=Px) and (y>=0) and (x <= Px+CKey.Width) and (y <= CKey.Height) then
  begin
   Octave := Octaves;
   key := 1;
  end;

  Px1 := Px; inc(Px,CKey.Width);

  if (x>=Px) and (y>=0) and (x <= Px+DCenterKey.Width) and (y <= DCenterKey.Height) then
  begin
   Octave := Octaves;
   key := 3;
  end;

  inc(Px,DCenterKey.Width);

  if (x>=Px1+10) and (y>=0) and (x <= Px1+10+BlackKey.Width) and (y <= BlackKey.Height) then
  begin
   Octave := Octaves;
   key := 2;
  end;

  if (x>=Px) and (y>=0) and (x <= Px+ERightKey.Width) and (y <= ERightKey.Height) then
  begin
   Octave := Octaves;
   key := 5;
  end;

  Px1 := Px; inc(Px,ERightKey.Width);

  if (x>=Px1-5) and (y>=0) and (x <= Px1-5+BlackKey.Width) and (y <= BlackKey.Height) then
  begin
   Octave := Octaves;
   key := 4;
  end;

  if (x>=Px) and (y>=0) and (x <= Px+CKey.Width) and (y <= CKey.Height) then
  begin
   Octave := Octaves;
   key := 6;
  end;

  Inc(Px,CKey.Width);

  if (x>=Px) and (y>=0) and (x <= Px+DCenterKey.Width) and (y <= DCenterKey.Height) then
  begin
   Octave := Octaves;
   key := 8;
  end;

  Px1 := Px; inc(Px,DCenterKey.Width);

  if (x>=Px) and (y>=0) and (x <= Px+AKey.Width) and (y <= AKey.Height) then
  begin
   Octave := Octaves;
   key := 10;
  end;

  inc(Px,AKey.Width);

  if (x>=Px1-9) and (y>=0) and (x <= Px1-9+BlackKey.Width) and (y <= BlackKey.Height) then
  begin
   Octave := Octaves;
   key := 7;
  end;

  if (x>=Px1+15) and (y>=0) and (x <= Px1+15+BlackKey.Width) and (y <= BlackKey.Height) then
  begin
   Octave := Octaves;
   key := 9;
  end;

  if (x>=Px) and (y>=0) and (x <= Px+ERightKey.Width) and (y <= ERightKey.Height) then
  begin
   Octave := Octaves;
   key := 12;
  end;

  Px1 := Px; inc(Px,ERightKey.Width);

  if (x>=Px1-5) and (y>=0) and (x <= Px1-5+BlackKey.Width) and (y <= BlackKey.Height) then
  begin
   Octave := Octaves;
   key := 11;
  end;
 end;

 if (LastKey<>Key) or (LastOctave<>Octave) then
 begin
  PaintKey(PaintBox1.Canvas,LastKey,LastOctave,False);

  if (octave<>-1) and (key<>-1) then
  begin
   LastKey := key;
   LastOctave := octave;
  end;

  if midiPort = 0 then SelectMIDIPort;
  if FMIDIPortOk then with data do
  begin
    b1 := $90 + FMIDIChannel - 1;
    b2 := Key+((Octave+2)*12);
    b3 := 64;
    b4 := 0;
    midiOutShortMsg (midiPort, l);
  end;

  PaintKey(PaintBox1.Canvas,key,octave,true);
 end;


 Caption := IntToStr(Key) + ' ' + IntToStr(Octave);
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  data : record case boolean of
    True  : (b1, b2, b3, b4 : byte);
    False : (l : LongInt);
  end;
begin

 if FMIDIPortOk then with data do
 begin
   b1 := $80 + FMIDIChannel - 1;
   b2 := LastKey+((LastOctave+2)*12);
   b3 := 64;
   b4 := 0;
   midiOutShortMsg (midiPort, l);
 end;

 PaintKey(PaintBox1.Canvas,LastKey,LastOctave,False);
 LastKey := -1;
 LastOctave := -1;
end;

////////////////////////////////////

procedure TForm1.SelectMIDIPort;
var
  rv, noDevs : Word;
begin
  if midiPort <> 0 then
  begin
    midiOutReset (midiPort);
    midiOutClose (midiPort);
    FMIDIPort := 0;
  end;

  FMIDIportOk := False;

  noDevs := midiOutGetNumDevs;
  if FMIDIDevice < noDevs then
  begin
    rv := midiOutOpen (@FMIDIPort, FMIDIDevice, 0, 0, 0);
    if rv = 0 then FMIDIPortOk := True;
  end
end;

procedure TForm1.SetMIDIDevice (value : Integer);
var
  noDevs : Integer;
  devCaps : TMidiOutCaps;
begin
  if value <> FMIDIDevice then
  begin
    if midiPort <> 0 then
    begin
      midiOutReset (midiPort);
      midiOutClose (midiPort);
      FMIDIPort := 0
    end;

    FMIDIDevice := value;
    noDevs := midiOutGetNumDevs;
    if FMIDIDevice < noDevs then
    begin
      midiOutGetDevCaps (FMIDIDevice, @devCaps, sizeof (devCaps));
      FMIDIPortName := StrPas (devCaps.szPName);
    end
    else FMIDIPortName := '';
  end
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if midiPort <> 0 then
 begin
  midiOutReset (midiPort);
  midiOutClose (midiPort);
 end;
end;

end.

(*
constructor TMIDIKeys.Create (AOwner : TComponent);
begin
  inherited Create (AOwner);
  OnNoteOn := NoteOn;
  OnNoteOff := NoteOff;

  FMIDIDevice := -1;
  FMIDIPortName := 'Microsoft MIDI Mapper';
  FMIDIChannel := 1;
end;

destructor TMIDIKeys.Destroy;
begin
  if midiPort <> 0 then
  begin
    midiOutReset (midiPort);
    midiOutClose (midiPort);
  end;
  inherited Destroy
end;

procedure TMIDIKeys.SelectMIDIPort;
var
  rv, noDevs : Word;
begin
  if midiPort <> 0 then
  begin
    midiOutReset (midiPort);
    midiOutClose (midiPort);
    FMIDIPort := 0;
  end;

  FMIDIportOk := False;

  noDevs := midiOutGetNumDevs;
  if FMIDIDevice < noDevs then
  begin
    rv := midiOutOpen (@FMIDIPort, FMIDIDevice, 0, 0, 0);
    if rv = 0 then FMIDIPortOk := True;
  end
end;

procedure TMIDIKeys.SetMIDIDevice (value : Integer);
var
  noDevs : Integer;
  devCaps : TMidiOutCaps;
begin
  if value <> FMIDIDevice then
  begin
    if midiPort <> 0 then
    begin
      midiOutReset (midiPort);
      midiOutClose (midiPort);
      FMIDIPort := 0
    end;

    FMIDIDevice := value;
    noDevs := midiOutGetNumDevs;
    if FMIDIDevice < noDevs then
    begin
      midiOutGetDevCaps (FMIDIDevice, @devCaps, sizeof (devCaps));
      FMIDIPortName := StrPas (devCaps.szPName);
    end
    else FMIDIPortName := '';
  end
end;

procedure TMIDIKeys.NoteOn (Sender : TObject; note, velocity : Integer);
var
  data : record case boolean of
    True  : (b1, b2, b3, b4 : byte);
    False : (l : LongInt);
  end;
begin
  if midiPort = 0 then SelectMIDIPort;
  if FMIDIPortOk then with data do
  begin
    b1 := $90 + FMIDIChannel - 1;
    b2 := note;
    b3 := velocity;
    b4 := 0;
    midiOutShortMsg (midiPort, l);
  end;
end;

procedure TMIDIKeys.NoteOff (Sender : TObject; note, velocity : Integer);
var
  data : record case boolean of
    True  : (b1, b2, b3, b4 : byte);
    False : (l : LongInt);
  end;
begin
  if FMIDIPortOk then with data do
  begin
    b1 := $80 + FMIDIChannel - 1;
    b2 := note;
    b3 := velocity;
    b4 := 0;
    midiOutShortMsg (midiPort, l);
  end;
end;

*)

