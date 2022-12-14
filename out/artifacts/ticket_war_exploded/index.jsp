<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/14
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //获取当前项目的项目名
  String path=request.getContextPath();
//获取动态的网络地址      http://ip:port/项目名/
  String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//存入全局域
  application.setAttribute("basePath", basePath);
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>梦田票务</title>
  <link href="${applicationScope.basePath}css/header.css" rel="stylesheet" type="text/css" />
  <link href="${applicationScope.basePath}css/index.css" rel="stylesheet" type="text/css" />
  <script type=text/javascript src="${applicationScope.basePath}js/jquery-1.7.1.min.js"></script>
  <script type=text/javascript src="${applicationScope.basePath}js/ifocus.js"></script>
  <script type="text/javascript" src="${applicationScope.basePath}js/scool.js"></script>
  <script type="text/javascript" src="${applicationScope.basePath}js/imgp.js"></script>
  <script type="text/javascript" src="${applicationScope.basePath}js/jquery.switchable[all].min.js"></script>
  <script type="text/javascript" src="${applicationScope.basePath}js/jquery.jcarousel.pack.js"></script>

  <script>
    $(document).ready(function() {

      //rotation speed and timer
      var speed = 5000;
      var run = setInterval('rotate()', speed);

      //grab the width and calculate left value
      var item_width = $('#slides li').outerWidth();
      var left_value = item_width * (-1);

      //move the last item before first item, just in case user click prev button
      $('#slides li:first').before($('#slides li:last'));

      //set the default item to the correct position
      $('#slides ul').css({'left' : left_value});

      //if user clicked on prev button
      $('#prev').click(function() {

        //get the right position
        var left_indent = parseInt($('#slides ul').css('left')) + item_width;

        //slide the item
        $('#slides ul:not(:animated)').animate({'left' : left_indent}, 200,function(){

          //move the last item and put it as first item
          $('#slides li:first').before($('#slides li:last'));

          //set the default item to correct position
          $('#slides ul').css({'left' : left_value});

        });

        //cancel the link behavior
        return false;

      });


      //if user clicked on next button
      $('#next').click(function() {

        //get the right position
        var left_indent = parseInt($('#slides ul').css('left')) - item_width;

        //slide the item
        $('#slides ul:not(:animated)').animate({'left' : left_indent}, 200, function () {

          //move the first item and put it as last item
          $('#slides li:last').after($('#slides li:first'));

          //set the default item to correct position
          $('#slides ul').css({'left' : left_value});

        });

        //cancel the link behavior
        return false;

      });

      //if mouse hover, pause the auto rotation, otherwise rotate it
      $('#slides').hover(

              function() {
                clearInterval(run);
              },
              function() {
                run = setInterval('rotate()', speed);
              }
      );

    });

    //a simple function to click next link
    //a timer will call this function, and the rotation will begin :)
    function rotate() {
      $('#next').click();
    }



  </script>





  <script type="text/javascript">
    function showarea(){
      var con = document.getElementById("t_area");
      var arealist = con.getElementsByTagName("li");
      var g = document.getElementById("t_con");
      var val2 = "seeeeeee";
      con.style.display = "block";
      for (var i=0;i<arealist.length;i++){
        arealist[i].onmouseover = function(){this.style.backgroundColor = "red"}
        arealist[i].onmouseout = function(){this.style.backgroundColor = "#F1F9FC"}
        arealist[i].onclick = function(){
          g.innerHTML = this.innerHTML ;
          document.getElementById("textnew").innerHTML=g.innerHTML;//赋值给下面一个form的值
          document.getElementById("ttt").value  = document.getElementById("t_con").innerHTML;//赋值给下面一个form的值
          con.style.display = "none";
        }
      }
    }
    function offarea(){      //dissappeared when mouse move out this div
      var con = document.getElementById("t_area");
      con.style.display = "none";
    }
    var timer;
  </script>




  <!--[if IE 6]>
  <script src="${applicationScope.basePath}js/DD_belatedPNG.js"></script>
  <script>
    DD_belatedPNG.fix('.but_gp,.rslides');
  </script>
  <![endif]-->

  <script>
      /**
       * 当页面加载完毕后执行的函数
       */
    $(document).ready(function(){
        $.ajax({
        url:"getNewsSession.do",
        data:{num:4 ,type:2},   //num表示要查询返回的条数，type是场次类型
        dataType:"json",
        success:function(msg) {
            if (msg.code == "200") {
                if (msg.flag == 0) {
                    //表示没有数据
                    $("#mymusic").html(msg.info);
                } else {
                    //表示有数据
                    var mydata=msg.data;
                    var str="";
                    for(let i=0;i<mydata.length;i++){
                         str=str+' <li><a href="getSessionId.do?sessionid='+mydata[i].session_id+'" class="big"><img src="${applicationScope.basePath}images/simg2.jpg" width="125" height="160" /><p>'+mydata[i].session_name+'</p></a><span class="but_gp"><a href="#"></a></span></li>';
                    }
                    $("#mymusic").html(str);

                }
            }
        else  if(msg.code=="500"){
           $("#mymusic").html(msg.info);
        }}
        });


    });



      /**
       * 当页面加载完毕后执行的函数
       */
      $(document).ready(function(){
          $.ajax({
              url:"getNewsSession.do",
              data:{num:8 ,type:1},   //num表示要查询返回的条数，type是场次类型
              dataType:"json",
              success:function(msg) {
                  if (msg.code == "200") {
                      if (msg.flag == 0) {
                          //表示没有数据
                          $("#mysingsong").html(msg.info);
                      } else {
                          //表示有数据
                          var mydata=msg.data;
                          var str="";
                          for(let i=0;i<mydata.length;i++){
                              str=str+'      <li><a href="#"><img src="${applicationScope.basePath}images/simg_07.jpg" width="144" height="189" /></a><span class="but_gp"><a href="#"></a></span><p><a href="#">'+mydata[i].session_name+'</a></p></li>';
                          }
                          $("#mysingsong").html(str);
                      }
                  }
                  else  if(msg.code=="500"){
                      $("#mysingsong").html(msg.info);
                  }}
          });
      });



  </script>

