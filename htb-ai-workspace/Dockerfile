FROM kasmweb/core-ubuntu-focal:1.17.0
USER root

ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

## Update APT

RUN apt update
RUN apt install -y python3-pip python-is-python3

## Install AI labs dependecies
RUN pip install numpy scipy pandas scikit-learn matplotlib seaborn \
        transformers==4.37.2 datasets 
RUN pip install tokenizers accelerate evaluate optimum huggingface_hub \
        nltk category_encoders requests requests_toolbelt
RUN pip install torch torchvision torchaudio

## Install Jupyter 
RUN pip install jupyter jupyterlab notebook ipykernel

## Install Firefox
COPY resources/install_firefox.sh /tmp/
RUN bash /tmp/install_firefox.sh

## Prepare startup
COPY resources/custom_startup.sh $STARTUPDIR
RUN chown 1000:0 $STARTUPDIR/custom_startup.sh

RUN mkdir $HOME/.jupyter
COPY resources/jupyter_notebook_config.py $HOME/.jupyter
######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000