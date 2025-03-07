DROP TABLE IF EXISTS inspiration;

CREATE TABLE inspiration (
  id bigint,
  inspiration_id bigint,
  itinerary_name text,
  attraction_name text,
  tags text,
  wild_mode string attribute indexed,
  attraction_location string attribute indexed,
  experience_duration float
) min_infix_len='2'
  charset_table='cjk, non_cjk'
  morphology='icu_chinese, lemmatize_en'
  wordforms = '/var/lib/manticore/wordforms.txt'
  stopwords='zh';

INSERT INTO inspiration (
    itinerary_name,
    attraction_name,
    tags,
    inspiration_id,
    wild_mode,
    attraction_location,
    experience_duration
) VALUES
('巴黎漫步', '羅浮宮', '新手,情侶,一日遊,文化體驗,期間限定', 101, '露營', '巴黎, 法國', 3.0),
('峇里島探險', '海神廟', '親子,寵物友善,多日遊,戶外運動,極限挑戰', 102, '登山', '峇里島, 印尼', 2.5),
('東京美食巡禮', '築地市場', '樂齡,獨旅,一日遊,療癒休閒,季節活動', 103, '野餐', '東京, 日本', 1.5),
('北海道雪地體驗', '札幌雪祭', '親子,新手,多日遊,文化體驗,期間限定', 104, '親水', '札幌, 日本', 2.0),
('洛杉磯陽光假期', '聖莫尼卡海灘', '情侶,寵物友善,一日遊,戶外運動,秘境探險', 105, '健行', '洛杉磯, 美國', 3.5),
('瑞士阿爾卑斯', '少女峰', '獨旅,多日遊,國家保護區,極限挑戰,季節活動', 106, '生態賞景', '少女峰, 瑞士', 4.0),
('墨西哥文化之旅', '奇琴伊察', '親子,一日遊,文化體驗,秘境探險', 107, '登山', '奇琴伊察, 墨西哥', 2.8),
('紐約都市漫步', '中央公園', '新手,獨旅,一日遊,療癒休閒', 108, '野餐', '紐約, 美國', 1.8),
('倫敦歷史之旅', '大英博物館', '情侶,多日遊,文化體驗,期間限定', 109, '親水', '倫敦, 英國', 3.2),
('澳洲大堡礁探險', '海洋世界', '親子,獨旅,一日遊,戶外運動,極限挑戰', 110, '健行', '大堡礁, 澳洲', 2.5),
('埃及金字塔探秘', '吉薩金字塔', '新手,情侶,多日遊,秘境探險,文化體驗', 111, '登山', '開羅, 埃及', 3.5),
('巴西熱情狂歡', '里約熱內盧海灘', '樂齡,獨旅,一日遊,療癒休閒,季節活動', 112, '野餐', '里約, 巴西', 2.0),
('義大利文藝之旅', '梵蒂岡', '親子,多日遊,文化體驗,期間限定,戶外運動', 113, '露營', '羅馬, 義大利', 3.0),
('韓國首爾探索', '景福宮', '新手,情侶,一日遊,文化體驗,秘境探險', 114, '健行', '首爾, 韓國', 2.2),
('加拿大自然奇觀', '班夫國家公園', '獨旅,多日遊,國家保護區,戶外運動,極限挑戰', 115, '生態賞景', '班夫, 加拿大', 4.5),
('希臘愛琴海之旅', '聖托里尼', '情侶,親子,一日遊,療癒休閒,季節活動', 116, '親水', '聖托里尼, 希臘', 2.3),
('印度古蹟探訪', '泰姬陵', '新手,情侶,多日遊,文化體驗,秘境探險', 117, '登山', '阿格拉, 印度', 3.8),
('非洲野生動物園', '塞倫蓋蒂', '獨旅,多日遊,戶外運動,國家保護區,期間限定', 118, '健行', '坦桑尼亞, 非洲', 5.0),
('新西蘭極限挑戰', '米爾福德峽灣', '親子,獨旅,一日遊,極限挑戰,秘境探險', 119, '生態賞景', '米爾福德峽灣, 紐西蘭', 3.6),
('阿根廷冰川之旅', '佩里托莫雷諾冰川', '新手,情侶,多日遊,戶外運動,療癒休閒', 120, '野餐', '巴塔哥尼亞, 阿根廷', 4.2),
('台灣環島之旅', '阿里山', '親子,一日遊,戶外運動,秘境探險', 201, '登山', '阿里山, 台灣', 3.0),
('台北文化散步', '故宮博物院', '情侶,一日遊,文化體驗,期間限定', 202, '親水', '台北, 台灣', 2.0),
('花蓮自然探索', '太魯閣國家公園', '獨旅,多日遊,國家保護區,戶外運動', 203, '健行', '花蓮, 台灣', 4.0),
('台中藝術之旅', '彩虹眷村', '新手,一日遊,文化體驗,療癒休閒', 204, '野餐', '台中, 台灣', 1.5),
('高雄熱情之夜', '駁二藝術特區', '情侶,一日遊,文化體驗,期間限定', 205, '露營', '高雄, 台灣', 2.5),
('台南古蹟巡禮', '赤崁樓', '新手,親子,一日遊,文化體驗', 206, '親水', '台南, 台灣', 2.0),
('宜蘭鄉村風光', '羅東夜市', '獨旅,一日遊,療癒休閒,季節活動', 207, '健行', '宜蘭, 台灣', 2.0),
('金門歷史探索', '金門國家公園', '樂齡,多日遊,國家保護區,秘境探險', 208, '生態賞景', '金門, 台灣', 3.0),
('澎湖海上活動', '澎湖跨海大橋', '親子,一日遊,戶外運動,極限挑戰', 209, '親水', '澎湖, 台灣', 1.5),
('南投山林之旅', '日月潭', '情侶,多日遊,療癒休閒,秘境探險', 210, '野餐', '南投, 台灣', 3.5);