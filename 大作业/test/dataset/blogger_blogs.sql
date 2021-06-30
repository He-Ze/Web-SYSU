create table blogs
(
    blogId       int auto_increment
        primary key,
    title        varchar(500)   not null,
    imageUrl     varchar(255)   not null,
    username     varchar(255)   not null,
    category     varchar(255)   not null,
    body         varchar(10000) not null,
    date         varchar(50)    not null,
    status       varchar(255)   not null,
    likeCount    int            null,
    commentCount int            null
);

INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (1, 'NBA西部决赛：太阳1-0快船', 'pictures/blog1.png', 'user', '体育', '<p>北京时间6月21日，西决首战打响，太阳主场120-114击败快船，总比分1-0领先。保罗因新冠阳性缺阵，莱昂纳德由于膝伤没能来到客场。布克轰下40分13篮板11助攻，表现全面，率领太阳拿下西决G1的胜利，乔治空砍34分。保罗缺阵，布克挺身而出，得分的同时也扛起组织进攻的重任。他轰下40分13篮板11助攻的三双数据，率领太阳获得西决首胜。同时，NBA官方宣布，太阳总经理詹姆斯-琼斯当选年度最佳总经理。他获得9张第一选票，总分65分，以4分优势险胜爵士总经理林德赛。</p>', '2021-06-21', 'Accepted', 2, 5);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (2, '新歌《Mojito》销量破百万，周杰伦凭啥永远不过气？', 'pictures/blog2.png', 'heze', '音乐', '<p style="text-align: center;">今天凌晨，等待了整整270天之后，周杰伦的新单曲《Mojito》终于公开发售！新歌数字专辑上线仅仅过了1小时4分钟，就在QQ音乐售出百万张，登顶畅销榜周榜NO.1！年过40的周董，在同一辈歌手大多沉寂的情形下，却依旧保持着惊人的影响力，不愧是贯穿了80后、90后的常青树偶像。这次发售的新曲，以古巴著名的鸡尾酒「Mojito」为名，洋溢古巴风情的拉丁曲风让人惊艳。MV中，周杰伦穿着花衬衫，开着老爷车，跳着古巴当地特色的萨尔萨舞步，带歌迷来了一次夏日古巴游。这就是JAY，永远走在潮流最前沿，一直让歌迷惊喜不断。出道二十年，周杰伦的音乐风格一直在改变，从不拘泥于一种音乐风格，无论是中国风、小清新，还是摇滚乐、电子风，他都游刃有余地加以驾驭。</p>', '2021-05-17', 'Accepted', 51, 26);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (3, '如何挑选荔枝？以下几点要牢记', 'pictures/blog3.jpeg', 'gth', '美食', '<p style="text-align: left;">“一骑红尘妃子笑，无人知是荔枝来”又到了吃荔枝的季节，很多人都喜欢吃荔枝，但是有时候买的荔枝比较酸，这是因为购买的时候不会挑选。那么，我们在平时购买荔枝的时候该如何挑选呢，怎么才能挑选到好吃的荔枝呢？<em>荔枝很少有完全鲜艳的红色，都多多少少带一些杂色，新鲜的荔枝的表皮很可能红中带白、也可能红中带绿、也可能红中带带点浅红色，这些都是很正常的，像这样的荔枝都是比较新鲜的。不过需要注意的就是，看到荔枝的果皮颜色上出现黑色或者褐色的部分，那就说明这个荔枝已经变质了，所以这样的荔枝就不要购买了。</em><em>我们也可以在选购荔枝的时候，用手轻轻地按捏一下，看看是不是有弹性。一般而言，如果稍微有些软，但又不失弹性的，应该是比较成熟的荔枝。但是，如果摸起来又软又没有弹性，那么说明该荔枝已经熟透了，或者是烂了。所以挑选荔枝的时候，尽量要选择那些稍硬一些，有弹性的。</em></p>', '2021-04-09', 'Accepted', 2, 1);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (4, '云南最值得去的地方有哪些？', 'pictures/blog4.jpg', 'user2', '旅行', '<p><云南最值得去的地方：丽江、昆明、大理、西双版纳。丽江地处云贵高原，靠近青藏高原，特殊的地形地貌，使丽江呈现出类型多样、立体分布的气候特点，囊括了中国大陆从南到北的各种气候类型，是地球上气候资源最为丰富、生物种类最为多样、民族文化最为多元的地区之一。神奇的自然景观、悠久的历史文化和浓郁的民族风情，形成了丽江别具特色的自然风光和旅游资源，吸引着越来越多的中外游客到丽江游览观光、休闲度假。这里是艳遇之都，大多数来云南旅游的朋友都会选择这里。昆明，云南省省会，昆明还有着“春城”这一美誉。昆明是我国重要的旅游城市和国家级历史文化名城，悠久的历史，众多的民族，独特的自然条件，给昆明留下了极其丰富的文物古迹和风景名胜。无论从哪个角度看昆明，一定是春光明媚，天空碧蓝又高远，仿佛是透明的。</p>', '2021-03-19', 'Accepted', 79, 33);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (5, '接种新冠疫苗的具体注意事项', 'pictures/blog5.jpg', 'user', '生活', '<p>接种前医生询问健康状况时，请如实告知相关信息。属严重过敏体质、患有惊厥癫痫和进行性神经系统疾病、正在接受免疫抑制剂、激素治疗、慢性病发作期或者免疫功能缺陷的患者，不适合接种本疫苗。处于哺乳期或妊娠期的女性，患急性疾病、严重慢性疾病、慢性疾病的急性发病期和发热者请暂缓接种。如28天内接种过其他疫苗，请现场告知医生。接种完成后，需现场留观30分钟，接种当日注射部位避免沾水并注意个人卫生，适当安排休息。接种后一周内避免接触个人既往已知过敏物及常见致敏原，尽量不饮酒、不进食辛辣刺激或海鲜类食物，建议清淡饮食、多喝水。</p>', '2021-02-20', 'Accepted', 25, 6);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (6, '中国新冠病毒疫苗接种突破10亿剂次', 'pictures/blog6.jpg', 'wsc', '生活', '<p>6月20日，中国国家卫生健康委员会官网发布消息，截至2021年6月19日，31个省（自治区、直辖市）和新疆生产建设兵团累计报告接种新冠病毒疫苗101048.9万剂次。图为6月19日，内蒙古呼和浩特市一新冠疫苗接种点，工作人员展示新冠疫苗。 </p>', '2021-06-20', 'Accepted', 62, 25);
INSERT INTO blogger.blogs (blogId, title, imageUrl, username, category, body, date, status, likeCount, commentCount) VALUES (7, '老鹰4-3淘汰76人 晋级东部决赛', 'pictures/blog7.jpg', 'mayun', '体育', '<p>2021年6月21日，美国费城，20/21NBA东部半决赛G7：亚特兰大老鹰103-96战胜费城76人，从而老鹰以总分4比3淘汰对手晋级东部决赛，他们将与雄鹿争夺总决赛资格；特雷-杨21分10助攻，凯文-赫尔特27分，乔尔-恩比德31分，本-西蒙斯5分13助攻。 </p>', '2021-06-20', 'Accepted', 59, 31);