#!/bin/bash
AQUESPI=/opt/aquestalkpi

Scripts_copy(){
	cp ./jihou /usr/local/bin/jihou
	if [ $? != 0 ];then
		echo "";
		echo "ファイルのコピーに失敗しました。"
		echo "スクリプトを終了します。"
		return 15;
	fi
	return 0;
}

Setting_File_copy(){
	cp -r ./jihou_conf /etc/jihou
	if [ $? != 0 ];then
		echo "";
		echo "ファイルのコピーに失敗しました。"
		echo "スクリプトを終了します。"
		return 15;
	fi
	return 0;
}

Cron_add(){
	cp /etc/crontab /etc/crontab.bak
	if [ $? != 0 ];then
		echo "";
		echo "バックアップを作成できません。"
		echo "スクリプトを終了します。"
		return 17;
#	else
#		echo "バックアップを作成しました。"
	fi
	echo "0 1/* * * * ${SUDO_USER} /usr/local/bin/jihou cron" >> /etc/crontab
	if [ $? != 0 ];then
		echo "";
		echo "追加に失敗しました。"
		echo "スクリプトを終了します。"
		return 20;
	fi
	return 0;
}

Change_P(){
	chmod +x /usr/local/bin/jihou
	if [ $? != 0 ];then
		echo "";
		echo "権限の付与に失敗しました。"
		echo "スクリプトを終了します。"
		return 15;
	fi
	return 0;
}

#
echo "時報読み上げスクリプトのインストールを開始します。"
echo "スクリプト製作者:風波(Kazanami)"
echo "----------------------------------"
echo "インストールするスクリプト"
echo "jihou Ver 1.0"
echo ""
echo ""
echo "----------------------------------"
read -p "開始するにはEnterキーを押してください:" x

if [ "$SUDO_USER" == "" ];then
	echo "インストールをするには管理者権限が必要です。"
	echo "sudo をつけて実行し直してください。"
	exit 3;
fi

echo -n "AquesTalk PiがREADMEにある場所にインストールされているか確認しています..."
if [ -d ${AQUESPI} ];then
	echo "完了"
else
	echo "エラー"
	echo "AquesTalk PiがREADMEにある場所にないか、インストールされていません。"
	echo "http://www.a-quest.com/products/aquestalkpi.html"
	echo "上記サイトよりダウンロードして、READMEにある場所に展開してください。"
	echo "その後、インストールスクリプトを実行してください。"
	exit 4;
fi

echo -n "スクリプトファイルをコピーしています..."
Scripts_copy
if [ $? != 0 ];then
	exit 15;
fi
echo "完了"

echo ""
echo ""
echo -n "設定ファイルをコピーしています..."
Setting_File_copy
if [ $? != 0 ];then
	exit 15;
fi
echo "完了"

echo ""
echo ""

echo -n "/etc/crontabに設定を追加しています..."
Cron_add
if [ $? != 0 ];then
	exit 15;
fi
echo "完了"

echo ""
echo ""

echo -n "最終処理:スクリプトに実行権限を付与しています..."
Change_P
if [ $? != 0 ];then
	exit 15;
fi
echo "完了"

echo ""
echo ""

echo "インストールが完了しました！"
echo "動作確認は"
echo "jihou nowtime"
echo "を実行してください。"
exit 0;
