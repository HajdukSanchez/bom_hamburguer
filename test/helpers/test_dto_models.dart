import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';

const tProductDTO = ProductDTO(
  id: 0,
  name: '',
  price: 0,
  image: '',
  type: ProductType.addition,
);

const tUserDTO = UserDTO(
  name: '',
);

const tDiscountRuleDTO = DiscountRuleDTO(
  products: [tProductDTO],
  discount: 0,
);

const tCatalogDTO = CatalogDTO(
  discounts: [tDiscountRuleDTO],
  products: [tProductDTO],
);
