unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls,DB, Mask,Buttons, ToolWin, DBClient,RXSTRUtils,
  Placemnt, yupack ;


type
  TForm2 = class(TForm)
    FormStorage1: TFormStorage;
    Panel8: TPanel;
    BPanel1: TYusoftGradientButton;
    BPanel4: TYusoftGradientButton;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    AN: TCheckBox;
    EGF_CUN: TCheckBox;
    BBG_CUF: TCheckBox;
    ADRES: TCheckBox;
    EGF_CRF: TCheckBox;
    BBG_NDIR: TCheckBox;
    BBG_NGLB: TCheckBox;
    BBG_PHONE: TCheckBox;
    ECA_BRNM: TCheckBox;
    BSC_SC: TCheckBox;
    ComboBox: TComboBox;
    YusoftWallpaper4: TYusoftWallpaper;
    YusoftWallpaper1: TYusoftWallpaper;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BSC_SCClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BPanel1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure BPanel4MouseEnter(Sender: TObject);
    procedure BPanel4MouseLeave(Sender: TObject);
    procedure BPanel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.DFM}

procedure TForm2.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
   Style := (Style or WS_POPUP) and (not WS_DLGFRAME);
 {I think this is the best way to get form without captiom
  BorderStyle=bsNone is not beatiful}
end;


