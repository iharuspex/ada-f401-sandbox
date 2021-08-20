with Ada.Text_IO;
with STM32F401.RCC;


procedure Test_F401 is 
   
   procedure Init_Periph is
     
   begin
      
      loop
         null;
      end loop;
   end Init_Periph;
   
begin
   Ada.Text_IO.Put_Line("Hello world!");
   null;
end Test_F401;