</head>
<body>

<SCRIPT type=text/javascript>
  jQuery(function(){
    $("#changeCity").click(function(a){
      $("#allCity").slideDown(300);
      a.stopPropagation();
      $(this).blur();
    });
    $("#allCity").click(function(a){
      a.stopPropagation()
    });
    $(document).click(function(a){
      a.button!=2 && $("#allCity").slideUp(300)
    });
    $("#foldin").click(function(){
      $("#allCity").slideUp(300)
    });
  });

</SCRIPT>


<div id="header">
 <jsp:include page="head.jsp"></jsp:include>


  <div id="site_nav">
    <div>
      <div class="clearfix nav_post">
        <span><a href="#">精彩专题</a>|<a href="#">最新动态</a></span><p class="yahei"><a href="#">首 页</a><a href="#">巡 演</a><a href="#">订 票</a><a href="#">售票场馆</a></p>

        <div class="nav_menu">
          <dl>
            <dt class="yahei ych"><a href="#">演唱会</a></dt>
            <dd><a href="#">内地</a><a href="#">港台</a><a href="#">日韩</a><a href="#">欧美</a></dd>
            <div class="clear"></div>
            <dt class="yahei hj"><a href="#">话剧歌剧</a></dt>
            <dd><a href="#">内地</a><a href="#">港台</a><a href="#">日韩</a><a href="#">欧美</a><a href="#">歌舞剧</a></dd>
            <div class="clear"></div>
            <dt class="yahei yyh"><a href="#">音乐会</a></dt>
            <dd><a href="#">内地</a><a href="#">港台</a><a href="#">日韩</a><a href="#">欧美</a></dd>
            <div class="clear"></div>
            <dt class="yahei ty"><a href="#">体育赛事</a></dt>
            <dd><a href="#">球类运动</a><a href="#">球类运动</a><a href="#">球类运动</a><a href="#">球类运动</a></dd>
            <div class="clear"></div>
            <dt class="yahei qyzt"><a href="#">曲苑杂坛</a></dt>
            <dd><a href="#">内地</a><a href="#">港台</a><a href="#">日韩</a><a href="#">欧美</a></dd>
            <div class="clear"></div>
            <dt class="yahei etqz"><a href="#">儿童亲子</a></dt>
            <dd><a href="#">内地</a><a href="#">港台</a><a href="#">日韩</a><a href="#">欧美</a></dd>
            <div class="clear"></div>

          </dl>

        </div>

      </div>

    </div>
  </div>
