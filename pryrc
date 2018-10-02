Pry.config.editor = 'vim'

Pry.config.hooks.add_hook(:before_session, :add_rails_console_methods) do
  self.extend Rails::ConsoleMethods if defined?(Rails::ConsoleMethods)
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
