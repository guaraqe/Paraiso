{-# LANGUAGE TypeOperators #-}
{-# OPTIONS -Wall #-}

import Control.Monad
import Language.Paraiso.Axis

type Vec6 a = Vec3 a :. a :. a :. a

x :: Vec3 Int
x = Vec :. 3 :. 9 :. 8

z :: Vec3 Double
z = zeroVector

ten :: Vec2 (Vec2 Int)
ten = Vec :. (Vec :. 1 :. 0) :. (Vec :. 0 :. 1)

z6 :: Vec6 Double
z6 = zeroVector

main :: IO ()
main = do
  putStrLn $ "x = " ++ show x
  putStrLn $ "zeroVector = " ++ show z
  putStrLn $ "zeroVector = " ++ show z6
  forM_ (map Axis [0..dimension x - 1]) sub
  putStrLn $ "a tensor = " ++ show ten
        
sub :: Axis -> IO ()
sub ex = do
  putStrLn $ "x[" ++ show ex ++ "] = " ++ show (getComponent ex x)
  putStrLn $ "unitVector[" ++ show ex ++ "] = " ++ show (unitVector ex::Vec3 Double)
         
