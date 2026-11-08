#!/bin/sh
# Dựng lại hệ thống đội Agent trên một máy (máy mới, hoặc sau khi cài lại).
# Cần có sẵn: Claude Code và Codex đã đăng nhập.
#
#   ./he-thong/cai-dat.sh
#
# Làm: cài piggery (đúng bản, có kiểm checksum) nếu chưa có, cài piggery vào Claude Code và Codex,
# rồi chép mẫu đội agentos và config.yaml từ repo sang ~/.piggery.
set -eu

PIGGERY_VERSION=v0.12.1
REPO=$(cd "$(dirname "$0")/.." && pwd)
BIN="$HOME/.local/bin"

if ! command -v piggery >/dev/null 2>&1; then
	case "$(uname -s)-$(uname -m)" in
	Darwin-arm64) name=piggery-darwin-arm64 ;;
	Darwin-x86_64) name=piggery-darwin-amd64 ;;
	Linux-x86_64) name=piggery-linux-amd64 ;;
	Linux-aarch64 | Linux-arm64) name=piggery-linux-arm64 ;;
	*) echo "không có bản piggery cho máy này" >&2; exit 1 ;;
	esac
	tmp=$(mktemp -d)
	trap 'rm -rf "$tmp"' EXIT
	url="https://github.com/sting8k/piggery/releases/download/$PIGGERY_VERSION"
	curl -fsSL -o "$tmp/$name" "$url/$name"
	curl -fsSL -o "$tmp/checksums.txt" "$url/checksums.txt"
	want=$(awk -v n="$name" '$2 == n || $2 == "*" n { print $1 }' "$tmp/checksums.txt")
	got=$(shasum -a 256 "$tmp/$name" | cut -d' ' -f1)
	[ -n "$want" ] && [ "$want" = "$got" ] || { echo "checksum không khớp, dừng" >&2; exit 1; }
	mkdir -p "$BIN"
	chmod +x "$tmp/$name" && mv -f "$tmp/$name" "$BIN/piggery"
	[ -e "$BIN/pig" ] || ln -s piggery "$BIN/pig"
	echo "đã cài piggery $PIGGERY_VERSION vào $BIN"
fi

piggery setup
# Lần đầu: điền đường dẫn trạm vào nội quy và config (chỗ ghi __TRAM__).
grep -rl "__TRAM__" "$REPO/luat" "$REPO/he-thong/piggery" 2>/dev/null | while read -r f; do
	sed -i.bak "s|__TRAM__|$REPO|g" "$f" && rm -f "$f.bak"
done
piggery setup claude
piggery setup codex
"$REPO/he-thong/dong-bo.sh"
echo "xong. Mở Paseo, tạo phiên Claude Opus (Auto mode) trong thư mục $REPO, gõ:"
echo "  Bạn là Super. Làm mục \"Khi phiên vừa mở\" trong luat/super.md."
