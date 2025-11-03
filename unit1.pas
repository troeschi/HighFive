{    <Part of "HighFive".
     Dice roll game.>

    Copyright (C) 2025  A.Trösch

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

    Source-Code on Github: https://github.com/troeschi/HighFive
    Email-contact: troesch.andreas@gmx.de	                            }


{ Main Window of HighFive }


unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Grids, Buttons, DividerBevel, BCSVGViewer, uplaysound, lNetComponents,
  strUtils, Unit2,
  {$IFDEF unix}
  clocale,ComCtrls,
  {$ENDIF}
  unit3, Unit4, fileutil, inifiles, lNet, lclstrconsts, TranslateStr,
  LCLTranslator, Unit5, Unit6;

const
  Dice_1 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M302.87 255.5a47.37 47.37 0 1 1-47.37-47.37 47.37 47.37 0 0 1 47.37 47.37zM484.5 428.02a56.48 56.48 0 0 1-56.48 56.48h-344a56.48 56.48 0 0 1-56.52-56.48v-344A56.48 56.48 0 0 1 83.98 27.5h344a56.48 56.48 0 0 1 56.52 56.48zm-20-344a36.48 36.48 0 0 0-36.48-36.52h-344A36.48 36.48 0 0 0 47.5 83.98v344a36.48 36.48 0 0 0 36.48 36.52h344a36.48 36.48 0 0 0 36.52-36.48z"/></svg>';
  Dice_2 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M383 81.68A47.37 47.37 0 1 1 335.58 129 47.37 47.37 0 0 1 383 81.68zM81.67 383A47.37 47.37 0 1 0 129 335.59 47.37 47.37 0 0 0 81.67 383zM428 47.57H84A36.48 36.48 0 0 0 47.57 84v344A36.48 36.48 0 0 0 84 464.43h344A36.48 36.48 0 0 0 464.43 428V84A36.48 36.48 0 0 0 428 47.57m0-20A56.54 56.54 0 0 1 484.43 84v344A56.54 56.54 0 0 1 428 484.43H84A56.54 56.54 0 0 1 27.57 428V84A56.54 56.54 0 0 1 84 27.57z"/></svg>';
  Dice_3 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M302.87 255.5a47.37 47.37 0 1 1-47.37-47.37 47.37 47.37 0 0 1 47.37 47.37zM382.5 81.18a47.37 47.37 0 1 0 47.32 47.32 47.37 47.37 0 0 0-47.32-47.32zm-254 253.91a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.41-47.41zm356 92.94a56.48 56.48 0 0 1-56.48 56.47h-344a56.48 56.48 0 0 1-56.52-56.48v-344A56.48 56.48 0 0 1 83.98 27.5h344a56.48 56.48 0 0 1 56.52 56.48zm-20-344a36.48 36.48 0 0 0-36.48-36.53h-344A36.48 36.48 0 0 0 47.5 83.98v344a36.48 36.48 0 0 0 36.48 36.52h344a36.48 36.48 0 0 0 36.52-36.48z"/></svg>';
  Dice_4 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M175.91 128.5a47.37 47.37 0 1 1-47.41-47.32 47.37 47.37 0 0 1 47.41 47.32zM382.5 81.18a47.37 47.37 0 1 0 47.32 47.32 47.37 47.37 0 0 0-47.32-47.32zm-254 253.91a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.41-47.41zm253.91 0a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.32-47.41zm102 92.93a56.48 56.48 0 0 1-56.39 56.48h-344a56.48 56.48 0 0 1-56.52-56.48v-344A56.48 56.48 0 0 1 83.98 27.5h344a56.48 56.48 0 0 1 56.52 56.48zm-20-344a36.48 36.48 0 0 0-36.39-36.52h-344A36.48 36.48 0 0 0 47.5 83.98v344a36.48 36.48 0 0 0 36.48 36.52h344a36.48 36.48 0 0 0 36.52-36.48z"/></svg>';
  Dice_5 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M302.87 255.5a47.37 47.37 0 1 1-47.37-47.37 47.37 47.37 0 0 1 47.37 47.37zM128.5 81.18a47.37 47.37 0 1 0 47.41 47.32 47.37 47.37 0 0 0-47.41-47.32zm253.91 0a47.37 47.37 0 1 0 47.41 47.32 47.37 47.37 0 0 0-47.32-47.32zM128.5 335.09a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.41-47.41zm253.91 0a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.32-47.41zm102 92.93a56.48 56.48 0 0 1-56.39 56.48h-344a56.48 56.48 0 0 1-56.52-56.48v-344A56.48 56.48 0 0 1 83.98 27.5h344a56.48 56.48 0 0 1 56.52 56.48zm-20-344a36.48 36.48 0 0 0-36.39-36.52h-344A36.48 36.48 0 0 0 47.5 83.98v344a36.48 36.48 0 0 0 36.48 36.52h344a36.48 36.48 0 0 0 36.52-36.48z"/></svg>';
  Dice_6 = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M35 35 60h440v440H60z"/><path fill="#000" d="M175.91 128.5a47.37 47.37 0 1 1-47.41-47.32 47.37 47.37 0 0 1 47.41 47.32zM382.5 81.18a47.37 47.37 0 1 0 47.32 47.32 47.37 47.37 0 0 0-47.32-47.32zm-254 126.95a47.37 47.37 0 1 0 47.41 47.37 47.37 47.37 0 0 0-47.41-47.37zm253.91 0a47.37 47.37 0 1 0 47.41 47.37 47.37 47.37 0 0 0-47.32-47.37zM128.5 335.09a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.41-47.41zm253.91 0a47.37 47.37 0 1 0 47.41 47.41 47.37 47.37 0 0 0-47.32-47.41zm102 92.93a56.48 56.48 0 0 1-56.39 56.48h-344a56.48 56.48 0 0 1-56.52-56.48v-344A56.48 56.48 0 0 1 83.98 27.5h344a56.48 56.48 0 0 1 56.52 56.48zm-20-344a36.48 36.48 0 0 0-36.39-36.52h-344A36.48 36.48 0 0 0 47.5 83.98v344a36.48 36.48 0 0 0 36.48 36.52h344a36.48 36.48 0 0 0 36.52-36.48z"/></svg>';
  Droll  = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="#fff" d="M0 0h512v512H0z"/><path fill="#000" d="M107.376 28.002c-7.475.147-15.469 2.625-21.11 5.318-12.971 6.287-26.097 18.123-36.622 32.412-10.526 14.29-18.463 30.992-21.854 46.35-3.371 15.272-2.164 28.759 3.705 38.08l89.178 117.861c-.323-1.676-.62-3.362-.877-5.062-4.594-30.313.962-64.488 17.356-95.967 16.393-31.479 40.677-54.6 67.261-66.51 9.26-4.148 18.853-6.918 28.473-8.152l-110.045-60.43c-5.044-2.575-10.19-3.83-15.465-3.9zm138.156 81.95c-11.029-.138-22.48 2.414-33.81 7.49-22.66 10.15-44.375 30.513-59.059 58.708-14.684 28.196-19.4 58.59-15.484 84.428 3.916 25.839 16.127 46.774 35.404 58.152 11.198 6.61 23.703 9.352 36.658 8.504-5.197-12.722-9.295-25.665-9.841-39.318 10.304-19.968 20.802-39.936 35.695-59.905 22.946-7.223 47.124-4.533 75.035-3.39 3.722-16.605 4.335-32.99 2.08-47.863-3.916-25.839-16.127-46.774-35.404-58.153-9.638-5.689-20.244-8.516-31.273-8.654zm71.481 132.306-67.496 3.863 18.369 61.832 66.26-3.715c-2.435-21.315-10.232-41.558-17.133-61.98zm-80.666 15.195c-7.923 9.763-14.526 20.318-17.787 32.877 1.772 19.22 4.134 38.373 14.185 56.672l18.39-30.13zm173.738 59.95c-24.604 11.259-43.699 23.436-62.822 35.609l70.945 55.69 67.86-48.368a578.575 578.575 0 0 0-75.983-42.932zm-82.357 6.152-62.108 2.92-18.431 29.722c19.703-.995 38.332.695 59.717-4.502 10.37-9.38 14.824-18.76 20.822-28.14zm14.894 48.601c-5.018 19.188-5.258 39.333-5.73 59.43 17.198 23.68 40.384 36.581 61.943 52.412l8.658-62.232zm142.354 9.223-58.973 42.498-8.88 56.496c19.434-11.58 37.82-24.417 52.605-41.574 8.266-19.14 11.495-38.28 15.248-57.42z"/></svg>';
  Dices  : array of string =(Dice_1,Dice_2,Dice_3,Dice_4,Dice_5,Dice_6);



