import 'package:delimeals/data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailed extends StatelessWidget {
  static const routename = '/meal-detailed';

  Widget buildSectionTitle(String text) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway'),
      ),
    );
  }

  Widget buildSectionContainer(
      BuildContext context, double height, Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: height,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSectionTitle('Ingredients'),
          buildSectionContainer(
            context,
            230,
            ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectMeal.steps[index]),
                    ),
                  );
                }),
          ),
          buildSectionTitle('Steps'),
          buildSectionContainer(
            context,
            250,
            ListView.builder(
                itemCount: selectMeal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        radius: 25,
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectMeal.steps[index]),
                    ),
                    Divider()
                  ]);
                }),
          )
        ]),
      ),
    );
  }
}
