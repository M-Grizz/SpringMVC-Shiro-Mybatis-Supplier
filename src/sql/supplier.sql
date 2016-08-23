
CREATE TABLE supplier (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `NAME` varchar(16) DEFAULT NULL COMMENT '单位名称',
  `CODE` varchar(32) DEFAULT NULL COMMENT '源代码',
  `STYPE` varchar(32) DEFAULT NULL COMMENT '数据类型',
  `LARGE` varchar(32) DEFAULT NULL COMMENT '数据范围',
  `BTIME` varchar(32) DEFAULT NULL COMMENT '最新协议生效时间',       
  `ETIME` varchar(32) DEFAULT NULL COMMENT '最新协议到期时间',
  `QTIME` varchar(32) DEFAULT NULL COMMENT '首次签约时间',
  `DBOSS` varchar(32) DEFAULT NULL COMMENT '主办人',       
  `XBOSS` varchar(32) DEFAULT NULL COMMENT '协办人',
  `ZHUANGTAI` varchar(32) DEFAULT NULL COMMENT '客户状态',
  `JTYPE` varchar(32) DEFAULT NULL COMMENT '机构类型',       
  `PS` varchar(32) DEFAULT NULL COMMENT '备注',
  `REPORT` varchar(32) DEFAULT NULL COMMENT '企业征信报告',
  
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `supplier` VALUES (1, '北京XX公司', '001', '户籍信息','全国', '2016.01.07', '2017.01.06', '2004','张三','李四','合作客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (2, '深圳XX公司', '002', '户籍信息','深圳', '2016.01.07', '2017.01.06', '2004','张三','李四','合作客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (3, '上海XX公司', '003', '户籍信息','全国', '2016.01.07', '2017.01.06', '2004','张三','李四','测试客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (4, '云南XX公司', '006', '户籍信息','云南', '2016.01.07', '2017.01.06', '2004','张三','李四','合作客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (5, '广州XX公司', '008', '户籍信息','广东', '2016.01.07', '2017.01.06', '2004','张三','李四','测试客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (6, 'XX公司', '056', '户籍信息','全国', '2016.01.07', '2017.01.06', '2004','张三','李四','合作客户', '计算机制造业', '这是测试用例', '无');
INSERT INTO `supplier` VALUES (7, '北京XX公司', '001', '户籍信息','全国', '2016.01.07', '2017.01.06', '2004','张三','李四','合作客户', '计算机制造业', '', '无');
INSERT INTO `supplier` VALUES (8, 'wang', '008', '省份信息','台湾', '2016.01.08', '2017.01.06', '2004','wang','lisi','合作客户', '计算机制造业', 'user能看到的', '无');
INSERT INTO `supplier` VALUES (9, 'wang', '009', '户籍信息','深圳', '2016.01.07', '2017.01.06', '2004','liang','liu','合作客户', '计算机制造业', 'wang能看到的', '无');