class ApiUrl {
  static const baseUrl = 'http://192.168.0.103:3000/api/v1/';

  static const apiGetPublicKey = '${baseUrl}public-key';

  // user api
  // todo: api: login, register,

  // product api
  // todo: get product poppular, get all product, get productbyID, add product to cart, search product by name
  static const apiGetAllProduct = '${baseUrl}product?page=1&pageSize=9';
  static const apiGetProductById = '${baseUrl}product/';
  static const apiGetProductByName =
      '${baseUrl}product/search?page=1&pageSize=6&name=';

  // todo: api: get table category, seaarch product by category,
  static const apiGetAllCategory =
      '${baseUrl}product/search?page=1&pageSize=6&name=';
  static const apiGetProductbyCategory =
      '${baseUrl}product/search?page=1&pageSize=6&name=';

// quý
  // todo: order: get all order by userId, create order
  // todo : user: get user by userId, change info user
  // todo: order-detail: get orderdetail by orderId
  // todo: address: get address by userId, change address

  //quy
  // todo: order: get all order by userId, create order
  // todo : user: get user by userId, change info user
  // todo: order-detail: get orderdetail by orderId
  // todo: address: get address by userId, change address

  static const apiGetOrderByUserId = '${baseUrl}order/'; // + orderId
  static const apiCreateOrder = '${baseUrl}order';

  static const apiGetUser = '${baseUrl}user/id/'; // + userId
  static const apiUpdateUser = '${baseUrl}user/update';

  static const apiGetOrderDetail = '${baseUrl}order/detail/'; // + order Id

  /// write api to get address
  static const apiGetAddress = baseUrl;
}
