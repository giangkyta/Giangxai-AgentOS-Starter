#!/bin/sh
# Đồng bộ phần piggery giữa repo (bản gốc) và ~/.piggery (bản piggery đang dùng).
#
#   ./he-thong/dong-bo.sh          chép repo -> ~/.piggery (có sao lưu bản cũ), rồi chạy piggery check
#   ./he-thong/dong-bo.sh --kiem   chỉ so sánh, báo lệch (thoát mã 1 nếu lệch), không chép gì
#   ./he-thong/dong-bo.sh --lay    chép ngược ~/.piggery -> repo (khi đã sửa bằng lệnh piggery)
#
# Đội đang chạy không bị ảnh hưởng: piggery đóng băng mẫu đội lúc lập đội. Thay đổi có tác dụng
# từ đội lập sau, hoặc (với config.yaml) từ phiên hay Worker mở sau.
set -eu

REPO=$(cd "$(dirname "$0")/.." && pwd)
SRC_T="$REPO/he-thong/piggery/templates/agentos"
SRC_C="$REPO/he-thong/piggery/config.yaml"
DST_T="$HOME/.piggery/templates/agentos"
DST_C="$HOME/.piggery/config.yaml"

khac() {
	lech=0
	diff -rq "$SRC_T" "$DST_T" >/dev/null 2>&1 || { echo "lệch: mẫu đội agentos"; lech=1; }
	cmp -s "$SRC_C" "$DST_C" || { echo "lệch: config.yaml"; lech=1; }
	return $lech
}

case "${1:-}" in
--kiem)
	if khac; then echo "đồng bộ: repo và ~/.piggery giống nhau"; else exit 1; fi
	;;
--lay)
	rm -rf "$SRC_T" && cp -Rp "$DST_T" "$SRC_T"
	cp -p "$DST_C" "$SRC_C"
	echo "đã chép ~/.piggery -> repo. Xem lại bằng git diff rồi commit."
	;;
"")
	if khac >/dev/null; then echo "đã giống nhau, không cần chép"; exit 0; fi
	bak="$HOME/.piggery/backups/dong-bo-$(date +%Y%m%d-%H%M%S)"
	mkdir -p "$bak"
	[ -d "$DST_T" ] && cp -Rp "$DST_T" "$bak/agentos"
	[ -f "$DST_C" ] && cp -p "$DST_C" "$bak/config.yaml"
	rm -rf "$DST_T" && mkdir -p "$(dirname "$DST_T")" && cp -Rp "$SRC_T" "$DST_T"
	cp -p "$SRC_C" "$DST_C"
	echo "đã chép repo -> ~/.piggery (bản cũ ở $bak)"
	piggery check
	;;
*)
	echo "cách dùng: $0 [--kiem | --lay]" >&2
	exit 2
	;;
esac
