import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:qooking_app/model/recipe_model.dart';
import 'package:transparent_image/transparent_image.dart';


class RecipeListView extends StatefulWidget {
  @override
  RecipeListViewState createState() =>RecipeListViewState();
}

String query = r"""
                      query {
                       allRecipes
                       {
                         id
                         title
                         lead
                         thumbnailUrl
                       }
                      }
                  """;

class RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Query(
        options: QueryOptions(document: query, pollInterval: 60),
        builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.errors != null && result.data == null) {
            return Center(child: Text(result.errors.toString()));
          }

          if (result.loading) {
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.pink,
                ));
          }

          if (result.data == null) {
            return Center(child: Text("No Data Found !"));
          }

          return Center(child: Text("No Data Found !"));

        }
      )
    );
  }
}

Widget buildRow(Recipe recipe) {
  return new RecipeItem(recipe: recipe);
}

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    this.recipe
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "recipe" + recipe.id,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: new EdgeInsets.only(
              left: 0.0, right: 0.0, top: 0.0, bottom: 24.0),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          elevation: 7.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Stack(alignment: Alignment.bottomRight, children: <Widget>[
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: recipe.thumbnailUrl ?? "",
                      height: 300,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: AlignmentDirectional.center,
                    ),
                  ]),
                ],
              ),
            ],
          ),
        )
    );
  }
}
