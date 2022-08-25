import 'package:notes/shared/commander/commands/note_commands.dart';

abstract class Commander<CommandType> {
  Future<void> send<SendType extends CommandType>(SendType command);

  void registerCommandHandler(
    Type command,
    void Function(CommandType command) handler,
  );

  void registerCommandHandlers(
    Type command,
    List<void Function(CommandType command)> handlers,
  );
}

class NoteCommander implements Commander<NoteCommand> {
  final _commandToHandlers = <Type, List<void Function(NoteCommand command)>>{};

  @override
  void registerCommandHandler(
    Type command,
    void Function(NoteCommand command) handler,
  ) {
    var handlers = _commandToHandlers[command];

    if (handlers == null) {
      handlers = [];
      _commandToHandlers[command] = handlers;
    }

    handlers.add(handler);
  }

  @override
  void registerCommandHandlers(
    Type command,
    List<void Function(NoteCommand)> handlers,
  ) {
    var existing = _commandToHandlers[command];

    if (existing == null) {
      existing = [];
      _commandToHandlers[command] = existing;
    }

    existing.addAll(handlers);
  }

  @override
  Future<void> send<SendType extends NoteCommand>(SendType command) async {
    final handlers = _commandToHandlers[SendType];

    if (handlers == null) return;

    for (var handler in handlers) {
      handler.call(command);
    }
  }
}
