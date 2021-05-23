unit MainU;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, Menus,
  GasStationUnit, FillingUnit; //2 моих модуля основной и форма заполнения

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    MenuIFile: TMenuItem;
    MenuFileCreatetxt: TMenuItem;
    MenuFileCreateTip: TMenuItem;
    MenuFileSaveTip: TMenuItem;
    MenuFileSaveTxt: TMenuItem;
    MenuSPSorFam: TMenuItem;
    MenuSGMainClear: TMenuItem;
    MenuSG: TMenuItem;
    MenuSpCreate: TMenuItem;
    MenuSp: TMenuItem;
    MenuFileOpenTip: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SGMain: TStringGrid;
    SGSort: TStringGrid;
    procedure MenuFileCreatetxtClick(Sender: TObject);
    procedure MenuFileCreateTipClick(Sender: TObject);
    procedure MenuFileOpenTipClick(Sender: TObject);
    procedure MenuFileSaveTipClick(Sender: TObject);
    procedure MenuSGMainClearClick(Sender: TObject);
    procedure MenuSpCreateClick(Sender: TObject);
    procedure MenuSPSorFamClick(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  f:GASFile;  //файловая переменная
  FName:string; //Имя типизированного файла
  Head:PUzel;

implementation



{$R *.lfm}

{ TMainForm }

procedure TMainForm.MenuFileCreatetxtClick(Sender: TObject);
begin

end;

procedure TMainForm.MenuFileCreateTipClick(Sender: TObject); //Создание типизированного файла
begin
  CreateTipFile(f, FName);
end;

procedure TMainForm.MenuFileOpenTipClick(Sender: TObject);  //Создание списка из типизированного файла
begin
  if SaveDialog1.Execute then       //Вызываем SaveDialog
     FName:=SaveDialog1.FileName;
  if (FName = '') or (FName = ' ') then     //Если не выбрали, то выводим сообщение
     DefaultMessageBox('Что то пошло не так, возможно вы файлик не выбрали','Ой, ошибочка вышла',0)
  else
      begin      //Если все хорошо,то
         AssignFile(f,FName); //Связываем файлик
         BuildFromFile(f,Head); //загружаем из файла
      end;
end;

procedure TMainForm.MenuFileSaveTipClick(Sender: TObject);
begin
  if SaveDialog1.Execute then       //Вызываем SaveDialog
     FName:=SaveDialog1.FileName;
  if (FName = '') or (FName = ' ') then     //Если не выбрали, то выводим сообщение
     DefaultMessageBox('Что то пошло не так, возможно вы файлик не выбрали','Ой, ошибочка вышла',0)
  else
      begin      //Если все хорошо,то
         AssignFile(f,FName); //Связываем файлик
         SaveSPinTipFile(f,Head);   // сохраняем
      end;

end;

procedure TMainForm.MenuSGMainClearClick(Sender: TObject);
begin
  SGMain_Clear;
end;

procedure TMainForm.MenuSpCreateClick(Sender: TObject); //Вызов формы для заполнения
begin
  FormFilling.Visible:=True;
end;

procedure TMainForm.MenuSPSorFamClick(Sender: TObject);  //СОртировка по ФИО в алфавитном порядке
begin
  Sort_FIO(Head);
  AddInSG2(Head);
end;

end.

