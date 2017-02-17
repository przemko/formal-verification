package Bubbles with SPARK_Mode is

   type Table is array (Positive range <>) of Integer;

   procedure Swap (T : in out Table; I : in Positive; J : in Positive)
     with
       Depends => (T => (T, I, J)),
       Pre => T'Length > 1 and then I in T'Range and then J in T'Range and then I /= J,
     Post => (for all K in T'Range => (if K /= I and then K /= J then T (K) = T'Old (K))) and then
                T (I) = T'Old (J) and then T (J) = T'Old (I);

   procedure Bubble (T : in out Table; I : in Positive)
     with
       Depends => (T => (T, I)),
       Pre => T'Length > 0
       and then I in T'Range
       and then T'First > Positive'First
       and then T'Last < Positive'Last,
       Post =>
         (for all J in T'First .. I => T(J) <= T(I))
         and then (for all J in I + 1 .. T'Last => T (J) = T'Old (J));

   procedure Sort (T : in out Table)
     with
       Depends => (T => T),
     Pre =>
       T'Length >= 1 and then
       T'Last > Positive'First and then
       T'Last < Positive'Last  and then
       T'First > Positive'First and then
       T'First < Positive'Last,
       Post => (for all I in T'First .. T'Last - 1 => T(I) <= T(I + 1));

end Bubbles;
