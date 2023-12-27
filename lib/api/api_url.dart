class ApiUrl {
  static const baseUrl = 'http://10.13.176.63:3000/api/v1/';

  static const apiGetPublicKey = '${baseUrl}public-key';

  // user api
  // todo: api: login, register,
  static const apiLogin = '${baseUrl}auth/login';
  static const apiRegister = '${baseUrl}auth/register';

  // product api
  // todo: get product poppular, get all product, get productbyID, add product to cart, search product by name
  static const apiGetAllProduct = '${baseUrl}product';
  static const apiGetProductById = '${baseUrl}product/';
  static const apiGetProductByName =
      '${baseUrl}product/search?page=1&pageSize=100&name=';

  static const apiFilterProduct = '${baseUrl}product/filter?orderBy=';

  // todo: api: get table category, seaarch product by category,
  static const apiGetAllCategory = '${baseUrl}categories';
  static const apiGetProductbyCategory = '${baseUrl}product/category/';
  static const apiPostAddtoCart = '${baseUrl}carts/';

  //Api review
  static const apiPostReview = '${baseUrl}review';

  //address api
  static const apiGetAddress = '${baseUrl}address/';
  static const apiPostAddress = '${baseUrl}address';
  static const apiPutAddress = '${baseUrl}address/';
  static const apiGetLocation = '${baseUrl}user/address/';

  //quy
  // todo: order: get all order by userId, create order
  // todo : user: get user by userId, change info user
  // todo: order-detail: get orderdetail by orderId
  // todo: address: get address by userId, change address

  static const apiGetCart = '${baseUrl}carts/'; // user Id
  static const apiGetOrderByUserId = '${baseUrl}order/id/'; // + orderId
  static const apiDeleteCart = '${baseUrl}carts';
  static const apiCreateOrder = '${baseUrl}order/';
  static const apiGetOrderDetailByOrderId =
      '${baseUrl}order/detail/'; // + orderID

  static const apiUpdateStatusOrder = '${baseUrl}order/update';

  static const apiGetUser = '${baseUrl}user/id/'; // + userId
  static const apiUpdateUser = '${baseUrl}user/update';
  static const apiChangePassword = '${baseUrl}user/password';
  static const apiGetUserByEmail = '${baseUrl}user/email/';
  static const apiPutUserPassword = '${baseUrl}user/updatepassword';

  static const apiGetOrderDetail = '${baseUrl}order/detail/'; // + order Id

  //api chat
  static const apiSendMessage = '${baseUrl}chat';
  static const apiGetListAccountChat = '${baseUrl}chat/list';
  static const apiGetMessage = '${baseUrl}chat/message';

  /// write api to get address
  // static const apiGetAddress = baseUrl;
}
