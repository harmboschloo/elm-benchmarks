module RecordUpdate exposing (main)

import Benchmark exposing (Benchmark)
import Benchmark.Runner as Runner


type alias R2 =
    { a : Int
    , b : Int
    }


type alias R3 =
    { a : Int
    , b : Int
    , c : Int
    }


r2 : R2
r2 =
    { a = 0
    , b = 0
    }


r3 : R3
r3 =
    { a = 0
    , b = 0
    , c = 0
    }


benchmark : Benchmark
benchmark =
    Benchmark.describe "record update"
        [ Benchmark.compare "update 1 of 2 fields"
            "normal {r2|a=1}"
            (\_ -> { r2 | a = 1 })
            "create {a=1,b=r2.b}"
            (\_ -> { a = 1, b = r2.b })
        , Benchmark.compare "update 1 of 2 fields"
            "normal {r2|a=1}"
            (\_ -> { r2 | a = 1 })
            "ctor (R2 1 r2.b)"
            (\_ -> R2 1 r2.b)
        , Benchmark.compare "update 1 of 3 fields"
            "normal {r3|a=1}"
            (\_ -> { r3 | a = 1 })
            "create {a=1,b=r3.b,c=r3.c}"
            (\_ -> { a = 1, b = r3.b, c = r3.c })
        , Benchmark.compare "update 1 of 3 fields"
            "normal {r3|a=1}"
            (\_ -> { r3 | a = 1 })
            "ctor (R3 1 r3.b r3.c)"
            (\_ -> R3 1 r3.b r3.c)
        , Benchmark.compare "update 2 of 3 fields"
            "normal {r3|a=1,b=2}"
            (\_ -> { r3 | a = 1, b = 2 })
            "create {a=1,b=2,c=r3.c}"
            (\_ -> { a = 1, b = 2, c = r3.c })
        , Benchmark.compare "update 2 of 3 fields"
            "normal {r3|a=1,b=2}"
            (\_ -> { r3 | a = 1, b = 2 })
            "ctor (R3 1 2 r3.c)"
            (\_ -> R3 1 2 r3.c)
        ]


main : Runner.BenchmarkProgram
main =
    Runner.program benchmark
