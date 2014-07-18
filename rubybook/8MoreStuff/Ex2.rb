# Nothing is printed because the block was not activated.
# The method returns #<Proc:0x94daab8@(irb):5>.

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!"}