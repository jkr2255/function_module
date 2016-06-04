require "function_module/version"

class Module # :nodoc:

  # lists all module functions.
  # @return [Array] array of symbols for defined module functions.
  def module_functions
    original_private_methods = private_instance_methods
    original_private_methods -= Module.new.private_instance_methods
    original_singular_methods = public_methods - Module.public_methods
    original_private_methods & original_singular_methods
  end

  private

  # include another Module & define public singleton methods
  # (makes parameter module's module functions to self's module functions)
  # @param [Module] mod including module
  def include_module_functions(mod)
    include mod
    extend mod
    singleton_class.__send__ :public, *mod.module_functions
  end
end