type

  { TForm1 }

  TForm1 = class(TForm)
    BCSVGViewer1: TBCSVGViewer;
    BCSVGViewer2: TBCSVGViewer;
    BCSVGViewer3: TBCSVGViewer;
    BCSVGViewer4: TBCSVGViewer;
    BCSVGViewer5: TBCSVGViewer;
    BCSVGViewer6: TBCSVGViewer;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    DividerBevel1: TDividerBevel;
    DividerBevel2: TDividerBevel;
    diceroll1: TImage;
    diceroll3: TImage;
    diceroll2: TImage;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    ImageList1: TImageList;
    LTCPComponent1: TLTCPComponent;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    playsound1: Tplaysound;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure BCSVGViewer1Click(Sender: TObject);
    procedure BCSVGViewer6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function isFive    : boolean;
    function isFour    : boolean;
    function isThree   : boolean;
    function isLstreet : boolean;
    function isGstreet : boolean;
    function isFhouse  : boolean;
    procedure LTCPComponent1Accept(aSocket: TLSocket);
    procedure LTCPComponent1Error(const msg: string; aSocket: TLSocket);
    procedure LTCPComponent1Receive(aSocket: TLSocket);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure checkWriteDown(Row : integer);
    procedure checkWriteUp(Row : integer);
    procedure checkWriteTopFirst(Row : integer);
    procedure checkWriteBottomFirst(Row : integer);
    procedure checkwriteFree(Row : integer);
    procedure RowCase(col,row : integer);
    procedure DiceReset;
    procedure loadgame(game_name : string);
    procedure savegame(game_name : string);
    procedure sendValues(aMsg : string);
    procedure RollDicesNet(d1,d2,d3,d4,d5 : integer);
    procedure countTotal;
    function countDiceResult : integer;
    function isAllWritten : boolean;
  private
    GameField  : TstringGrid;
    onePlayer  : Boolean;
    isWritten  : boolean;
    canUndo    : boolean;
    DiceRoll   : integer;
    isPlayer1  : boolean;
    HostMove   : boolean;
    client     : TLSocket;
    valueStr   : string;
    gameStarted     : boolean;
    score_Player1   : integer;
    score_Player2   : integer;
    ServerConnected : boolean;
    DiceDelay  : integer;
    SrvDelay   : integer;
    ShowMsg    : boolean;
    SndOn      : boolean;
    UndoResult : array[0..5] of integer;
    DiceResult : array[0..4] of integer;
    SortResult : array[0..4] of integer;
  public
    user_Path  : string;
  end;

var
  Form1 : TForm1;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i,j    : integer;
    HF_ini : Tinifile;
begin
 {$ifdef windows}
 user_path:=sysutils.GetEnvironmentVariable('localappdata')+DirectorySeparator+'HighFive';
 {$else $ifdef unix}
 user_path:=getuserdir+'.HighFive';
 {$endif}
 if(not directoryexists(user_path)) then
  if (not createdir(user_path)) then
   begin
    messagedlgpos(cantCreateDir1+user_path+cantCreateDir2+slineBreak+endProgram,
                  mtError,[mbOk],0,round(left+(width/2)),top+100);
    close;
   end;
 stringgrid1.RowHeights[0]:=40;
 stringgrid2.RowHeights[0]:=40;
 BCSVGViewer1.svgstring:=Dices[5];
 BCSVGViewer2.svgstring:=Dices[5];
 BCSVGViewer3.svgstring:=Dices[5];
 BCSVGViewer4.svgstring:=Dices[5];
 BCSVGViewer5.svgstring:=Dices[5];
 BCSVGViewer6.svgstring:=Droll;
 BCSVGViewer1.ShowHint:=true;
 BCSVGViewer2.ShowHint:=true;
 BCSVGViewer3.ShowHint:=true;
 BCSVGViewer4.ShowHint:=true;
 BCSVGViewer5.ShowHint:=true;
 BCSVGViewer6.ShowHint:=true;
 onePlayer:=true;
 isPlayer1:=true;
 isWritten:=true;
 canUndo:=false;
 client:=nil;
 HF_ini:=Tinifile.create(user_path+DirectorySeparator+'HighFive.ini');
 LTCPComponent1.Host:=HF_ini.ReadString('Net','Host','192.168.100.100');
 LTCPComponent1.Port:=HF_ini.ReadInteger('Net','Port',29175);
 SrvDelay:=HF_ini.ReadInteger('Net','SrvDelay',1000);
 ShowMsg:=HF_ini.ReadBool('Net','ShowMsg',false);
 DiceDelay:=HF_ini.ReadInteger('Options','DiceDelay',40);
 setdefaultlang(HF_ini.ReadString('Options','Lang','de'));
 SndOn:=HF_ini.ReadBool('Options','PlaySound',true);
 HF_ini.free;
 DividerBevel2.Font.Color:=clGray;
 SpeedButton1.Enabled:=false;
 speedbutton10.Enabled:=false;
 for i:=1 to 5 do
  for j:=1 to 16 do
   begin
    StringGrid1.Cells[i,j]:='-';
    StringGrid2.Cells[i,j]:='-';
   end;
 DiceRoll:=0;
 for i:=0 to 4 do
  begin
   DiceResult[i]:=0;
   UndoResult[i]:=0;
   SortResult[i]:=0;
  end;
 GameField:=stringGrid1;
 stringGrid2.Enabled:=false;
 SpeedButton7.Enabled:=false;
 SpeedButton8.Enabled:=false;
 SpeedButton9.visible:=false;
 SpeedButton11.visible:=false;
 edit1.Visible:=false;
 checkbox1.Visible:=false;
 SpeedButton2Click(nil);
 ServerConnected:=false;
 statictext2.Visible:=false;
 score_Player1:=0;
 score_Player2:=0;
 Height:=554;
 Panel2.top:=152;
 Panel2.Left:=95;
 Panel3.top:=152;
 Panel3.Left:=510;
 Panel2.Visible:=false;
 Panel3.Visible:=false;
 {$IFDEF unix}
 DividerBevel1.Style:=gsSimple;
 DividerBevel2.Style:=gsSimple;
 {$ENDIF}
 gameStarted:=false;
end;


procedure TForm1.countTotal;
var i : integer;
begin
 for i:=1 to 5 do
  begin
   if(isPlayer1 = true) then
    score_Player1:=score_Player1+strtoint(stringgrid1.Cells[i,16])
   else
    if(ServerConnected = false) and (oneplayer = false) then
    score_Player2:=score_Player2+strtoint(stringgrid2.Cells[i,16]);
  end;
end;


function TForm1.isAllWritten : boolean;
var i : integer;
begin
 result:=true;
 for i := 1 to 5 do
  begin
   if(Gamefield.Cells[i,8] = '-') then
    result:=false;
   if(Gamefield.Cells[i,16] = '-') then
    result:=false;
  end;
end;


procedure TForm1.RollDicesNet(d1,d2,d3,d4,d5 : integer);
var i,j,Dnr : integer;
    Dnet    : array[0..4] of integer;
begin
 Dnet[0]:=d1;
 Dnet[1]:=d2; Dnet[2]:=d3;
 Dnet[3]:=d4; Dnet[4]:=d5;
 for j:=1 to 5 do
  for i:=0 to 6 do
   begin
    if(i = 6) then Dnr:=Dnet[j-1]
    else Dnr:=i;
    case j of
     1 : if (Dnet[0] > -1) then
          begin
           BCSVGViewer1.svgstring:=Dices[Dnr];
           BCSVGViewer1.Repaint;
           sleep(DiceDelay);
          end;
     2 : if (Dnet[1] > -1) then
          begin
           BCSVGViewer2.svgstring:=Dices[Dnr];
           BCSVGViewer2.repaint;
           sleep(DiceDelay);
          end;
     3 : if (Dnet[2] > -1) then
          begin
           BCSVGViewer3.svgstring:=Dices[Dnr];
           BCSVGViewer3.repaint;
           sleep(DiceDelay);
          end;
     4 : if (Dnet[3] > -1) then
          begin
           BCSVGViewer4.svgstring:=Dices[Dnr];
           BCSVGViewer4.repaint;
           sleep(DiceDelay);
          end;
     5 : if (Dnet[4] > -1) then
          begin
           BCSVGViewer5.svgstring:=Dices[Dnr];
           BCSVGViewer5.repaint;
           sleep(DiceDelay);
          end;
    end;
   end;
end;


procedure TForm1.BCSVGViewer6Click(Sender: TObject);
var i,j,Dnr : integer;
    DiceSendResult : array[0..4] of integer;
