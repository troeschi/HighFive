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


{ About Window }

unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    StaticText1: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    procedure StaticText10Click(Sender: TObject);
    procedure StaticText12Click(Sender: TObject);
    procedure StaticText14Click(Sender: TObject);
    procedure StaticText16Click(Sender: TObject);
    procedure StaticText3Click(Sender: TObject);
    procedure StaticText3MouseEnter(Sender: TObject);
    procedure StaticText3MouseLeave(Sender: TObject);
    procedure StaticText5Click(Sender: TObject);
    procedure StaticText7Click(Sender: TObject);
    procedure StaticText9Click(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation

uses lclintf;

{$R *.lfm}

{ TForm4 }

procedure TForm4.StaticText3Click(Sender: TObject);
begin
 openurl('Mailto:troesch.andreas@gmx.de');
end;

procedure TForm4.StaticText3MouseEnter(Sender: TObject);
begin
 (Sender as TStatictext).Cursor:=crHandPoint;
end;

procedure TForm4.StaticText3MouseLeave(Sender: TObject);
begin
 (Sender as TStatictext).Cursor:=crDefault;
end;

procedure TForm4.StaticText14Click(Sender: TObject);
begin
 openurl('https://wmh.github.io/hunbook/tools/fatcow-icons.html');
end;

procedure TForm4.StaticText16Click(Sender: TObject);
begin
 openurl('https://Github.com/Troeschi/HighFive');
end;

procedure TForm4.StaticText12Click(Sender: TObject);
begin
 openurl('http://www.se.rit.edu/~andy/');
end;

procedure TForm4.StaticText10Click(Sender: TObject);
begin
 openurl('https://github.com/bgrabitmap/');
end;

procedure TForm4.StaticText5Click(Sender: TObject);
begin
 openurl('https://www.freepascal.org');
end;

procedure TForm4.StaticText7Click(Sender: TObject);
begin
 openurl('https://www.lazarus-ide.org');
end;

procedure TForm4.StaticText9Click(Sender: TObject);
begin
 openurl('https://github.com/almindor/lnet');
end;

end.

