-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.5055
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 blog 的数据库结构
CREATE DATABASE IF NOT EXISTS `blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `blog`;

-- 导出  表 blog.post 结构
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `content` varchar(10000) NOT NULL COMMENT '文章内容',
  `render_content` varchar(10000) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- 正在导出表  blog.post 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `content`, `render_content`, `create_date`, `update_date`) VALUES
	(1, '快速使用JenKins', '# 快速使用JenKins\n\n标签（空格分隔）： JenKins\n\n---\n\n## １、快速开始\n　　我们JenKins的服务器地址为：http://172.20.3.151:8080/jenkins。\n　　由于在SVN中提交过代码的用户会在JenKins中存有（用于发邮件提示）。但是这些用户都是非正式的用户，所以不能直接使用SVN的用户密码登录JenKins。所以建议以SVN的用户名和密码在JenKins上注册之后再登录，这样一来在后期的SVN仓库验证时JenKins会默认以此用户名密码来验证，从而避免了再次输入SVN的用户名密码来验证。\n　　本文只是简单的引导使用，如果想进一步了解可以参考：https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins\n　　\n### 1.1 新建JenKins项目\n　　简单新建一个JenKins的项目，其中的设置使用的都是推荐的设置，如果以下配置不能满足需求则可以根据自己的需求配置。构建的流程如下：\n> 1. 登录后进入主界面，点击右边控制面板的“新建”选项。\n> 2. 然后主页跳转到新的页面**（如图1.1.1所示）**:\n　　a. 然后再Item名称输入项目的名称**（命名规范请参考本文1.4小节）**；\n　　b. 构建自由风格的软件项目**（推荐选择此类型，如果有需求可以选择其他类型）**；\n　　c. 选择完成后点击“OK”按钮。\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.1.png)图 1.1.1</center>\n> 3. 第二步完成后会跳到新页面继续配置项目的详情填写描述信息**（如图1.1.2所示）**。\n> 4. 配置“丢弃旧的构建”，该配置有两种方式供我们选择**（如图1.1.2所示）**：\n　　a. 勾选“丢弃旧的构建”复选框；\n　　b. 保持构建的最大个数，如果非空，最多此数目的构建记录被保存**（推荐选择此方式，并且保留的次数推荐是5~10次）**；\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.2.png)图 1.1.2</center>\n> 5. 配置“源码管理”，我们使用的是SVN来管理源码所以选择“Subversion”配置具体配置**（如图1.1.3与图1.1.4所示）**：\n　　a. 填写源码Repository URL，若有错误则将主域名换成IP试试；\n　　b. 如果用户名和密码与SVN的用户名密码不同则需要验证（如果一样，或已认证则跳过以下步骤）。点击Repository URL输入框后面的问号。\n　　c. 点击“this link”链接，会跳到一个新的页面；\n<center>![图1.3](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.3.png)图 1.1.3</center>　　d. 再次输入Repository URL；\n　　e. 然后输入用户名密码来验证**推荐**；\n　　f. 点击“OK”按钮；\n<center>![图1.4](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.4.png)图 1.1.4</center>　　g. 然后点击close按钮完成验证。\n> 6. 配置“构建触发器”（如图1.1.5所示），**推荐使用“Poll SCM”方式**（按一定周期轮询SVN仓库是否有更新，如果有则触发构建）来触发构建：\n　　a. 选择Poll SCM；\n　　b. 示例每天23:00的时候轮询一次，填写“H 23 * * *”即可，自定义配置可参考 https://zh.wikipedia.org/wiki/Cron。\n<center>![图1.5](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.5.png)图 1.1.5</center>\n> 7. 配置“构建”**（如图1.1.6所示）**：\n　　a. 点击“增加构建步骤”下拉列表框，选择“Invoke top-level Maven targets”使用Maven进行构建；\n　　b. 然后选择“Maven Versioin”，**注意不能是“Default”**；\n　　c. Goals设置为Maven的构建令，**推荐为clean install sonar:sonar”**；\n<center>![图1.6](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.6.png)图 1.1.6</center>\n\n> 8. 配置“构建后操作”之”邮件通知**（如图1.1.7所示）**：\n　　a. 点“增加构建操作步骤”选择“E-mail Notification”；\n　　b. 在Recipients输入框中输入指定的收件人，以空格分隔（只要有特殊的事件发生就会发送邮件给收件人）**推荐填写项目经理、项目管理员或项目监管者的邮件**；\n　　c. 勾选“每次不稳定的够建都发送邮件通知”；\n　　d. 勾选“单独发送邮件给对构造成不良影响的责任人”；\n<center>![图1.7](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.8.png)图 1.1.7</center>\n> 9. 配置完成后点击“保存”或“应用”来保存配置内容。\n\n### 1.2、将项目发布到服务器\n　　在JenKins中可以将项目以不同形式发布到不同的服务器上，其中包括了使用Sonar分析项目并且将报告发布到Soanr服务器、将项目打包好发布到Servlet容器和将项目打包好发布到Nexus私服。如图1.2.1所示：\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/deployroute.png)图1.2.1</center>\n\n#### 1.2.1、发布到Sonar服务器\n　　如果需要使用Sonar对项目的质量进行分析，可以在JenKins项目配置中的构建命令加入**“sonar:sonar”**。具体的配置在1.1小节中的7.c步骤中已配置。\n　　\n#### 1.2.2、 发布到Servlet容器\n　　如果有将项目发布到服务器的需求，比如发布到测试服务器，或者项目已经结项可以发布生产环境。那么可以在项目的配置中进行如下配置使项目能够自动化发布。\n　　增加构建后操作步骤，具体**如图1.2.2.1所示**：\n> 1. 填写war包或者ear包的路径。因为JenKins扫描war包时默认以workspace目录，所以我们可以如此填写“PMS1.0\\_CP1\\_SC\\_20160322/target/*.war”；\n> 2. 填写“Context path”。JenKins会以此重名发布的war包，如填写pms那么发布到服务器下的包名就是pms.war。\n> 3. 选择容器并且填写容器的用户名密码以及链接**（注：此用户必须拥有发布的权限，比如tomcat容器的manager-script或者更高的权限）**。\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.2.1.png)图1.2.2.1</center>\n\n#### 1.2.3、将项目发布到Nexus私服\n　　如果需要将某个项目发布的Nexus私服，供其它项目依赖使用或者备份。那么可以在JenKins项目配置中的构建命令加入**“deploy”**即可。具体**如图1.2.3.1所示**：\n<center>![图1.2.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/deploy.png)<br>图1.2.3.1</center>\n\n　　需要注意的是出了配置“deploy”命令之外，在项目的“pom.xml”文件中进行如下配置：\n```\n<project>\n	<distributionManagement>\n		<repository>\n			<id>thirdparty</id>\n			<name>Nexus Thirdparty Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/thirdparty</url>\n		</repository>\n		<snapshotRepository>\n			<id>snapshots</id>\n			<name>Nexus Snapshot Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/snapshots/</url>\n		</snapshotRepository>\n	</distributionManagement>\n</project>\n```\n　　上述配置一定要遵循以下几点：\n> 1. 两个id的值一定不能改变，因为这个值一定要保证和服务器上的一致（如果改变那么服务器上也必须改变成一致才能发布）；\n> 2. 并且，如果pom.xml文件中的“version”中含有SNAPSHOT，那么包将会发布到snapshots仓库，否则会发布到第三方仓库。\n\n### 1.3、关于项目的构建\n　　在JenKins中分有两种构建方式：自动构建和手动构建。项目构建后会根据项目的配置执行各种操作。\n　　在1.1小节中，我们配置了自动构建项目。所以我们也可以在需要的时候手动触发构建。具体步骤如下**（如图1.3.1所示）**：\n> 1. 在JenKins主页上的项目列表中点击某个项目，进入项目详情页；\n> 2. 点击左边控制面板的“立即构建”，然后可以在构建历史中看到构建正在进行，以及可以查看某次构建的星期；\n> 3. 点击某次构建的详情，会跳转到新页面**（如图1.3.2所示）**；\n> 4. 点击有边控制面板后“Console Output”，查看构建的控制台输出信息。\n<center>![图1.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.1.png)图1.3.1</center>\n<center>![图1.3.2](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.2.png)图1.3.2</center>\n### 1.4、命名规范\n　　先暂定的命名规范为：**项目名称[版本号]\\_项目级别\\_项目来源\\_项目创建日期**。例如PMS1.0\\_CP1\\_SC\\_20160322。\n　　项目级别的分类如下：\n|类型|描述|\n|----|----|\n|原型机|原型机|\n|C1~C4、CP1~CP2、CU1~CU2|C类派生机|\n|ZA2、ZC1、ZC2、ZC3|Z类派生机|\n　　项目的来源分类如下：\n|来源|描述|\n|----|----|\n|SC|市场部下单|\n|NB|内部立项|\n\n## 2、JenKins的任务监控\n### 2.1、全局监控\n　　进入系统后，主页由四个部分组成：\n> 1. 导航菜单：位于页面左上方，方便用户执行各类JenKins操作，如新建用户，系统管理等操作；\n> 2. 构建队列：位于页面左边中间的部分，表示等待执行的构建任务；\n> 3. 构建执行状态：位于页面左下方的部分，表示正在构建的任务；\n> 4. 任务状态：位于页面的右部分，显示了所有任务的状态。\n\n　　具体如图2.1所示：\n　　<center>![JenKins主页](http://7qnbbc.com1.z0.glb.clouddn.com/jenkinsindex.png)图2.1 JenKins主页</center>\n\n　　对于任务列表中的Ｓ和Ｗ类所表示的含义请点击主页右下角的**图例**进行了解。\n　　\n### 2.2、自定义视图\n　　在有很多任务的情况下，会造成项目查找不方便，因此JenKins提供了一个自定义视图让用选择出自己感兴趣的任务，甚至还能自定义视图中显示的列。\n　　用户点击任务列表中**ALL**旁边的加号（+）创建自己的视图，然后根据提示自定义即可。\n\n### 2.3、单个任务监控\n　　在任务视图中，点击任务名称就可以进一步查看任务的状态。具体如图2.2所示：\n　　<center>![JenKins任务主页](http://7qnbbc.com1.z0.glb.clouddn.com/job.png)图2.2 任务状态</center>\n\n　　JenKins的任务状态页面中分为5个部分：\n> 1. 控制面板：可以对任务进行操作，配置等；\n> 2. 构建历史：可以看到项目之前的构建历史，图中显示了最近十次构建记录；\n> 3. 项目信息区：可以查看项目的工作去，以及修改记录，和最新的测试结果；\n> 4. 相关链接：这里提供了一些永久连接，可以快速的访问关键的信息；\n> 5. 图形化视图：这里显示了几种插件工作结果的趋势图，图中有Checkstyle趋势图、FindBugs趋势图以及测试结果趋势图。\n\n　　对于更详细的信息，可以点击对应的链接就可以查看。\n　　\n|head1 head1 head1|head2 head2 head2|head3 head3 head3|head4 head4 head4|\n|---|:---|:---:|---:|\n|row1text1|row1text3|row1text3|row1text4|\n|row2text1|row2text3|row2text3|row2text4|', '', '2016-03-28 00:00:00', '2016-03-28 00:00:00'),
	(2, '更改测试标题！', '更改测试内容！', '', '2016-04-06 17:24:50', '2016-04-06 17:30:10'),
	(3, '插入测试标题！', '插入测试内容！', '', '2016-04-06 17:25:34', NULL),
	(4, '插入测试标题！', '插入测试内容！', '', '2016-04-06 19:16:36', NULL),
	(5, '插入测试标题！', '插入测试内容！', '', '2016-04-06 19:19:09', NULL),
	(6, '快速使用JenKins', '# 快速使用JenKins\n\n标签（空格分隔）： JenKins\n\n---\n\n## １、快速开始\n　　我们JenKins的服务器地址为：http://172.20.3.151:8080/jenkins。\n　　由于在SVN中提交过代码的用户会在JenKins中存有（用于发邮件提示）。但是这些用户都是非正式的用户，所以不能直接使用SVN的用户密码登录JenKins。所以建议以SVN的用户名和密码在JenKins上注册之后再登录，这样一来在后期的SVN仓库验证时JenKins会默认以此用户名密码来验证，从而避免了再次输入SVN的用户名密码来验证。\n　　本文只是简单的引导使用，如果想进一步了解可以参考：https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins\n　　\n### 1.1 新建JenKins项目\n　　简单新建一个JenKins的项目，其中的设置使用的都是推荐的设置，如果以下配置不能满足需求则可以根据自己的需求配置。构建的流程如下：\n> 1. 登录后进入主界面，点击右边控制面板的“新建”选项。\n> 2. 然后主页跳转到新的页面**（如图1.1.1所示）**:\n　　a. 然后再Item名称输入项目的名称**（命名规范请参考本文1.4小节）**；\n　　b. 构建自由风格的软件项目**（推荐选择此类型，如果有需求可以选择其他类型）**；\n　　c. 选择完成后点击“OK”按钮。\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.1.png)图 1.1.1</center>\n> 3. 第二步完成后会跳到新页面继续配置项目的详情填写描述信息**（如图1.1.2所示）**。\n> 4. 配置“丢弃旧的构建”，该配置有两种方式供我们选择**（如图1.1.2所示）**：\n　　a. 勾选“丢弃旧的构建”复选框；\n　　b. 保持构建的最大个数，如果非空，最多此数目的构建记录被保存**（推荐选择此方式，并且保留的次数推荐是5~10次）**；\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.2.png)图 1.1.2</center>\n> 5. 配置“源码管理”，我们使用的是SVN来管理源码所以选择“Subversion”配置具体配置**（如图1.1.3与图1.1.4所示）**：\n　　a. 填写源码Repository URL，若有错误则将主域名换成IP试试；\n　　b. 如果用户名和密码与SVN的用户名密码不同则需要验证（如果一样，或已认证则跳过以下步骤）。点击Repository URL输入框后面的问号。\n　　c. 点击“this link”链接，会跳到一个新的页面；\n<center>![图1.3](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.3.png)图 1.1.3</center>　　d. 再次输入Repository URL；\n　　e. 然后输入用户名密码来验证**推荐**；\n　　f. 点击“OK”按钮；\n<center>![图1.4](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.4.png)图 1.1.4</center>　　g. 然后点击close按钮完成验证。\n> 6. 配置“构建触发器”（如图1.1.5所示），**推荐使用“Poll SCM”方式**（按一定周期轮询SVN仓库是否有更新，如果有则触发构建）来触发构建：\n　　a. 选择Poll SCM；\n　　b. 示例每天23:00的时候轮询一次，填写“H 23 * * *”即可，自定义配置可参考 https://zh.wikipedia.org/wiki/Cron。\n<center>![图1.5](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.5.png)图 1.1.5</center>\n> 7. 配置“构建”**（如图1.1.6所示）**：\n　　a. 点击“增加构建步骤”下拉列表框，选择“Invoke top-level Maven targets”使用Maven进行构建；\n　　b. 然后选择“Maven Versioin”，**注意不能是“Default”**；\n　　c. Goals设置为Maven的构建令，**推荐为clean install sonar:sonar”**；\n<center>![图1.6](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.6.png)图 1.1.6</center>\n\n> 8. 配置“构建后操作”之”邮件通知**（如图1.1.7所示）**：\n　　a. 点“增加构建操作步骤”选择“E-mail Notification”；\n　　b. 在Recipients输入框中输入指定的收件人，以空格分隔（只要有特殊的事件发生就会发送邮件给收件人）**推荐填写项目经理、项目管理员或项目监管者的邮件**；\n　　c. 勾选“每次不稳定的够建都发送邮件通知”；\n　　d. 勾选“单独发送邮件给对构造成不良影响的责任人”；\n<center>![图1.7](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.8.png)图 1.1.7</center>\n> 9. 配置完成后点击“保存”或“应用”来保存配置内容。\n\n### 1.2、将项目发布到服务器\n　　在JenKins中可以将项目以不同形式发布到不同的服务器上，其中包括了使用Sonar分析项目并且将报告发布到Soanr服务器、将项目打包好发布到Servlet容器和将项目打包好发布到Nexus私服。如图1.2.1所示：\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/deployroute.png)图1.2.1</center>\n\n#### 1.2.1、发布到Sonar服务器\n　　如果需要使用Sonar对项目的质量进行分析，可以在JenKins项目配置中的构建命令加入**“sonar:sonar”**。具体的配置在1.1小节中的7.c步骤中已配置。\n　　\n#### 1.2.2、 发布到Servlet容器\n　　如果有将项目发布到服务器的需求，比如发布到测试服务器，或者项目已经结项可以发布生产环境。那么可以在项目的配置中进行如下配置使项目能够自动化发布。\n　　增加构建后操作步骤，具体**如图1.2.2.1所示**：\n> 1. 填写war包或者ear包的路径。因为JenKins扫描war包时默认以workspace目录，所以我们可以如此填写“PMS1.0\\_CP1\\_SC\\_20160322/target/*.war”；\n> 2. 填写“Context path”。JenKins会以此重名发布的war包，如填写pms那么发布到服务器下的包名就是pms.war。\n> 3. 选择容器并且填写容器的用户名密码以及链接**（注：此用户必须拥有发布的权限，比如tomcat容器的manager-script或者更高的权限）**。\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.2.1.png)图1.2.2.1</center>\n\n#### 1.2.3、将项目发布到Nexus私服\n　　如果需要将某个项目发布的Nexus私服，供其它项目依赖使用或者备份。那么可以在JenKins项目配置中的构建命令加入**“deploy”**即可。具体**如图1.2.3.1所示**：\n<center>![图1.2.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/deploy.png)<br>图1.2.3.1</center>\n\n　　需要注意的是出了配置“deploy”命令之外，在项目的“pom.xml”文件中进行如下配置：\n```\n<project>\n	<distributionManagement>\n		<repository>\n			<id>thirdparty</id>\n			<name>Nexus Thirdparty Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/thirdparty</url>\n		</repository>\n		<snapshotRepository>\n			<id>snapshots</id>\n			<name>Nexus Snapshot Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/snapshots/</url>\n		</snapshotRepository>\n	</distributionManagement>\n</project>\n```\n　　上述配置一定要遵循以下几点：\n> 1. 两个id的值一定不能改变，因为这个值一定要保证和服务器上的一致（如果改变那么服务器上也必须改变成一致才能发布）；\n> 2. 并且，如果pom.xml文件中的“version”中含有SNAPSHOT，那么包将会发布到snapshots仓库，否则会发布到第三方仓库。\n\n### 1.3、关于项目的构建\n　　在JenKins中分有两种构建方式：自动构建和手动构建。项目构建后会根据项目的配置执行各种操作。\n　　在1.1小节中，我们配置了自动构建项目。所以我们也可以在需要的时候手动触发构建。具体步骤如下**（如图1.3.1所示）**：\n> 1. 在JenKins主页上的项目列表中点击某个项目，进入项目详情页；\n> 2. 点击左边控制面板的“立即构建”，然后可以在构建历史中看到构建正在进行，以及可以查看某次构建的星期；\n> 3. 点击某次构建的详情，会跳转到新页面**（如图1.3.2所示）**；\n> 4. 点击有边控制面板后“Console Output”，查看构建的控制台输出信息。\n<center>![图1.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.1.png)图1.3.1</center>\n<center>![图1.3.2](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.2.png)图1.3.2</center>\n### 1.4、命名规范\n　　先暂定的命名规范为：**项目名称[版本号]\\_项目级别\\_项目来源\\_项目创建日期**。例如PMS1.0\\_CP1\\_SC\\_20160322。\n　　项目级别的分类如下：\n|类型|描述|\n|----|----|\n|原型机|原型机|\n|C1~C4、CP1~CP2、CU1~CU2|C类派生机|\n|ZA2、ZC1、ZC2、ZC3|Z类派生机|\n　　项目的来源分类如下：\n|来源|描述|\n|----|----|\n|SC|市场部下单|\n|NB|内部立项|\n\n## 2、JenKins的任务监控\n### 2.1、全局监控\n　　进入系统后，主页由四个部分组成：\n> 1. 导航菜单：位于页面左上方，方便用户执行各类JenKins操作，如新建用户，系统管理等操作；\n> 2. 构建队列：位于页面左边中间的部分，表示等待执行的构建任务；\n> 3. 构建执行状态：位于页面左下方的部分，表示正在构建的任务；\n> 4. 任务状态：位于页面的右部分，显示了所有任务的状态。\n\n　　具体如图2.1所示：\n　　<center>![JenKins主页](http://7qnbbc.com1.z0.glb.clouddn.com/jenkinsindex.png)图2.1 JenKins主页</center>\n\n　　对于任务列表中的Ｓ和Ｗ类所表示的含义请点击主页右下角的**图例**进行了解。\n　　\n### 2.2、自定义视图\n　　在有很多任务的情况下，会造成项目查找不方便，因此JenKins提供了一个自定义视图让用选择出自己感兴趣的任务，甚至还能自定义视图中显示的列。\n　　用户点击任务列表中**ALL**旁边的加号（+）创建自己的视图，然后根据提示自定义即可。\n\n### 2.3、单个任务监控\n　　在任务视图中，点击任务名称就可以进一步查看任务的状态。具体如图2.2所示：\n　　<center>![JenKins任务主页](http://7qnbbc.com1.z0.glb.clouddn.com/job.png)图2.2 任务状态</center>\n\n　　JenKins的任务状态页面中分为5个部分：\n> 1. 控制面板：可以对任务进行操作，配置等；\n> 2. 构建历史：可以看到项目之前的构建历史，图中显示了最近十次构建记录；\n> 3. 项目信息区：可以查看项目的工作去，以及修改记录，和最新的测试结果；\n> 4. 相关链接：这里提供了一些永久连接，可以快速的访问关键的信息；\n> 5. 图形化视图：这里显示了几种插件工作结果的趋势图，图中有Checkstyle趋势图、FindBugs趋势图以及测试结果趋势图。\n\n　　对于更详细的信息，可以点击对应的链接就可以查看。\n　　\n|head1 head1 head1|head2 head2 head2|head3 head3 head3|head4 head4 head4|\n|---|:---|:---:|---:|\n|row1text1|row1text3|row1text3|row1text4|\n|row2text1|row2text3|row2text3|row2text4|', '', '2016-03-28 00:00:00', '2016-03-28 00:00:00'),
	(7, '快速使用JenKins', '# 快速使用JenKins\n\n标签（空格分隔）： JenKins\n\n---\n\n## １、快速开始\n　　我们JenKins的服务器地址为：http://172.20.3.151:8080/jenkins。\n　　由于在SVN中提交过代码的用户会在JenKins中存有（用于发邮件提示）。但是这些用户都是非正式的用户，所以不能直接使用SVN的用户密码登录JenKins。所以建议以SVN的用户名和密码在JenKins上注册之后再登录，这样一来在后期的SVN仓库验证时JenKins会默认以此用户名密码来验证，从而避免了再次输入SVN的用户名密码来验证。\n　　本文只是简单的引导使用，如果想进一步了解可以参考：https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins\n　　\n### 1.1 新建JenKins项目\n　　简单新建一个JenKins的项目，其中的设置使用的都是推荐的设置，如果以下配置不能满足需求则可以根据自己的需求配置。构建的流程如下：\n> 1. 登录后进入主界面，点击右边控制面板的“新建”选项。\n> 2. 然后主页跳转到新的页面**（如图1.1.1所示）**:\n　　a. 然后再Item名称输入项目的名称**（命名规范请参考本文1.4小节）**；\n　　b. 构建自由风格的软件项目**（推荐选择此类型，如果有需求可以选择其他类型）**；\n　　c. 选择完成后点击“OK”按钮。\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.1.png)图 1.1.1</center>\n> 3. 第二步完成后会跳到新页面继续配置项目的详情填写描述信息**（如图1.1.2所示）**。\n> 4. 配置“丢弃旧的构建”，该配置有两种方式供我们选择**（如图1.1.2所示）**：\n　　a. 勾选“丢弃旧的构建”复选框；\n　　b. 保持构建的最大个数，如果非空，最多此数目的构建记录被保存**（推荐选择此方式，并且保留的次数推荐是5~10次）**；\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.2.png)图 1.1.2</center>\n> 5. 配置“源码管理”，我们使用的是SVN来管理源码所以选择“Subversion”配置具体配置**（如图1.1.3与图1.1.4所示）**：\n　　a. 填写源码Repository URL，若有错误则将主域名换成IP试试；\n　　b. 如果用户名和密码与SVN的用户名密码不同则需要验证（如果一样，或已认证则跳过以下步骤）。点击Repository URL输入框后面的问号。\n　　c. 点击“this link”链接，会跳到一个新的页面；\n<center>![图1.3](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.3.png)图 1.1.3</center>　　d. 再次输入Repository URL；\n　　e. 然后输入用户名密码来验证**推荐**；\n　　f. 点击“OK”按钮；\n<center>![图1.4](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.4.png)图 1.1.4</center>　　g. 然后点击close按钮完成验证。\n> 6. 配置“构建触发器”（如图1.1.5所示），**推荐使用“Poll SCM”方式**（按一定周期轮询SVN仓库是否有更新，如果有则触发构建）来触发构建：\n　　a. 选择Poll SCM；\n　　b. 示例每天23:00的时候轮询一次，填写“H 23 * * *”即可，自定义配置可参考 https://zh.wikipedia.org/wiki/Cron。\n<center>![图1.5](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.5.png)图 1.1.5</center>\n> 7. 配置“构建”**（如图1.1.6所示）**：\n　　a. 点击“增加构建步骤”下拉列表框，选择“Invoke top-level Maven targets”使用Maven进行构建；\n　　b. 然后选择“Maven Versioin”，**注意不能是“Default”**；\n　　c. Goals设置为Maven的构建令，**推荐为clean install sonar:sonar”**；\n<center>![图1.6](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.6.png)图 1.1.6</center>\n\n> 8. 配置“构建后操作”之”邮件通知**（如图1.1.7所示）**：\n　　a. 点“增加构建操作步骤”选择“E-mail Notification”；\n　　b. 在Recipients输入框中输入指定的收件人，以空格分隔（只要有特殊的事件发生就会发送邮件给收件人）**推荐填写项目经理、项目管理员或项目监管者的邮件**；\n　　c. 勾选“每次不稳定的够建都发送邮件通知”；\n　　d. 勾选“单独发送邮件给对构造成不良影响的责任人”；\n<center>![图1.7](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.8.png)图 1.1.7</center>\n> 9. 配置完成后点击“保存”或“应用”来保存配置内容。\n\n### 1.2、将项目发布到服务器\n　　在JenKins中可以将项目以不同形式发布到不同的服务器上，其中包括了使用Sonar分析项目并且将报告发布到Soanr服务器、将项目打包好发布到Servlet容器和将项目打包好发布到Nexus私服。如图1.2.1所示：\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/deployroute.png)图1.2.1</center>\n\n#### 1.2.1、发布到Sonar服务器\n　　如果需要使用Sonar对项目的质量进行分析，可以在JenKins项目配置中的构建命令加入**“sonar:sonar”**。具体的配置在1.1小节中的7.c步骤中已配置。\n　　\n#### 1.2.2、 发布到Servlet容器\n　　如果有将项目发布到服务器的需求，比如发布到测试服务器，或者项目已经结项可以发布生产环境。那么可以在项目的配置中进行如下配置使项目能够自动化发布。\n　　增加构建后操作步骤，具体**如图1.2.2.1所示**：\n> 1. 填写war包或者ear包的路径。因为JenKins扫描war包时默认以workspace目录，所以我们可以如此填写“PMS1.0\\_CP1\\_SC\\_20160322/target/*.war”；\n> 2. 填写“Context path”。JenKins会以此重名发布的war包，如填写pms那么发布到服务器下的包名就是pms.war。\n> 3. 选择容器并且填写容器的用户名密码以及链接**（注：此用户必须拥有发布的权限，比如tomcat容器的manager-script或者更高的权限）**。\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.2.1.png)图1.2.2.1</center>\n\n#### 1.2.3、将项目发布到Nexus私服\n　　如果需要将某个项目发布的Nexus私服，供其它项目依赖使用或者备份。那么可以在JenKins项目配置中的构建命令加入**“deploy”**即可。具体**如图1.2.3.1所示**：\n<center>![图1.2.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/deploy.png)<br>图1.2.3.1</center>\n\n　　需要注意的是出了配置“deploy”命令之外，在项目的“pom.xml”文件中进行如下配置：\n```\n<project>\n	<distributionManagement>\n		<repository>\n			<id>thirdparty</id>\n			<name>Nexus Thirdparty Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/thirdparty</url>\n		</repository>\n		<snapshotRepository>\n			<id>snapshots</id>\n			<name>Nexus Snapshot Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/snapshots/</url>\n		</snapshotRepository>\n	</distributionManagement>\n</project>\n```\n　　上述配置一定要遵循以下几点：\n> 1. 两个id的值一定不能改变，因为这个值一定要保证和服务器上的一致（如果改变那么服务器上也必须改变成一致才能发布）；\n> 2. 并且，如果pom.xml文件中的“version”中含有SNAPSHOT，那么包将会发布到snapshots仓库，否则会发布到第三方仓库。\n\n### 1.3、关于项目的构建\n　　在JenKins中分有两种构建方式：自动构建和手动构建。项目构建后会根据项目的配置执行各种操作。\n　　在1.1小节中，我们配置了自动构建项目。所以我们也可以在需要的时候手动触发构建。具体步骤如下**（如图1.3.1所示）**：\n> 1. 在JenKins主页上的项目列表中点击某个项目，进入项目详情页；\n> 2. 点击左边控制面板的“立即构建”，然后可以在构建历史中看到构建正在进行，以及可以查看某次构建的星期；\n> 3. 点击某次构建的详情，会跳转到新页面**（如图1.3.2所示）**；\n> 4. 点击有边控制面板后“Console Output”，查看构建的控制台输出信息。\n<center>![图1.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.1.png)图1.3.1</center>\n<center>![图1.3.2](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.2.png)图1.3.2</center>\n### 1.4、命名规范\n　　先暂定的命名规范为：**项目名称[版本号]\\_项目级别\\_项目来源\\_项目创建日期**。例如PMS1.0\\_CP1\\_SC\\_20160322。\n　　项目级别的分类如下：\n|类型|描述|\n|----|----|\n|原型机|原型机|\n|C1~C4、CP1~CP2、CU1~CU2|C类派生机|\n|ZA2、ZC1、ZC2、ZC3|Z类派生机|\n　　项目的来源分类如下：\n|来源|描述|\n|----|----|\n|SC|市场部下单|\n|NB|内部立项|\n\n## 2、JenKins的任务监控\n### 2.1、全局监控\n　　进入系统后，主页由四个部分组成：\n> 1. 导航菜单：位于页面左上方，方便用户执行各类JenKins操作，如新建用户，系统管理等操作；\n> 2. 构建队列：位于页面左边中间的部分，表示等待执行的构建任务；\n> 3. 构建执行状态：位于页面左下方的部分，表示正在构建的任务；\n> 4. 任务状态：位于页面的右部分，显示了所有任务的状态。\n\n　　具体如图2.1所示：\n　　<center>![JenKins主页](http://7qnbbc.com1.z0.glb.clouddn.com/jenkinsindex.png)图2.1 JenKins主页</center>\n\n　　对于任务列表中的Ｓ和Ｗ类所表示的含义请点击主页右下角的**图例**进行了解。\n　　\n### 2.2、自定义视图\n　　在有很多任务的情况下，会造成项目查找不方便，因此JenKins提供了一个自定义视图让用选择出自己感兴趣的任务，甚至还能自定义视图中显示的列。\n　　用户点击任务列表中**ALL**旁边的加号（+）创建自己的视图，然后根据提示自定义即可。\n\n### 2.3、单个任务监控\n　　在任务视图中，点击任务名称就可以进一步查看任务的状态。具体如图2.2所示：\n　　<center>![JenKins任务主页](http://7qnbbc.com1.z0.glb.clouddn.com/job.png)图2.2 任务状态</center>\n\n　　JenKins的任务状态页面中分为5个部分：\n> 1. 控制面板：可以对任务进行操作，配置等；\n> 2. 构建历史：可以看到项目之前的构建历史，图中显示了最近十次构建记录；\n> 3. 项目信息区：可以查看项目的工作去，以及修改记录，和最新的测试结果；\n> 4. 相关链接：这里提供了一些永久连接，可以快速的访问关键的信息；\n> 5. 图形化视图：这里显示了几种插件工作结果的趋势图，图中有Checkstyle趋势图、FindBugs趋势图以及测试结果趋势图。\n\n　　对于更详细的信息，可以点击对应的链接就可以查看。\n　　\n|head1 head1 head1|head2 head2 head2|head3 head3 head3|head4 head4 head4|\n|---|:---|:---:|---:|\n|row1text1|row1text3|row1text3|row1text4|\n|row2text1|row2text3|row2text3|row2text4|', '', '2016-03-28 00:00:00', '2016-03-28 00:00:00'),
	(8, '快速使用JenKins', '# 快速使用JenKins\n\n标签（空格分隔）： JenKins\n\n---\n\n## １、快速开始\n　　我们JenKins的服务器地址为：http://172.20.3.151:8080/jenkins。\n　　由于在SVN中提交过代码的用户会在JenKins中存有（用于发邮件提示）。但是这些用户都是非正式的用户，所以不能直接使用SVN的用户密码登录JenKins。所以建议以SVN的用户名和密码在JenKins上注册之后再登录，这样一来在后期的SVN仓库验证时JenKins会默认以此用户名密码来验证，从而避免了再次输入SVN的用户名密码来验证。\n　　本文只是简单的引导使用，如果想进一步了解可以参考：https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins\n　　\n### 1.1 新建JenKins项目\n　　简单新建一个JenKins的项目，其中的设置使用的都是推荐的设置，如果以下配置不能满足需求则可以根据自己的需求配置。构建的流程如下：\n> 1. 登录后进入主界面，点击右边控制面板的“新建”选项。\n> 2. 然后主页跳转到新的页面**（如图1.1.1所示）**:\n　　a. 然后再Item名称输入项目的名称**（命名规范请参考本文1.4小节）**；\n　　b. 构建自由风格的软件项目**（推荐选择此类型，如果有需求可以选择其他类型）**；\n　　c. 选择完成后点击“OK”按钮。\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.1.png)图 1.1.1</center>\n> 3. 第二步完成后会跳到新页面继续配置项目的详情填写描述信息**（如图1.1.2所示）**。\n> 4. 配置“丢弃旧的构建”，该配置有两种方式供我们选择**（如图1.1.2所示）**：\n　　a. 勾选“丢弃旧的构建”复选框；\n　　b. 保持构建的最大个数，如果非空，最多此数目的构建记录被保存**（推荐选择此方式，并且保留的次数推荐是5~10次）**；\n<center>![图1.1](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.2.png)图 1.1.2</center>\n> 5. 配置“源码管理”，我们使用的是SVN来管理源码所以选择“Subversion”配置具体配置**（如图1.1.3与图1.1.4所示）**：\n　　a. 填写源码Repository URL，若有错误则将主域名换成IP试试；\n　　b. 如果用户名和密码与SVN的用户名密码不同则需要验证（如果一样，或已认证则跳过以下步骤）。点击Repository URL输入框后面的问号。\n　　c. 点击“this link”链接，会跳到一个新的页面；\n<center>![图1.3](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.3.png)图 1.1.3</center>　　d. 再次输入Repository URL；\n　　e. 然后输入用户名密码来验证**推荐**；\n　　f. 点击“OK”按钮；\n<center>![图1.4](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.4.png)图 1.1.4</center>　　g. 然后点击close按钮完成验证。\n> 6. 配置“构建触发器”（如图1.1.5所示），**推荐使用“Poll SCM”方式**（按一定周期轮询SVN仓库是否有更新，如果有则触发构建）来触发构建：\n　　a. 选择Poll SCM；\n　　b. 示例每天23:00的时候轮询一次，填写“H 23 * * *”即可，自定义配置可参考 https://zh.wikipedia.org/wiki/Cron。\n<center>![图1.5](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.5.png)图 1.1.5</center>\n> 7. 配置“构建”**（如图1.1.6所示）**：\n　　a. 点击“增加构建步骤”下拉列表框，选择“Invoke top-level Maven targets”使用Maven进行构建；\n　　b. 然后选择“Maven Versioin”，**注意不能是“Default”**；\n　　c. Goals设置为Maven的构建令，**推荐为clean install sonar:sonar”**；\n<center>![图1.6](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.6.png)图 1.1.6</center>\n\n> 8. 配置“构建后操作”之”邮件通知**（如图1.1.7所示）**：\n　　a. 点“增加构建操作步骤”选择“E-mail Notification”；\n　　b. 在Recipients输入框中输入指定的收件人，以空格分隔（只要有特殊的事件发生就会发送邮件给收件人）**推荐填写项目经理、项目管理员或项目监管者的邮件**；\n　　c. 勾选“每次不稳定的够建都发送邮件通知”；\n　　d. 勾选“单独发送邮件给对构造成不良影响的责任人”；\n<center>![图1.7](http://7qnbbc.com1.z0.glb.clouddn.com/newjob1.8.png)图 1.1.7</center>\n> 9. 配置完成后点击“保存”或“应用”来保存配置内容。\n\n### 1.2、将项目发布到服务器\n　　在JenKins中可以将项目以不同形式发布到不同的服务器上，其中包括了使用Sonar分析项目并且将报告发布到Soanr服务器、将项目打包好发布到Servlet容器和将项目打包好发布到Nexus私服。如图1.2.1所示：\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/deployroute.png)图1.2.1</center>\n\n#### 1.2.1、发布到Sonar服务器\n　　如果需要使用Sonar对项目的质量进行分析，可以在JenKins项目配置中的构建命令加入**“sonar:sonar”**。具体的配置在1.1小节中的7.c步骤中已配置。\n　　\n#### 1.2.2、 发布到Servlet容器\n　　如果有将项目发布到服务器的需求，比如发布到测试服务器，或者项目已经结项可以发布生产环境。那么可以在项目的配置中进行如下配置使项目能够自动化发布。\n　　增加构建后操作步骤，具体**如图1.2.2.1所示**：\n> 1. 填写war包或者ear包的路径。因为JenKins扫描war包时默认以workspace目录，所以我们可以如此填写“PMS1.0\\_CP1\\_SC\\_20160322/target/*.war”；\n> 2. 填写“Context path”。JenKins会以此重名发布的war包，如填写pms那么发布到服务器下的包名就是pms.war。\n> 3. 选择容器并且填写容器的用户名密码以及链接**（注：此用户必须拥有发布的权限，比如tomcat容器的manager-script或者更高的权限）**。\n<center>![图1.2.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.2.1.png)图1.2.2.1</center>\n\n#### 1.2.3、将项目发布到Nexus私服\n　　如果需要将某个项目发布的Nexus私服，供其它项目依赖使用或者备份。那么可以在JenKins项目配置中的构建命令加入**“deploy”**即可。具体**如图1.2.3.1所示**：\n<center>![图1.2.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/deploy.png)<br>图1.2.3.1</center>\n\n　　需要注意的是出了配置“deploy”命令之外，在项目的“pom.xml”文件中进行如下配置：\n```\n<project>\n	<distributionManagement>\n		<repository>\n			<id>thirdparty</id>\n			<name>Nexus Thirdparty Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/thirdparty</url>\n		</repository>\n		<snapshotRepository>\n			<id>snapshots</id>\n			<name>Nexus Snapshot Repository</name>\n			<url>http://172.20.4.71:8081/nexus/content/repositories/snapshots/</url>\n		</snapshotRepository>\n	</distributionManagement>\n</project>\n```\n　　上述配置一定要遵循以下几点：\n> 1. 两个id的值一定不能改变，因为这个值一定要保证和服务器上的一致（如果改变那么服务器上也必须改变成一致才能发布）；\n> 2. 并且，如果pom.xml文件中的“version”中含有SNAPSHOT，那么包将会发布到snapshots仓库，否则会发布到第三方仓库。\n\n### 1.3、关于项目的构建\n　　在JenKins中分有两种构建方式：自动构建和手动构建。项目构建后会根据项目的配置执行各种操作。\n　　在1.1小节中，我们配置了自动构建项目。所以我们也可以在需要的时候手动触发构建。具体步骤如下**（如图1.3.1所示）**：\n> 1. 在JenKins主页上的项目列表中点击某个项目，进入项目详情页；\n> 2. 点击左边控制面板的“立即构建”，然后可以在构建历史中看到构建正在进行，以及可以查看某次构建的星期；\n> 3. 点击某次构建的详情，会跳转到新页面**（如图1.3.2所示）**；\n> 4. 点击有边控制面板后“Console Output”，查看构建的控制台输出信息。\n<center>![图1.3.1](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.1.png)图1.3.1</center>\n<center>![图1.3.2](http://7qnbbc.com1.z0.glb.clouddn.com/1.3.2.png)图1.3.2</center>\n### 1.4、命名规范\n　　先暂定的命名规范为：**项目名称[版本号]\\_项目级别\\_项目来源\\_项目创建日期**。例如PMS1.0\\_CP1\\_SC\\_20160322。\n　　项目级别的分类如下：\n|类型|描述|\n|----|----|\n|原型机|原型机|\n|C1~C4、CP1~CP2、CU1~CU2|C类派生机|\n|ZA2、ZC1、ZC2、ZC3|Z类派生机|\n　　项目的来源分类如下：\n|来源|描述|\n|----|----|\n|SC|市场部下单|\n|NB|内部立项|\n\n## 2、JenKins的任务监控\n### 2.1、全局监控\n　　进入系统后，主页由四个部分组成：\n> 1. 导航菜单：位于页面左上方，方便用户执行各类JenKins操作，如新建用户，系统管理等操作；\n> 2. 构建队列：位于页面左边中间的部分，表示等待执行的构建任务；\n> 3. 构建执行状态：位于页面左下方的部分，表示正在构建的任务；\n> 4. 任务状态：位于页面的右部分，显示了所有任务的状态。\n\n　　具体如图2.1所示：\n　　<center>![JenKins主页](http://7qnbbc.com1.z0.glb.clouddn.com/jenkinsindex.png)图2.1 JenKins主页</center>\n\n　　对于任务列表中的Ｓ和Ｗ类所表示的含义请点击主页右下角的**图例**进行了解。\n　　\n### 2.2、自定义视图\n　　在有很多任务的情况下，会造成项目查找不方便，因此JenKins提供了一个自定义视图让用选择出自己感兴趣的任务，甚至还能自定义视图中显示的列。\n　　用户点击任务列表中**ALL**旁边的加号（+）创建自己的视图，然后根据提示自定义即可。\n\n### 2.3、单个任务监控\n　　在任务视图中，点击任务名称就可以进一步查看任务的状态。具体如图2.2所示：\n　　<center>![JenKins任务主页](http://7qnbbc.com1.z0.glb.clouddn.com/job.png)图2.2 任务状态</center>\n\n　　JenKins的任务状态页面中分为5个部分：\n> 1. 控制面板：可以对任务进行操作，配置等；\n> 2. 构建历史：可以看到项目之前的构建历史，图中显示了最近十次构建记录；\n> 3. 项目信息区：可以查看项目的工作去，以及修改记录，和最新的测试结果；\n> 4. 相关链接：这里提供了一些永久连接，可以快速的访问关键的信息；\n> 5. 图形化视图：这里显示了几种插件工作结果的趋势图，图中有Checkstyle趋势图、FindBugs趋势图以及测试结果趋势图。\n\n　　对于更详细的信息，可以点击对应的链接就可以查看。\n　　\n|head1 head1 head1|head2 head2 head2|head3 head3 head3|head4 head4 head4|\n|---|:---|:---:|---:|\n|row1text1|row1text3|row1text3|row1text4|\n|row2text1|row2text3|row2text3|row2text4|', '', '2016-03-28 00:00:00', '2016-03-28 00:00:00'),
	(9, '创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '', '2016-04-11 17:37:18', NULL),
	(10, '创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '', '2016-04-11 17:38:36', NULL),
	(11, '创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '', '2016-04-11 17:39:31', NULL),
	(12, '创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '', '2016-04-11 17:43:47', NULL),
	(13, '创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '', '2016-04-11 17:45:02', NULL),
	(14, '重构后创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '<p>测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上</p>', '2016-04-12 10:57:01', NULL),
	(15, '重构后创建文章测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '<p>测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上</p>', '2016-04-12 10:58:03', NULL),
	(16, '创建文章函数全重构后测试标题', '测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上', '<p>测试创建文章的内容等等的那里睡大觉发牢骚的开发就爱上</p>', '2016-04-12 11:03:40', NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- 导出  表 blog.post_tag 结构
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL COMMENT '文章标题',
  `tag_id` int(10) unsigned NOT NULL COMMENT '标签标题',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `ptpidfk` (`post_id`),
  KEY `pttidfk` (`tag_id`),
  CONSTRAINT `ptpidfk` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `pttidfk` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 正在导出表  blog.post_tag 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `create_date`, `update_date`) VALUES
	(1, 1, 1, '2016-04-06 19:11:06', '2016-04-06 18:59:26'),
	(2, 4, 1, '2016-04-06 19:37:16', '2016-04-06 19:37:16'),
	(3, 2, 1, '2016-04-06 19:18:18', '0000-00-00 00:00:00'),
	(4, 2, 1, '2016-04-06 19:20:51', '0000-00-00 00:00:00'),
	(5, 2, 1, '2016-04-06 19:21:37', '0000-00-00 00:00:00'),
	(6, 2, 1, '2016-04-06 19:24:08', '0000-00-00 00:00:00'),
	(7, 11, 3, '2016-04-11 17:39:31', '0000-00-00 00:00:00'),
	(8, 11, 4, '2016-04-11 17:39:32', '0000-00-00 00:00:00'),
	(9, 11, 2, '2016-04-11 17:39:32', '0000-00-00 00:00:00'),
	(10, 12, 3, '2016-04-11 17:44:01', '0000-00-00 00:00:00'),
	(11, 12, 4, '2016-04-11 17:44:05', '0000-00-00 00:00:00'),
	(12, 12, 2, '2016-04-11 17:44:08', '0000-00-00 00:00:00'),
	(13, 13, 5, '2016-04-11 17:45:12', '0000-00-00 00:00:00'),
	(14, 13, 6, '2016-04-11 17:45:16', '0000-00-00 00:00:00'),
	(15, 13, 2, '2016-04-11 17:45:19', '0000-00-00 00:00:00'),
	(16, 14, 5, '2016-04-12 10:57:01', '0000-00-00 00:00:00'),
	(17, 14, 6, '2016-04-12 10:57:01', '0000-00-00 00:00:00'),
	(18, 15, 5, '2016-04-12 10:58:03', '0000-00-00 00:00:00'),
	(19, 15, 6, '2016-04-12 10:58:03', '0000-00-00 00:00:00'),
	(20, 16, 5, '2016-04-12 11:03:40', '0000-00-00 00:00:00'),
	(21, 16, 6, '2016-04-12 11:03:40', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;

-- 导出  表 blog.post_user 结构
CREATE TABLE IF NOT EXISTS `post_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '作者id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `pupid` (`post_id`),
  KEY `puaid` (`user_id`),
  CONSTRAINT `puaid` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `pupid` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在导出表  blog.post_user 的数据：~11 rows (大约)
/*!40000 ALTER TABLE `post_user` DISABLE KEYS */;
INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `create_date`, `update_date`) VALUES
	(1, 3, 1, '2016-04-06 19:50:47', '2016-04-06 19:50:47'),
	(2, 4, 1, '2016-04-06 19:44:53', '0000-00-00 00:00:00'),
	(3, 4, 1, '2016-04-06 19:48:20', '0000-00-00 00:00:00'),
	(4, 11, 1, '2016-04-11 17:39:32', '0000-00-00 00:00:00'),
	(5, 11, 2, '2016-04-11 17:39:32', '0000-00-00 00:00:00'),
	(6, 12, 1, '2016-04-11 17:44:15', '0000-00-00 00:00:00'),
	(7, 12, 2, '2016-04-11 17:44:17', '0000-00-00 00:00:00'),
	(8, 13, 1, '2016-04-11 17:45:23', '0000-00-00 00:00:00'),
	(9, 13, 2, '2016-04-11 17:45:24', '0000-00-00 00:00:00'),
	(10, 14, 1, '2016-04-12 10:57:01', '0000-00-00 00:00:00'),
	(11, 14, 2, '2016-04-12 10:57:01', '0000-00-00 00:00:00'),
	(12, 15, 1, '2016-04-12 10:58:03', '0000-00-00 00:00:00'),
	(13, 15, 2, '2016-04-12 10:58:03', '0000-00-00 00:00:00'),
	(14, 16, 1, '2016-04-12 11:03:40', '0000-00-00 00:00:00'),
	(15, 16, 2, '2016-04-12 11:03:40', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `post_user` ENABLE KEYS */;

-- 导出  表 blog.tag 结构
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '标签内容',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  blog.tag 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `tag_name`, `create_date`, `update_date`) VALUES
	(1, '测试分类', '2016-04-06 18:59:04', '2016-04-06 18:59:05'),
	(2, 'Exception', '2016-04-07 09:17:16', '2016-04-07 09:17:16'),
	(3, '创建文章分类1', '2016-04-11 17:39:31', NULL),
	(4, '创建文章分类2', '2016-04-11 17:39:32', NULL),
	(5, '创建文章分类3', '2016-04-11 17:45:08', NULL),
	(6, '创建文章分类4', '2016-04-11 17:45:14', NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- 导出  表 blog.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  blog.user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `create_date`, `update_date`) VALUES
	(1, 'moguichun', 'moguichun', 'moguichun@foxmail.com', '2016-04-06 00:00:00', NULL),
	(2, 'admin', 'admin', 'admin@foxmail.com', '2016-04-07 09:30:41', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
