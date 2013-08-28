module SubscriberExtractor
  # Internal: a class that uses a block to define methods on the object.
  #
  # object   - The object on which the methods should be defnined.
  #
  # Examples
  #
  #    m = MethodDefiner.new(Object.new)
  #    block = Proc.new {|x| x.hello { "Hello Bob"}}
  #    block.call(m)
  #    m.object.hello #=> "Hello Bob"
  #
  MethodDefiner = Struct.new(:object) do
    def method_missing(method_name, &block)
      object.define_singleton_method(method_name) {|*args| block.call(*args) }
    end
  end

  # Public: uses the given block to define methods on a new object.
  #
  # blk  - The block containing the methods.
  #
  # Examples
  #
  #    s = extract_subscriber do |r|
  #        r.hello   { "Hello everyone!" }
  #        r.goodbye { |name| "Goodbye #{name}."}
  #    end
  #    s.hello          #=> "Hello everyone!"
  #    s.goodbye('Tom') #=> "Goodbye Tom."
  #
  # Returns the object on which the methods have been defined.
  def extract_subscriber(&blk)
    if blk
      method_definer = MethodDefiner.new(Object.new)
      yield method_definer
      [method_definer.object]
    else
      []
    end
  end
end