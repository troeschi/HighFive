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


{ Translation strings }


unit TranslateStr;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

resourcestring cantCreateDir1  = 'Kann Verzeichnis ';
resourcestring cantCreateDir2  = ' nicht erstellen!';
resourcestring endProgram      = 'Programm wird beendet.';
resourcestring firstEndMove    = 'Erst "Zug beendet" anklicken!';
resourcestring noDices         = 'Ohne Würfel würfeln?';
resourcestring noDices2        = 'Alle Würfel werden gehalten...';
resourcestring serverStopped   = 'Server angehalten...';
resourcestring serverStopped2  = 'Von Server getrennt...';
resourcestring PmessageStr     = 'Nachricht: ';
resourcestring isNotWrittenstr = 'Ergebnis nicht eingetragen!';
resourcestring UndoLastEntryStr= 'Letzen Eintrag wiederrufen?';
resourcestring deletestr       = 'löschen?';
resourcestring newGameStr1     = 'Neues Spiel starten ?';
resourcestring netGameStr1     = 'Netzwerkspiele lädt der Server-Spieler!';
resourcestring overrideStr1    = 'Spielstand überschreiben?';
resourcestring saveGameStr1    = 'Fehler beim Speichern von ';
resourcestring saveGameStr2    = 'Netzwerkspiele speichert der Server-Spieler!';
resourcestring loadGameStr1    = 'Laden';
resourcestring loadGameStr2    = 'Fehler beim Laden von ';
resourcestring saveGameStr3    = 'Speichern';
resourcestring loadGameStr3    = 'Lade Spiel:';
resourcestring saveGameStr4    = 'Speichern unter:';
resourcestring serverStart1    = 'Server gestartet...';
resourcestring serverStart5    = 'Server angehalten...';
resourcestring serverStopped3  = 'Trennen';
resourcestring serverStart2    = 'Server konnte nicht gestartet werden!';
resourcestring serverStart3    = 'Mit Server verbunden...';
resourcestring serverStopped4  = 'Verbindung mit Server konnte nicht hergestellt werden!';
resourcestring serverStart4    = 'Verbinden';
resourcestring serverStopped5  = 'Von Server getrennt...';
resourcestring allreadyUsedstr = 'Bereits genutzt!';
resourcestring strikeStr1      = '3er streichen ?';
resourcestring strikeStr2      = '4er streichen ?';
resourcestring strikeStr3      = 'Kl. Strasse streichen ?';
resourcestring strikeStr4      = 'Gr. Strasse streichen ?';
resourcestring strikeStr5      = 'Full House streichen ?';
resourcestring strikeStr6      = 'HighFive streichen ?';
resourcestring strikeStr7      = 'Chance schreiben ?';
resourcestring valGridStr1     = 'In dieser Reihe muss jedes vorige Feld erst ausgefüllt werden!';
resourcestring valGridStr2     = 'In dieser Reihe muss jedes untere Feld erst ausgefüllt werden!';
resourcestring valGridStr3     = 'In dieser Reihe muss der obere Teil als erstes ausgefüllt werden!';
resourcestring valGridStr4     = 'In dieser Reihe muss der untere Teil als erstes ausgefüllt werden!';
resourcestring svdlgCaption1   = 'Spiel Speichern';
resourcestring svdlgCaption2   = 'Spiel Laden';
resourcestring srvdialogNG1    = 'Anfrage Server: Neues Spiel?';
resourcestring srvdialogNG2    = 'Client: Neues Spiel zurückgewiesen';
resourcestring srvdialogLG1    = 'Anfrage Server: Spiel laden?';
resourcestring srvdialogLG2    = 'Client: Spiel laden zurückgewiesen';
resourcestring srvdialogRsv1   = 'Spieler 2: Spalte:';
resourcestring srvdialogRsv2   = ' Reihe:';
resourcestring srvdialogRsv3   = ' Wert: ';

implementation

end.

