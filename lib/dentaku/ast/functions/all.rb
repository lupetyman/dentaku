require_relative './enum'

module Dentaku
  module AST
    class All < Enum
      def value(context = {})
        collection      = Array(@args[0].value(context))
        item_identifier = @args[1].identifier
        expression      = @args[2]

        collection.all? do |item_value|
          expression.value(
            context.merge(
              FlatHash.from_hash_with_intermediates(item_identifier => item_value)
            )
          )
        end
      end
    end
  end
end

Dentaku::AST::Function.register_class(:all, Dentaku::AST::All)
