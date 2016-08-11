package body Euklides with SPARK_Mode is

   procedure Solve (A : in Positive; B : in Positive; 
                    X : out Integer; Y : out Integer;
                    Z : out Positive)
   is
      Local_A : Positive := A;
      Local_B : Natural := B;
      R : Integer := 0;
      S : Integer := 1;
      Temp_R, Temp_S : Integer;
      Remainder : Natural;
      Quotient : Natural;
   begin
      X := 1;
      Y := 0;
      while Local_B > 0 loop
         pragma Loop_Invariant (Local_A = A * X + B * Y);
         pragma Loop_Invariant (Local_B = A * R + B * S);
         Remainder := Local_A mod Local_B;
         Quotient := Local_A / Local_B;
         pragma Assert (Remainder = Local_A - Quotient * Local_B);
         Local_A := Local_B;
         Local_B := Remainder;
         Temp_R := R;
         Temp_S := S;
         R := X - Quotient * R;
         S := Y - Quotient * S;
         pragma Assert (A * R + B * S = A * X + B * Y - Quotient * (A * Temp_R + B * Temp_S));
         X := Temp_R;
         Y := Temp_S; 
      end loop;
      Z := Local_A;
   end Solve;

end Euklides;

