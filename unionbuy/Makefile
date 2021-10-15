admin:
	cd unionbuy-admin && git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-admin/unionbuy-admin-web/target/unionbuy-admin-web.jar uni1:/usr/local/unionbuy-admin/unionbuy-admin.jar


server:
	cd unionbuy-server && git pull  &&  mvn clean package -Dmaven.test.skip=true
	scp unionbuy-server/unionbuy-server-web/target/unionbuy-server-web.jar uni1:/usr/local/unionbuy-server/unionbuy-server.jar

member:
	cd unionbuy-member && git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-member/unionbuy-member-web/target/unionbuy-member-web.jar  uni1:/usr/local/unionbuy-member/unionbuy-member.jar



order:
	cd unionbuy-order && git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-order/unionbuy-order-web/target/unionbuy-order-web.jar uni1:/usr/local/unionbuy-order/unionbuy-order.jar



goods:
	cd unionbuy-goods && git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-goods/unionbuy-goods-web/target/unionbuy-goods.jar uni1:/usr/local/unionbuy-goods/unionbuy-goods.jar


good-lf:
	cd unionbuy-good-lifeng && git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-good-lifeng/unionbuy-good-lifeng-web/target/unionbuy-good-lifeng.jar uni1:/usr/local/unionbuy-good-lifeng/unionbuy-good-lifeng.jar

member-lf:
	cd unionbuy-member-lifeng &&  git pull  && mvn clean package -Dmaven.test.skip=true
	scp unionbuy-member-lifeng/unionbuy-member-lifeng-web/target/unionbuy-member-lifeng-web.jar uni1:/usr/local/unionbuy-member-lifeng/unionbuy-member-lifeng.jar

all: admin server member order goods good-lf member-lf
	echo all