procedure TForm2.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
sSQL4,stroka:String;
begin
{--------------���������� ��������--------------------------------}
   if Not IsEmptyStr(Combobox.Text, [#0,' ']) then
     if Combobox.Text<>Combobox.Items[0]  then
        Combobox.Items.Add(Combobox.Text);
    while Combobox.Items.Count>30 do  Combobox.Items.Delete(0);
{--------------------------------------------------------------}
 with Form1 do begin

   if BSC_SC.Checked then //����� ������ �� ������� �/�
    begin
     DM.QTMP.Active:=False;
     DM.QTMP.SQL.Clear;
//     DM.QTMP.SQL.ADD('select bsc_an from scpf where bsc_sc LIKE '+ccharLike(Trim(Form2.Combobox.Text)));
//     DM.QTMP.SQL.ADD('select bsc_an from scpf where bsc_sc LIKE '+chr(39)+'%'+chr(39)+'+'+Trim(Form2.Combobox.Text)+chr(39)+'%'+chr(39));
     DM.QTMP.SQL.ADD('select bsc_an from scpf where bsc_sc LIKE '+chr(39)+'%'+Trim(Form2.Combobox.Text)+'%'+chr(39));
     DM.QTMP.Active:=True;

     if DM.QTMP.IsEmpty then begin
       ShowMessage('�� ����� ������ �/� '+ ReplaceStr(stroka,'%',''));
       Combobox.SetFocus;
      end else begin
       Form2.Combobox.Text:= DM.QTMP.FieldByName('BSC_AN').ASString;
       AN.Checked:=True;
      end;

   end; {if}

  sSQL4:='';
  stroka:=chr(39)+'%'+Trim(Form2.Combobox.Text)+'%'+chr(39);
//  stroka:=ccharLike(Trim(Form2.Combobox.Text));
  if AN.Checked then  sSQL4:=' OR B.EGF_CPNC LIKE '+stroka;
  if EGF_CUN.Checked then  sSQL4:=sSQL4+' OR UPPER(G.EGF_CUN) LIKE '+ stroka;
  if BBG_CUF.Checked then  sSQL4:=sSQL4+' OR BBG_CUF LIKE '+ stroka;
  if ADRES.Checked then  sSQL4:=sSQL4+' OR ADRES LIKE '+ stroka;
  if EGF_CRF.Checked then  sSQL4:=sSQL4+' OR EGF_CRF LIKE '+ stroka;
  if BBG_NDIR.Checked then  sSQL4:=sSQL4+' OR BBG_NDIR LIKE '+ stroka;
  if BBG_NGLB.Checked then  sSQL4:=sSQL4+' OR BBG_NGLB LIKE '+ stroka;
  if BBG_PHONE.Checked then sSQL4:=sSQL4+' OR BBG_PHONE1 LIKE '+ stroka+
    ' OR BBG_PHONE2 LIKE '+ stroka+' OR BBG_TELEX LIKE '+ stroka+' OR BBG_FAX LIKE '+ stroka;
  if ECA_BRNM.Checked then  sSQL4:=sSQL4+' OR ECA_BRNM LIKE '+ stroka;


if Trim(Form2.Combobox.Text)='' then ShowMessage('���� ������ ������ ��� ������')
else
  if (sSQL4='')  then //ShowMessage('� �� �����, � �� ��� ������ ����� ? ')
   else
  begin
   screen.Cursor:=crSearch;
   sSQL4:=' AND ( '+COPY(sSQL4,4,Length(sSQL4)-3)+' ) ';
   DM.QNANC.Active:=False;
   DM.QNANC.SQL.Clear;
   DM.QNANC.SQL.Add(sSQL1+sSQL2+sSQL3+sSQL4);
 //  memo1.Lines.add(sSQL1+sSQL2+sSQL3+sSQL4);
///   DM.QNANC.SQL.SaveToFile('d:\sql.txt'); 
   DM.QNANC.Active:=True;
//   StatusBar1.Panels[1].Text:= '��������� ������ ������: '+ ReplaceStr(stroka,'%','');
//   ToolButton1.Enabled:=True;
   PopupMenu1.Items[2].Enabled:=True;
   PopupMenu1.Items.ImageIndex:=0;
   screen.Cursor:=crS_Green;
  end {if};
 end;{if}

 if DM.QNANC.IsEmpty then begin
    ShowMessage('�� ����� ������ '+ Trim(Form2.Combobox.Text));
    Combobox.SetFocus;
   end else Close ;

end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 BPanel1.ShadowColor:=clGray;
 BPanel4.ShadowColor:=clGray;
  with Form1 do
  begin
   PageControl1.ActivePage:=PageControl1.Pages[0] ;
  end; {with}
  ComboBox.SetFocus;
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
   BPanel1.ShadowColor:=clBlack;
   BPanel4.ShadowColor:=clBlack;
   Form1.GridNANC.SetFocus;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
// Combobox.Items.SaveToFile(Form1.Utils1.PathWinDir+'\mscombo.txt');
end;

procedure TForm2.FormCreate(Sender: TObject);
var
sFile : String;
begin
/// BitBtn1.Cursor:=crDetectF;
// sFile:=Form1.Utils1.PathWinDir+'\mscombo.txt';
//  if FileExists(sFile) then
//     Combobox.Items.LoadFromFile(sFile);

end;

procedure TForm2.ComboBoxDblClick(Sender: TObject);
begin
  Combobox.DroppedDown:=True;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS,30);
end;

procedure TForm2.FormPaint(Sender: TObject);
begin
// GradientFillRect(Canvas, ClientRect,clBlack, clBlue, fdTopToBottom, 255);

end;

procedure TForm2.BSC_SCClick(Sender: TObject);
begin
if BSC_sc.Checked then
  begin
   AN.Enabled:=False;
   EGF_CUN.Enabled:=False;
   BBG_CUF.Enabled:=False;
   ADRES.Enabled:=False;
   ECA_BRNM.Enabled:=False;
   EGF_CRF.Enabled:=False;
   BBG_NDIR.Enabled:=False;
   BBG_NGLB.Enabled:=False;
   BBG_PHONE.Enabled:=False;

  end else begin
   AN.Enabled:=True;
   EGF_CUN.Enabled:=True;
   BBG_CUF.Enabled:=True;
   ADRES.Enabled:=True;
   ECA_BRNM.Enabled:=True;
   EGF_CRF.Enabled:=True;
   BBG_NDIR.Enabled:=True;
   BBG_NGLB.Enabled:=True;
   BBG_PHONE.Enabled:=True;

end;



end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Ord(Key)= VK_F5 then BitBtn1Click(Sender);
end;

procedure TForm2.BPanel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssleft in shift then
  begin
    ReleaseCapture;
    Form2.perform(WM_syscommand, $F012, 0);
  end;
end;

procedure TForm2.BPanel4MouseEnter(Sender: TObject);
begin
  (Sender as TYusoftGradientButton).Font.Color:=clYellow;
end;

procedure TForm2.BPanel4MouseLeave(Sender: TObject);
begin
  (Sender as TYusoftGradientButton).Font.Color:=clWhite;
end;

procedure TForm2.BPanel4Click(Sender: TObject);
begin
Close;
end;

end.
