<!DOCTYPE html>
<html ng-app="yunzhiclub">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <link href="__LIB__/ionic/css/ionic.css" rel="stylesheet">
    <link href="__CSS__/style.css" rel="stylesheet">
    <!-- ionic/angularjs js -->
</head>

<body>
    <ion-nav-view>
        <div class="backdrop visible backdrop-loading active" ng-hide="1"></div>
        <div class="loading-container visible active" ng-hide="1">
            <div class="loading" ng-hide="1"><span>Loading...</span></div>
        </div>
    </ion-nav-view>

    <!--js-->
    <script src="__LIB__/ionic/js/ionic.bundle.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <!-- your app's js -->
    <script src="{:U('indexAppJs')}"></script>
    <!-- <script src="__JS__/app.js"></script>
   <script src="__JS__/controllers.js"></script> -->
    <!-- include -->
    <include file="indexHotel" />
    <include file="indexTabs" />
    <include file="indexHome" />
    <include file="indexRim" />
    <include file="indexFullTime" />
    <include file="indexDate" />
    <include file="indexConfirmOrder" />
    <include file="indexHotel" />
    <include file="indexEvaluation" />
    <include file="indexMap" />
    <include file="indexEvaluationing" />
    <include file="indexSuccess" />
    <include file="indexActivity" />
    <include file="indexActivityDetails" />
    <include file="indexPersonalCenter" />
    <!--支付-->
    <include file="indexPay" />
    <!--订单-->
    <include file="indexOrder" />
    <include file="indexPaySuccess" />
    <include file="indexPayError" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=U7N6PIKHKGEKgXmi5wqNfItn"></script>
</body>

</html>
