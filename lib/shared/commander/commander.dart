class CommanderBuilder {
  final _commandToHandlers = <Type, CommandHandlerGroup>{};
  
  CommanderBuilder addGroup<RegisterType>(CommandHandlerGroup<RegisterType> group) {
    _commandToHandlers.putIfAbsent(RegisterType, () => group);
    return this;
  }
  
  Commander finalize() {
    return Commander(_commandToHandlers);
  }
}

class Commander {
  Commander(this._commandToHandlers);
  final Map<Type, CommandHandlerGroup> _commandToHandlers;

  Future<void> order<SendType>(SendType command) async {
    print("ordering");
    final group = _commandToHandlers[SendType];
    group?.send(command);
  }
}

class CommandHandlerGroup<CommandType> {
  CommandHandlerGroup(List<void Function(CommandType command)> handlers) : _handlers = handlers;
  final List<void Function(CommandType)> _handlers;

  void send(dynamic command) {
    if (command is CommandType) {
      for (var handler in _handlers) {
        handler.call(command);
      }
    }
  }
}
