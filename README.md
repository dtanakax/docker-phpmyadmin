![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

docker-phpmyadmin
=====================

Base Docker Image
---------------------

[dtanakax/storage](https://registry.hub.docker.com/u/dtanakax/storage/)

説明
---------------------

phpMyAdmin Dockerコンテナ作成設定

使用方法
---------------------

起動

    $ docker run --name <name> -d \
                 -e PMA_SECRET="blowfish_secret" \
                 -e PMA_USERNAME="pma" \
                 -e PMA_PASSWORD="password" \
                 -e DB_HOST="db" \
                 -e DB_PORT="3306" \
                 -ti dtanakax/phpmyadmin

起動後に必要な作業
---------------------

create_table.sqlファイルを以下のURLからダウンロードします。

    https://ホスト名/sql/create_tables.sql

WebブラウザでphpMyAdminへアクセスし、MySQLの管理者用アカウントでログインします。

pmaテーブルを作成するために、ダウンロードしたcreate_table.sqlファイルをインポートしSQL実行します。

pmaユーザーを作成するために、以下のSQLを実行します。`PMA_USERNAME`, `PMA_PASSWORD`には環境変数で設定した値を入力して下さい。

    CREATE USER 'PMA_USERNAME'@'%' IDENTIFIED BY 'PMA_PASSWORD';
    GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'PMA_USERNAME'@'%';
    FLUSH PRIVILEGES;

以上で作業は完了です。

既知の不具合
---------------------

Nginx Reverse SSL Proxy使用時ログイン後ポート80番にリダイレクトされますが
:80の部分を手動で削除してログインして下さい。

    https://ホスト名:80/index.php?token=9300f277215dbc639f2efac5cd33e238
    以下の様に修正
    https://ホスト名/index.php?token=9300f277215dbc639f2efac5cd33e238

環境変数
---------------------

- `PMA_SECRET` phpMyAdmin用秘密キー
- `PMA_USERNAME` phpMyAdmin用ユーザー名
- `PMA_PASSWORD` phpMyAdmin用パスワード
- `DB_HOST` MySQLサーバーホスト名
- `DB_PORT` MySQLサーバーポート番号

利用可能なボリューム
---------------------

以下のボリュームが利用可能

    /var/www/html       # phpMyAdminドキュメントルート

License
---------------------

The MIT License
Copyright (c) 2015 Daisuke Tanaka

以下に定める条件に従い、本ソフトウェアおよび関連文書のファイル（以下「ソフトウェア」）の複製を取得するすべての人に対し、ソフトウェアを無制限に扱うことを無償で許可します。これには、ソフトウェアの複製を使用、複写、変更、結合、掲載、頒布、サブライセンス、および/または販売する権利、およびソフトウェアを提供する相手に同じことを許可する権利も無制限に含まれます。

上記の著作権表示および本許諾表示を、ソフトウェアのすべての複製または重要な部分に記載するものとします。

ソフトウェアは「現状のまま」で、明示であるか暗黙であるかを問わず、何らの保証もなく提供されます。ここでいう保証とは、商品性、特定の目的への適合性、および権利非侵害についての保証も含みますが、それに限定されるものではありません。 作者または著作権者は、契約行為、不法行為、またはそれ以外であろうと、ソフトウェアに起因または関連し、あるいはソフトウェアの使用またはその他の扱いによって生じる一切の請求、損害、その他の義務について何らの責任も負わないものとします。

The MIT License
Copyright (c) 2015 Daisuke Tanaka

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.