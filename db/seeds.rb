# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#stock_amount暂时作为价格
products = Product.create([{name: '菲特尼斯有氧塑身踏步机 HLJ-020', image: 'http://static-cdn.eli99.com/system/uploads/2014/10/10/product_detail_image/image/33358/box_400_1412924116.jpg',
  description: '', stock_amount: 20},{name: '车志酷车载干湿两用吸尘器CZK-6103', image: 'http://static-cdn.eli99.com/system/uploads/2014/10/16/product_detail_image/image/34582/box_400_1427259791.jpg',
  description: '', stock_amount: 50},{name: 'FANCL无添加 速净卸妆液120ML', image: 'http://static-cdn.eli99.com/system/uploads/2015/01/20/product_detail_image/image/41906/box_400_1421734690.jpg',
  description: '', stock_amount: 30}])