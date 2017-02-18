package body Bubbles with SPARK_Mode is

   procedure Swap (T : in out Table; I : in Positive; J : in Positive) is
      Temp : Integer := T (I);
   begin
      T (I) := T (J);
      T (J) := Temp;
   end Swap;

   procedure Bubble (T : in out Table; I : in Positive) is
   begin
      for J in T'First .. I - 1 loop

         if T (J) > T (J + 1) then

            Swap (T, J, J + 1);

         end if;

         pragma Loop_Invariant
           (for all K in I + 1 .. T'Last =>
              T(K) = T'Loop_Entry (K));

         pragma Loop_Invariant
           (for all K in T'First .. J =>
              T(K) <= T(J + 1));

      end loop;

   end Bubble;

   procedure Sort (T : in out Table) is
   begin

      for I in reverse T'Range  loop

         Bubble (T, I);

         -- udowodnic ponizsza assercje:
         pragma Assert
           (if I < T'Last then T (I) <= T (I + 1));

         pragma Loop_Invariant
           (for all J in I .. T'Last =>
              (for all K in T'First .. J =>
                   T(K) <= T(J)));

      end loop;

   end Sort;

end Bubbles;

