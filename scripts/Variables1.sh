awk '{
foo = 1print foofoo = "bar"print foo
foo = "a string"
print foofoo = foo + 5'
print foo}'