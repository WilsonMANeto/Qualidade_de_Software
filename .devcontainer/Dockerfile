# .devcontainer/Dockerfile

# 1. Começamos a partir da imagem base do Flutter que já conhecemos.
FROM cirrusci/flutter:stable

# 2. Argumentos para tornar a criação do usuário configurável (boa prática).
ARG USERNAME=cirrus
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 3. Comandos para criar o grupo e o usuário.
#    Isso é executado como 'root' durante a construção da imagem.
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME --shell /bin/bash

# 4. Instala o 'sudo' (caso não venha na imagem) e dá ao nosso novo usuário
#    permissões de sudo sem precisar de senha.
RUN apt-get update && apt-get install -y sudo \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME