(module
  (import "JEFF.Platform.Console" "write_line" (func $write_line (param i32 i32)))
  (memory (export "memory") 1)
  (global $printed (mut i32) (i32.const 0))

  (data (i32.const 0) "Hello World! Our name is JEFF.")

  (func $activate (export "activate")
    (if (i32.eq (global.get $printed) (i32.const 0))
      (then
        (call $write_line (i32.const 0) (i32.const 35))
        (global.set $printed (i32.const 1))
      )
    )
  )

  (func $tick (export "tick") nop)
  (func $init (export "init") nop)
  (func $bind (export "bind") nop)
  (func $deactivate (export "deactivate") nop)
  (func $destroy (export "destroy") nop)
)
