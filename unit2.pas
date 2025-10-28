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


{ Save / load game dialog Window }

unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  lclstrconsts, TranslateStr, LCLTranslator, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
  private

  public

  end;

var
  Form2: TForm2;

implementation

uses unit1, fileutil;

{$R *.lfm}

{ TForm2 }


procedure TForm2.FormCreate(Sender: TObject);
begin
end;


procedure TForm2.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin
 if(ListBox1.ItemIndex > -1) and (ListBox1.ItemIndex < listbox1.count) then
  edit1.Text:=ListBox1.Items[listbox1.ItemIndex];
end;


procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 if((Listbox1.ItemIndex > -1) and (Listbox1.ItemIndex < Listbox1.Count)) then
  if(messageDlgPos(ListBox1.Items[ListBox1.ItemIndex]+' '+deletestr,mtConfirmation,
                  [mbYes,mbNo],0,round(left+(width/2)),top+100) = mrYes) then
   begin
    if(DirectoryExists(Form1.user_Path+DirectorySeparator+ListBox1.Items[ListBox1.ItemIndex])) then
     DeleteDirectory(Form1.user_Path+DirectorySeparator+ListBox1.Items[ListBox1.ItemIndex],false);
    ListBox1.Items.Delete(ListBox1.ItemIndex);
   end;
end;


end.

