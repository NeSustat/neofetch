#!/bin/bash

# 🐱 Custom Neofetch Installer by NeSustat

REPO="https://github.com/NeSustat/neofetch.git"
DIR="$HOME/.neofetch-custom"
NEOFETCH_CONFIG="$HOME/.config/neofetch"
ASCII_CAT="$HOME/.ascii-cat.txt"

echo "🚀 Клонирую репозиторий..."
git clone "$REPO" "$DIR" || { echo "❌ Не удалось клонировать!"; exit 1; }

echo "📁 Создаю папки..."
mkdir -p "$NEOFETCH_CONFIG"

echo "📦 Копирую конфиг и ASCII-кота..."
cp "$DIR/custom-config/config.conf" "$NEOFETCH_CONFIG/config.conf"
cp "$DIR/custom-config/ascii-cat.txt" "$ASCII_CAT"

echo "🧼 Очищаю старые строки запуска neofetch..."
sed -i '/neofetch/d' ~/.zshrc 2>/dev/null
sed -i '/neofetch/d' ~/.config/fish/config.fish 2>/dev/null

echo "➕ Добавляю кастомный neofetch в zsh/fish..."

# Добавляем в .zshrc
if [ -f "$HOME/.zshrc" ]; then
  echo 'neofetch --ascii "$HOME/.ascii-cat.txt" --ascii_colors 2' >> "$HOME/.zshrc"
fi

# Добавляем в .config/fish/config.fish
mkdir -p "$HOME/.config/fish"
echo 'neofetch --ascii "$HOME/.ascii-cat.txt" --ascii_colors 2' >> "$HOME/.config/fish/config.fish"

echo "✅ Готово! Открой новый терминал — и тебя встретит хакер-котик 🐱💻"

