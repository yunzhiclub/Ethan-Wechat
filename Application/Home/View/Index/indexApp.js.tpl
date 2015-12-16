var app = angular.module('yunzhiclub', ['ionic']);

app.config(function($stateProvider, $urlRouterProvider,$ionicConfigProvider){
    //用$ionicConfigProvider解决了安卓手机上的导航在顶部的bug
    $ionicConfigProvider.platform.ios.tabs.style('standard');
    $ionicConfigProvider.platform.ios.tabs.position('bottom');
    $ionicConfigProvider.platform.android.tabs.style('standard');
    $ionicConfigProvider.platform.android.tabs.position('standard');

    $ionicConfigProvider.platform.ios.navBar.alignTitle('center');
    $ionicConfigProvider.platform.android.navBar.alignTitle('left');

    $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
    $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-android-arrow-back');

    $ionicConfigProvider.platform.ios.views.transition('ios');
    $ionicConfigProvider.platform.android.views.transition('android');
    $stateProvider
    .state('tabs',
    {
        url: "/tab",
        abstract: true,
        templateUrl: "templates/indexTabs.html"
    })
    .state('tabs.home',{
        url: "/home",
        views:{
        	//首页
            'home-tab':{
                templateUrl: "templates/indexHome.html",
                controller: "HomeTabCtrl"
            }
        }
    })
    .state('tabs.evaluation',{
        url: "/evaluation",
        views:{
        	//首页的查看评论
            'home-tab':{
                templateUrl: "templates/indexEvaluation.html"
            }
        }
    })
    .state('tabs.evaluationing',{
        url: "/evaluationing",
        views:{
        	//评论界面
            'home-tab':{
                templateUrl: "templates/indexEvaluationing.html"
            }
        }
    })
    .state('tabs.success',{
        url: "/success",
        views:{
            //评论成功
            'home-tab':{
                templateUrl: "templates/indexSuccess.html"
            }
        }
    })
    .state('tabs.integral1',{
        url: "/integral1",
        views:{
            //我的积分
            'home-tab':{
                templateUrl: "templates/indexIntegral.html"
            }
        }
    })
    .state('tabs.paySuccess1',{
        url: "/paySuccess1",
        views:{
            //支付成功
            'home-tab':{
                templateUrl: "templates/indexPaySuccess.html"
            }
        }
    })
    .state('tabs.date',{
        url: "/date",
        views:{
            //选择日期
            'home-tab':{
                templateUrl: "templates/indexDate.html"
            }
        }
    })
    .state('tabs.hotel',{
        url: "/hotel",
        views:{
            //酒店介绍
            'home-tab':{
                templateUrl: "templates/indexHotel.html"
            }
        }
    })
    .state('tabs.confirmOrder',{
        url: "/confirmOrder",
        views:{
            //填写订单
            'home-tab':{
                templateUrl: "templates/indexConfirmOrder.html"
            }
        }
    })
    .state("tabs.rim",{
        url: "/rim",
        views: {
            "rim-tab":{
            	//搜周边
                templateUrl: "templates/indexRim.html"
            }
        }
    })
    .state("tabs.activity",{
        url: "/activity",
        views: {
            "activity-tab":{
            	//活动
                templateUrl: "templates/indexActivity.html"
            }
        }
    })
    .state("tabs.activityDetail",{
        url: "/activityDetail",
        views: {
            "activity-tab":{
                //活动详情
                templateUrl: "templates/indexActivityDetails.html"
            }
        }
    })
    .state('tabs.personal', {
      url: "/personal",
      views: {
        'personal-tab': {
        	//个人中心
          templateUrl: "templates/indexPersonalCenter.html"
        }
      }
    })
    .state('tabs.toBePaid', {
      url: "/toBePaid",
      views: {
        'personal-tab': {
            //待支付
          templateUrl: "templates/indexToBePaid.html"
        }
      }
    })
    .state('tabs.toBeEvaluation', {
      url: "/toBeEvaluation",
      views: {
        'personal-tab': {
            //待评价
          templateUrl: "templates/indexToBeEvaluation.html"
        }
      }
    })
    .state('tabs.toBeStay', {
      url: "/toBeStay",
      views: {
        'personal-tab': {
            //待入住
          templateUrl: "templates/indexToBeStay.html"
        }
      }
    })
    .state('tabs.paySuccess', {
      url: "/paySuccess",
      views: {
        'personal-tab': {
            //支付成功
          templateUrl: "templates/indexPaySuccess.html"
        }
      }
    })
    .state('tabs.payError', {
      url: "/payError",
      views: {
        'personal-tab': {
            //支付失败
          templateUrl: "templates/indexPayError.html"
        }
      }
    })
    .state('tabs.evaluationing1', {
      url: "/evaluationing1",
      views: {
        'personal-tab': {
            //个人中心待评价的评价界面
          templateUrl: "templates/indexEvaluationing.html"
        }
      }
    })
    .state('tabs.success1',{
        url: "/success",
        views:{
            //个人中心待评价的评论成功
            'home-tab':{
                templateUrl: "templates/indexSuccess.html"
            }
        }
    })
    .state('tabs.allOrder', {
      url: "/allOrder",
      views: {
        'personal-tab': {
            //我的订单
          templateUrl: "templates/indexAllOrder.html"
        }
      }
    })
    .state('tabs.integral2', {
      url: "/integral2",
      views: {
        'personal-tab': {
            //我的积分
          templateUrl: "templates/indexIntegral.html"
        }
      }
    });
   $urlRouterProvider.otherwise("/tab/home");
});

app.controller("HomeTabCtrl", ['$scope', function(){
    console.log('HomeTabCtrl');
}]);

app.controller('SlideCtrl', function($scope) {
  $scope.countEm = [
    '__IMG__/jiudian.jpg',
    '__IMG__/big.jpg',
    '__IMG__/rujia.jpg',
    '__IMG__/tupian.png',
  ];
});

app.controller('MapCtrl', function() {
 // 百度地图API功能
  var map = new BMap.Map("allmap");
  var point = new BMap.Point(117.223579,39.119671);
  map.centerAndZoom(point,12);
  // 创建地址解析器实例
  var myGeo = new BMap.Geocoder();
  // 将地址解析结果显示在地图上,并调整地图视野
  myGeo.getPoint("天津市河西区凯德国贸中心C座（近小白楼地铁站C出口）", function(point){
    if (point) {
      map.centerAndZoom(point, 16);
      map.addOverlay(new BMap.Marker(point));
    }else{
      alert("您选择地址没有解析到结果!");
    }
  }, "天津市");
});
