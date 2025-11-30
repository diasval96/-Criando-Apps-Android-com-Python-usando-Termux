# setupandroidbuild.sh

Aqui está um **script completo `setupandroidbuild.sh`** para Termux, já preparado para qualquer Android moderno. Ele instala todos os pacotes essenciais, configura Python, adiciona bibliotecas necessárias e garante que o **Buildozer** baixe e configure automaticamente o **SDK/NDK/Gradle** na primeira compilação. Incluí comentários detalhados para que você (ou qualquer iniciante) entenda cada etapa.

---

## 📜 **setupandroidbuild.sh**

```sh
#!/data/data/com.termux/files/usr/bin/bash
# Script de preparação do Termux para compilar APKs Android com Python
# Autor: Dias Valente
# Este script instala todos os pacotes necessários, bibliotecas Python,
# e prepara o ambiente para que o Buildozer baixe SDK/NDK/Gradle automaticamente.

echo "🔧 Atualizando pacotes do Termux..."
pkg update -y && pkg upgrade -y

echo "📦 Instalando componentes principais do Termux..."
# git → clonar projetos
# python → linguagem base
# clang → compilador C/C++ (necessário para compilar extensões)
# zip/unzip → manipulação de pacotes
# libffi, openssl, libjpeg-turbo, freetype → dependências gráficas e criptográficas
# sqlite → banco de dados local
# android-tools → inclui ADB para instalar/testar APKs
pkg install -y git python clang zip unzip libffi openssl libjpeg-turbo freetype sqlite android-tools

echo "🐍 Atualizando pip e ferramentas Python..."
pip install --upgrade pip setuptools wheel cython

echo "🎨 Instalando frameworks Python para apps Android..."
# Kivy → interface gráfica
# KivyMD → Material Design para Kivy
# Plyer → acesso a sensores (GPS, câmera, bateria, vibração)
# Flask → backend local
# Buildozer → compilador Python → APK
pip install kivy kivymd plyer flask buildozer

echo "✅ Configurando acesso ao armazenamento..."
termux-setup-storage

echo "📦 Preparando ambiente Android..."
echo "   O Buildozer irá baixar automaticamente SDK, NDK e Gradle na primeira compilação."
echo "   Certifique-se de ter pelo menos 5 GB livres no armazenamento interno."

echo "🚀 Ambiente pronto!"
echo "   Para criar um projeto, use:"
echo "      buildozer init"
echo "   Para compilar o APK, use:"
echo "      buildozer -v android debug"
echo "   O APK será gerado na pasta 'bin/'."
```

---

## 🔧 O que esse script cobre
- **Pacotes Termux essenciais**: compiladores, libs gráficas, banco de dados, ADB  
- **Python atualizado** com pip, setuptools, wheel, cython  
- **Bibliotecas Python**: Kivy, KivyMD, Plyer, Flask, Buildozer  
- **SDK/NDK/Gradle**: baixados automaticamente pelo Buildozer na primeira compilação  
- **Armazenamento liberado** com `termux-setup-storage`  

---

## 🚀 Como usar
1. Crie o arquivo no Termux:
   ```bash
   nano setupandroidbuild.sh
   ```
2. Cole o conteúdo acima.  
3. Dê permissão de execução:
   ```bash
   chmod +x setupandroidbuild.sh
   ```
4. Execute:
   ```bash
   ./setupandroidbuild.sh
   ```

---

👉 Esse script é **universal para qualquer Android moderno** (arm64-v8a, Android 7+).  
Na primeira vez que rodar `buildozer -v android debug`, ele baixa **SDK, NDK e Gradle** automaticamente.  
