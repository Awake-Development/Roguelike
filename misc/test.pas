type

   Leonid = record
   private
      surname : string;
      age, money : integer;
   public
      constructor create ();
      procedure setValues (sn : string; ag, mn : integer);
      procedure print ();
   end;
   
   pNode = ^Node;
   Node = record 
   public
      data : Leonid;
      next : pNode;
   end;
   
   TList = class
   private
      head : pNode;
   public
      constructor create();
      procedure addNode(sn : string; ag, mn : integer);
      procedure printList();
   end;
   
   constructor Leonid.create ();
         begin
            age := 0;
            money := 0;
            surname := ' ';
         end;
   procedure Leonid.print ();
         begin
            writeln ('Фамилия вашего Леонида: ', surname, ', Возраст: ', age, ', Денег в кошельке: ', money, ' рублей.');
            if (money < 1000) then writeln ('Да ваш Леонид нищеброд!');
            if (money > 5000) then writeln ('Да ваш Леонид мажор!');
         end;
   procedure Leonid.setValues (sn : string; ag, mn : integer);
         begin
            age := ag;
            money := mn;
            if ((sn = 'Бабков') or (sn = 'бабков') or (sn = 'БАБКОВ')) then surname := 'БОБОКОВ ЛОЛ'
            else surname := sn;
         end;
   constructor TList.create();
   begin
      head := NIL;
   end;
   procedure TList.addNode(sn : string; ag, mn : integer);
   var
      pnd : pNode;
   begin
      New(pnd);
      pnd^.data.setValues (sn, ag, mn);
      pnd^.next := NIL;
      if (head = NIL) then
         head := pnd
      else begin
         var current : pNode := head;
         while (current^.next <> NIL) do
            current := current^.next;
            
         current^.next := pnd;
      end;
   end;
   procedure TList.printList();
   var
      current : pNode := head;
   begin
      while (current <> NIL) do
      begin
         current^.data.print();
         current := current^.next;
      end;
   end;
   
   
var   
    list : TList := new TList;
    surname : string;
    age, money, i: integer;
   
begin
         for i := 1 to 5 do begin
         write ('Введите фамилию Леонида: ');
         readln (surname);
         write ('Введите возраст Леонида: ');
         readln (age);
         write ('Введите количество денег у Леонида в кошельке: ');
         readln (money);
         list.addNode (surname, age, money);
         end;
         list.printList();
end.
