unit iostream;

interface

uses
   types, crt;

procedure moveObject(input: char; map: field; posX, posY: ^integer);//������� ����������� ������� (����� ������� � �����)
procedure background(map: field);//������� ������ ������ �� ����� (��� �������)

implementation

procedure background(map: field);

var
   x, y: integer;//���������� ��� ���������

begin
   for y := 1 to h do
      for x := 1 to w do
      begin
         if (map[y][x] = 1) then write('#')//���� � ������� �����, �� ��������� "#"
         else write(' ');//���� � ������� ���, �� ��������� ������
         if (x = h) then writeln();//���� ������ ���������,�� �������������� ������� �� ����� ������
      end;
end;

procedure moveObject(input: char; map: field; posX, posY: ^integer);
begin
   gotoxy(posX^, posY^);  
   write(' ');   
   
   case input of //������������� ��������� ������� ���������
      #37: if (map[posY^][posX^ - 1] = 0) then posX^ -= 1;
      #38: if (map[posY^ - 1][posX^] = 0) then posY^ -= 1;
      #39: if (map[posY^][posX^ + 1] = 0) then posX^ += 1;
      #40: if (map[posY^ + 1][posX^] = 0) then posY^ += 1;
   end;
   
   gotoxy(posX^, posY^);  
   write('@');         
end;

end.