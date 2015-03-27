![phpMyAdmin 4.3.12](https://img.shields.io/badge/phpMyAdmin-4.3.12-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

# docker-phpMyAdmin

### Base Docker Image

[tanaka0323/storage](https://bitbucket.org/tanaka0323/docker-storage "tanaka0323/storage")

### 説明

phpMyAdmin Dockerコンテナイメージです。

[Dockerとは？](https://docs.docker.com/ "Dockerとは？")  
[Docker Command Reference](https://docs.docker.com/reference/commandline/cli/ "Docker Command Reference")

### 使用方法

git pull後に

    $ cd docker-phpmyadmin

イメージ作成

    $ docker build -t <tag>/phpmyadmin .

起動

    $ docker run --name <name> -d \
                 -e PMA_SECRET="blowfish_secret" \
                 -e PMA_USERNAME="pma" \
                 -e PMA_PASSWORD="password" \
                 -e DB_HOST="db" \
                 -e DB_PORT="3306" \
                 -ti <tag>/phpmyadmin

### 起動後に必要な作業

create_table.sqlファイルを以下のURLからダウンロードします。

    https://ホスト名/examples/create_tables.sql

WebブラウザでphpMyAdminへアクセスし、MySQLの管理者用アカウントでログインします。

pmaテーブルを作成するために、ダウンロードしたcreate_table.sqlファイルをインポートしSQL実行します。

pmaユーザーを作成するために、以下のSQLを実行します。PMA_USERNAME, PMA_PASSWORDには環境変数で設定した値を入力して下さい。

    CREATE USER 'PMA_USERNAME'@'%' IDENTIFIED BY 'PMA_PASSWORD';
    GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'PMA_USERNAME'@'%';
    FLUSH PRIVILEGES;

以上で作業は完了です。

### 環境変数

- <code>PMA_SECRET</code>phpMyAdmin用秘密キー
- <code>PMA_USERNAME</code>phpMyAdmin用ユーザー名
- <code>PMA_PASSWORD</code>phpMyAdmin用パスワード
- <code>DB_HOST</code>MySQLサーバーホスト名
- <code>DB_PORT</code>MySQLサーバーポート番号

### 利用可能なボリューム

以下のボリュームが利用可能

    /var/www/html       # phpMyAdminドキュメントルート

### Figでの使用方法

[Figとは](http://www.fig.sh/ "Figとは")  

[設定ファイル記述例](https://bitbucket.org/tanaka0323/fig-examples "設定ファイル記述例")

### License

The MIT License
Copyright (c) 2015 Daisuke Tanaka

以下に定める条件に従い、本ソフトウェアおよび関連文書のファイル（以下「ソフトウェア」）の複製を取得するすべての人に対し、ソフトウェアを無制限に扱うことを無償で許可します。これには、ソフトウェアの複製を使用、複写、変更、結合、掲載、頒布、サブライセンス、および/または販売する権利、およびソフトウェアを提供する相手に同じことを許可する権利も無制限に含まれます。

上記の著作権表示および本許諾表示を、ソフトウェアのすべての複製または重要な部分に記載するものとします。

ソフトウェアは「現状のまま」で、明示であるか暗黙であるかを問わず、何らの保証もなく提供されます。ここでいう保証とは、商品性、特定の目的への適合性、および権利非侵害についての保証も含みますが、それに限定されるものではありません。 作者または著作権者は、契約行為、不法行為、またはそれ以外であろうと、ソフトウェアに起因または関連し、あるいはソフトウェアの使用またはその他の扱いによって生じる一切の請求、損害、その他の義務について何らの責任も負わないものとします。