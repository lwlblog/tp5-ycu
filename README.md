### 前言
本项目为自己的毕业设计作品，自学一个月php结合tp5框架编写的一个小项目，前前后后做了差不多两个月，内容比较简单，适合初学者用来借鉴学习，为了方便使用，我把自己的数据库文件以及学校的数据提供在git上（db.sql），导入数据库即可，具体使用方法如下文描述。如果觉得不错，可以给个star作为鼓励。
**注意：本项目仅供个人学习交流使用！**

### 项目介绍
项目框架：thinkphp5 + layui
数据库：mysql

### 界面展示
如果图片不显示可以复制链接用浏览器打开，或者访问我的 [gitee](https://gitee.com/lwlblog)
#### 首页
![http://lwlblog.gitee.io/img/git/tp5-index.jpg](http://lwlblog.gitee.io/img/git/tp5-index.jpg)
#### 内容分类页
![http://lwlblog.gitee.io/img/git/tp5-category.jpg](http://lwlblog.gitee.io/img/git/tp5-category.jpg)
#### 内容详情页
![http://lwlblog.gitee.io/img/git/tp5-detail.jpg](http://lwlblog.gitee.io/img/git/tp5-detail.jpg)
#### 后台管理
![http://lwlblog.gitee.io/img/git/tp5-admin.jpg](http://lwlblog.gitee.io/img/git/tp5-admin.jpg)

### 使用方法（环境搭建步骤）
1. 安装php集成环境。推荐使用phpStudy。[官网下载](https://www.xp.cn/download.html)
2. 安装MySQL数据库管理工具。推荐使用Navicat。[官网下载](https://www.navicat.com.cn/)
3. 打开phpStudy，启动Apache和MySQL
![http://lwlblog.gitee.io/img/git/tp5-phpstudy1.jpg](http://lwlblog.gitee.io/img/git/tp5-phpstudy1.jpg)
4. 创建网站，注意根目录访问路径在public目录下。具体配置项如下图所示
![http://lwlblog.gitee.io/img/git/tp5-phpstudy2.jpg](http://lwlblog.gitee.io/img/git/tp5-phpstudy2.jpg)
5. 把源代码（ycu文件夹里所有内容）拷贝到上述创建的ycu网站的根目录（C:/phpstudy_pro/WWW/ycu/）下。
6. 打开Navicat，链接MySQL数据库，创建db数据库，导入db.sql文件。
7. 浏览器访问ycu.com进入首页，底部导航进入后台管理，管理员账号admin，密码123456。
