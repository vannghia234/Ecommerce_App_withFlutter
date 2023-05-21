class ApiUrl {
  static const baseUrl = 'http://172.29.208.1:3000/api/v1/';

  static const apiGetPublicKey = '${baseUrl}public-key';

  // user api
  // todo: api: login, register,

  // product api
  // todo: get product poppular, get all product, get productbyID, add product to cart, search product by name
  static const apiGetAllProduct = '${baseUrl}product?page=1&pageSize=9';
  static const apiGetProductById = '${baseUrl}product/';
  static const apiGetProductByName = '${baseUrl}product/search?page=1&pageSize=6&name=';

  // todo: api: get table category, seaarch product by category,
  static const apiGetAllCategory = '${baseUrl}product/search?page=1&pageSize=6&name=';
  static const apiGetProductbyCategory = '${baseUrl}product/search?page=1&pageSize=6&name=';

// quý
  // todo: order: get all order by userId, create order
  // todo : user: get user by userId, change info user
  // todo: order-detail: get orderdetail by orderId
  // todo: address: get address by userId, change address
}
