FROM rocker/r-base
MAINTAINER Adam Feldmann <adam.feldmann@aok.pte.hu>

# install additional packages
RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN R -e "install.packages(c('devtools','digest','jsonlite','httr','uuid'),repos='https://cran.rstudio.com/')"

RUN R -e 'devtools::install_github("trestletech/plumber")'

RUN mkdir ./blockchaincore/
RUN ls -la d:/git/bc_Food/bc_Food_R*
COPY  blockchain.R ./blockchaincore/
COPY  blockchain-node-server.R ./blockchaincore/
COPY  plumberize.R ./blockchaincore/

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='127.0.0.1', port=8000)"]
CMD ["./blockchaincore/plumberize.R"]
