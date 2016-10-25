<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我爱老家</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
<iframe style="width:100%;height:200px" scrolling="no" frameborder="0" src="header.jsp"></iframe>
<div class="content">
  <div class="clear"></div>
   <div class="content_left">
      <div class="left_top">
         <div class="left_top_zuo">
            <div id="fader">
               <ul>
                  <li><a href="" title=""><img src="images/01.jpg" width="372px" height="242px" alt="李克强在座谈会频发问要求官员不要念稿"></a></li>
                  <li><a href="" title=""><img src="images/02.jpg" width="372px" height="242px" alt="地铁无WIFI覆盖就别怪它影响运行"></a></li>
                  <li><a href="" title=""><img src="images/03.jpg" width="372px" height="242px" alt="全球生育子女条件排名榜出炉 瑞士夺冠"></a></li>
                  <li><a href="" title=""><img src="images/04.jpg" width="372px" height="242px" alt="《看客》美国大选特刊：奥巴马，总统难做"></a></li>
                  <li><a href="" title=""><img src="images/05.jpg" width="372px" height="242px" alt="《看客》美国大选特刊之二：总统的“备胎”"></a></li>
              </ul>
            </div><!--fader(banner) end-->
            <script type="text/javascript" src="js/banner2.js"></script> 
            <div class="scdt">
               <h1>家乡动态</h1>
               <div class="intro">
                  <a href="" title=""><img src="${jxdt_n1.img_path}" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">${jxdt_n1.news_title}</a></h2>
                  <p>${jxdt_n1.news_summary}<a href="<%=path%>/news.do?method=news_detail&news_id=${jxdt_n1.news_id}" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                        <c:forEach var="news1" items="${jxdt_list}">
                        <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="<%=path%>/news.do?method=news_detail&news_id=${news1.news_id}" title="">${news1.news_title}</a></li>
                        </c:forEach>
                  </ul>
               </div><!--list end-->
            </div><!--scdt end-->
            <div class="hyaq">
               <h1>食品安全</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/hyaq.jpg" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">欧盟内部争议多 英国进退皆为难</a></h2>
                  <p>英国在欧元创始之初，就对其抱有怀疑和抵制的态度。截至目前，英国这种态度也未转...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟内部争议多 英国进退皆为难</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">世界艾滋病日临近 三类概念股引关注</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">希腊受援峰回路转 援助协议或下周敲定</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯启动阔轨联盟 泛亚铁路轨距之争升级</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">张茉楠：新兴经济体缘何偏爱增持黄金储备</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美元对主要货币汇率23日普遍下跌</a></li>
                  </ul>
               </div><!--list end-->
            </div><!--hyaq end-->
            <div class="ppzs">
               <h1>特产展示</h1>
               <div class="list">
                 <ul>
                   <li><a href="" title=""><img src="images/ppzs1.jpg" width="101px" height="99px" alt="" /><span>中联重科董事长...</span></a></li>
                   <li><a href="" title=""><img src="images/ppzs2.jpg" width="101px" height="99px" alt="" /><span>领导者不要...</span></a></li>
                   <li><a href="" title=""><img src="images/ppzs3.jpg" width="101px" height="99px" alt="" /><span>拒绝空谈...</span></a></li>
                   <li><a href="" title=""><img src="images/ppzs4.jpg" width="101px" height="99px" alt="" /><span>有远见的CEO们...</span></a></li>
                   <li><a href="" title=""><img src="images/ppzs5.jpg" width="101px" height="99px" alt="" /><span>从软银创始人身...</span></a></li>
                   <li><a href="" title=""><img src="images/ppzs6.jpg" width="101px" height="99px" alt="" /><span>宝洁CEO谈复兴...</span></a></li>
                </ul> 
               </div><!--list end-->   
            </div><!--ppzs end-->
         </div><!--top_left_zuo end-->
         <div class="left_top_you">
            <div class="hyyw">
                <h1><span>家乡要闻</span><a class="more" href="" title="">更多>></a></h1>
                <div class="clear"></div>
                <div class="list">
                  <ul>
                     <li class="li1">
                        <h2><a href="" title="">${jxdt_n1.news_title}</a></h2>
                        <p>${jxdt_n1.news_summary}<a href="<%=path%>/news.do?method=news_detail&news_id=${jxdt_n1.news_id}" title="">[详细]</a></p>
                     </li>
                      <c:forEach var="news2" items="${jxdt_list}">
                        <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="<%=path%>/news.do?method=news_detail&news_id=${news2.news_id}" title="">${news2.news_title}</a></li>
                       </c:forEach>
                   </ul>
                </div>
            </div><!--hyyw end-->
            <div class="hyfx">
                <h1><span>风土人情</span><a class="more" href="" title="">更多>></a></h1>
                <div class="clear"></div>
                <div class="list">
                  <ul>
                     <li class="li1">
                        <h2><a href="" title="">${jxfs_n4.news_title}</a></h2>
                        <p>${jxfs_n4.news_summary}<a href="<%=path%>/news.do?method=news_detail&news_id=${jxfs_n4.news_id}" title="">[详细]</a></p>
                     </li>
                     <c:forEach var="news4" items="${jxfs_list}">
                        <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="<%=path%>/news.do?method=news_detail&news_id=${news4.news_id}" title="">${news4.news_title}</a></li>
                      </c:forEach>
                   </ul>
                </div>
            </div><!--hyfx end-->
            <div class="dfdt">
               <h1>家乡美食</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/dfdt.jpg" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></h2>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                  </ul>
               </div><!--list end-->
            </div><!--dfdt end-->
            <div class="zhxx">
               <h1>家乡特产</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/dfdt.jpg" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></h2>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                  </ul>
               </div><!--list end-->
            </div><!--zhxx end-->
         </div><!--top_left_you end-->
      </div><!--left_top end-->
      <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
      <div class="clear"></div><!--清除浮动-->
      <div class="left_center"><a href="" title=""><img src="images/left_center.jpg" width="754px" height="80px" alt="" /></a></div><!--left_center end-->
      <div class="left_under">
         <div class="left_under_zuo">
           <div class="mjgf">
            <h1>蜜饯果脯</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/mjgf.jpg" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></h2>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                  </ul>
               </div><!--list end-->
         </div><!--mjgf end-->
          </div><!--left_under_zuo end-->
         <div class="left_under_you">
           <div class="mjgf">
            <h1>炒货干果</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/chgg.jpg" width="140px" height="113px" alt="" /></a>
                  <h2><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></h2>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                  </ul>
               </div><!--list end-->
           </div><!--tgmj end-->
         </div><!--left_under_you end-->
      </div><!--left_under end-->
   </div><!--content_left end-->
   <div class="content_right">
      <div class="rdsp">
        <h1>热点视频</h1>
        <ul>
            <li><a href="" title=""><img src="images/rdsp1.jpg" width="108px" height="110px" alt="" /><span>德国会议通过...</span></a></li>
            <li><a href="" title=""><img src="images/rdsp2.jpg" width="108px" height="110px" alt="" /><span>德国会议通过...</span></a></li>
            <li><a href="" title=""><img src="images/rdsp3.jpg" width="108px" height="110px" alt="" /><span>德国会议通过...</span></a></li>
            <li><a href="" title=""><img src="images/rdsp3.jpg" width="108px" height="110px" alt="" /><span>德国会议通过...</span></a></li>
        </ul>
      </div><!--rdsp end-->
      <div class="qyfc">
            <h1>企业风采</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/chgg.jpg" width="110px" height="113px" alt="" /></a>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                  </ul>
               </div><!--list end-->
           </div><!--qyfc end-->
           <div class="rwzf">
               <h1>人物专访</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/rwzf1.jpg" width="110px" height="113px" alt="" /></a>
                  <h2><a href="" title="">阿根廷面临内外两</a></h2>
                  <p>在布宜诺斯艾利斯，罢工工人用...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="intro">
                  <a href="" title=""><img src="images/rwzf2.jpg" width="110px" height="113px" alt="" /></a>
                  <h2><a href="" title="">美财政悬崖忧虑缓</a></h2>
                  <p>美国财政悬崖成为年底前全球经济的...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="intro">
                  <a href="" title=""><img src="images/rwzf3.jpg" width="110px" height="113px" alt="" /></a>
                  <h2><a href="" title="">埃及总统被反对派</a></h2>
                  <p>综合国外媒体报道，埃及总统穆尔西...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
           </div><!--rwzf end-->
           <div class="dfpp">
            <h1>地方品牌</h1>
               <div class="intro">
                  <a href="" title=""><img src="images/dfpp.jpg" width="110px" height="113px" alt="" /></a>
                  <p>欧洲理事会主席范龙佩23日宣布，为期两天的欧盟特别峰会未能就2014年至2020年欧盟...<a href="" title="">[详细]</a></p>
               </div><!--intro end-->
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                  </ul>
               </div><!--list end-->
           </div><!--dfpp end-->
            <div class="zsjm">
               <h1>招商加盟</h1>
               <div class="list">
                  <ul>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">法国巴黎南郊发生枪击案造成1人死亡</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟特别峰会未能就中期预算达成一致</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">美法院判阿偿13亿债务</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧盟将助塞浦路斯展开宏观经济调控</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">欧洲三大股指23日全线上涨</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                      <li><img src="images/dian.png" width="5px" height="5px" alt="" /><a href="" title="">俄罗斯担忧北约在土耳其扩大军事力量</a></li>
                  </ul>
               </div><!--list end-->
           </div><!--zsjm end-->
          </div><!--content_right end-->
   <div class="clear"></div><!--清除浮动-->
   <div class="link">
      <h1></h1>
      <ul>
         <li><a   href="http://www.wzsjz.com/ ">玩转石家庄网</a></li>
         <li><a   href="http://www.0315best.com/">唐山百事通网</a></li>
         <li><a   href="http://www.qhdmsw.com/">秦皇岛美食网</a></li>
         <li><a   href="http://qhd.1000city.cn/ ">秦皇岛之窗</a></li>
         <li><a   href="http://bbs.hdzc.net/">邯郸之窗网</a></li>
         <li><a   href="http://www.0312eat.com/">爱邢网</a></li>
         <li><a   href="http://www.wlcb.cn/">保定吃喝玩乐</a></li>
         <li><a   href="http://www.zjkonline.com/">张家口在线</a></li>
         <li><a   href="http://www.chengdegou.com/">承德购</a></li>
         <li><a   href="http://www.52chengde.com/">承德优惠网</a></li>
         <li><a   href="http://www.580317.com/portal.php">沧州圈</a></li>
         <li><a   href="http://www.langfangtuangou.com/">廊坊生活网</a></li>
         <li><a   href="http://www.hengshui0318.cn/">衡水之家</a></li>
         <li><a   href="http://www.ttxinji.com/">天天辛集网</a></li>
         <li><a   href="http://www.zunhua.org/">遵化热线</a></li>
         <li><a   href="http://www.qa114.com/">迁安信息港</a></li>
         <li><a   href="http://www.so0310.com/">武安天下网</a></li>
         <li><a   href="http://bbs.wa8688.com/">武安之窗</a></li>
         <li><a   href="http://www.name68.com">南宫生活网</a></li>
         <li><a   href="http://www.shahemenhu.com/">沙河门户网</a></li>
         <li><a   href="http://www.anguo365.com/">安国生活网</a></li>
         <li><a   href="http://www.gbdw.net/">高碑店网</a></li>
         <li><a   href="http://www.zzshi.com/">定州热线 </a></li>
         <li><a   href="http://www.cqw.cc/ "> 涿州指尖网</a></li>
         <li><a   href="http://www.botouw.cn/">泊头网</a></li>
        </ul>
   </div><!--link end-->
</div><!--content end-->
	 <div class="footer">
		<p>
			<a href="/gygx/"> 关于我们</a> | <a href=#>人才招聘</a> | <a href="#">联系我们</a>
			| <a href="#">广告合作</a> | <a href="#">业务合作</a> | <a href="#">版权说明</a>
			| <a href="#">免责说明</a> | <a href="#">隐私权保护</a> |<a href="#">法律顾问</a>
		</p>
		<p>
			Copyright 2014-2015 Inc.All Right Reserved <br>我爱老家网 
		</p>

	</div>
	<!--footer end-->

</body>
</html>