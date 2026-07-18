Item item = Item(name: 'Usman', id: 34, favourite: false);
final name = item.copyWith(name: 'Khalid');

class Item {
  final String name;
  final int id;
  final bool favourite;

  Item({required this.name, required this.id, required this.favourite});

  Item copyWith({String? name, int? id, bool? favourite}) {
    return Item(
      name: name ?? this.name,
      id: id ?? this.id,
      favourite: favourite ?? this.favourite,
    );
  }
}



// copyWith function : agr hum ny Item class ka koi instance create kr lia hy 
// to copyWith method ki help sy hum instance ki value ko change krskty hyn