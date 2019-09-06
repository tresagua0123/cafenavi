# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Prefecture.create(id:1, name:'北海道')
Prefecture.create(id:2, name:'東北')
Prefecture.create(id:3, name:'関東')
Prefecture.create(id:4, name:'関西')
Prefecture.create(id:5, name:'近畿')
Prefecture.create(id:6, name:'中四国')
Prefecture.create(id:7, name:'九州')
Prefecture.create(id:8, name:'沖縄')
Prefecture.create(id:9, name:'海外')



Tag.create(name:'WiFi有')
Tag.create(name:'充電OK')
Tag.create(name:'駐車場有')
Tag.create(name:'駅ちか')
Tag.create(name:'静か')
Tag.create(name:'作業しやすい')
Tag.create(name:'夜遅く迄営業')
Tag.create(name:'24時間営業')

