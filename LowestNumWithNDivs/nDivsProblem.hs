is_divided :: Int -> Int -> [Int]
is_divided a 1 = [1]
is_divided a b = if (a `mod` b) == 0 then [1] else [0]


div_number :: Int -> Int -> [Int]
div_number n i = do 
        if i <= n
                then do 
                     is_divided n i  ++ div_number n (i+1)                 
                       
                else [0]

fun :: Int -> Int-> [Int] 
fun n x = do 
        if n == sum(div_number x 1)
                then do 
                     [x]             
                       
                else do
                     fun n (x+1)
main = do print (fun 16 1)
          


