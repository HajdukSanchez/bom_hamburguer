import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';

const tProduct = Product(
  id: 0,
  name: '',
  price: 0,
  image: '',
  type: ProductType.addition,
);

const tUser = User(
  name: '',
);

const tDiscountRule = DiscountRule(
  products: [tProduct],
  discount: 0,
);

const tCatalog = Catalog(
  discounts: [tDiscountRule],
  products: [tProduct],
);
