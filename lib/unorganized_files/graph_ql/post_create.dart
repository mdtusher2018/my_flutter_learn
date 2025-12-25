import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:template/src/core/utils/logger.dart';
import 'graphql_service.dart';

class PostRepository {
  final GraphQLClient _client = GraphQLService.client(
    GraphQLEndpoint.graphqlZero,
  );

  Future<Map<String, dynamic>> createPost({
    required String title,
    required String body,
  }) async {
    final MutationOptions options = MutationOptions(
      document: gql(r'''
        mutation CreatePost($input: CreatePostInput!) {
          createPost(input: $input) {
            id
            title
            body
          }
        }
      '''),
      variables: {
        'input': {'title': title, 'body': body},
      },
    );

    final result = await _client.mutate(options);
    AppLogger.log(result.data.toString());
    if (result.hasException) {
      throw result.exception!;
    }

    return result.data!['createPost'];
  }
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  bool _isLoading = false;
  String? _resultMessage;

  final PostRepository _repository = PostRepository();

  Future<void> _createPost() async {
    setState(() {
      _isLoading = true;
      _resultMessage = null;
    });

    try {
      final post = await _repository.createPost(
        title: _titleController.text,
        body: _bodyController.text,
      );

      setState(() {
        _resultMessage = 'Post created with ID: ${post['id']}';
      });
    } catch (e) {
      setState(() {
        _resultMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _createPost,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Create Post'),
            ),
            const SizedBox(height: 20),
            if (_resultMessage != null)
              Text(
                _resultMessage!,
                style: TextStyle(
                  color: _resultMessage!.startsWith('Error')
                      ? Colors.red
                      : Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
