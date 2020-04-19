module MethodComposition
  module ClassMethods
    def call(*params)
      new.call(*params)
    end

    def methods_chain(*m_chain)
      (chain << m_chain).flatten!
    end

    def chain
      @chain ||= []
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def call(*params)
    result_proc = self.class.chain.map { |mtd| method(mtd) }
    result_proc.reduce(:>>).call(*params)
  end
end
