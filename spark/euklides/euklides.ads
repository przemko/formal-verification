package Euklides with SPARK_Mode is

   procedure Solve (A : in Positive; B : in Positive;
                    X : out Integer; Y : out Integer;
                    Z : out Positive)
   with
      Post => A * X + B * Y = Z;

end Euklides;

