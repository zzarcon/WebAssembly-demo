(module
  (import "env" "memoryBase" (global $memoryBase i32))
  (import "env" "memory" (memory $0 256))
  (import "env" "table" (table 0 anyfunc))
  (import "env" "tableBase" (global $tableBase i32))
  (global $STACKTOP (mut i32) (i32.const 0))
  (global $STACK_MAX (mut i32) (i32.const 0))
  (global $_memo i32 (i32.const 5242880))
  (export "_fibonacciMemo" (func $_fibonacciMemo))
  (export "_fibonacci" (func $_fibonacci))
  (export "_fibonacciRec" (func $_fibonacciRec))
  (export "__post_instantiate" (func $__post_instantiate))
  (export "runPostSets" (func $runPostSets))
  (export "_memo" (global $_memo))
  (func $_fibonacci (param $0 i32) (result i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (if
      (i32.gt_s
        (get_local $0)
        (i32.const 1)
      )
      (block
        (set_local $2
          (i32.const 1)
        )
        (set_local $1
          (i32.const 1)
        )
        (set_local $3
          (get_local $0)
        )
        (loop $while-in
          (set_local $1
            (i32.add
              (get_local $2)
              (get_local $1)
            )
          )
          (if
            (i32.gt_s
              (tee_local $3
                (i32.add
                  (get_local $3)
                  (i32.const -1)
                )
              )
              (i32.const 1)
            )
            (block
              (set_local $0
                (get_local $2)
              )
              (set_local $2
                (get_local $1)
              )
              (set_local $1
                (get_local $0)
              )
              (br $while-in)
            )
          )
        )
      )
      (set_local $1
        (i32.const 1)
      )
    )
    (get_local $1)
  )
  (func $_fibonacciRec (param $0 i32) (result i32)
    (local $1 i32)
    (if
      (i32.lt_s
        (get_local $0)
        (i32.const 2)
      )
      (set_local $1
        (i32.const 1)
      )
      (block
        (set_local $1
          (i32.const 1)
        )
        (loop $while-in
          (set_local $1
            (i32.add
              (call $_fibonacciRec
                (i32.add
                  (get_local $0)
                  (i32.const -1)
                )
              )
              (get_local $1)
            )
          )
          (br_if $while-in
            (i32.ge_s
              (tee_local $0
                (i32.add
                  (get_local $0)
                  (i32.const -2)
                )
              )
              (i32.const 2)
            )
          )
        )
      )
    )
    (get_local $1)
  )
  (func $_fibonacciMemo (param $0 i32) (result i32)
    (local $1 i32)
    (local $2 i32)
    (if
      (i32.eq
        (tee_local $1
          (i32.load
            (tee_local $2
              (i32.add
                (i32.add
                  (get_global $memoryBase)
                  (i32.const 5242880)
                )
                (i32.shl
                  (get_local $0)
                  (i32.const 2)
                )
              )
            )
          )
        )
        (i32.const -1)
      )
      (if
        (i32.lt_u
          (tee_local $1
            (i32.add
              (get_local $0)
              (i32.const -1)
            )
          )
          (i32.const 2)
        )
        (set_local $1
          (i32.const 1)
        )
        (block
          (set_local $1
            (call $_fibonacciMemo
              (get_local $1)
            )
          )
          (i32.store
            (get_local $2)
            (tee_local $0
              (i32.add
                (call $_fibonacciMemo
                  (i32.add
                    (get_local $0)
                    (i32.const -2)
                  )
                )
                (get_local $1)
              )
            )
          )
          (return
            (get_local $0)
          )
        )
      )
    )
    (get_local $1)
  )
  (func $runPostSets
    (nop)
  )
  (func $__post_instantiate
    (set_global $STACKTOP
      (i32.add
        (get_global $memoryBase)
        (i32.const 0)
      )
    )
    (set_global $STACK_MAX
      (i32.add
        (get_global $STACKTOP)
        (i32.const 5242880)
      )
    )
    (call $runPostSets)
  )
)
