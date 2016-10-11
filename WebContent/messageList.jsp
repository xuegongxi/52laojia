<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我爱老家--信息列表</title>
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link href="css/messagelist.css" type="text/css" rel="stylesheet" />
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery.min.js"></SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/script/jquery-1.4.2.min.js"></SCRIPT>
<SCRIPT>
	jQ = jQuery.noConflict();
</SCRIPT>
<SCRIPT type="text/javascript">
	var strongpw = new Array();
	var pwlength = 6;
</SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath() %>/js/register.js"></SCRIPT>
<style type="text/css">
.bm_h {
	background: rgb(242, 242, 242);
	padding: 0px 10px;
	height: 31px;
	line-height: 31px;
	overflow: hidden;
	border-top-color: rgb(255, 255, 255);
	border-bottom-color: rgb(194, 213, 227);
	border-top-width: 1px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-bottom-style: solid;
	white-space: nowrap;
}

.bbs {
	border-bottom-color: rgb(205, 205, 205) !important;
	border-bottom-width: 1px !important;
	border-bottom-style: solid !important;
}

.bm {
	margin-bottom: 10px;
	background: rgb(255, 255, 255);
	border: 1px solid rgb(205, 205, 205);
}

.bn {
	margin-bottom: 10px;
}

.ptm {
	padding-top: 10px !important;
}

.wp {
	margin: 0px auto;
	width: 998px;
	clear: both;
}

.cl::after {
	height: 0px;
	clear: both;
	display: block;
	visibility: hidden;
	content: ".";
}

.cl {
	zoom: 1;
}

#ct {
	min-height: 300px;
}

.xs2 {
	font-size: 14px !important;
}

.xi2 {
	color: rgb(51, 102, 153);
}

.xi2 a {
	color: rgb(51, 102, 153);
}

.y {
	float: right;
}

.mn {
	overflow: hidden;
}

.flb {
	padding: 10px 10px 8px;
	height: 20px;
	line-height: 20px;
}

.flb em {
	color: rgb(51, 102, 153);
	font-size: 14px;
	font-weight: 700;
	float: left;
}

.flb em a {
	text-decoration: none;
}

.rfm {
	margin: 0px auto;
	width: 760px;
	border-bottom-color: rgb(205, 205, 205);
	border-bottom-width: 1px;
	border-bottom-style: dotted;
}

.rfm a {
	color: rgb(51, 102, 153);
}
.rq {
	color: red;
}
.rfm .rq {
	
}

.rfm th {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm td {
	padding: 10px 2px;
	line-height: 24px;
	vertical-align: top;
}

.rfm .tipwide {
	padding-top: 0px;
}

.rfm th {
	width: 10em;
	text-align: right;
	padding-right: 10px;
}

.rfm .px {
	width: 220px;
}

.rfm .px:focus {
	background: rgb(255, 255, 255);
	border-color: rgb(51, 102, 153);
}

.rfm .p_tip {
	background: rgb(255, 255, 255);
	width: 390px;
	color: rgb(102, 102, 102);
	padding-left: 10px;
	font-style: normal;
	display: none;
	position: absolute;
	z-index: 2;
}

.rfm .p_chk {
	width: 390px;
	color: red;
	padding-left: 10px;
	font-family: Tahoma, "Microsoft Yahei", "Simsun";
	font-weight: 700;
	position: absolute;
	z-index: 1;
}

.rfm #emailmore {
	position: absolute;
}

hr.l {
	background: rgb(205, 205, 205);
	border: currentColor;
	height: 1px;
	color: rgb(205, 205, 205);
}
</style>
<script type="text/javascript" src="js/banner1.js"></script>
</head>