</div>



<div id="index_focus">
            <span class="tu">
                <a href="#" class="lianjie" style=" "> <p><img src="images/focus_01.jpg" height="451" border="0" /></p></a>
                <a href="#" class="lianjie" style=" "> <p><img src="images/focus_01.jpg" height="451" border="0" /></p></a>
                <a href="#" class="lianjie" style=" "> <p><img src="images/focus_01.jpg" height="451" border="0" /></p></a>
                <a href="#" class="lianjie" style=" "> <p><img src="images/focus_01.jpg" height="451" border="0" /></p></a>
                <a href="#" class="lianjie" style=" "> <p><img src="images/focus_01.jpg" height="451" border="0" /></p></a>
            </span>
</div>


<div class="index_jrtj">
  <div class="content">
    <p class="titlestyle1"><strong class="yahei">今日推荐</strong><span>Recommended</span><b><a href="#">七夕中国</a>|<a href="#">林俊杰</a>|<a href="#">音乐节</a>|<a href="#">S.H.E</a>|<a href="#">蔡健雅</a>|<a href="#">任贤齐</a></b></p>
    <div id="carousel_container">
      <div id="carousel_inners">
        <ul id="carousel_ul" class="clearfix artist_l">
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>
          <li><img src="images/simg1.jpg" width="203" height="282" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"></span></li>


        </ul>
      </div>
    </div>
  </div>
  <div id="left_scroll">11</div>
  <div id="right_scroll">22</div>
</div>


<div class="hot_tours">
  <p><img src="images/back01.gif" width="1008" height="11" /></p>
  <div class="content">
    <div class="left_focus floatl">
      <p class="titlestyle1"><strong class="yahei">热门巡演</strong><span>Hot tours</span></p>

      <div id="slide1" class="slide-panel">
        <div>

          <img src="images/simg_02.jpg" width="231" height="319" />

        </div>
      </div>
      <div id="trigger1" class="slide-trigger"><!-- 自动创建 triggers --></div>
      <script type="text/javascript">
        $(function(){
          $("#trigger1").switchable("#slide1 > div > img", { effect: "fade", speed:.5,circular:true }).autoplay();
        });
      </script>

    </div>


    <div class="tours_imgshow floatl">
      <div class="left floatl">
        <ul class="artist_l">
          <li><a href="#"><img src="images/simg_03.jpg" width="128" height="117" /></a><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>场　　馆： ​万事达中心</p></a></li>
          <li><a href="#"><img src="images/simg_03.jpg" width="128" height="117" /></a><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>场　　馆： ​万事达中心</p></a></li>
          <li><a href="#"><img src="images/simg_03.jpg" width="128" height="117" /></a><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>场　　馆： ​万事达中心</p></a></li>
        </ul>
      </div>

      <div class="right floatl">
        <ul class="artist_l">
          <li><img src="images/simg_04.jpg" width="210" height="182" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>场　　馆： ​万事达中心</p></a></li>
          <li><img src="images/simg_04.jpg" width="210" height="182" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>场　　馆： ​万事达中心</p></a></li>
        </ul>
      </div>
    </div>


    <div class="tours_rfocus floatl">
      <div id="carousel">

        <div id="buttons">
          <a href="#" id="prev">prev</a>
          <a href="#" id="next">next</a>
          <div class="clear"></div>
        </div>

        <div class="clear"></div>

        <div id="slides">
          <ul>
            <li><img src="images/pp_zlj.png" width="307" height="299" /></li>
            <li><img src="images/pp_zlj.png" width="307" height="299" /></li>
            <li><img src="images/pp_zlj.png" width="307" height="299" /></li>
          </ul>
          <div class="clear"></div>
        </div>

      </div>


    </div>

    <div class="clear"></div>

  </div>
</div>



