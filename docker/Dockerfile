#
#
# docker run -itd --gpus all holidaysm/anygrasp:0.0.0 /bin/bash
# docker exec -it 45e630ed09e5 /bin/bash
#
#

# Use use previous versions, modify these variables
# ARG PYTORCH="1.9.0"
# ARG CUDA="11.1"

ARG PYTORCH="1.7.1"
ARG CUDA="11.0"
ARG CUDNN="8"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

##############################################
# You should modify this to match your GPU compute capability
# ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 6.2 7.0 7.2 7.5 8.0"
##############################################

ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

# Install dependencies
RUN apt-get update
RUN apt-get install -y git ninja-build cmake build-essential libopenblas-dev \
    xterm xauth openssh-server tmux wget mate-desktop-environment-core

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# For faster build, use more jobs.
ENV MAX_JOBS=4
RUN git clone --recursive "https://github.com/NVIDIA/MinkowskiEngine"
RUN cd MinkowskiEngine; python setup.py install --force_cuda --blas=openblas

# Install AnyGrasp
RUN cd ..
RUN git clone "https://github.com/graspnet/anygrasp_sdk.git" && \
    cd anygrasp_sdk && \
    pip install --ignore-installed -r requirements.txt && \
    cd pointnet2 && \
    python setup.py install && \
    cd .. && \
    cd ..

RUN apt-get update
RUN apt-get install net-tools

COPY docker_entry.sh docker_entry.sh
RUN chmod +x docker_entry.sh
ENTRYPOINT ["sh", "docker_entry.sh"]