begin
 if(gameStarted = false) then
  exit;
 if(DiceRoll = 3) then
  exit;
 if(ServerConnected = true) and (HostMove = true) and (client = nil) then
  exit;
 if(ServerConnected = true) and (HostMove = false) and (client <> nil) then
  exit;
 if((DiceRoll = 0) and (speedbutton10.Enabled = true) and (onePlayer = false)) then
  begin
   messagedlgpos(firstEndMove,mtError,[mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 if((BCSVGViewer1.Top = 5) and (BCSVGViewer2.Top = 5) and (BCSVGViewer3.Top = 5) and
    (BCSVGViewer4.Top = 5) and (BCSVGViewer5.Top = 5)) then
  begin
   messagedlgpos(noDices+sLineBreak+noDices2,mtError,
                 [mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 BCSVGViewer6.enabled:=false;
 if(speedButton5.Enabled = true) then
  begin
   speedButton5.Enabled:=false;
   speedButton6.Enabled:=false;
   SpeedButton7.Enabled:=false;
   SpeedButton8.Enabled:=false;
  end;
 inc(DiceRoll,1);
 isWritten:=false;
 canUndo:=false;
 speedbutton1.Enabled:=false;
 case DiceRoll of
  1 : diceroll1.visible:=false;
  2 : diceroll2.visible:=false;
  3 : diceroll3.visible:=false;
 end;
 randomize;
 playsound1.SoundFile:=user_path+DirectorySeparator+'dice.wav';
 playsound1.Execute;
 for j:=1 to 5 do
  for i:=0 to 6 do
   begin
    if(i = 6) then Dnr:=random(6)
    else Dnr:=i;
    case j of
     1 : if (BCSVGViewer1.Top=16) then
          begin
           BCSVGViewer1.svgstring:=Dices[Dnr];
           DiceResult[0]:=Dnr;
           BCSVGViewer1.Repaint;
           sleep(DiceDelay);
          end;
     2 : if (BCSVGViewer2.Top=16) then
          begin
           BCSVGViewer2.svgstring:=Dices[Dnr];
           DiceResult[1]:=Dnr;
           BCSVGViewer2.repaint;
           sleep(DiceDelay);
          end;
     3 : if (BCSVGViewer3.Top=16) then
          begin
           BCSVGViewer3.svgstring:=Dices[Dnr];
           DiceResult[2]:=Dnr;
           BCSVGViewer3.repaint;
           sleep(DiceDelay);
          end;
     4 : if (BCSVGViewer4.Top=16) then
          begin
           BCSVGViewer4.svgstring:=Dices[Dnr];
           DiceResult[3]:=Dnr;
           BCSVGViewer4.repaint;
           sleep(DiceDelay);
          end;
     5 : if (BCSVGViewer5.Top=16) then
          begin
           BCSVGViewer5.svgstring:=Dices[Dnr];
           DiceResult[4]:=Dnr;
           BCSVGViewer5.repaint;
           sleep(DiceDelay);
          end;
    end;
   end;
 if(ServerConnected = true) then
  begin
   for i:=0 to 4 do
    DiceSendResult[i]:=DiceResult[i];
   if(BCSVGViewer1.Top < 16) then
    DiceSendResult[0]:=-1;
   if(BCSVGViewer2.Top < 16) then
    DiceSendResult[1]:=-1;
   if(BCSVGViewer3.Top < 16) then
    DiceSendResult[2]:=-1;
   if(BCSVGViewer4.Top < 16) then
    DiceSendResult[3]:=-1;
   if(BCSVGViewer5.Top < 16) then
    DiceSendResult[4]:=-1;
   sendvalues('DiceRoll:'+inttostr(DiceSendResult[0])+':'+inttostr(DiceSendResult[1])+':'+inttostr(DiceSendResult[2])+':'+
                         inttostr(DiceSendResult[3])+':'+inttostr(DiceSendResult[4]));
  end;
 Application.ProcessMessages;
 BCSVGViewer6.enabled:=true;
end;


procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var HF_ini : Tinifile;
begin
 if(checkbox1.Checked = true) and (ServerConnected = true) then
  begin
   SendValues('bye');
   messagedlgpos(serverStopped,mtInformation,[mbOk],0,
                  round(left+(width/2)),top+100);
   sleep(SrvDelay);     //1000
   LTCPComponent1.Disconnect(True);
  end;
 if(checkbox1.Checked = false) and (ServerConnected = true) then
  begin
   SendValues('bye');
   messagedlgpos(serverStopped2,mtInformation,[mbOk],0,
                  round(left+(width/2)),top+100);
   sleep(SrvDelay);   //1000
   LTCPComponent1.Disconnect(True);
  end;
 HF_ini:=Tinifile.create(user_path+DirectorySeparator+'HighFive.ini');
 HF_ini.WriteString('Net','Host',LTCPComponent1.Host);
 HF_ini.WriteInteger('Net','Port',LTCPComponent1.Port);
 HF_ini.WriteInteger('Net','SrvDelay',SrvDelay);
 HF_ini.WriteBool('Net','ShowMsg',ShowMsg);
 HF_ini.WriteInteger('Options','DiceDelay',DiceDelay);
 HF_ini.WriteBool('Options','PlaySound',SndOn);
 HF_ini.free;
end;


procedure TForm1.BCSVGViewer1Click(Sender: TObject);
begin
 if(DiceRoll = 3) then
  exit;
 if(DiceRoll > 0) then
  begin
   if((Sender as TBCSVGViewer).top =16) then
    (Sender as TBCSVGViewer).top:=5
   else
    (Sender as TBCSVGViewer).top:=16;
  end;
end;


function TForm1.isFive : boolean;
begin
 result:=false;
 if(DiceResult[0] = DiceResult[1]) then
  if(DiceResult[1] = DiceResult[2]) then
   if(DiceResult[2] = DiceResult[3]) then
    if(DiceResult[3] = DiceResult[4]) then
     result:=true;
end;


function TForm1.isFour : boolean;
var i,j,k : integer;
begin
 result:=false;
 for i:=0 to 4 do
  sortresult[i]:=DiceResult[i];
 for i:= 0 to 4 do
  for j:= i+1 to 4 do
   if(sortresult[i] > sortresult[j]) then
    begin
     k:=sortresult[j];
     sortresult[j]:=sortresult[i];
     sortresult[i]:=k;
    end;
 if((sortresult[0]=sortresult[1]) and (sortresult[0]=sortresult[2]) and (sortresult[0]=sortresult[3])) then
  result:=true
 else
  if((sortresult[1]=sortresult[2]) and (sortresult[1]=sortresult[3]) and (sortresult[1]=sortresult[4])) then
  result:=true
end;


function TForm1.isThree : boolean;
var i,j,k : integer;
begin
 result:=false;
 for i:=0 to 4 do
  sortresult[i]:=DiceResult[i];
 for i:= 0 to 4 do
  for j:= i+1 to 4 do
   if(sortresult[i] > sortresult[j]) then
    begin
     k:=sortresult[j];
     sortresult[j]:=sortresult[i];
     sortresult[i]:=k;
    end;
 if((sortresult[0]=sortresult[1]) and (sortresult[0]=sortresult[2])) then
  result:=true
 else
  begin
   if((sortresult[1]=sortresult[2]) and (sortresult[1]=sortresult[3])) then
    result:=true
   else
    if((sortresult[2]=sortresult[3]) and (sortresult[2]=sortresult[4])) then
     result:=true;
  end;
end;


function TForm1.isGstreet : boolean;
var i,j,k : integer;
begin
 result:=false;
 for i:=0 to 4 do
  sortresult[i]:=DiceResult[i];
 for i:= 0 to 4 do
  for j:= i+1 to 4 do
   if(sortresult[i] > sortresult[j]) then
    begin
     k:=sortresult[j];
     sortresult[j]:=sortresult[i];
     sortresult[i]:=k;
    end;
 if((sortresult[0]+1=1) and (sortresult[1]+1=2) and (sortresult[2]+1=3) and (sortresult[3]+1=4) and (sortresult[4]+1=5)) then
  result:=true
 else
  if ((sortresult[0]+1=2) and (sortresult[1]+1=3) and (sortresult[2]+1=4) and (sortresult[3]+1=5) and (sortresult[4]+1=6)) then
   result:=true;
end;


function TForm1.isLstreet : boolean;
var i,j,k : integer;
begin
 result:=false;
 for i:=0 to 4 do
  sortresult[i]:=DiceResult[i];
 for i:= 0 to 4 do
  for j:= i+1 to 4 do
   begin
    if(sortresult[i] > sortresult[j]) then
     begin
      k:=sortresult[j];
      sortresult[j]:=sortresult[i];
      sortresult[i]:=k;
     end
    else
     if(sortresult[i] = sortresult[j]) then
      sortresult[j]:=7;
   end;
 if((sortresult[0]+1=1) and (sortresult[1]+1=2) and (sortresult[2]+1=3) and (sortresult[3]+1=4)) or
   ((sortresult[1]+1=1) and (sortresult[2]+1=2) and (sortresult[3]+1=3) and (sortresult[4]+1=4)) then
  result:=true
 else
  begin
   if ((sortresult[0]+1=2) and (sortresult[1]+1=3) and (sortresult[2]+1=4) and (sortresult[3]+1=5)) or
      ((sortresult[1]+1=2) and (sortresult[2]+1=3) and (sortresult[3]+1=4) and (sortresult[4]+1=5)) then
    result:=true
   else
    if ((sortresult[0]+1=3) and (sortresult[1]+1=4) and (sortresult[2]+1=5) and (sortresult[3]+1=6)) or
       ((sortresult[1]+1=3) and (sortresult[2]+1=4) and (sortresult[3]+1=5) and (sortresult[4]+1=6)) then
     result:=true;
  end;
end;


function TForm1.isFhouse : boolean;
var i,j,k : integer;
begin
 result:=false;
 for i:=0 to 4 do
  sortresult[i]:=DiceResult[i];
 for i:= 0 to 4 do
  for j:= i+1 to 4 do
   if(sortresult[i] > sortresult[j]) then
    begin
     k:=sortresult[j];
     sortresult[j]:=sortresult[i];
     sortresult[i]:=k;
    end;
 if(((sortresult[0]=sortresult[1]) and (sortresult[0]=sortresult[2])) and ((sortresult[3]=sortresult[4]))) then
  result:=true
 else
  if(((sortresult[0]=sortresult[1])) and ((sortresult[2]=sortresult[3]) and (sortresult[2]=sortresult[4]))) then
   result:=true;
end;

procedure TForm1.LTCPComponent1Accept(aSocket: TLSocket);
begin
 if(checkbox1.checked = true) then
  client:=aSocket;
 ServerConnected:=true;
end;


procedure TForm1.LTCPComponent1Error(const msg: string; aSocket: TLSocket);
begin
 messagedlgpos(msg,mtError,[mbOk],0,round(left+(width/2)),top+100);
end;


procedure TForm1.LTCPComponent1Receive(aSocket: TLSocket);
var asource, amsg : string;
    str_array     : array of string;
    Txtfile       : Tstringlist;
    i,j           : integer;
begin
 amsg:='';
 statictext2.Caption:='';
 aSocket.GetMessage(amsg);
 if(ShowMsg = true) then
  begin
   if(checkbox1.Checked = true) then
    statictext2.Caption:='Client ('+client.PeerAddress+') send: '+amsg
   else
    statictext2.Caption:='Server send: '+amsg;
  end;
 if(amsg = 'Bye') then
  begin
   LTCPComponent1.Disconnect(true);
   //alles nach disconnect
  end;
 if(amsg = 'Load refused') then
  begin
   messagedlgpos(srvdialogLG2 ,mtInformation,[mbOk],
                   0,round(left+(width/2)),top+100);
   gamestarted:=false;
  end;
 if(amsg = 'New refused') then
  begin
   messagedlgpos(srvdialogNG2,mtInformation,[mbOk],
                   0,round(left+(width/2)),top+100);
   gamestarted:=false;
  end;
 if(Pos('Pmessage:',amsg) > 0) then
  begin
   amsg:=copy(amsg,10,length(amsg));
   statictext2.Caption:=statictext2.Caption+SlineBreak+
                        PmessageStr+amsg;
   playsound1.SoundFile:=user_path+DirectorySeparator+'message.wav';
   playsound1.Execute;
   exit;
  end;
 if(pos('Score:',amsg) > 0) then
  begin
   amsg:=copy(amsg,7,length(amsg));
   score_Player2:=strtoint(amsg);
   if(client <> Nil) then
    begin
     Panel2.Visible:=true;
     if(score_Player1 < score_Player2) then
      image2.ImageIndex:=37;
     Statictext3.Caption:='Total: '+inttostr(score_Player1);
     Panel3.Visible:=true;
     if(score_Player2 < score_Player1) then
      image3.ImageIndex:=37;
     Statictext5.Caption:='Total: '+inttostr(score_Player2);
     speedbutton16.Visible:=false;
     gameStarted:=false;
    end;
  end;
 if(pos('DiceRoll:',amsg) > 0) then
  begin
   amsg:=copy(amsg,10,length(amsg));
   str_array:=amsg.split(':');
   RollDicesNet(strtoint(str_array[0]),strtoint(str_array[1]),strtoint(str_array[2]),
                        strtoint(str_array[3]),strtoint(str_array[4]));
  end;
 if(Pos('Values:',amsg) > 0) then
  begin
   if(HostMove = true) then
    begin
     HostMove:=false;
     BCSVGViewer6.Enabled:=true;
    end
   else
    HostMove:=true;
   isPlayer1:=true;
   amsg:=copy(amsg,8,length(amsg));
   str_array:=amsg.split(':');
   GameField.cells[strtoint(str_array[0]),strtoint(str_array[1])]:=str_array[2];
   if(length(str_array) > 3) then
    begin
     if(GameField.cells[strtoint(str_array[0]),7]='-') then
      begin
       GameField.cells[strtoint(str_array[0]),7]:=str_array[3];
       GameField.cells[strtoint(str_array[0]),8]:=str_array[4];
      end
     else
      GameField.cells[strtoint(str_array[0]),16]:=str_array[3];
    end;
   if(length(str_array) > 5) then
    GameField.cells[strtoint(str_array[0]),16]:=str_array[5];
   GameField:=stringgrid1;
   DividerBevel1.Font.Color:=clWhite;
   DividerBevel2.Font.Color:=clgray;
   speedbutton11.ImageIndex:=26;
   statictext2.Caption:=statictext2.Caption+SlineBreak+
                        srvdialogRsv1+str_array[0]+srvdialogRsv2+str_array[1]+srvdialogRsv3+str_array[2];
  end;
 if(pos('game.ini:',amsg) > 0) then
  begin
   if(not directoryexists(user_path+DirectorySeparator+'Net')) then
    if (not createdir(user_path+DirectorySeparator+'Net')) then
     begin
      messagedlgpos(cantCreateDir1+user_path+DirectorySeparator+
                    'Net'+cantCreateDir2 +slineBreak+endProgram,
                    mtError,[mbOk],0,round(left+(width/2)),top+100);
      close;
     end;
   amsg:=copy(amsg,10,length(amsg));
   str_array:=amsg.split('|');
   Txtfile:=Tstringlist.create;
   for i:=0 to length(str_array)-1  do
    Txtfile.Add(str_array[i]);
   Txtfile.SaveToFile(user_path+DirectorySeparator+'Net'+DirectorySeparator+'game.ini');
   Txtfile.free;
  end;
 if(pos('gamefield1.csv:',amsg) > 0) then
  begin
   amsg:=copy(amsg,16,length(amsg));
   str_array:=amsg.split('|');
   Txtfile:=Tstringlist.create;
   for i:=0 to length(str_array)-1  do
    Txtfile.Add(str_array[i]);
   Txtfile.SaveToFile(user_path+DirectorySeparator+'Net'+DirectorySeparator+'gamefield2.csv');
   Txtfile.free;
  end;
 if(pos('gamefield2.csv:',amsg) > 0) then
  begin
   amsg:=copy(amsg,16,length(amsg));
   str_array:=amsg.split('|');
   Txtfile:=Tstringlist.create;
   for i:=0 to length(str_array)-1  do
    Txtfile.Add(str_array[i]);
   Txtfile.SaveToFile(user_path+DirectorySeparator+'Net'+DirectorySeparator+'gamefield1.csv');
   Txtfile.free;
   if(messagedlgpos(srvdialogLG1,mtConfirmation,[mbYes,mbNo],
                    0,round(left+(width/2)),top+100) = mrYes) then
    loadgame('Net')
   else
    sendvalues('Load refused');
  end;
 if(pos('startNew',amsg) > 0) and (client = Nil) then
  if(messagedlgpos(srvdialogNG1,mtConfirmation,[mbYes,mbNo],
                   0,round(left+(width/2)),top+100) = mrYes) then
  begin
   BCSVGViewer6.Enabled:=false;
   gameStarted:=true;
   for i:=1 to 5 do
    for j:=1 to 16 do
     begin
      stringgrid1.Cells[i,j]:='-';
      stringgrid2.Cells[i,j]:='-';
     end;
   for i:=0 to 4 do
    begin
     DiceResult[i]:=0;
     SortResult[i]:=0;
     UndoResult[i]:=0;
    end;
   isPlayer1:=true;
   GameField:=stringgrid2;
   DividerBevel1.Font.color:=clMedGray;
   DividerBevel2.Font.color:=clWhite;
   DiceRoll:=0;
   canUndo:=false;
   isWritten:=false;
   HostMove:=true;
   SpeedButton1.Enabled:=false;
   SpeedButton10.Enabled:=false;
   speedButton5.Enabled:=true;
   speedButton6.Enabled:=true;
   SpeedButton7.Enabled:=false;
   SpeedButton8.Enabled:=false;
   speedButton5.Down:=true;
   BCSVGViewer1.top:=16;
   BCSVGViewer2.top:=16;
   BCSVGViewer3.top:=16;
   BCSVGViewer4.top:=16;
   BCSVGViewer5.top:=16;
   BCSVGViewer1.svgstring:=Dices[5];
   BCSVGViewer2.svgstring:=Dices[5];
   BCSVGViewer3.svgstring:=Dices[5];
   BCSVGViewer4.svgstring:=Dices[5];
   BCSVGViewer5.svgstring:=Dices[5];
   DiceRoll1.Visible:=true;
   DiceRoll2.Visible:=true;
   DiceRoll3.Visible:=true;
   score_Player1:=0;
   score_Player2:=0;
   panel2.Visible:=false;
   panel3.Visible:=false;
  end
 else
  sendvalues('New refused');
end;


procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
 if(isWritten = false) then
  messagedlgpos(isNotWrittenstr,mtError,[mbOk],0,round(left+(width/2)),top+100)
 else
  begin
   if(onePlayer = false) then
    begin
     if(isPlayer1 = true) then
      begin
       isPlayer1:=false;
       DividerBevel1.Font.Color:=clGray;
       DividerBevel2.Font.Color:=clWhite;
       GameField:=stringgrid2;
      end
     else
      begin
       isPlayer1:=true;
       DividerBevel1.Font.Color:=clWhite;
       DividerBevel2.Font.Color:=clGray;
       GameField:=stringgrid1;
      end;
     speedbutton1.Enabled:=false;
     speedbutton10.Enabled:=false;
    end;
   if(ServerConnected = true) then
    begin
     sendValues(valueStr);
     if(score_Player1 > 0) then
      sendvalues('Score:'+inttostr(score_Player1))
    end;
  end;
end;


procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
 Form3.edit1.text:='';
 if(Form3.ShowModal = mrOk) then
  begin
   if(ServerConnected = true) then
    sendValues('Pmessage:'+Form3.edit1.text);
  end;
end;


procedure TForm1.SpeedButton12Click(Sender: TObject);
var HF_ini : Tinifile;
begin
 HF_ini:=Tinifile.create(user_path+DirectorySeparator+'HighFive.ini');
 HF_ini.WriteString('Options','Lang','de');
 HF_ini.free;
 SetDefaultLang('de');
end;


procedure TForm1.SpeedButton13Click(Sender: TObject);
var HF_ini : Tinifile;
begin
 HF_ini:=Tinifile.create(user_path+DirectorySeparator+'HighFive.ini');
 HF_ini.WriteString('Options','Lang','en');
 HF_ini.free;
 SetDefaultLang('en');
end;


procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
 Form4.ShowModal;
end;


procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
 Form5.Edit1.Text:='';
 Form5.Image1.Visible:=false;
 Form5.Image2.Visible:=false;
 Form5.Image3.Visible:=false;
 Form5.Image4.Visible:=false;
 if((Sender as TSpeedbutton).name = 'SpeedButton15') then
  Form5.write_str:=inttostr(form1.score_Player1)
 else
  Form5.write_str:=inttostr(form1.score_Player2);
 Form5.ShowModal;
 Form5.Image1.Visible:=true;
 Form5.Image2.Visible:=true;
 Form5.Image3.Visible:=true;
 Form5.Image4.Visible:=true;
 if((Sender as TSpeedbutton).name = 'SpeedButton15') then
  speedbutton15.Visible:=false
 else
  speedbutton16.Visible:=false;
end;


procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
 Form5.Label1.Visible:=false;
 Form5.Edit1.Visible:=false;
 Form5.ShowModal;
 Form5.Label1.Visible:=true;
 Form5.Edit1.Visible:=true;
end;


procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
 Form6.Edit1.text:=LTCPComponent1.Host;
 Form6.Edit2.text:=inttostr(LTCPComponent1.Port);
 Form6.Edit3.text:=inttostr(DiceDelay);
 Form6.Edit4.text:=inttostr(SrvDelay);
 Form6.checkbox1.Checked:=showMsg;
 Form6.CheckBox2.Checked:=SndOn;
 if(Form6.ShowModal = mrOk) then
  begin
   LTCPComponent1.Host:=Form6.Edit1.text;
   LTCPComponent1.Port:=strtoint(Form6.Edit2.text);
   DiceDelay:=strtoint(Form6.Edit3.text);
   SrvDelay:=strtoint(Form6.Edit4.text);
   ShowMsg:=Form6.checkbox1.Checked;
   SndOn:=Form6.checkbox2.Checked;
  end;
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
var i : integer;
begin
 if(canUndo = true) then
  if(messagedlgpos(UndoLastEntryStr,mtConfirmation,[mbYes,mbNo],0,round(left+(width/2)),top+100) = mrYes) then
   begin
    canUndo:=false;
    GameField.SaveOptions:=[soContent];
    GameField.LoadFromCSVFile(user_path+DirectorySeparator+'gamefield.csv');
    DiceRoll:=UndoResult[5];
    for i:=0 to 4 do
     begin
      DiceResult[i]:=UndoResult[i];
      SortResult[i]:=UndoResult[i];
      isWritten:=false;
     end;
    diceroll1.visible:=false;
    diceroll2.visible:=false;
    diceroll3.visible:=false;
    if(DiceRoll = 1) then
     diceroll2.visible:=true;
    if(DiceRoll = 2) then
     diceroll3.visible:=true;
   end;
end;


procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j : integer;
    startNew : boolean;
begin
 startNew:=false;
 if(Sender = nil) then
  startNew:=true
 else
  if(messagedlgpos(newGameStr1,mtConfirmation,[mbYes,mbNo],0,
    round(left+(width/2)),top+100) = mrYes) then
   startNew:=true;
 if(startNew = true) then
  begin
   gameStarted:=true;
   for i:=1 to 5 do
    for j:=1 to 16 do
     begin
      stringgrid1.Cells[i,j]:='-';
      stringgrid2.Cells[i,j]:='-';
     end;
   for i:=0 to 4 do
    begin
     DiceResult[i]:=0;
     SortResult[i]:=0;
     UndoResult[i]:=0;
    end;
   isPlayer1:=true;
   GameField:=stringgrid1;
   if(ServerConnected = true) and (client = nil) then
    begin
     isPlayer1:=false;
     GameField:=stringgrid2;
     DividerBevel1.Font.color:=clMedGray;
     DividerBevel2.Font.color:=clWhite;
    end;
   DiceRoll:=0;
   canUndo:=false;
   isWritten:=false;
   HostMove:=true;
   SpeedButton1.Enabled:=false;
   SpeedButton10.Enabled:=false;
   speedButton5.Enabled:=true;
   speedButton6.Enabled:=true;
   SpeedButton7.Enabled:=false;
   SpeedButton8.Enabled:=false;
   speedButton5.Down:=true;
   BCSVGViewer1.top:=16;
   BCSVGViewer2.top:=16;
   BCSVGViewer3.top:=16;
   BCSVGViewer4.top:=16;
   BCSVGViewer5.top:=16;
   BCSVGViewer1.svgstring:=Dices[5];
   BCSVGViewer2.svgstring:=Dices[5];
   BCSVGViewer3.svgstring:=Dices[5];
   BCSVGViewer4.svgstring:=Dices[5];
   BCSVGViewer5.svgstring:=Dices[5];
   DiceRoll1.Visible:=true;
   DiceRoll2.Visible:=true;
   DiceRoll3.Visible:=true;
   score_Player1:=0;
   score_Player2:=0;
   panel2.Visible:=false;
   panel3.Visible:=false;
   if(ServerConnected = true) and (client <> nil) then
    begin
     sendValues('startNew');
    end;
  end;
end;


procedure TForm1.loadgame(game_name : string);
var i,j      : integer;
    GF_ini   : Tinifile;
    s1,s2,s3 : string;
    NetGame  : boolean;
    Txtfile  : Tstringlist;
    Txtline  : string;
begin
 GF_ini:=Tinifile.create(user_path+DirectorySeparator+game_name+DirectorySeparator+'game.ini');
 NetGame:=GF_ini.readBool('Options','NetGame',false);
 gameStarted:=true;
 if((NetGame = true) and (ServerConnected = true) and (client <> nil)) or
    (NetGame = false) or (game_name = 'Net') then
  begin
   DiceRoll:=GF_ini.readInteger('Options','DRoll',0);
   onePlayer:=GF_ini.readBool('Options','oPlayer',true);
   isPlayer1:=GF_ini.readBool('Options','iPlayer1',true);
   isWritten:=GF_ini.readBool('Options','iWritten',true);
   canUndo:=GF_ini.readBool('Options','cUndo',false);
   s1:=GF_ini.readString('Options','UResult','0:0:0:0:0');
   s2:=GF_ini.readString('Options','DResult','0:0:0:0');
   s3:=GF_ini.readString('Options','SResult','0:0:0:0');
   j:=1;
   for i:=0 to 4 do
    begin
     UndoResult[i]:=strtoint(s1[j]);
     DiceResult[i]:=strtoint(s2[j]);
     SortResult[i]:=strtoint(s3[j]);
     inc(j,2);
    end;
   UndoResult[5]:=strtoint(s1[9]);
   DiceRoll1.visible:=GF_ini.ReadBool('Images','i1',true);
   DiceRoll2.visible:=GF_ini.ReadBool('Images','i2',true);
   DiceRoll3.visible:=GF_ini.ReadBool('Images','i3',true);
   SpeedButton10.enabled:=GF_ini.ReadBool('Images','i9',false);
   SpeedButton1.enabled:=GF_ini.ReadBool('Images','i10',false);
   SpeedButton5.down:=GF_ini.ReadBool('Images','i11',true);
   SpeedButton6.down:=GF_ini.ReadBool('Images','i12',false);
   GF_ini.free;
   stringgrid1.SaveOptions:=[soContent];
   stringgrid1.LoadFromCSVFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield1.csv');
   stringgrid2.SaveOptions:=[soContent];
   stringgrid2.LoadFromCSVFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield2.csv');
   BCSVGViewer1.SVGString:=Dices[DiceResult[0]];
   BCSVGViewer2.SVGString:=Dices[DiceResult[1]];
   BCSVGViewer3.SVGString:=Dices[DiceResult[2]];
   BCSVGViewer4.SVGString:=Dices[DiceResult[3]];
   BCSVGViewer5.SVGString:=Dices[DiceResult[4]];
   if(ServerConnected = true) and (game_name <> 'Net') then
    begin
     Txtfile:=Tstringlist.create;
     Txtfile.LoadFromFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'game.ini');
     Txtline:='game.ini:';
     for i:=0 to Txtfile.Count-1 do
      Txtline:=Txtline+Txtfile[i]+'|';
     sendValues(Txtline);
     Txtfile.Clear;
     Txtline:='gamefield1.csv:';
     Txtfile.LoadFromFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield1.csv');
     for i:=0 to Txtfile.Count-1 do
      Txtline:=Txtline+Txtfile[i]+'|';
     sendValues(Txtline);
     Txtfile.Clear;
     Txtline:='gamefield2.csv:';
     Txtfile.LoadFromFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield2.csv');
     for i:=0 to Txtfile.Count-1 do
      Txtline:=Txtline+Txtfile[i]+'|';
     sendValues(Txtline);
     Txtfile.free;
    end;
  end
 else
  begin
   GF_ini.free;
   messagedlgpos(netGameStr1,mtInformation,
                 [mbOk],0,round(left+(width/2)),top+100);
  end;
end;


procedure TForm1.savegame(game_name : string);
var i        : integer;
    GF_ini   : Tinifile;
    s1,s2,s3 : string;
begin
 if(directoryExists(user_path+DirectorySeparator+game_name)) then
  if(messagedlgpos(overrideStr1,mtConfirmation,
     [mbYes,mbNo],0,round(left+(width/2)),top+100) = mrYes) then
   deleteDirectory(user_path+DirectorySeparator+game_name,false)
  else
   exit;
 showmessage(user_path+DirectorySeparator+game_name);
 if(createDir(user_path+DirectorySeparator+game_name)) then
  begin
   GF_ini:=Tinifile.create(user_path+DirectorySeparator+game_name+DirectorySeparator+'game.ini');
   GF_ini.WriteInteger('Options','DRoll',DiceRoll);
   GF_ini.WriteBool('Options','oPlayer',onePlayer);
   GF_ini.WriteBool('Options','iPlayer1',isPlayer1);
   GF_ini.WriteBool('Options','iWritten',isWritten);
   GF_ini.WriteBool('Options','cUndo',canUndo);
   GF_ini.Writebool('Options','NetGame',ServerConnected);
   s1:='';s2:='';s3:='';
   for i:=0 to 5 do
    if(i < 5) then
     begin
      s1:=s1+':'+inttostr(UndoResult[i]);
      s2:=s2+':'+inttostr(DiceResult[i]);
      s3:=s3+':'+inttostr(SortResult[i]);
     end
    else
     s1:=s1+':'+inttostr(UndoResult[i]);
   GF_ini.WriteString('Options','UResult',copy(s1,2,length(s1)));
   GF_ini.WriteString('Options','DResult',copy(s2,2,length(s2)));
   GF_ini.WriteString('Options','SResult',copy(s3,2,length(s3)));
   GF_ini.WriteBool('Images','i1',DiceRoll1.visible);
   GF_ini.WriteBool('Images','i2',DiceRoll2.visible);
   GF_ini.WriteBool('Images','i3',DiceRoll3.visible);
   GF_ini.WriteBool('Images','i9',SpeedButton10.enabled);
   GF_ini.WriteBool('Images','i10',SpeedButton1.enabled);
   GF_ini.WriteBool('Images','i11',SpeedButton5.down);
   GF_ini.WriteBool('Images','i12',SpeedButton6.down);
   if(ServerConnected = true) then
    begin
     GF_ini.WriteBool('Net','Hmove',HostMove);
    end;
   GF_ini.free;
   stringgrid1.SaveOptions:=[soContent];
   stringgrid1.SaveToCSVFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield1.csv');
   stringgrid2.SaveOptions:=[soContent];
   stringgrid2.SaveToCSVFile(user_path+DirectorySeparator+game_name+DirectorySeparator+'gamefield2.csv');
  end
 else
  messageDlgPos(saveGameStr1+'"'+game_name+'"!',mtError,[mbOk],0,round(left+(width/2)),top+100);
end;


procedure TForm1.SpeedButton3Click(Sender: TObject);
var i       : integer;
    DirList : TstringList;
    gametype,
    gname   : string;
begin
 if(ServerConnected = true) and (Client = nil) then
  begin
   messagedlgpos(saveGameStr2,mtInformation,
                 [mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 gametype:='';
 Form2.image2.ImageIndex:=32;
 Form2.image3.ImageIndex:=29;
 Form2.image1.ImageIndex:=13;
 if(onePlayer = false) then
  begin
   if(not directoryExists(user_path+DirectorySeparator+'TwoPlayer')) then
    if(not createdir(user_path+DirectorySeparator+'TwoPlayer')) then
     begin
      messagedlgpos(cantCreateDir1+user_path+DirectorySeparator+'TwoPlayer'+cantCreateDir2,mtError,
                 [mbOk],0,round(left+(width/2)),top+100);
      exit;
     end;
   gametype:=DirectorySeparator+'TwoPlayer';
   Form2.image1.ImageIndex:=19;
   Form2.image3.ImageIndex:=29;
   Form2.image2.ImageIndex:=14;
  end;
 if(serverConnected = true) then
  begin
   if(not directoryExists(user_path+DirectorySeparator+'NetGames')) then
    if(not createdir(user_path+DirectorySeparator+'NetGames')) then
     begin
      messagedlgpos(cantCreateDir1+user_path+DirectorySeparator+'NetGames'+cantCreateDir2,mtError,
                 [mbOk],0,round(left+(width/2)),top+100);
      exit;
     end;
   gametype:=DirectorySeparator+'NetGames';
   Form2.image1.ImageIndex:=19;
   Form2.image2.ImageIndex:=32;
   Form2.image3.ImageIndex:=16;
  end;
 DirList:=FindAllDirectories(user_Path+gametype, false);
 Form2.ListBox1.Items.Assign(DirList);
 DirList.Free;
 for i:=Form2.Listbox1.Count-1 downto 0 do
  begin
   Form2.Listbox1.Items[i]:=copy(Form2.Listbox1.Items[i],rpos(DirectorySeparator,Form2.Listbox1.Items[i])+1,
                                 length(Form2.Listbox1.Items[i]));
   if(Form2.ListBox1.Items[i] = 'Net') or (Form2.ListBox1.Items[i] = 'NetGames') or
      (Form2.ListBox1.Items[i] = 'TwoPlayer') then
    Form2.ListBox1.Items.Delete(i);
  end;
 Form2.Caption:=svdlgCaption1;
 if(Form2.showModal = mrOK) and (Form2.Edit1.Text > '') then
  begin
   if(gametype > '') then
    gametype:=copy(gametype,2,length(gametype))+DirectorySeparator;
   gname:=Form2.Edit1.Text;
   for i:=1 to length(gname) do
    begin
     if(gname[i] = ' ') then gname[i]:='_'
     else
     if(not (gname[i] in ['a'..'z','A'..'Z','0'..'9'])) then gname[i]:='_';
    end;
   savegame(gametype+gname);
  end;
 Form2.Edit1.Text:='';
end;


procedure TForm1.SpeedButton4Click(Sender: TObject);
var i       : integer;
    DirList : TstringList;
    gametype: string;
begin
 if(ServerConnected = true) and (Client = nil) then
  begin
   messagedlgpos(saveGameStr2,mtInformation,
                 [mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 gametype:='';
 Form2.image2.ImageIndex:=32;
 Form2.image3.ImageIndex:=29;
 Form2.image1.ImageIndex:=13;
 if(onePlayer = false) then
  begin
   gametype:=DirectorySeparator+'TwoPlayer';
   Form2.image1.ImageIndex:=19;
   Form2.image3.ImageIndex:=29;
   Form2.image2.ImageIndex:=14;
  end;
 if(serverConnected = true) then
  begin
   gametype:=DirectorySeparator+'NetGames';
   Form2.image1.ImageIndex:=19;
   Form2.image2.ImageIndex:=32;
   Form2.image3.ImageIndex:=16;
  end;
 DirList:=FindAllDirectories(Form1.user_Path+gametype, false);
 Form2.ListBox1.Items.Assign(DirList);
 DirList.Free;
 for i:=Form2.Listbox1.Count-1 downto 0 do
  begin
   Form2.Listbox1.Items[i]:=copy(Form2.Listbox1.Items[i],rpos(DirectorySeparator,Form2.Listbox1.Items[i])+1,
                                 length(Form2.Listbox1.Items[i]));
   if(Form2.ListBox1.Items[i] = 'Net') or (Form2.ListBox1.Items[i] = 'NetGames') or
     (Form2.ListBox1.Items[i] = 'TwoPlayer') then
    Form2.ListBox1.Items.Delete(i);
  end;
 Form2.Edit1.ReadOnly:=true;
 Form2.BitBtn1.Caption:=loadGameStr1;
 Form2.Caption:=svdlgCaption2;
 Form2.label2.caption:=loadGameStr3;
 if(Form2.showModal = mrOK) and (Form2.Edit1.Text > '') then
  begin
   if(gametype > '') then
    gametype:=copy(gametype,2,length(gametype))+DirectorySeparator;
   if(fileexists(user_path+DirectorySeparator+gametype+Form2.Edit1.Text+DirectorySeparator+'game.ini') and
      fileexists(user_path+DirectorySeparator+gametype+Form2.Edit1.Text+DirectorySeparator+'gamefield1.csv') and
      fileexists(user_path+DirectorySeparator+gametype+Form2.Edit1.Text+DirectorySeparator+'gamefield2.csv')) then
    begin
     loadgame(gametype+Form2.Edit1.Text);
     panel2.Visible:=false;
     panel3.Visible:=false;
    end
   else
    messageDlgPos(loadGameStr2+'"'+Form2.Edit1.Text+'"!',mtError,[mbOk],0,round(left+(width/2)),top+100);
  end;
 Form2.label2.caption:=saveGameStr4;
 Form2.Edit1.Text:='';
 Form2.Edit1.ReadOnly:=false;
 Form2.BitBtn1.Caption:=saveGameStr3;
end;


procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
 onePlayer:=true;
 stringgrid2.Enabled:=false;
 SpeedButton7.Enabled:=false;
 SpeedButton8.Enabled:=false;
 SpeedButton9.visible:=false;
 edit1.Visible:=false;
 checkbox1.Visible:=false;
end;


procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
 onePlayer:=false;
 stringgrid2.Enabled:=true;
 SpeedButton7.Enabled:=true;
 SpeedButton8.Enabled:=true;
end;


procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 SpeedButton9.visible:=false;
 edit1.Visible:=false;
 checkbox1.Visible:=false;
end;


procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
 SpeedButton9.visible:=true;
 edit1.Visible:=true;
 checkbox1.Visible:=true;
end;


procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
 ServerConnected:=LTCPComponent1.Connected;
 if(ServerConnected = false) then
  begin
   if(checkbox1.checked = true) then
    begin
     LTCPComponent1.Host:=edit1.Text;
     ServerConnected := LTCPComponent1.Listen(LTCPComponent1.port);
     if (ServerConnected = true) then
      begin
       messagedlgpos(serverStart1,mtInformation,[mbOk],0,
                      round(left+(width/2)),top+100);
       checkbox1.Visible:=false;
       edit1.visible:=false;
       speedbutton9.ImageIndex:=22;
       speedbutton9.hint:=serverStopped3;
       speedbutton11.visible:=true;
       speedbutton11.ImageIndex:=26;
       statictext2.Visible:=true;
      end
     else
      messagedlgpos(serverStart2,mtError,[mbOk],0,
                     round(left+(width/2)),top+100);
    end
   else
    begin
     LTCPComponent1.Host:=edit1.Text;
     ServerConnected := LTCPComponent1.Connect(LTCPComponent1.Host, LTCPComponent1.port);
     if (ServerConnected = true) then
      begin
       messagedlgpos(serverStart3,mtInformation,[mbOk],0,
                      round(left+(width/2)),top+100);
       checkbox1.Visible:=false;
       edit1.visible:=false;
       speedbutton9.ImageIndex:=22;
       speedbutton9.hint:=serverStopped3;
       speedbutton11.visible:=true;
       speedbutton11.ImageIndex:=27;
       statictext2.Visible:=true;
       speedbutton2click(nil);
      end
     else
      messagedlgpos(serverStopped4,mtError,[mbOk],0,
                     round(left+(width/2)),top+100);
    end;
  end
 else
  begin
   if(checkbox1.checked = true) then
    begin
     SendValues('bye');
     sleep(SrvDelay); //1000
     LTCPComponent1.Disconnect(True);
     ServerConnected:=false;
     checkbox1.Visible:=true;
     edit1.visible:=true;
     client:=nil;
     speedbutton9.ImageIndex:=24;
     speedbutton9.hint:=serverStart4;
     speedbutton11.visible:=false;
     statictext2.Visible:=false;
     messagedlgpos(serverStart5,mtInformation,[mbOk],0,
                      round(left+(width/2)),top+100);
    end
   else
    begin
     SendValues('bye');
     sleep(SrvDelay); //1000
     LTCPComponent1.Disconnect(True);
     ServerConnected:=false;
     checkbox1.Visible:=true;
     edit1.visible:=true;
     speedbutton9.ImageIndex:=24;
     speedbutton9.hint:=serverStart4;
     speedbutton11.visible:=false;
     statictext2.Visible:=false;
     messagedlgpos(serverStopped5,mtInformation,[mbOk],0,
                      round(left+(width/2)),top+100);
    end;
  end;
end;


procedure TForm1.StringGrid1Click(Sender: TObject);
begin
 if((diceroll > 0) and (isWritten = false)) then
  begin
   if(isPlayer1 = true) then
    begin
     GameField:=StringGrid1;
     if(Sender as TstringGrid).name <> 'StringGrid1' then
      exit;
    end
   else
    begin
     GameField:=StringGrid2;
     if(Sender as TstringGrid).name <> 'StringGrid2' then
      exit;
    end;
   if(not ((GameField.row > 0) and (GameField.row < 7)) and
     (not ((GameField.row > 8) and (GameField.row < 16)))) then
    exit;
   if(GameField.Cells[GameField.Col,GameField.row] <> '-') then
    begin
     messagedlgpos(allreadyUsedstr,mtError,[mbOK],0,round(left+(width/2)),top+100);
     exit;
    end;
   GameField.SaveOptions:=[soContent];
   GameField.SaveToCSVFile(user_path+DirectorySeparator+'gamefield.csv');
   case GameField.Col of
    1 : checkWriteDown(GameField.Row);
    2 : checkWriteUp(GameField.Row);
    3 : checkWriteTopFirst(GameField.Row);
    4 : checkWriteBottomFirst(GameField.Row);
    5 : checkwriteFree(GameField.Row);
   end;
   if(isAllWritten = true) then
    begin
     countTotal;
     if(serverConnected = false) then
      begin
       if(isPlayer1 = false) then
        begin
         Panel2.Visible:=true;
         if(score_Player1 < score_Player2) then
          image2.ImageIndex:=37;
         Statictext3.Caption:='Total: '+inttostr(score_Player1);
         Panel3.Visible:=true;
         if(score_Player2 < score_Player1) then
          image3.ImageIndex:=37;
         Statictext5.Caption:='Total: '+inttostr(score_Player2);
         SpeedButton16.Visible:=true;
         gameStarted:=false;
        end
       else
        if(onePlayer = true) then
         begin
          Panel2.Visible:=true;
          Statictext3.Caption:='Total: '+inttostr(score_Player1);
          gameStarted:=false;
         end;
      end;
    end;
  end;
end;


procedure TForm1.RowCase(col,row : integer);
var i,j : integer;
begin
 case row of
    1 : begin
         j:=0;
         for i:=0 to 4 do
          if(DiceResult[i]+1=1) then
           j:=j+1;
         GameField.Cells[col,1]:=inttostr(j);
         isWritten:=true;
        end;
    2 : begin
         j:=0;
         for i:=0 to 4 do
          if(DiceResult[i]+1=2) then
           j:=j+2;
         GameField.Cells[col,2]:=inttostr(j);
         isWritten:=true;
        end;
    3 : begin
         j:=0;
         for i:=0 to 4 do
          if(DiceResult[i]+1=3) then
           j:=j+3;
         GameField.Cells[col,3]:=inttostr(j);
         isWritten:=true;
        end;
    4 : begin
         j:=0;
         for i:=0 to 4 do
          if(DiceResult[i]+1=4) then
           j:=j+4;
         GameField.Cells[col,4]:=inttostr(j);
         isWritten:=true;
        end;
    5 : begin
         j:=0;
         for i:=0 to 4 do
          if(DiceResult[i]+1=5) then
           j:=j+5;
         GameField.Cells[col,5]:=inttostr(j);
         isWritten:=true;
        end;
    6 : begin
          j:=0;
          for i:=0 to 4 do
           if(DiceResult[i]+1=6) then
            j:=j+6;
         GameField.Cells[col,6]:=inttostr(j);
         isWritten:=true;
         end;
    9 : if(isThree) then
          begin
           GameField.Cells[col,9]:=inttostr(countDiceResult);
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr1,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,9]:='0';
            isWritten:=true;
           end;
    10 : if(isFour) then
          begin
           GameField.Cells[col,10]:=inttostr(countDiceResult);
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr2,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,10]:='0';
            isWritten:=true;
           end;
    11 : if(isLstreet) then
          begin
           GameField.Cells[col,11]:='30';
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr3,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,11]:='0';
            isWritten:=true;
           end;
    12 : if(isGstreet) then
          begin
           GameField.Cells[col,12]:='40';
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr4,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,12]:='0';
            isWritten:=true;
           end;
    13 : if(isFHouse) then
          begin
           GameField.Cells[col,13]:='25';
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr5,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,13]:='0';
            isWritten:=true;
           end;
    14 : if(isFive) then
          begin
           playsound1.SoundFile:=user_path+DirectorySeparator+'victory.wav';
           playsound1.Execute;
           GameField.Cells[col,14]:='50';
           isWritten:=true;
          end
         else
          if(messagedlgpos(strikeStr6,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
           begin
            playsound1.SoundFile:=user_path+DirectorySeparator+'laugh.wav';
            playsound1.Execute;
            GameField.Cells[col,14]:='0';
            isWritten:=true;
           end;
    15 : if(messagedlgpos(strikeStr7,mtConfirmation,[mbYes,mbNo],0,
                          round(left+(width/2)),top+100) = mrYes) then
          begin
           GameField.Cells[col,15]:=inttostr(countDiceResult);
           isWritten:=true;
          end;
   end;
 if(isWritten = true) and (ServerConnected = true) then
  begin
   valueStr:='Values:'+inttostr(col)+':'+inttostr(row)+':'+GameField.Cells[col,row];
  end;
end;


procedure TForm1.checkWriteDown(Row : integer);
var sum : integer;
begin
 if(row = 9) then
  begin
   if(GameField.Cells[1,6] = '-') then
    begin
     messagedlgpos(valGridStr1,
                    mtError,[mbOk],0,round(left+(width/2)),top+100);
     exit;
    end;
  end
 else
  if((row > 1) and (GameField.Cells[1,Row-1] = '-')) then
   begin
    messagedlgpos(valGridStr1 ,
                  mtError,[mbOk],0,round(left+(width/2)),top+100);
    exit;
   end;
 rowCase(1,row);
 if(isWritten = true) then
  begin
   if(row = 6) then
    begin
     sum:=strtoint(GameField.Cells[1,1])+strtoint(GameField.Cells[1,2])+strtoint(GameField.Cells[1,3])+
          strtoint(GameField.Cells[1,4])+strtoint(GameField.Cells[1,5])+strtoint(GameField.Cells[1,6]);
     if(sum > 62) then
      begin
       GameField.Cells[1,7]:='35';
       sum:=sum+35;;
      end
     else
      GameField.Cells[1,7]:='0';
     GameField.Cells[1,8]:=inttostr(sum);
     valueStr:=ValueStr+':'+GameField.Cells[1,7]+':'+GameField.Cells[1,8];
    end;
   if(row = 15) then
    begin
     sum:=strtoint(GameField.Cells[1,8])+strtoint(GameField.Cells[1,9])+strtoint(GameField.Cells[1,10])+
          strtoint(GameField.Cells[1,11])+strtoint(GameField.Cells[1,12])+strtoint(GameField.Cells[1,13])+
          strtoint(GameField.Cells[1,14])+strtoint(GameField.Cells[1,15]);
     GameField.Cells[1,16]:=inttostr(sum);
     valueStr:=ValueStr+':'+GameField.Cells[1,16];
    end;
   DiceReset;
  end;
end;


procedure TForm1.checkWriteUp(Row : integer);
var sum : integer;
begin
 if(row = 6) then
  begin
   if(GameField.Cells[2,9] = '-') then
    begin
     messagedlgpos(valGridStr2,
                   mtError,[mbOk],0,round(left+(width/2)),top+100);
     exit;
    end;
  end
 else
  if((row < 15) and (GameField.Cells[2,Row+1] = '-')) then
   begin
    messagedlgpos(valGridStr2,
                  mtError,[mbOk],0,round(left+(width/2)),top+100);
    exit;
   end;
 rowCase(2,row);
 if(isWritten = true) then
  begin
   if(row = 1) then
    begin
     sum:=strtoint(GameField.Cells[2,1])+strtoint(GameField.Cells[2,2])+strtoint(GameField.Cells[2,3])+
          strtoint(GameField.Cells[2,4])+strtoint(GameField.Cells[2,5])+strtoint(GameField.Cells[2,6]);
     if(sum > 62) then
      begin
       GameField.Cells[2,7]:='35';
       sum:=sum+35;;
      end
     else
      GameField.Cells[2,7]:='0';
     GameField.Cells[2,8]:=inttostr(sum);
     sum:=strtoint(GameField.Cells[2,8])+strtoint(GameField.Cells[2,9])+strtoint(GameField.Cells[2,10])+
          strtoint(GameField.Cells[2,11])+strtoint(GameField.Cells[2,12])+strtoint(GameField.Cells[2,13])+
          strtoint(GameField.Cells[2,14])+strtoint(GameField.Cells[2,15]);
     GameField.Cells[2,16]:=inttostr(sum);
     valueStr:=ValueStr+':'+GameField.Cells[2,7]+':'+GameField.Cells[2,8]+':'+GameField.Cells[2,16];
    end;
   DiceReset;
  end;
end;


procedure TForm1.checkWriteTopFirst(Row : integer);
var i,j,sum : integer;
    top_full : boolean;
begin
 top_full:=true;
 if(row > 8) then
  for i:=1 to 6 do
   if(GameField.Cells[3,i] = '-') then
     top_full:=false;
 if(top_full = false) then
  begin
   messagedlgpos(valGridStr3,
                  mtError,[mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 rowCase(3,row);
 if(isWritten = true) then
  begin
   if(row < 7) then
    if(GameField.Cells[3,8] = '-') then
     begin
      top_full:=true;
      for i:=1 to 6 do
       if(GameField.Cells[3,i] = '-') then
        top_full:=false;
      if(top_full = true) then
       begin
        sum:=strtoint(GameField.Cells[3,1])+strtoint(GameField.Cells[3,2])+strtoint(GameField.Cells[3,3])+
             strtoint(GameField.Cells[3,4])+strtoint(GameField.Cells[3,5])+strtoint(GameField.Cells[3,6]);
        if(sum > 62) then
         begin
          GameField.Cells[3,7]:='35';
          sum:=sum+35;;
         end
        else
         GameField.Cells[3,7]:='0';
        GameField.Cells[3,8]:=inttostr(sum);
        valueStr:=ValueStr+':'+GameField.Cells[3,7]+':'+GameField.Cells[3,8];
       end;
     end;
   if(row > 8) then
    begin
     top_full:=true;
     for i:=9 to 15 do
      begin
       if(GameField.Cells[3,i] = '-') then
        top_full:=false;
      end;
     if(top_full = true) then
      begin
       sum:=strtoint(GameField.Cells[3,8])+strtoint(GameField.Cells[3,9])+strtoint(GameField.Cells[3,10])+
            strtoint(GameField.Cells[3,11])+strtoint(GameField.Cells[3,12])+strtoint(GameField.Cells[3,13])+
            strtoint(GameField.Cells[3,14])+strtoint(GameField.Cells[3,15]);
       GameField.Cells[3,16]:=inttostr(sum);
       valueStr:=ValueStr+':'+GameField.Cells[3,16];
      end;
    end;
   DiceReset;
  end;
end;


procedure TForm1.checkWriteBottomFirst(Row : integer);
var i,j,sum : integer;
    bottom_full : boolean;
begin
 bottom_full:=true;
 if(row < 7) then
  for i:=9 to 15 do
   if(GameField.Cells[4,i] = '-') then
     bottom_full:=false;
 if(bottom_full = false) then
  begin
   messagedlgpos(valGridStr4,
                  mtError,[mbOk],0,round(left+(width/2)),top+100);
   exit;
  end;
 rowCase(4,row);
 if(isWritten = true) then
  begin
   if(row < 7) then
    if(GameField.Cells[4,8] = '-') then
     begin
      bottom_full:=true;
      for i:=1 to 6 do
       if(GameField.Cells[4,i] = '-') then
        bottom_full:=false;
      if(bottom_full = true) then
       begin
        sum:=strtoint(GameField.Cells[4,1])+strtoint(GameField.Cells[4,2])+strtoint(GameField.Cells[4,3])+
             strtoint(GameField.Cells[4,4])+strtoint(GameField.Cells[4,5])+strtoint(GameField.Cells[4,6]);
        if(sum > 62) then
         begin
          GameField.Cells[4,7]:='35';
          sum:=sum+35;;
         end
        else
         GameField.Cells[4,7]:='0';
        GameField.Cells[4,8]:=inttostr(sum);
        valueStr:=ValueStr+':'+GameField.Cells[4,7]+':'+GameField.Cells[4,8];
       end;
     end;
   if((row < 7) and (GameField.Cells[4,8] <> '-')) then
    begin
     sum:=strtoint(GameField.Cells[4,8])+strtoint(GameField.Cells[4,9])+strtoint(GameField.Cells[4,10])+
          strtoint(GameField.Cells[4,11])+strtoint(GameField.Cells[4,12])+strtoint(GameField.Cells[4,13])+
          strtoint(GameField.Cells[4,14])+strtoint(GameField.Cells[4,15]);
     GameField.Cells[4,16]:=inttostr(sum);
     valueStr:=ValueStr+':'+GameField.Cells[4,16];
    end;
   DiceReset;
  end;
end;


procedure TForm1.checkwriteFree(Row : integer);
var i,j,sum  : integer;
    top_full : boolean;
begin
 rowCase(5,row);
 if(isWritten = true) then
  begin
   if(row < 7) then
    if(GameField.Cells[5,8] = '-') then
     begin
      top_full:=true;
      for i:=1 to 6 do
       if(GameField.Cells[5,i] = '-') then
        top_full:=false;
      if(top_full = true) then
       begin
        sum:=strtoint(GameField.Cells[5,1])+strtoint(GameField.Cells[5,2])+strtoint(GameField.Cells[5,3])+
             strtoint(GameField.Cells[5,4])+strtoint(GameField.Cells[5,5])+strtoint(GameField.Cells[5,6]);
        if(sum > 62) then
         begin
          GameField.Cells[5,7]:='35';
          sum:=sum+35;;
         end
        else
         GameField.Cells[5,7]:='0';
        GameField.Cells[5,8]:=inttostr(sum);
        valueStr:=ValueStr+':'+GameField.Cells[5,7]+':'+GameField.Cells[5,8];
       end;
     end;
   if((GameField.Cells[5,16] = '-') and (GameField.Cells[5,8] <> '-')) then
    begin
     top_full:=true;
     for i:=9 to 15 do
      begin
       if(GameField.Cells[5,i] = '-') then
        top_full:=false;
      end;
     if(top_full = true) then
      begin
       sum:=strtoint(GameField.Cells[5,8])+strtoint(GameField.Cells[5,9])+strtoint(GameField.Cells[5,10])+
            strtoint(GameField.Cells[5,11])+strtoint(GameField.Cells[5,12])+strtoint(GameField.Cells[5,13])+
            strtoint(GameField.Cells[5,14])+strtoint(GameField.Cells[5,15]);
       GameField.Cells[5,16]:=inttostr(sum);
       valueStr:=ValueStr+':'+GameField.Cells[5,16];
      end;
    end;
   DiceReset;
  end;
end;


function TForm1.countDiceResult : integer;
var i,j : integer;
begin
 j:=0;
 for i:=0 to 4 do
  j:=j+DiceResult[i]+1;
 result:=j;
end;


procedure TForm1.DiceReset;
var i : integer;
begin
 UndoResult[5]:=DiceRoll;
 DiceRoll:=0;
 for i:=0 to 4 do
  begin
   UndoResult[i]:=DiceResult[i];
   DiceResult[i]:=0;
  end;
 canUndo:=true;
 speedbutton1.Enabled:=true;
 if(onePlayer = false) then
  speedbutton10.Enabled:=true;
 BCSVGViewer1.top:=16;
 BCSVGViewer2.top:=16;
 BCSVGViewer3.top:=16;
 BCSVGViewer4.top:=16;
 BCSVGViewer5.top:=16;
 diceroll1.visible:=true;
 diceroll2.visible:=true;
 diceroll3.visible:=true;
end;


procedure TForm1.sendValues(aMsg : string);
var i : integer;
begin
 sleep(SrvDelay); //2000
 if(pos('Values:',amsg) > 0) then
  begin
   if(HostMove = true) then
    HostMove:=false
   else
    HostMove:=true;
   speedbutton11.ImageIndex:=27;
  end;
 if(pos('Pmessage:',aMsg) > 0) then
  for i:=10 to length(aMsg) do
   if(not (aMsg[i] in ['a'..'z','A'..'Z','0'..'9',' ','-','.',',','!','?'])) then
    aMsg[i]:='*';
 if(pos('Score:',aMsg) > 0) and (client = nil) then
  begin
   Panel2.Visible:=true;
   if(score_Player1 < score_Player2) then
    image2.ImageIndex:=37;
   Statictext3.Caption:='Total: '+inttostr(score_Player1);
   Panel3.Visible:=true;
   if(score_Player2 < score_Player1) then
    image3.ImageIndex:=37;
   Statictext5.Caption:='Total: '+inttostr(score_Player2);
   speedbutton16.Visible:=false;
   gameStarted:=false;
  end;
 if(checkbox1.checked = true) then
  LTCPComponent1.SendMessage(aMsg,client)
 else
  LTCPComponent1.SendMessage(aMsg);
end;


end.
