// import 'package:fanpulse/features/article/presentation/view_model/article_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ArticleView extends StatelessWidget {
//   ArticleView({super.key});

//   final articleNameController = TextEditingController();

//   final _articleViewFormKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _articleViewFormKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: articleNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Article Name',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter article name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_articleViewFormKey.currentState!.validate()) {
//                     context.read<ArticleBloc>().add(
//                           CreateArticle(
//                               articleName: articleNameController.text),
//                         );
//                   }
//                 },
//                 child: Text('Add Article'),
//               ),
//               SizedBox(height: 10),
//               BlocBuilder<ArticleBloc, ArticleState>(
//                 builder: (context, state) {
//                   if (state.articles.isEmpty) {
//                     return Center(child: Text('No Articles Added Yet'));
//                   } else if (state.isLoading) {
//                     return CircularProgressIndicator();
//                   } else {
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: state.articles.length,
//                         itemBuilder: (context, index) {
//                           final article = state.articles[index];
//                           return ListTile(
//                             title: Text(article.articleName),
//                             subtitle: Text(article.articleId!),
//                             trailing: IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () {
//                                 context.read<ArticleBloc>().add(
//                                       DeleteArticle(id: article.articleId!),
//                                     );
//                               },
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
