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

procedure TFormMain.ButtonCountClick(Sender: TObject); // ����� ������ �����(������� ���������)
begin
  if not TryStrToInt(EditCount.Text, count) then
    ShowMessage('������� ������� ���-�� ������')
  else
    count:= StrToInt(EditCount.Text);
end;

procedure TFormMain.ButtonGridClick(Sender: TObject); // ���������� ������� ���������
var
  i,j:integer;
begin
  StringGrid1.ColCount:= count;
  StringGrid1.RowCount:= count;
  for i:=0 to count-1 do
    StringGrid1.Cells[i,i]:= IntToStr(0);  // ������� ��������� - ����
  for i:=0 to count-1 do
    for j:= i+1 to count-1 do
    begin
      StringGrid1.Cells[i,j]:= IntToStr(Random(10));
      if StringGrid1.Cells[i,j] = '0' then
        StringGrid1.Cells[i,j]:= IntToStr(-1); // ���� ��� ����� ����, �� �������� ������ = -1
      StringGrid1.Cells[j,i]:= StringGrid1.Cells[i,j];
    end;
end;

procedure TFormMain.ButtonGoClick(Sender: TObject);
var
  A:array of array of longint; // ������� ���������
  B:array of boolean;         // ������ ���������� ������
  C:array of longint;        //  ���������� ����������
  i,j,m,q,v:integer;
begin
  if not TryStrToInt(EditTop.Text, q) then
    ShowMessage('������� ������� �������� �������')
  else
    q:= StrToInt(EditTop.Text);  // �������� �������
  if (q < 1) or (q > count) then
    q:= 1;

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
  C[q]:= 0;  // ���������� �� ��������� �������
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
