#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# 日本人の名字と名前のテーブルを作る。
# CreatedAt: 2020-09-24
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	DB_PATH='Names.db'
	for path in `ls -1 | grep .sql | sort`; do
		sqlite3 -batch -interactive "$DB_PATH" < "$path"
	done
#	sqlite3 -batch -interactive "$DB_PATH" 'select * from sqlite_master'
}
Run "$@"
