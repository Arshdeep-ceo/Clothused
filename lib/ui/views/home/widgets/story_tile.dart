import 'package:flutter/material.dart';

class StoryTile extends StatelessWidget {
  const StoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            // clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 0.5,
            child: Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1605637465697-1c5ab764ce29?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlYXV0aWZ1bCUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500'),
                      // child: Image.network(
                      //     'https://images.unsplash.com/photo-1605637465697-1c5ab764ce29?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlYXV0aWZ1bCUyMGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500'),
                    ),
                  ),
                ),
                Text('data'),
              ],
            ),
          );
        });
  }
}
