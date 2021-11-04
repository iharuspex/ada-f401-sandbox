with STM32F401.RCC; use STM32F401.RCC;
with STM32F401.GPIO; use STM32F401.GPIO;


procedure Test_F401 is 
   
   -- ... of course not the entire periphery
   procedure Init_Periph (LED_Pin : in Integer) is
   begin
      -- Enable SWD
      RCC_Periph.AHB1ENR.GPIOAEN := 1;

      -- Enable GPIOC clock
      RCC_Periph.AHB1ENR.GPIOCEN := 1;
      -- General purpose output mode
      GPIOC_Periph.MODER.Arr (LED_Pin) := 1;
      -- Output push/pull mode
      GPIOC_Periph.OTYPER.OT.Arr (LED_Pin) := 0;
      -- Low speed
      GPIOC_Periph.OSPEEDR.Arr (LED_Pin) := 1;
      -- No pull up/down
      GPIOC_Periph.PUPDR.Arr (LED_Pin) := 0;
   end Init_Periph;
   
   -- Worst delay emulation ever
   procedure Silly_Delay is
      foo : Integer := 0;
   begin
      for I in 0..100_000 loop
         foo := foo + 1;
      end loop;
   end Silly_Delay;
   
   -- On WeAct LED connected to C13 pin
   LED_GPIO_Num : constant := 13;
   
begin
   Init_Periph (LED_GPIO_Num);
   
   loop
      GPIOC_Periph.ODR.ODR.Arr (LED_GPIO_Num) := 1;

      Silly_Delay;

      GPIOC_Periph.ODR.ODR.Arr (LED_GPIO_Num) := 0;

      Silly_Delay;
      
   end loop;
end Test_F401;
