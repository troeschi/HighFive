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


{ Highscore Window }

unit Unit5;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Grids;

type

  { TForm5 }

  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    procedure listbox_readitems;
    procedure FormShow(Sender: TObject);
    procedure SaveHighScore(Sender : TObject);
  private

  public
   write_str : string;
  end;

var
  Form5: TForm5;

implementation

uses unit1;

{$R *.lfm}

{ TForm5 }

procedure TForm5.FormShow(Sender: TObject);
begin
 if(edit1.Visible = true) then
  button1.Visible:=true
 else
  button1.Visible:=false;
 listbox_readitems;
end;


procedure TForm5.listbox_readitems;
var tf : Tstringlist;
    i,j: integer;
    sa : array of string;
begin
 tf:=Tstringlist.create;
 if(not fileexists(Form1.user_path+DirectorySeparator+'highscrore.txt')) then
  tf.SaveToFile(Form1.user_path+DirectorySeparator+'highscrore.txt')
 else
  tf.LoadFromFile(Form1.user_path+DirectorySeparator+'highscrore.txt');
 stringgrid1.RowCount:=tf.Count;
 j:=0;
 for i:=tf.Count-1 downto 0 do
   begin
    inc(j);
    sa:=tf[i].Split(':');
    stringgrid1.Cells[0,j-1]:=inttostr(j);
    stringgrid1.Cells[1,j-1]:=sa[0];
    stringgrid1.Cells[2,j-1]:=sa[1];
   end;
end;


procedure TForm5.SaveHighScore(Sender : TObject);
var tf : Tstringlist;
    i  : integer;
    sa : array of string;
begin
 if(Edit1.Text = '') then
  exit;
 tf:=Tstringlist.create;
 if(not fileexists(Form1.user_path+DirectorySeparator+'highscrore.txt')) then
  tf.SaveToFile(Form1.user_path+DirectorySeparator+'highscrore.txt')
 else
  tf.LoadFromFile(Form1.user_path+DirectorySeparator+'highscrore.txt');
 if(tf.count > 100) then
  for i:=tf.count-1 downto 99 do
   tf.delete(i);
 if(tf.Count > 0) then
  for i:=0 to tf.Count-1 do
   begin
    sa:=tf[i].Split(':');
    if (strtoint(write_str) < strtoint(sa[0])) or
       (strtoint(write_str) = strtoint(sa[0])) then
     begin
      tf.Insert(i,write_str+':'+edit1.Text);
      break;
     end;
    if(i = tf.Count-1) then
     tf.Add(write_str+':'+edit1.Text);
   end
 else
  tf.Add(write_str+':'+edit1.Text);
 tf.SaveToFile(Form1.user_path+DirectorySeparator+'highscrore.txt');
 tf.free;
 button1.Visible:=false;
 edit1.Visible:=false;
 label1.Visible:=false;
 Image1.Visible:=true;
 Image2.Visible:=true;
 Image3.Visible:=true;
 Image4.Visible:=true;
 listbox_readitems;
end;


end.
