from bryandollery/aws-cli-alpine

copy --from=lachlanevenson/k8s-kubectl:latest /usr/local/bin/kubectl /usr/local/bin/kubectl
copy --from=hashicorp/terraform:latest /bin/terraform /usr/local/bin/terraform
copy --from=hashicorp/packer:latest /bin/packer /usr/local/bin/packer

env TF_CLI_CONFIG_FILE="/.terraformrc"

run curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash && \
    echo "alias ll='ls -gAlF'" >> /root/.bash_aliases && \
    echo "alias vi='vim'" >> /root/.bash_aliases && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform && \
    git clone https://github.com/hashivim/vim-packer.git ~/.vim/pack/plugins/start/vim-packer && \
    git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/fugitive && \
    git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git ~/.vim/pack/plugins/start/jenkinsfile && \
    terraform -install-autocomplete && \
    packer -autocomplete-install && \
    echo "plugin_cache_dir = \"/plugin-cache\"" >> /.terraformrc && \
    apk add --no-cache less

volume /plugin-cache

entrypoint ["/bin/bash", "-c"]
