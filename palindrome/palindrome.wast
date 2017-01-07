(module
  (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
  (type $FUNCSIG$ii (func (param i32) (result i32)))
  (import "env" "memoryBase" (global $memoryBase i32))
  (import "env" "_printf" (func $_printf (param i32 i32) (result i32)))
  (import "env" "_strlen" (func $_strlen (param i32) (result i32)))
  (import "env" "memory" (memory $0 256))
  (import "env" "table" (table 0 anyfunc))
  (import "env" "tableBase" (global $tableBase i32))
  (global $STACKTOP (mut i32) (i32.const 0))
  (global $STACK_MAX (mut i32) (i32.const 0))
  (data (get_global $memoryBase) "%zu\n")
  (export "_isPalindrome" (func $_isPalindrome))
  (export "__post_instantiate" (func $__post_instantiate))
  (export "runPostSets" (func $runPostSets))
  (func $_isPalindrome (param $0 i32) (result i32)
    (local $1 i32)
    (local $2 i32)
    (local $3 i32)
    (local $4 i32)
    (local $5 i32)
    (local $6 i32)
    (local $7 i32)
    (local $8 i32)
    (set_local $6
      (get_global $STACKTOP)
    )
    (set_global $STACKTOP
      (i32.add
        (get_global $STACKTOP)
        (i32.const 16)
      )
    )
    (set_local $5
      (i32.shr_u
        (tee_local $1
          (call $_strlen
            (get_local $0)
          )
        )
        (i32.const 1)
      )
    )
    (i32.store
      (tee_local $4
        (get_local $6)
      )
      (get_local $1)
    )
    (drop
      (call $_printf
        (i32.add
          (get_global $memoryBase)
          (i32.const 0)
        )
        (get_local $4)
      )
    )
    (if
      (get_local $5)
      (block
        (set_local $4
          (i32.const 0)
        )
        (set_local $1
          (i32.add
            (get_local $1)
            (i32.const -1)
          )
        )
        (loop $while-in
          (set_local $7
            (i32.or
              (i32.eq
                (i32.shr_s
                  (i32.shl
                    (tee_local $3
                      (i32.load8_s
                        (i32.add
                          (get_local $0)
                          (get_local $4)
                        )
                      )
                    )
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
                (i32.const 32)
              )
              (i32.eq
                (i32.shr_s
                  (i32.shl
                    (get_local $3)
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
                (i32.const 44)
              )
            )
          )
          (set_local $8
            (i32.or
              (i32.eq
                (i32.shr_s
                  (i32.shl
                    (tee_local $2
                      (i32.load8_s
                        (i32.add
                          (get_local $0)
                          (get_local $1)
                        )
                      )
                    )
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
                (i32.const 32)
              )
              (i32.eq
                (i32.shr_s
                  (i32.shl
                    (get_local $2)
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
                (i32.const 44)
              )
            )
          )
          (set_local $4
            (if i32
              (i32.eq
                (i32.shr_s
                  (i32.shl
                    (get_local $3)
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
                (i32.shr_s
                  (i32.shl
                    (get_local $2)
                    (i32.const 24)
                  )
                  (i32.const 24)
                )
              )
              (block i32
                (set_local $2
                  (i32.const 1)
                )
                (set_local $1
                  (i32.add
                    (get_local $1)
                    (i32.const -1)
                  )
                )
                (i32.add
                  (get_local $4)
                  (i32.const 1)
                )
              )
              (block i32
                (set_local $2
                  (tee_local $3
                    (i32.or
                      (get_local $7)
                      (get_local $8)
                    )
                  )
                )
                (set_local $1
                  (i32.add
                    (select
                      (i32.shr_s
                        (i32.shl
                          (get_local $8)
                          (i32.const 31)
                        )
                        (i32.const 31)
                      )
                      (i32.const 0)
                      (get_local $3)
                    )
                    (get_local $1)
                  )
                )
                (i32.add
                  (select
                    (i32.and
                      (get_local $7)
                      (i32.const 1)
                    )
                    (i32.const 0)
                    (get_local $3)
                  )
                  (get_local $4)
                )
              )
            )
          )
          (set_local $3
            (i32.add
              (get_local $5)
              (i32.const -1)
            )
          )
          (if
            (i32.and
              (get_local $2)
              (i32.gt_s
                (get_local $5)
                (i32.const 1)
              )
            )
            (block
              (set_local $5
                (get_local $3)
              )
              (br $while-in)
            )
          )
        )
      )
      (set_local $2
        (i32.const 1)
      )
    )
    (set_global $STACKTOP
      (get_local $6)
    )
    (get_local $2)
  )
  (func $runPostSets
    (nop)
  )
  (func $__post_instantiate
    (set_global $STACKTOP
      (i32.add
        (get_global $memoryBase)
        (i32.const 16)
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
