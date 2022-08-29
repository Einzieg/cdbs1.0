/*
Navicat MySQL Data Transfer

Source Server         : Einzieg
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : cdbs1.0

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2022-08-10 23:51:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(9) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(11) NOT NULL,
  `admin_password` varchar(15) NOT NULL,
  `admin_state` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `cinema_id` int(9) NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(20) NOT NULL,
  `cinema_seat` int(11) NOT NULL,
  `cinema_state` int(1) NOT NULL,
  PRIMARY KEY (`cinema_id`),
  KEY `cinema_name` (`cinema_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES ('1', '1号激光巨幕厅', '99', '1');
INSERT INTO `cinema` VALUES ('2', '2号IMAX4D厅', '99', '1');
INSERT INTO `cinema` VALUES ('3', '3号DMAX巨幕·DTS厅', '99', '1');
INSERT INTO `cinema` VALUES ('4', '4号激光厅', '99', '1');
INSERT INTO `cinema` VALUES ('5', '5号激光厅', '99', '1');
INSERT INTO `cinema` VALUES ('6', '6号杜比全景声巨幕厅', '99', '1');
INSERT INTO `cinema` VALUES ('7', '7号亿海红旗厅', '99', '1');
INSERT INTO `cinema` VALUES ('8', '8号VIP厅(免费提供爆米花可乐)', '99', '1');

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `film_id` int(9) NOT NULL AUTO_INCREMENT,
  `film_type` varchar(255) NOT NULL,
  `film_name` varchar(255) NOT NULL,
  `film_poster` varchar(255) NOT NULL,
  `director_name` varchar(255) NOT NULL,
  `performer_name` varchar(255) NOT NULL,
  `film_introduce` varchar(2550) NOT NULL,
  `film_language` varchar(255) NOT NULL,
  `film_time` varchar(255) NOT NULL,
  `movie_showtime` date NOT NULL,
  `ticket_price` float NOT NULL,
  `film_status` int(11) NOT NULL,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('9', '爱情/剧情/动画', '你的名字', '15831832-648a-4ee2-a0e6-df0f997ed17d97f06b3f7c8fea66646066401d5709d51424e1d5.png@466w_260h.webp', '新海诚', '神木隆之介、上白石萌音、长泽雅美、市原悦子、成田凌、悠木碧、岛崎信长、石川界人、谷花音、寺杣昌纪、大原沙耶香、井上和彦、茶风林、加藤有花、花泽香菜、寺崎裕香', '在远离大都会的小山村，住着巫女世家出身的高中女孩宫水三叶。不知从何时起，三叶在梦中就会变成一个住在东京的高中男孩。另一方面，住在东京的高中男孩立花泷则总在梦里来到陌生的小山村，以女孩子的身份过着全新的生活。许是受那颗神秘彗星的影响，立花和三叶在梦中交换了身份。', '日语', '106分钟', '2016-08-26', '0', '1');
INSERT INTO `film` VALUES ('10', '冒险/动画/喜剧/奇幻', '精灵旅社4：变身大冒险', '65bce7aa-447e-4f4a-864a-faedfdf1b024f8dc856ed9090af8042964342869082ca245b2c8.jpg@1128w_730h.webp', '德里克·德莱蒙,詹妮弗·克鲁斯卡', '布赖恩·哈尔 安迪·萨姆伯格 赛琳娜·戈麦斯 凯瑟琳·哈恩 史蒂夫·布西密 大卫·斯佩德 科甘-迈克尔·凯 阿什·布林克夫 布拉德·阿布瑞尔 法兰·德瑞雪 吉姆·加菲根 莫莉·香侬 ChloéMalaisé ZoeBerri AaronLaPlante', '在精灵旅社125周年庆典派对上，一场意外使德古拉带领的精灵家族首次变身成人，而约翰尼则成了怪兽。为了寻找治疗方法，这对冤家翁婿前往危机重重的南美雨林开启了一场欢乐又刺激的冒险之旅。', '英语', '88分钟', '2022-04-03', '0', '1');
INSERT INTO `film` VALUES ('11', '剧情/喜剧/动作', '让子弹飞', '0c81695b-058b-450e-a8ae-9f2442417a961c950a7b02087bf445efb670f2d3572c11dfcf2c.webp', '姜文', '姜文、葛优、周润发、刘嘉玲、陈坤、张默、姜武、周韵、廖凡、姚橹、邵兵、苗圃、冯小刚、胡军', '民国年间，花钱捐得县长的马邦德（葛优 饰）走马上任，遭劫匪张麻子（姜文 饰）一伙伏击。马为保命，谎称自己是县长的汤师爷。为汤师爷许下的财富所动，张麻子摇身一变，化身县长，带着手下上任。鹅城地处偏僻，一方霸主黄四郎（周润发 饰）只手遮天，全然不将新来的县长放在眼里。鹅城上空愁云密布，血雨腥风在所难免……', '中文', '127分钟', '2010-12-16', '0', '1');
INSERT INTO `film` VALUES ('12', '动作/科幻/冒险', '环太平洋', '775e0641-75b5-4f6f-be1e-6dbd124c0e385d2547fccd75717eab7426cb94b021ec71473b76.png@220w_296h_1c.webp', '吉尔莫·德尔·托罗', '查理·汉纳姆 菊地凛子 伊德里斯·艾尔巴 查理·戴 朗·普尔曼 罗伯特·卡辛斯基 马克斯·马蒂尼 伯恩·戈曼 小克利夫顿·克林斯 芦田爱菜 迪亚哥·克莱特霍夫 希瑟·多克森 罗伯特·梅耶 刘智福 刘智满 刘智堂', '近未来，地球环境逐步恶化。神秘外星殖民者通过大洋底部的虫洞“缺口”将身形庞大、残冷迅猛、身藏剧毒的怪兽接连派往地球，有条不紊地实施着它们的殖民毁灭计划。为此，人类联手打造“贼鸥计划”，制造出与怪兽体型相当的机甲战士迎战，但随着怪兽渐次进化，机甲战士全面溃败，复活的“流浪者”即将与另外三台仅存的机甲战士迎战更强大的怪兽侵略者，同时寻找彻底扫除敌人的良机。苍茫的大海之上，人类保卫之战接连而起……', '英语', '131分钟', '2013-07-31', '0', '1');
INSERT INTO `film` VALUES ('13', '剧情/犯罪/小说改', '肖申克的救赎', '65a07521-0c0c-4657-ac20-d859e2e1cd381a8e6a7405d631b399098e46c267d028e618bc75.jpg@220w_296h_1c.webp', '弗兰克·德拉邦特', '蒂姆·罗宾斯 摩根·弗里曼 鲍勃·冈顿 威廉姆·赛德勒 克兰西·布朗 吉尔·贝罗斯 马克·罗斯顿 詹姆斯·惠特摩 杰弗里·德曼 拉里·布兰登伯格 尼尔·吉恩托利 布赖恩·利比 大卫·普罗瓦尔 约瑟夫·劳格诺 祖德·塞克利拉 保罗·麦克兰尼 芮妮·布莱恩 阿方索·弗里曼 V·J·福斯特 弗兰克·梅德拉诺 马克·迈尔斯 尼尔·萨默斯 耐德·巴拉米 布赖恩·戴拉特 唐·麦克马纳斯', '20世纪40年代末，银行家安迪因涉嫌杀害妻子及她的情夫而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈。未过多久，安迪尝试接近囚犯中颇有声望的瑞德，二人逐渐熟稔，安迪也仿佛在鱼龙混杂、罪恶横生、黑白混淆的牢狱中找到属于自己的求生之道。他利用自身的专业知识，渐渐受到礼遇。表面看来，他已如瑞德那样对那堵高墙从憎恨转变为处之泰然，但是对自由的渴望仍促使他朝着心中的希望和目标前进……', '英语', '142分钟', '1994-09-23', '0', '1');
INSERT INTO `film` VALUES ('14', '喜剧/动作/犯罪', '功夫', '4cba3e90-2703-4084-a117-98a52026ee6f0c65b23a92ea20115147df841cdfaa3e4b1170df.png@282w_375h.webp', '周星驰', '周星驰 元秋 元华 黄圣依 梁小龙 陈国坤 田启文 林子聪 林雪 冯克安 释彦能 冯小刚 袁祥仁 张一白 赵志凌 董志华 何文辉 陈凯师 贾康熙 林子善 任珈锐 王仕颖', '1940年代，自小受尽欺辱的街头混混阿星（周星驰）为了能出人头地，可谓窥见机会的缝隙就往里钻，今次他盯上行动日益猖獗的黑道势力“斧头帮”，想借之大名成就大业。阿星假冒“斧头帮”成员试图在一个叫“猪笼城寨”的地方对居民敲诈，不想引来真的“斧头帮”与“猪笼城寨”居民的恩怨。“猪笼城寨”原是藏龙卧虎之处，居民中有许多身怀绝技者，他们隐藏于此本是为远离江湖恩怨，不想麻烦自动上身，躲都躲不及。而在观战正邪两派的斗争中，阿星逐渐领悟功夫的真谛。', '中文', '95分钟', '2004-12-23', '0', '1');
INSERT INTO `film` VALUES ('15', '爱情/奇幻/动画', '天气之子', '51e915a8-3bdb-4bd5-bd98-7c40a8a5297733680a2209c4dba76322b2ffeeaf3dd821db576c.png@282w_375h.webp', '新海诚', '醍醐虎汰朗 森七菜 小栗旬 本田翼 倍赏千惠子 吉柳咲良 平泉成 梶裕贵 木村良平 柴田秀胜 野泽雅子 花泽香菜 佐仓绫音', '高一那年夏天，帆高（醍醐虎汰朗 配音）离开位在离岛的家乡，独自一人来到东京，拮据的生活迫使他不得不找份工作，最后来到一间专门出版奇怪超自然刊物的出版社担任写手。不久，东京开始下起连日大雨，仿佛暗示着帆高不顺遂的未来，在这座繁忙城市里到处取材的帆高邂逅了与弟弟相依为命，不可思议的美少女阳菜（森七菜 配音）。「等等就会放晴了喔。」阳菜这样告诉着帆高，不久，头顶的乌云逐渐散去，耀眼的阳光洒落街道……原来，阳菜拥有「改变天气」的奇妙能力……', '日语', '113分钟', '2019-11-01', '0', '1');
INSERT INTO `film` VALUES ('16', '剧情/科幻/冒险', '星际穿越', '1766e5f5-cf19-4069-aa11-28f0dbc5c0f33b8acd7a69aa3462297b0b1f206e7093e4961914.jpg@282w_375h.webp', '克里斯托弗·诺兰', '马修·麦康纳 安妮·海瑟薇 杰西卡·查斯坦 卡西·阿弗莱克 迈克尔·凯恩 马特·达蒙 麦肯吉·弗依 蒂莫西·柴勒梅德 艾伦·伯斯汀 约翰·利思戈 韦斯·本特利 大卫·吉亚西 比尔·欧文 托弗·戈瑞斯 科莱特·沃夫 弗朗西斯·X·麦卡蒂 安德鲁·博尔巴 乔什·斯图沃特 莱雅·卡里恩斯 利亚姆·迪金森 杰夫·赫普内尔 伊莱耶斯·加贝尔 布鲁克·史密斯 大卫·奥伊罗 威廉姆·德瓦内 拉什·费加 格里芬·弗雷泽 弗洛拉·诺兰', '近未来的地球黄沙遍野，小麦、秋葵等基础农作物相继因枯萎病灭绝，人类不再像从前那样仰望星空，放纵想象力和灵感的迸发，而是每日在沙尘暴的肆虐下倒数着所剩不多的光景。在家务农的前NASA宇航员库珀（马修·麦康纳 饰）接连在女儿墨菲的书房发现奇怪的重力场现象，随即得知在某个未知区域内前NASA成员仍秘密进行一个拯救人类的计划。多年以前土星附近出现神秘虫洞，NASA借机将数名宇航员派遣到遥远的星系寻找适合居住的星球。在布兰德教授（迈克尔·凯恩 饰）的劝说下，库珀忍痛告别了女儿...', '英语', '169分钟', '2020-08-02', '0', '1');
INSERT INTO `film` VALUES ('17', '爱情/动画/奇幻', '游戏人生 零 ノーゲーム・ノーライフ', 'eabd713d-0052-4407-a1b6-65304f5788d2bb4ec6dc-d83b-4b39-ba68-a07b93ebfc6c.webp', '石塚敦子', '松冈祯丞 / 茅野爱衣 / 日笠阳子 / 田村由香里 / 能登麻美子 / 井口裕香 / 泽城美雪 / 大川透 / 兴津和幸 / Lynn / 诹访部顺一 / 堀江由衣 / 森奈奈子 / 竹内良太 / 大地叶 / 石上静香 / 滨野大辉 / 手冢弘道 / 钉宫理惠', '距今超过六千年的远古世界，天地割裂的凄惨战争持续不断，毫无还手之力的人类被拥有强大力量的各个种族逼入绝境，濒临灭亡。此时率领人类的年轻领袖里克，与机凯种少女休比偶然相遇。被同伴抛弃的休比，为了修复故障，拜托里克把“人类的心”告诉自己。机凯种少女的单纯与真诚，使得里克对休比逐渐放下戒备、敞开心扉，二人感情亦日渐升温。最终二人带领人类共同面对终极一战，少女休比也将面临恋人与生命的残酷抉择。末日来临，在251秒的时间里，赌上一场深情告白。', '日语', '107分钟', '2017-07-19', '19.99', '1');
INSERT INTO `film` VALUES ('18', '催泪/动画/日常', '秒速五厘米', '177911f9-a8de-40c3-90f7-d3048e9f49d64fed6a1e2e9aae0f171c904c36c23384586e8d90.png@282w_375h.webp', '新海诚', '远野贵树：水桥研二 篠原明里：近藤好美、尾上绫华 澄田花苗：花村怜美 卓比：新海诚', '秒速五厘米是日本导演新海诚在2007年发布的动画电影，全作由《樱花抄》、《宇航员》和《秒速五厘米》三话组成。导演结合樱花、电车、卫星等美丽的意象，讲述了围绕着男主角远野贵树和女主角篠原明里、澄田花苗之间所发生的唯美而又忧伤的故事。少年远野贵树与少女筱原明里，这两人是幼时的同班同学兼好友，但自从小学毕业之后却没能再见一次面。分隔两地的贵树与明里一直靠书信保持联络，直到贵树知道自己即将举家搬到鹿儿岛那个遥远的地方。两人约定了见面的时间，但计划好的行程偏偏却遇上了暴风雪……', '日语', '62分钟', '2007-03-03', '0', '1');
INSERT INTO `film` VALUES ('19', '日常/动画/治愈', '言叶之庭', '70c740fc-525b-435b-8911-0c84845262ac5b00c25e00b639194f51ead01c557c9709c3ea6a.jpg@282w_375h.webp', '新海诚', '秋月孝雄：入野自由 雪野百香里：花泽香菜 孝雄的母亲：平野文 孝雄的哥哥：前田刚 孝雄哥哥的女友：寺崎裕香 松本：井上优 佐藤：潘惠美 相泽：小松未可子', '刚满15岁的高中生秋月孝雄，因母亲离家出走，不得不为了生计打工赚钱。入梅之日，孝雄逃课来到一座日本庭园。安静的小亭子里，27岁的职场女性雪野百香里边吃巧克力、边喝啤酒的样子引起了他的注意。对彼此感到似曾相识的二人，每到落雨之日便从世俗的烦恼中逃脱出来，相会于这座都市丛林中的幽静角落。在梅雨季节，他们的心渐渐互相靠拢。志愿成为手工鞋匠的秋月，决心为雪野做一双鞋。雨过天晴，艳阳高照，庭园中久久不见两人的身影……', '日语', '46分钟', '2013-05-31', '0', '1');
INSERT INTO `film` VALUES ('21', '动作/冒险', '世界第一男枪传', 'b42e243a-892d-482f-a6cb-bc20a108492bef02a70a19d8bc3e937bae10c78ba61ea9d38.jpg', '山上徹也', '安倍晋三', '日本当地时间7月8日11时30分左右，正在日本奈良市进行街头演说的日本前首相安倍晋三遭枪击倒地，击中他的武器是手枪，安培身中两枪，一枪击中左胸，另一枪击中脖子，紧急处理伤势后，由直升机送往医院，去医院的途中安培已处于心肺功能停止状态。', '日语', '120分钟', '2022-07-08', '-99.99', '1');
INSERT INTO `film` VALUES ('22', '类型22', '名称22', '41185d4b-b881-42f5-9a6d-a822e7e82964OIP-gfdtf.jpg', '导演', '演员', '简介', '语言', '时长', '2022-07-14', '122', '0');
INSERT INTO `film` VALUES ('24', '111', '222', '9cea9533-b63a-40f1-abc1-cbae489a9f90R-C.jpg', '555', '566', '234', '444', '223', '2022-07-14', '7', '0');
INSERT INTO `film` VALUES ('25', '剧情/传记/历史/战争', '帝国的毁灭', '68565ac1-522f-4c62-9f5e-d955cbb875373e5cba15da41e1b8b1e32007127382d812f8c54d.jpg@282w_375h.webp', '奥利弗·希施比格尔', '布鲁诺·冈茨 亚历山德拉·玛丽亚·拉娜 科琳娜·哈弗奇 乌尔里希·马特斯 茱莉安·柯勒 海诺·费尔希 克里斯蒂安·贝克尔', '这是一部纪实性电影，逼真地反映了希特勒人生的最后12天，第三帝国最后的日子。苏联红军已经攻入柏林，希特勒（布鲁诺·甘茨 饰）和情妇爱娃也躲到了掩体下。爱娃知道自己是来陪希特勒一起共赴黄泉的，但她并 不后悔。即使在她向希特勒为妹夫求情遭拒绝后，她也和希特勒一起举办了最后一次的婚礼。希特勒的忠实追随者戈培尔决心全家一起陪着元首殉葬。他共有7个孩子，他和妻子坚决不让自己的孩子们在没有帝国的天空生长，在希特勒和爱娃自杀后也一同自杀。令人不胜感慨。历史的真实通过镜头一幕幕重现。', '德语', '156分钟', '2004-09-08', '1.99', '1');
INSERT INTO `film` VALUES ('26', '动作/科幻/冒险', '哥斯拉2:怪兽之王', 'ab656730-b298-46cd-bba1-ce4fbf3aaa910ac9aac707084339d758a0cf11b8bb0c0f3c2900.jpg@282w_375h.webp', '迈克尔·道赫蒂', '凯尔·钱德勒 维拉·法米加 米莉·波比·布朗 章子怡 渡边谦 布莱德利·惠特福德 托马斯·米德蒂奇 艾莎·辛德斯 莎莉·霍金斯 查尔斯·丹斯 大卫·斯特雷泽恩 小奥谢拉·杰克逊 希·庞德', '动物基因组学——“帝王组织”研究机构的一个小组在一座庙里研究着魔斯拉。她从幼体中孵出，在一群雇佣兵袭击这个机构时，魔斯拉逃了出去。她在一个瀑布包了茧，随后破茧而出，完成了全形态生长。在2014年，哥斯拉被整个世界看到后，“帝王组织”在水下建了一个基地，在这个位于水下好几英里的水中基地中，他们研究着哥斯拉和其它可能存在的生物，那是他们真正的研究核心。', '英语', '132分钟', '2019-05-31', '2.99', '1');
INSERT INTO `film` VALUES ('27', '动作/奇幻/冒险', '魔兽', '25ab5b1f-5550-48ca-b57d-094de3630bcbf82bf06db7e5cce460e53070d86f41e9014b52af.jpg@282w_375h.webp', '邓肯·琼斯', '崔维斯·费米尔 托比·凯贝尔 宝拉·巴顿 吴彦祖 本·福斯特 多米尼克·库珀 鲁丝·内伽 克兰西·布朗 丹尼尔·库德摩尔 罗伯特·卡辛斯基 本·施耐泽 格伦·克洛斯 考乐姆·吉斯·雷尼 泰瑞·诺塔里 瑞安·罗宾斯 博尔克利·杜菲尔德 丹·佩恩 迪伦·肖明 唐尼·麦克尼尔 迈克·安东纳科斯 拉吉·拉尔', '这是一个人类和兽人共存，和谐相处，互不侵犯的世界。人类生活在艾泽拉斯大陆中，兽人则在德拉诺劳作繁衍。某日，邪恶的兽人古尔丹（吴彦祖 饰）出现了，它打开了黑暗之门，肆意屠戮手无寸铁的人类，将艾泽拉斯大陆变为了一片地狱的火海。与此同时，曾经与世无争的兽人们如今变得凶猛残暴，他们来到人类的领地，在这里烧杀抢掠，无恶不作。杜隆坦（托比·凯贝尔 饰）是霜狼氏族的酋长，他发现了古尔丹的野心和阴谋，于是带领着自己的部族千里迢迢来到了艾泽拉斯...', '英语', '124分钟', '2016-06-08', '3.99', '1');
INSERT INTO `film` VALUES ('28', '测试', '测试', 'a523c115-37e0-4312-b9f3-5b1f404e608efa2fff7775c64109a41a5be4e42b9d961099669096 (2).jpg', '彩色', '测试', '测试', '彩色', '测试c', '2022-07-20', '1', '0');

-- ----------------------------
-- Table structure for message_board
-- ----------------------------
DROP TABLE IF EXISTS `message_board`;
CREATE TABLE `message_board` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `film_num` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluate_content` varchar(255) NOT NULL,
  `evaluate_date` datetime NOT NULL,
  `parent_message_id` int(10) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_board
-- ----------------------------
INSERT INTO `message_board` VALUES ('95', '17', '1', '123', '2022-07-21 16:29:49', '0');
INSERT INTO `message_board` VALUES ('96', '17', '1', '123', '2022-07-21 16:29:53', '0');
INSERT INTO `message_board` VALUES ('97', '17', '1', '123', '2022-07-21 16:30:02', '0');
INSERT INTO `message_board` VALUES ('98', '17', '1', 'lkj', '2022-07-21 16:30:20', '0');
INSERT INTO `message_board` VALUES ('99', '17', '1', ';lk', '2022-07-21 16:30:24', '0');
INSERT INTO `message_board` VALUES ('100', '17', '1', 'lkj', '2022-07-21 16:30:31', '0');
INSERT INTO `message_board` VALUES ('101', '10', '1', '123', '2022-07-21 16:33:00', '0');
INSERT INTO `message_board` VALUES ('105', '9', '1', '123', '2022-07-21 16:37:35', '0');
INSERT INTO `message_board` VALUES ('106', '9', '1', '123', '2022-07-21 16:38:51', '0');
INSERT INTO `message_board` VALUES ('108', '9', '1', '123', '2022-07-21 16:40:03', '0');
INSERT INTO `message_board` VALUES ('111', '9', '1', 'qw', '2022-07-21 17:06:32', '109');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_num` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_order_date` date NOT NULL,
  `ticket_price` float NOT NULL,
  `count` int(11) NOT NULL,
  `total_price` float NOT NULL,
  `order_status` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for slice_arrangement
-- ----------------------------
DROP TABLE IF EXISTS `slice_arrangement`;
CREATE TABLE `slice_arrangement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_name` varchar(255) NOT NULL,
  `cinema_name` varchar(255) NOT NULL,
  `starting_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slice_arrangement
-- ----------------------------
INSERT INTO `slice_arrangement` VALUES ('10', '游戏人生 零 ノーゲーム・ノーライフ', '1号激光巨幕厅', '2022-07-22 00:00:00', '2022-07-22 02:20:00');
INSERT INTO `slice_arrangement` VALUES ('11', '游戏人生 零 ノーゲーム・ノーライフ', '2号IMAX4D厅', '2022-07-22 00:00:00', '2022-07-22 02:20:00');
INSERT INTO `slice_arrangement` VALUES ('12', '游戏人生 零 ノーゲーム・ノーライフ', '3号DMAX巨幕·DTS厅', '2022-07-22 00:00:00', '2022-07-22 02:20:00');
INSERT INTO `slice_arrangement` VALUES ('13', '游戏人生 零 ノーゲーム・ノーライフ', '1号激光巨幕厅', '2022-07-22 09:30:00', '2022-07-22 11:50:00');
INSERT INTO `slice_arrangement` VALUES ('14', '游戏人生 零 ノーゲーム・ノーライフ', '2号IMAX4D厅', '2022-07-22 09:30:00', '2022-07-22 11:50:00');
INSERT INTO `slice_arrangement` VALUES ('15', '游戏人生 零 ノーゲーム・ノーライフ', '3号DMAX巨幕·DTS厅', '2022-07-22 09:30:00', '2022-07-22 11:50:00');
INSERT INTO `slice_arrangement` VALUES ('19', '游戏人生 零 ノーゲーム・ノーライフ', '1号激光巨幕厅', '2022-07-22 15:30:00', '2022-07-22 17:50:00');
INSERT INTO `slice_arrangement` VALUES ('20', '游戏人生 零 ノーゲーム・ノーライフ', '2号IMAX4D厅', '2022-07-22 15:30:00', '2022-07-22 17:50:00');
INSERT INTO `slice_arrangement` VALUES ('21', '游戏人生 零 ノーゲーム・ノーライフ', '3号DMAX巨幕·DTS厅', '2022-07-22 15:30:00', '2022-07-22 17:50:00');
INSERT INTO `slice_arrangement` VALUES ('22', '你的名字', '1号激光巨幕厅', '2022-07-22 03:00:00', '2022-07-22 05:20:00');
INSERT INTO `slice_arrangement` VALUES ('23', '你的名字', '1号激光巨幕厅', '2022-07-22 12:30:00', '2022-07-22 15:50:00');
INSERT INTO `slice_arrangement` VALUES ('24', '你的名字', '1号激光巨幕厅', '2022-07-22 18:30:00', '2022-07-22 20:50:00');
INSERT INTO `slice_arrangement` VALUES ('25', '精灵旅社4：变身大冒险', '4号激光厅', '2022-07-22 12:00:00', '2022-07-22 14:30:00');
INSERT INTO `slice_arrangement` VALUES ('26', '让子弹飞', '5号激光厅', '2022-07-22 12:30:00', '2022-07-22 15:00:00');
INSERT INTO `slice_arrangement` VALUES ('27', '环太平洋', '6号杜比全景声巨幕厅', '2022-07-22 11:00:00', '2022-07-22 13:37:00');
INSERT INTO `slice_arrangement` VALUES ('28', '肖申克的救赎', '7号亿海红旗厅', '2022-07-22 16:30:00', '2022-07-22 18:20:00');
INSERT INTO `slice_arrangement` VALUES ('29', '天气之子', '8号VIP厅(免费提供爆米花可乐)', '2022-07-22 14:00:00', '2022-07-22 16:30:00');
INSERT INTO `slice_arrangement` VALUES ('30', '游戏人生 零 ノーゲーム・ノーライフ', '1号激光巨幕厅', '2022-07-23 00:00:00', '2022-07-23 02:20:00');
INSERT INTO `slice_arrangement` VALUES ('31', '游戏人生 零 ノーゲーム・ノーライフ', '2号IMAX4D厅', '2022-07-23 15:30:00', '2022-07-23 17:50:00');
INSERT INTO `slice_arrangement` VALUES ('32', '游戏人生 零 ノーゲーム・ノーライフ', '3号DMAX巨幕·DTS厅', '2022-07-23 15:30:00', '2022-07-23 17:50:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(9) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(11) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_img` varchar(255) NOT NULL,
  `user_gender` char(2) DEFAULT NULL,
  `user_state` int(1) NOT NULL,
  `user_date` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '202cb962ac59075b964b07152d234b70', '', '1', '1', '2022-07-21');
INSERT INTO `user` VALUES ('2', 'admin', '84bb1b61180da0b4fda0226e29725934', '3d5dae47-7734-4263-b72b-eccde9ceecd7', '1', '1', '2022-07-22');
