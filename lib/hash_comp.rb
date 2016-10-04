require "hash_comp/version"
require "hash_comp/comparison"

module HashComp
  def self.patch!
    Hash.class_eval do
      def diff(right)
        HashComp.left_diff(self, right)
      end
    end unless Hash.new.respond_to?(:diff)
  end

  module_function

  def diff(*args)
    Comparison.new(*args).diff
  end

  def left_diff(*args)
    Comparison.new(*args).left_diff
  end

  def right_diff(*args)
    Comparison.new(*args).right_diff
  end
end
