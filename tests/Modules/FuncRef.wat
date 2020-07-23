(module
  (import "" "callback" (func $callback (param funcref) (result externref)))
  (import "" "assert" (func $assert (param externref) (result externref)))
  (table $t 1 funcref)
  (elem declare func $f)
  (func (export "call_nested") (param funcref funcref) (result externref)
    (table.set $t (i32.const 0) (local.get 0))
    (call_indirect $t (param funcref) (result externref) (local.get 1) (i32.const 0))
  )
  (func $f (param externref) (result externref)
    (call $assert (local.get 0))
  )
  (func (export "call_callback") (result externref)
    (call $callback (ref.func $f))
  )
)