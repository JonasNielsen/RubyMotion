# encoding: utf-8

# Keeps track of function bodies for symbol lookup during Ruby method declarations
class YARD::Handlers::C::SymbolHandler < YARD::Handlers::C::Base
  MATCH = %r{\A\s*(?:(?:static|SWIGINTERN)\s+)?(?:intern\s+)?VALUE\s+(\w+)\s*\(}
  handles MATCH
  statement_class ToplevelStatement
  process { symbols[statement.source[MATCH, 1]] = statement }
end
