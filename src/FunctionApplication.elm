module Main exposing (main)

import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner


benchmark : Benchmark
benchmark =
    Benchmark.describe "function application"
        [ Benchmark.compare "sum2"
            "partial: (sum2 1) 2"
            (\_ -> (sum2 1) 2)
            "full: sum2 1 2"
            (\_ -> sum2 1 2)
        , Benchmark.compare "sum3"
            "partial: (sum3 1) 2 3"
            (\_ -> (sum3 1) 2 3)
            "full: sum3 1 2 3"
            (\_ -> sum3 1 2 3)
        , Benchmark.compare "sum3"
            "partial: (sum3 1 2) 3"
            (\_ -> (sum3 1 2) 3)
            "full: sum3 1 2 3"
            (\_ -> sum3 1 2 3)
        , Benchmark.compare "sum4"
            "partial: (sum4 1) 2 3 4"
            (\_ -> (sum4 1) 2 3 4)
            "full: sum4 1 2 3 4"
            (\_ -> sum4 1 2 3 4)
        , Benchmark.compare "sum4"
            "partial: (sum4 1 2) 3 4"
            (\_ -> (sum4 1 2) 3 4)
            "full: sum4 1 2 3 4"
            (\_ -> sum4 1 2 3 4)
        , Benchmark.compare "sum4"
            "partial: (sum4 1 2 3) 4"
            (\_ -> (sum4 1 2 3) 4)
            "full: sum4 1 2 3 4"
            (\_ -> sum4 1 2 3 4)
        ]


sum2 : Int -> Int -> Int
sum2 a b =
    a + b


sum3 : Int -> Int -> Int -> Int
sum3 a b c =
    a + b + c


sum4 : Int -> Int -> Int -> Int -> Int
sum4 a b c d =
    a + b + c + d


main : Runner.BenchmarkProgram
main =
    Runner.program benchmark
