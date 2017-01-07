(module
  (import "env" "memoryBase" (global $memoryBase i32))
  (import "env" "memory" (memory $0 256))
  (import "env" "table" (table 0 anyfunc))
  (import "env" "tableBase" (global $tableBase i32))
  (global $STACKTOP (mut i32) (i32.const 0))
  (global $STACK_MAX (mut i32) (i32.const 0))
  (export "_isPalindrome" (func $_isPalindrome))
  (export "__post_instantiate" (func $__post_instantiate))
  (export "runPostSets" (func $runPostSets))
  (func $_isPalindrome (param $0 i32) (result i32)
    (i32.const 1)
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
