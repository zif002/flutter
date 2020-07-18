import 'dart:collection';

import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(text: 'Test text 1', author: 'oscar wild'),
    Quote(text: 'Test text 2', author: 'oscar wild'),
    Quote(text: 'Test text 3', author: 'oscar wild'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          children: [...quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
          )).toList(),
          SizedBox(height: 8),
          FlatButton.icon(
            onPressed: () {
              setState(() {
                quotes = [
                  Quote(text: 'Test text 1', author: 'oscar wild'),
                  Quote(text: 'Test text 2', author: 'oscar wild'),
                  Quote(text: 'Test text 3', author: 'oscar wild'),
                ];
              });
            },
            label: Text('revert items'),
            icon: Icon(Icons.new_releases),
          )
          ],
          
      )
    );
  }
}



