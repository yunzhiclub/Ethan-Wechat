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
<div class="bar bar-header bar-dark">
    <a href="" class="button button-icon icon ion-close-round"></a>
    <h1 class="title">洛克酒店预订</h1>
  </div>
<!-- 图片轮播 -->
<div class="gundong"><img src="__IMG__/gundong.jpg"></div>
<!-- 各大网站好评 -->
<div><img src="__IMG__/dianping.png"></div>
<!-- 酒店介绍 -->
<div class="list introduction">
    <a class="item item-thumbnail-left" href="#">
      <img src="__IMG__/logo.jpg">
      <h2>酒店介绍</h2>
      <h4>洛克公寓，本来生活。</h4>
      <div><button class="button button-small button-clear button-icon icon ion-wifi">WIFI</button>
      <button class="button button-small button-clear button-icon icon ion-plane">接机服务</button></div>
      <div><button class="button button-small button-clear button-icon icon ion-no-smoking">无烟房</button>
      <button class="button button-small button-clear button-icon icon ion-android-car">免费停车</button></div>
    </a>
</div>
<!-- 查看评论 -->
<div><button class="button button-full button-positive">查看评论</button></div>
<!-- 选择房型 -->
<div class="row fangxing">
  <a class="button button-stable button-full col">全日房</a>
  <div class="line"></div>
  <a href="" class="button button-stable button-full col">小时房</a>
</div>
<!-- 日期 -->
<div class="row">
      <div class="col">
        <h3>日</h3>
        <h3>期</h3>
      </div>
      <div class="col">
      <h6>2015年11月23日入住</h6>
      <h6>2015年11月24日离店</h6>
      </div>
      <a class="col button button-icon icon ion-chevron-right"></a>
</div>
  <div class="bar bar-footer bar-positive row">
    <div class="col">酒店预订</div>
    <div class="col">搜周边</div>    
    <div class="col">活动</div>
    <div class="col">个人中心</div>  
  </div>
</body>
</html>
<style type="text/css">
  .line{
    border: 1px solid #B2B2B2;height: 51px;margin-top: 11px;
  }
  .introduction{
    margin-bottom: 5px;
  }
  .fangxing{
    padding-top: 0px;padding-bottom: 0px;
  }
  .gundong{
    margin-top: 45px;
  }
</style>