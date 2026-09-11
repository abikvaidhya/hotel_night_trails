
class MenuItem {
  final String name;
  final String notes;
  const MenuItem(this.name, this.notes);
}

class MenuGroup {
  final String title;
  final String image;
  final List<MenuItem> items;
  const MenuGroup({required this.title, required this.image, required this.items});
}

const List<MenuGroup> cafeMenu = [
  MenuGroup(
    title: 'Coffee & Espresso',
    image: 'assets/images/cafe_2.jpg',
    items: [
      MenuItem('Drip Coffee', 'Colombian beans, single origin, brewed to order'),
      MenuItem('Cappuccino', 'Double espresso, steamed milk, dense foam'),
      MenuItem('Cinnamon Latte', 'Espresso, steamed milk, toasted cinnamon'),
      MenuItem('Cold Brew', 'Slow steeped eighteen hours, served over ice'),
    ],
  ),
  MenuGroup(
    title: 'Tea & Infusions',
    image: 'assets/images/cafe_4.jpg',
    items: [
      MenuItem('Chamomile Steep', 'Whole chamomile flower, honey on request'),
      MenuItem('Smoked Oolong', 'Pine-smoked leaves, brewed light'),
      MenuItem('Ginger Turmeric', 'Fresh ginger, turmeric root, black pepper'),
      MenuItem('Peppermint Leaf', 'Garden peppermint, steeped hot or iced'),
    ],
  ),
  MenuGroup(
    title: 'Morning Pastries',
    image: 'assets/images/cafe_3.jpg',
    items: [
      MenuItem('Buttermilk Biscuit', 'Cultured butter, served warm with jam'),
      MenuItem('Honey Oat Scone', 'Rolled oats, wildflower honey, toasted almonds'),
      MenuItem('Almond Croissant', 'Laminated dough, almond cream, sliced almonds'),
      MenuItem('Sourdough Toast', 'House-baked loaf, cultured butter, sea salt'),
    ],
  ),
  MenuGroup(
    title: 'Light Bites',
    image: 'assets/images/cafe_1.jpg',
    items: [
      MenuItem('Trailhead Bowl', 'Yogurt, oats, seasonal fruit, honey'),
      MenuItem('Soft Egg Sandwich', 'Soft egg, cheddar, chive, brioche'),
      MenuItem('Seasonal Soup', 'Changes weekly, ask at the counter'),
      MenuItem('Cheese & Fruit Board', 'Local cheese, seasonal fruit, crackers'),
    ],
  ),
];