<div class="index_1f">
  <p class="cl_title"><span><a href="#">进入话剧歌剧频道</a></span><strong><a href="#">首都剧场</a><a href="#">孟京辉</a><a href="#">开心麻花</a><a href="#">赖声川</a><a href="#">繁星戏剧村</a></strong></p>
  <div class="index_lcbox">
    <div class="f1_left">
      <div class="left_ad">
        <ul class="artist_l">
          <li><img src="images/simg_05.jpg" width="296" height="300" /><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a></li>
        </ul>
      </div>
      <ul class="left_news">
        <li><a href="#">中国国家话剧院话剧《活着》</a></li>
        <li><a href="#">田沁鑫青春爱情三部曲 《夜店之天生绝配》</a></li>
        <li><a href="#">25周年戏剧季《最后14堂星期二的课》</a></li>
        <li><a href="#">第一届两岸三地青年戏剧节 话剧《最后晚餐》</a></li>
      </ul>

      <div class="sm_ad">
        <a href="#"><img src="images/simg_06.jpg" width="296" height="96" /></a>
      </div>

    </div>



    <div class="f1_right">
      <ul id="mysingsong">


      </ul>
    </div>

    <div class="clear"></div>

  </div>

</div>


<div class="index_2f">
  <p class="cl_title"><span><a href="#">进入音乐会频道</a></span><strong><a href="#">首都剧场</a><a href="#">孟京辉</a><a href="#">开心麻花</a><a href="#">赖声川</a><a href="#">繁星戏剧村</a></strong></p>
  <div class="index_lcbox">
    <div class="f2_left">
      <div class="bimg">
        <a href="#"><img src="images/simg_08.jpg" width="369" height="280" /></a>
      </div>
      <div class="topwz">
        <h2 class="yahei"><a href="#">打开音乐之门2013北京音乐厅暑期系列音乐会</a></h2>
        <p>场馆：中山音乐堂</p>
        <p>时间：2013.07.07</p>
        <span class="price"><b>¥80</b>起</span>
      </div>

    </div>


    <div class="f2_right">
      <!--  利用ajax动态加载数据  -->
      <ul class="right_ul clearfix" id="mymusic">

      </ul>

      <div class="effects_box">

        <ul>
          <li>
            <div class="simg"><a href="#"><img src="images/simg_09.jpg" width="188" height="115" /></a></div>
            <div class="right">
              <p class="yahei title"><strong><a href="#">浪A漫中国—理查德·克莱德曼2013北京圣诞音乐会</a></strong></p>
              <p class="cont">北京交响乐团本场大师系列音乐会将与俄罗斯小提琴三杰之一的谢尔盖·克雷诺夫合作百听不厌的《柴可夫斯基：D大调小提琴协奏曲》</p>
              <p class="more"><a href="#">查看更多>></a></p>
            </div>
          </li>

          <li>
            <div class="simg"><a href="#"><img src="images/simg_09.jpg" width="188" height="115" /></a></div>
            <div class="right">
              <p class="yahei title"><strong><a href="#">浪A漫中国—理查德·克莱德曼2013北京圣诞音乐会</a></strong></p>
              <p class="cont">北京交响乐团本场大师系列音乐会将与俄罗斯小提琴三杰之一的谢尔盖·克雷诺夫合作百听不厌的《柴可夫斯基：D大调小提琴协奏曲》</p>
              <p class="more"><a href="#">查看更多>></a></p>
            </div>
          </li>

          <li>
            <div class="simg"><a href="#"><img src="images/simg_09.jpg" width="188" height="115" /></a></div>
            <div class="right">
              <p class="yahei title"><strong><a href="#">浪A漫中国—理查德·克莱德曼2013北京圣诞音乐会</a></strong></p>
              <p class="cont">北京交响乐团本场大师系列音乐会将与俄罗斯小提琴三杰之一的谢尔盖·克雷诺夫合作百听不厌的《柴可夫斯基：D大调小提琴协奏曲》</p>
              <p class="more"><a href="#">查看更多>></a></p>
            </div>
          </li>

        </ul>
        <div><span id="left" class="btn" >left</span> <span id="right" class="btn">right</span></div>
      </div>

    </div>

    <div class="clear"></div>
  </div>
</div>




