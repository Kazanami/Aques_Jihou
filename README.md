# Aques_Jihou
====
AquesTalk Piに時報を読み上げさせるだけのスクリプトです。

# 環境
	Raspbian jessie(日本語環境適応済み)にて動作確認済みです。
	他環境での動作は自己責任でお願いします(多分動くと思いますが…)。

#Requirement
・AquesTalk Piが必要です。

# Usage
時報は、crondと連携して1時間ごとに起動するように組んでいます。
他には現在の時刻を読み上げさせる機能をつけています。

コマンド
	- jihou config    設定ファイルを開きます。ボイスを変えたいときなどに使います。
	- jihou nowtime   現在の日付、時刻を読み上げます。
	- jihou cron      読み上げの実体です。これをcrondに渡すことで時報を実現しています。

#　Install
インストールは一緒に入っている、autoinstall.shをターミナルで実行してください。
実行には管理者権限が必要です。

$ sudo ./autoinstall.sh

完了したら、テストもかねて、jihou nowtimeを実行してみてください。

# Contribution
	もしカスタマイズしてくださる方が居るなら大歓迎です！
	gitは初めて使用したので、まだ慣れない点がありますが、よろしくお願いします。

Created by Kazanami
