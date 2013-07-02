unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TFormMain = class(TForm)
    StringGrid1: TStringGrid;
    LabelGraph: TLabel;
    Label2: TLabel;
    EditTop: TEdit;
    ListBox1: TListBox;
    Label1: TLabel;
    ButtonGo: TButton;
    ButtonCount: TButton;
    EditCount: TEdit;
    Label3: TLabel;
    ButtonGrid: TButton;
    procedure ButtonCountClick(Sender: TObject);
    procedure ButtonGridClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  count:integer;

implementation

{$R *.dfm}

procedure TFormMain.ButtonCountClick(Sender: TObject); // задаю размер графа(матрицы смежности)
begin
  if not TryStrToInt(EditCount.Text, count) then
    ShowMessage('Неверно введено кол-во вершин')
  else
    count:= StrToInt(EditCount.Text);
end;

procedure TFormMain.ButtonGridClick(Sender: TObject); // заполнение матрицы смежности
var
  i,j:integer;
begin
  StringGrid1.ColCount:= count;
  StringGrid1.RowCount:= count;
  for i:=0 to count-1 do
    StringGrid1.Cells[i,i]:= IntToStr(0);  // главная диагональ - нули
  for i:=0 to count-1 do
    for j:= i+1 to count-1 do
    begin
      StringGrid1.Cells[i,j]:= IntToStr(Random(10));
      if StringGrid1.Cells[i,j] = '0' then
        StringGrid1.Cells[i,j]:= IntToStr(-1); // если нет общей дуги, то значение ячейки = -1
      StringGrid1.Cells[j,i]:= StringGrid1.Cells[i,j];
    end;
end;

procedure TFormMain.ButtonGoClick(Sender: TObject);
var
  A:array of array of longint; // матрица смежности
  B:array of boolean;         // список отмеченных вершин
  C:array of longint;        //  кратчайшие расстояния
  i,j,m,q,v:integer;
begin
  if not TryStrToInt(EditTop.Text, q) then
    ShowMessage('Неверно введена исходная вершина')
  else
    q:= StrToInt(EditTop.Text);  // исходная вершина
  if (q < 0) or (q > count) then
    q:= 0;

  SetLength(A,count,count);
  for i:=0 to count-1 do
    for j:=0 to count-1 do
      A[j,i]:= StrToIntDef(StringGrid1.Cells[i,j],-1);

  SetLength(B,count);
  SetLength(C,count);
  for i:=0 to count-1 do
    B[i]:= False;
  for i:=0 to count-1 do
    C[i]:=10000;
  C[q]:= 0;  // расстояние до начальной вершины
  for i:=0 to count-1 do
  begin
    m:=10000;
    for j:=0 to count-1 do
      if ((C[j] <= m) and (not B[j])) then
      begin
        m:= C[j];
        v:= j;
      end;
      B[v]:= True;
      for j:=0 to count-1 do
        if ((A[v,j] <> -1) and (not B[j]) and (C[v]+A[v,j] < C[j])) then
          C[j]:= C[v]+A[v,j];
  end;

  ListBox1.Clear;
  for i:=0 to count-1 do
    ListBox1.Items.Append(IntToStr(q) + ' -> ' +IntToStr(i) + ': ' + IntToStr(C[i]));
end;

end.
