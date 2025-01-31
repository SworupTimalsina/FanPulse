import 'package:fanpulse/features/message/presentation/view_model/message_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageView extends StatelessWidget {
  MessageView({super.key});

  final messageNameController = TextEditingController();

  final _messageViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _messageViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: messageNameController,
                decoration: const InputDecoration(
                  labelText: 'Message Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Message name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_messageViewFormKey.currentState!.validate()) {
                    context.read<MessageBloc>().add(
                          CreateMessage(
                              messageName: messageNameController.text),
                        );
                  }
                },
                child: Text('Add Message'),
              ),
              SizedBox(height: 10),
              BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  if (state.messages.isEmpty) {
                    return Center(child: Text('No Messages Added Yet'));
                  } else if (state.isLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          return ListTile(
                            title: Text(message.messageName),
                            subtitle: Text(message.messageId!),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context.read<MessageBloc>().add(
                                      DeleteMessage(id: message.messageId!),
                                    );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
