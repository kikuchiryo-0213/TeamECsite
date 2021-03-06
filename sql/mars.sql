set names utf8;

set foreign_key_checks=0;

drop database if exists mars;
create database if not exists mars;

use mars;

create table user_info(id int primary key auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint not null default 0 comment "性別",
email varchar(32) not null comment "メールアドレス",
status tinyint not null default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
);
create table m_category(id int primary key auto_increment comment "ID",
category_id int unique not null comment "カテゴリID",
category_name varchar(20) unique not null comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
insert_date datetime not null comment "登録日",
update_date datetime comment "更新日"
);

create table product_info(id int primary key auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) unique not null comment "商品名かな",
product_description varchar(255) not null comment "商品詳細",
category_id int not null comment "カテゴリID(外部キー)",
price int comment "価格",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
release_date datetime not null comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint not null default 0 comment "ステータス",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(category_id) references m_category(category_id)
);


create table cart_info(id int primary key auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
temp_user_id varchar(16) comment "仮ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "金額",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
);

create table purchase_history_info(id int primary key auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID(外部キー)",
product_count int not null comment "個数",
price int not null comment "金額",
destination_id int not null comment "宛先情報ID",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(product_id) references product_info(product_id)
);


create table destination_info(id int primary key auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) not null comment "メールアドレス",
tel_number varchar(13) not null comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
);


insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());


insert into product_info values
( 1, 1,"ブルゾン","ぶるぞん","ネックが高めのショートモッズコートタイプのブルゾン。今期はよりコットンライクな生地感の淡いカラーに変更し、細部もアップデート。ミリタリー調のデザインながらも無駄のないモダンなデザインがポイント。",2,6400,"./images","image1.jpg",now(),"coen",0,now(),now()),
( 2, 2,"ミリタリージャケット","みりたりーじゃけっと","N.HOOLYWOOD SPRING & SUMMER 2019 TEST PRODUCT EXCHANGE SERVICE N.HOOLYWOOD × DICKIES COLLABORATION BLOUSON",2,25900,"./images","image2.jpg",now(),"N.HOOLYWOOD",0,now(),now()),
( 3, 3,"スタジャン","すたじゃん","NY発の老舗アパレルメーカーであるショットとの継続的に行う共同制作。今回は、スポーティなスタジアムジャケットを初制作。素材には肌に吸い付くような滑らかな質感が特徴のシープレザーを使用。",2,99000,"./images","image3.jpg",now(),"schott",0,now(),now()),
( 4, 4,"ダウンジャケット","だうんじゃけっと","表地には70デニールのGORE-TEX products2層構造を採用。肩、肘、後ろ裾端は高強度の生地で補強をしています。",2,77000,"./images","image4.jpg",now(),"THE NORTH FACE",0,now(),now()),
( 5, 5,"パーカー","ぱーかー","柔らかさを重視したミニ裏毛を使用",2,3000,"./images","image5.jpg",now(),"INTER FACTORY",0,now(),now()),
( 6, 6,"Tシャツ","てぃーしゃつ","大人気のBUHIを落ち着いたカラーの同系色で大人な雰囲気にプリントしました。",2,5000,"./images","image6.jpg",now(),"THE ENDLESS SUMMER",0,now(),now()),
( 7, 7,"デニムパンツ","でにむぱんつ","素材にはポリウレタンが入っており、屈伸などをするとストレッチ感を非常に感じとれ、膝にダーツも入っている為、細いシルエットながらも非常に履きやすく、ストレスを感じにくいスキニーパンツに仕上げております。",3,5000,"./images","image7.jpg",now(),"coen",0,now(),now()),
( 8, 8,"カーゴパンツ","かーごぱんつ","製品染めによるナチュラルなカラーリングが特徴的なジョガーパンツ。",3,12000,"./images","image8.jpg",now(),"MONKEY TIME",0,now(),now()),
( 9, 9,"チノパンツ","ちのぱんつ","コットンベースの生地のため、季節を選ばずに着用可能なのも嬉しいポイントです。",3,4000,"./images","image9.jpg",now(),"nano.universe",0,now(),now()),
( 10, 10,"スラックス","すらっくす","ストレッチ素材を活かした動きやすく軽やかなパンツです。",3,7000,"./images","image10.jpg",now(),"nano.universe",0,now(),now()),
( 11, 11,"ジャージ","じゃーじ","アディダスが1967年にリリースし、革命をもたらしたトラックスーツ。",3,10000,"./images","image11.jpg",now(),"adidas",0,now(),now()),
( 12, 12,"テーパードパンツ","てーぱーどぱんつ","家庭洗濯も可能なので、汗を気にせずヘビーローテーションしていただけます。",3,12000,"./images","image12.jpg",now(),"LANVIN en Bleu",0,now(),now()),
( 13, 13,"FRED PERRY","フレッドペリー","フレッドペリーのフットウェアでアイコン的なモデルのSPENCER。クリーンでシャープなデザイン。",4,12700,"./images","image13.jpg",now(),"FRED PERRY",0,now(),now()),
( 14, 14,"CONVERSE","こんばーす","テーマ“ENERGY WAVE®”に基づく「オールスター 100」のプリントアレンジモデル",4,8900,"./images","image14.jpg",now(),"CONVERSE",0,now(),now()),
( 15, 15,"ショルダークラッチバック","しょるだーくらっちばっく","ショルダーベルトが付属で付いた2WAY仕様で、荷物が増えた際にはショルダーにするなど使い勝手◎",4,8600,"./images","image15.jpg",now(),"TAKEO KIKUCHI",0,now(),now()),
( 16, 16,"クラッチバック","くらっちばっく","滑らかな風合いが特徴のスムースレザーを採用したクラッチバッグ自然の艶となじみ易い質感、上品な素材感が魅力的な、新作のクラッチバッグです",4,8900,"./images","image16.jpg",now(),"SHIPS",0,now(),now()),
( 17, 17,"G-SHOCK","じーしょっく","究極の強さを求めて進化を続けるタフネスウオッチG-SHOCKから、新たな耐衝撃構造として「カーボンコアガード構造」を採用した新シリーズが登場",4,21600,"./images","image17.jpg",now(),"G-SHOCK",0,now(),now()),
( 18, 18,"SEIKO","せいこー","SEIKOの考える時計の基本機能とデザイン性を追求。機能・品質・デザインのトータルバランスを重視する人へむけたセレクションです",4,18300,"./images","image18.jpg",now(),"SEIKO",0,now(),now());

insert into m_category values
(1,1,"全てのカテゴリー","トップス、ボトムス、小物全てのカテゴリーが対象となります",now(),now()),
(2,2,"トップス","トップスに関するカテゴリーが対象となります",now(),now()),
(3,3,"ボトムス","ボトムスに関するカテゴリーが対象となります",now(),now()),
(4,4,"小物","小物に関するカテゴリーが対象となります",now(),now());
