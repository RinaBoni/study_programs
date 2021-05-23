unit FillingUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  GasStationUnit;

type

  { TFormFilling }

  TFormFilling = class(TForm)
    ButtonClose: TButton;
    ButtonAdd: TButton;
    ComboBox1: TComboBox;
    EditLitr: TEdit;
    EditOtch: TEdit;
    EditName: TEdit;
    EditFam: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MemoPrice: TMemo;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure MemoPriceChange(Sender: TObject);
  private

  public

  end;

var
  FormFilling: TFormFilling;

implementation

uses MainU;

{$R *.lfm}

{ TFormFilling }

procedure TFormFilling.MemoPriceChange(Sender: TObject);
begin

end;

procedure TFormFilling.ButtonCloseClick(Sender: TObject);
begin
  FormFilling.close;
end;

procedure TFormFilling.ButtonAddClick(Sender: TObject);  //Добавление записи в список
var l:integer;
begin
  if not ((EditFam.Text = '') or (EditName.Text = '') or (EditOtch.Text = '') or (ComboBox1.Text = '')) and TryStrToInt(EditLitr.Text, l) then
     BuildSpisok(Head)
  else
    DefaultMessageBox('Одно или больше полей не заполнено', 'Ой, ошибочка вышла',0);


end;

end.

