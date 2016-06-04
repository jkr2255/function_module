require "function_module/version"

class Module # :nodoc:

  def module_functions
    original_private_methods = private_instance_methods
    original_private_methods -= Module.new.private_instance_methods
    original_singular_methods = public_methods - Module.public_methods
    original_private_methods & original_singular_methods
  end

  private

  def include_module_functions(mod)
    include mod
    extend mod
    singleton_class.__send__ :public, *mod.module_functions
  end
end