<div class="index_3f">
  <p class="cl_title"><span><a href="#">进入体育赛事频道</a></span><strong><a href="#">首都剧场</a><a href="#">孟京辉</a><a href="#">开心麻花</a><a href="#">赖声川</a><a href="#">体育赛事</a></strong></p>
  <div class="index_lcbox">
    <div class="left_tops floatl">
      <dl class="clearfix">
        <dt><span>1</span>th</dt>
        <dd>
          <p><a href="#">北京东方荣誉国际搏击俱乐部¥1500起</a></p>
          <p><span>场 馆： ​东方荣誉国际搏击俱乐部</span></p>
        </dd>
      </dl>

      <dl class="clearfix">
        <dt><span>2</span>th</dt>
        <dd>
          <p><a href="#">北京东方荣誉国际搏击俱乐部¥1500起</a></p>
          <p><span>场 馆： ​东方荣誉国际搏击俱乐部</span></p>
        </dd>
      </dl>

      <dl class="clearfix">
        <dt class="hs"><span>3</span>th</dt>
        <dd>
          <p><a href="#">北京东方荣誉国际搏击俱乐部¥1500起</a></p>
          <p><span>场 馆： ​东方荣誉国际搏击俱乐部</span></p>
        </dd>
      </dl>

      <dl class="clearfix">
        <dt class="hs"><span>4</span>th</dt>
        <dd>
          <p><a href="#">北京东方荣誉国际搏击俱乐部¥1500起</a></p>
          <p><span>场 馆： ​东方荣誉国际搏击俱乐部</span></p>
        </dd>
      </dl>

      <dl class="clearfix">
        <dt class="hs"><span>5</span>th</dt>
        <dd>
          <p><a href="#">北京东方荣誉国际搏击俱乐部¥1500起</a></p>
          <p><span>场 馆： ​东方荣誉国际搏击俱乐部</span></p>
        </dd>
      </dl>


      <div class="left_ad">
        <a href="#"><img src="images/simg_ad.jpg" width="289" height="143" /></a>
      </div>

    </div>



    <div class="centt floatl">
      <ul class="artist_l">
        <li><img src="images/simg_10.jpg"  width="210" height="273"/><a href="#" target="_blank" class="ib"><h4>张震岳</h4><p>时　　间：2013.07.01</p><p>场　　馆： ​万事达中心</p></a><span class="but_gp"><a href="#"></a></span></li>
      </ul>
      <div class="js">
        <p>北京东方荣誉国际搏击俱乐部，是全国最专业的拳馆之一，该基地主要以国家级专业运动员为主的训练，旗下多名专综合格斗)为主要特色，打造并建立着中国顶级的MMA(领着大家继续进军国际擂台!</p>
      </div>


    </div>


    <div class="right floatl">
      <ul>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>
        <li><a href="#"><img src="images/simg_11.jpg" width="129" height="167" /></a><p><a href="#">孟京辉导演话剧《活着》</a></p><span class="but_gp"><a href="#"></a></span></li>


      </ul>

    </div>
  </div>
</div>


<div class="index_4f">
  <p class="cl_title"><span><a href="#">进入曲苑杂坛频道</a></span><strong><a href="#">首都剧场</a><a href="#">孟京辉</a><a href="#">开心麻花</a><a href="#">赖声川</a><a href="#">曲苑杂坛</a></strong></p>
  <div class="index_lcbox">
    <div class="left floatl">
      <div class="simg floatl">
        <a href="#"><img src="images/simg_12.jpg" width="215" height="289" /></a>
      </div>

      <div class="js floatl">
        <div class="cont">
          <h3 class="yahei"><a href="#">北京刘老根大舞台</a></h3>
          <p>场　馆： ​刘老根大舞台北京剧场</p>
          <p>票价：<span>¥180</span>起</p>
          <div class="jianj">
            本山传媒是由著名表演艺术家赵本山先生一手创建的大型文化产业集团。本山传媒始终按照“经营面向市场、剧场连锁管理、影视打造明星、产业良性互动”的管理模式和运行机制，一年一个新台阶，一年一个新面貌，2004年，被文化部...
          </div>
        </div>
      </div>
      <div class="clear"></div>
    </div>


    <div class="right floatl">

      <script type="text/javascript">

        function mycarousel_initCallback(carousel)
        {

          carousel.buttonNext.bind('click', function() {
            carousel.startAuto(0);
          });

          carousel.buttonPrev.bind('click', function() {
            carousel.startAuto(0);
          });


          carousel.clip.hover(function() {
            carousel.stopAuto();
          }, function() {
            carousel.startAuto();
          });
        };

        jQuery(document).ready(function() {
          jQuery('#mycarousel').jcarousel({
            auto: 2,
            wrap: 'last',
            initCallback: mycarousel_initCallback
          });
        });

      </script>

      <ul id="mycarousel" class="right_gd jcarousel-skin-tango clearfix">
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_13.jpg" width="140" height="183" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
      </ul>

      <div class="newslist">
        <ul>
          <li><a href="#">周杰伦周边商品盛大起航</a></li>
          <li><a href="#">五月天周边商品火热预售中</a></li>
          <li><a href="#">刷运通卡购古典项目享9.5折优惠</a></li>
          <li><a href="#">刷万事达卡“两人同行 一人免费”</a></li>
        </ul>
      </div>
      <div class="clear"></div>

    </div>


  </div>
</div>



<div class="index_5f">
  <p class="cl_title"><span><a href="#">进入曲苑杂坛频道</a></span><strong><a href="#">首都剧场</a><a href="#">孟京辉</a><a href="#">开心麻花</a><a href="#">赖声川</a><a href="#">曲苑杂坛</a></strong></p>
  <div class="index_lcbox">
    <div class="sibebox floatl">

      <div class="title">
        <ul>
          <li class="sel"><a href="javascript:void(0);">0-3岁</a></li>
          <li><a href="javascript:void(0);">3-6岁</a></li>
          <li><a href="javascript:void(0);">6-12岁</a></li>
          <li><a href="javascript:void(0);">全年龄段</a></li>
        </ul>
      </div>
      <div class="content">
        <div class="within" style=" display: block;">
          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

        </div>
        <div class="within">

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻2历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>


        </div>
        <div class="within">

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮3城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

        </div>


        <div class="within">

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘4城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

          <dl class="clearfix">
            <dt><a href="#"><img src="images/sigm_14.jpg" width="76" height="91" /></a></dt>
            <dd>
              <h2><a href="#">2013全新春季巧虎舞台剧《飘浮城堡的魔幻历险》</a></h2>
              <p>时间：2013.06.29-2013.06.30</p>
              <p class="buy"><a href="#">购买门票</a></p>
            </dd>
          </dl>

        </div>
      </div>
    </div>


    <div class="right floatl">
      <ul class="clearfix">
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>
        <li><a href="#"><img src="images/simg_14.jpg" width="146" height="203" /></a><p><a href="#">舞剧《警幻绝》</a></p></li>


      </ul>

    </div>







  </div>
</div>




<jsp:include page="foot.jsp"></jsp:include>











<script>
  $(function(){
    /**/

    /*effectsBox*/
    var page = 1;
    var i = 1;
    $('.effects_box #left').click(function(){
      var $pictureShow = $('.effects_box');
      var downwidth = $pictureShow.width();
      var len = $('.effects_box ul').find('li').length;
      var effects = $('.effects_box ul');
      var page_number = Math.ceil(len/i);
      if( !effects.is(":animated") ){
        if(page == 1){
          effects.animate({left: '-='+downwidth*(page_number-1)},"slow");
          page = page_number;
        }else{
          effects.animate({left:'+='+downwidth},"slow");
          page--;
        }
      }
    });
    $('.effects_box #right').click(function(){
      var $pictureShow = $('.effects_box');
      var downwidth = $pictureShow.width();
      var len = $('.effects_box ul').find('li').length;
      var effects = $('.effects_box ul');
      var page_number = Math.ceil(len/i);
      if( !effects.is(":animated") ){
        if( page == page_number){
          effects.animate({left:'0px'},"slow");
          page = 1;
        }else{
          effects.animate({left:'-='+downwidth},"slow");
          page++;
        }
      }
    });
    $(".effects_box li").hover( function(){
      $(this).find("h3").slideDown(300);
    },function(){
      $(this).find("h3").slideUp(300);
    });
    $(".effects_box .uclick").click(function(){
      $(".effects_box").animate({ left: -20 }).animate({ left: 20 }).animate({ left: -10 }).animate({ left: 5 }).animate({ left: 0 });
    });
    $(function(){
      var _ebox = $(".effects_box ul"),
              _eboxx = $(".effects_box ul li").width(),
              _eboxi = _ebox.find("li").length;
      _ebox.css({width:_eboxx * _eboxi});
    });

    $(".sibebox li").hover( function(){
      var _cbox = $(this).closest(".sibebox").find(".content .within")
      $(this).addClass("sel").siblings().removeClass("sel");
      _cbox.eq($(this).prevAll().length).show().siblings().hide();
    });

  });
</script>

<!--<script type="text/javascript" src="js/slideshow.js"></script>-->

</body>
</html>
