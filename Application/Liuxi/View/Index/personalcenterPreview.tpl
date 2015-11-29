<!DOCTYPE html>
<html ng-app="yunzhiclub">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
  <title></title>

  <link href="__LIB__/ionic/css/ionic.css" rel="stylesheet">
  <link href="__CSS__/style.css" rel="stylesheet">

    <!-- IF using Sass (run gulp sass first), then uncomment below and remove the CSS includes above
    <link href="css/ionic.app.css" rel="stylesheet">
  -->
  <!-- ionic/angularjs js -->
  <script src="__LIB__/ionic/js/ionic.bundle.js"></script>

  <!-- your app's js -->
  <script src="__JS__/app.js"></script>

</head>
<body ng-controller="MyCtrl">

<div class="bar bar-header bar-positive">
  <a href="#/app/capture" class="button button-icon icon ion-chevron-left"></a>
  <h1 class="title">个人中心</h1>
  <a href="#/app/capture" class="button button-icon icon ion-gear-a"></a>
</div>

<ion-content class="bar-content">
  <div class="list has-header">
    <a class="item item-avatar" href="#">
    <img src="__IMG__/1024.jpg">
    <h2>昵称</h2>
    <p>手机号</p>
    </a>

    <div class="item item-divider">

    </div>

    <div class="button-bar">
      <a class="button button-light">
        <i class="icon  ion-ios-folder-outline"></i>
        <p>待支付</p>
      </a>
      <a class="button button-light">
        <i class="icon ion-ios-rose-outline"></i>
        <p>待评价</p>
      </a>
      <a class="button button-light">
        <i class="icon ion-ios-browsers-outline"></i>
        <p>待入住</p>
      </a>
    <!--   <a class="tab-item">
        <i class="icon ion-ios-folder-outline"></i>
          待支付
      </a>
      <a class="tab-item">
        <i class="icon ion-ios-rose-outline"></i>
          待评价
      </a>
      <a class="tab-item">
        <i class="icon ion-ios-browsers-outline"></i>
          待入住
      </a> -->
    </div>

    <div class="item item-divider">

    </div>

    <a class="item item-icon-left item-icon-right" href="#">
    <i class="icon ion-ios-list-outline"></i>
      全部订单
    <i class="icon ion-ios-arrow-right"></i>
    </a>
    <a class="item item-icon-left item-icon-right" href="#">
    <i class="icon ion-ios-pricetags-outline"></i>
      查看积分
    <i class="icon ion-ios-arrow-right"></i>
    </a>
    <a class="item item-icon-left item-icon-right" href="#">
    <i class="icon ion-ios-telephone-outline"></i>
      客服  ********
    <i class="icon ion-ios-arrow-right"></i>
    </a>
  </div>
</ion-content>
 
<div class="tabs tabs-icon-top tabs-positive">
  <a class="tab-item">
    <i class="icon ion-ios-home-outline"></i>
      首页
  </a>
  <a class="tab-item">
    <i class="icon ion-ios-paperplane-outline"></i>
      搜周边
  </a>
  <a class="tab-item">
    <i class="icon ion-ios-bookmarks-outline"></i>
      活动
  </a>
  <a class="tab-item">
    <i class="icon ion-ios-person-outline"></i>
      个人中心
  </a>
</div>
</body>
</html>