<body>
	<iframe style="width: 100%; height: 200px" scrolling="no"
		frameborder="0" src="header.jsp"></iframe>
	<DIV id="wp" class="wp">
		<DIV id="ct" class="ptm wp cl">
			<div class="more-list">
				<div class="sub-title">新鲜推送</div>
				<a class="item"
					href="http://domestic.firefox.sina.com/16/1011/08/FRG4SVYXQ5UKNC2L.html">
					<img
					src="images/news/77de9208jw1f8nzz6rpc3j20gr0av3zs.jpg"
					alt="济南限购令出台后1周网签量减少5500套">
					<div>
						<h1>济南限购令出台后1周网签量减少5500套</h1>
						<p>10月11日 08:05 齐鲁晚报</p>
						<span> 原标题：楼市降温！济南限购令一出，一周网签量少了5500套
							限购令出台一周，济南新建商品住宅网签量出现断崖式下跌，比限购前下降了76%，济南楼市进入降温期。此外，业内人士指出，网签量下降的客观原因还有…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/WMX85N3Q96RDYHIP.html">
					<img
					src="images/news/PGPN-fxwrtna8218679.jpg"
					alt="10天22城楼市调控加码 房企或因高价拿地陷困局">
					<div>
						<h1>10天22城楼市调控加码 房企或因高价拿地陷困局</h1>
						<p>10月11日 07:54 证券日报</p>
						<span> 原标题：10天内22城楼市调控加码 房企将因高价拿地陷入困局 部分房企将因高价拿地陷入困局 &nbsp;
							聚焦楼市调控新政 编者按：国庆节期间，楼市不平静，22个城市发布楼市调控新政，限购、信贷等多重…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/HXUO2RTFB8Q7NEM4.html">
					<img
					src="images/news/17417a06b26620f9a5982eddcc3eb974.jpg"
					alt="济南环保:齐鲁制药厂泄爆区域环境空气质量恢复">
					<div>
						<h1>济南环保:齐鲁制药厂泄爆区域环境空气质量恢复</h1>
						<p>10月11日 07:51 齐鲁晚报</p>
						<span> 原标题：济南环保：齐鲁制药厂泄爆事故，区域环境空气质量恢复
							2016年10月10日20点50分左右，齐鲁天和惠世制药有限公司废水回收车间一回收罐发生泄爆事故，山东省、济南市有关领导和消防、安监、环保等相关部…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/WCK9BXDA3IHQY57V.html">
					<img
					src="images/news/ay9C-fxwrhpn9630204.jpg"
					alt="温州民房倒塌现场：家属反复拨打失联亲人电话">
					<div>
						<h1>温州民房倒塌现场：家属反复拨打失联亲人电话</h1>
						<p>10月11日 07:45 中国新闻网</p>
						<span> 原标题：直击温州民房倒塌现场：家属反复拨打失联亲人电话 温州民房倒塌现场 张茵 摄
							中新网温州10月11日电（记者 李婷婷）“滴滴滴……”10月10日晚，在浙江省温州市鹿城区中央涂村中央街的一个拐角里，身着…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/QN08PZ75D2F4MI3C.html">
					<img
					src="images/news/ExuS-fxwrhpn9629684.jpg"
					alt="温州民房倒塌:男子用身体护住3岁女童 自己身亡">
					<div>
						<h1>温州民房倒塌:男子用身体护住3岁女童 自己身亡</h1>
						<p>10月11日 07:35 中国新闻网</p>
						<span> 原标题：温州民房倒塌：3岁女孩被男子环抱保护14小时后获救 温州民房倒塌救援现场。 余根铃 摄
							中新网温州10月11日电（记者 李婷婷 见习记者 李倩倩 实习生 陈洁）“救出她的时候，她下意识地紧紧抓住我的手…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/N0VMW7OBQUFHEI3S.html">
					<img
					src="images/news/iu38-fxwrtna8217098.JPG"
					alt="济南药企发生泄爆事故 附近学校常年有酸臭味">
					<div>
						<h1>济南药企发生泄爆事故 附近学校常年有酸臭味</h1>
						<p>10月11日 07:32 中国新闻网</p>
						<span> 原标题：济南齐鲁制药一企业泄爆 隔壁中学家长称常年气味难闻
							济南齐鲁制药一企业10日深夜发生泄爆，图为环境检测车遭到现场的人群围堵，历城二中学生家长要求监测车对现场空气质量进行检测，给出具体的数据…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/07/MYKPGX8D0NW5O34H.html">
					<img
					src="images/news/H39I-fxwrhpq6278249.jpg"
					alt="浙江温州楼房倒塌致22人身亡 现场搜救基本结束">
					<div>
						<h1>浙江温州楼房倒塌致22人身亡 现场搜救基本结束</h1>
						<p>10月11日 07:24 央视</p>
						<span>
							10日凌晨4点，浙江温州市鹿城区双屿街道发生一起楼房倒塌事故，一座约6层楼高楼房的一部分发生垮塌，多人被掩埋。截至今天凌晨1时12分，现场搜救工作基本结束，共搜救出28人，其中确认死亡22人。
							…</span>
					</div>
				</a><a class="item"
					href="http://domestic.firefox.sina.com/16/1011/06/NP4VCFWGDIETBR56.html">
					<img
					src="images/news/d8aD-fxwrtna8213972.jpg"
					alt="“楼疯”众生相：温州炒房团为何缺席本轮狂欢">
					<div>
						<h1>“楼疯”众生相：温州炒房团为何缺席本轮狂欢</h1>
						<p>10月11日 06:08 中国经济周刊</p>
						<span>资料图 韦亮 摄 《中国经济周刊》 记者 劳佳迪 | 上海报道
							9月25日，看起来再寻常不过的一个周日。上海初秋的阳光穿过刚刚开始褪色的行道树，静静洒落在位于商业核心区的一间咖啡馆内。但如果将镜头慢慢拉近…</span>
					</div>
				</a>
			</div>


		</DIV>
	</DIV>





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