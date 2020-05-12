from bryandollery/aws-cli-alpine

COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=hashicorp/terraform /bin/terraform /usr/local/bin/terraform
COPY --from=hashicorp/packer /bin/packer /usr/local/bin/packer

run curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh | bash && \
    echo "alias ll='ls -gAlF'" >> /root/.bash_aliases && \
    echo "alias vi='vim'" >> /root/.bash_aliases && \
    git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform && \
    git clone https://github.com/hashivim/vim-packer.git ~/.vim/pack/plugins/start/vim-packer && \
    git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/plugins/start/fugitive
ENTRYPOINT ["/bin/bash"]
